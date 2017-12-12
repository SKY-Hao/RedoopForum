package com.lxinet.jeesns.web.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lxinet.jeesns.core.utils.Const;
import com.lxinet.jeesns.model.member.PicUploadResult;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.joda.time.DateTime;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * 说明：富文本编辑器,图片上传controller
 * 创建人:黄天浩
 * 创建时间：2017年10月17日
 */
@Controller
@RequestMapping("pic")
public class PicUploadController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PicUploadController.class);

	private static final ObjectMapper mapper = new ObjectMapper();

	// 允许上传的格式
	private static final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".gif", ".png" };

	//private static  final  String REPOSITORY_PATH="D:\\Idea\\Redoop\\src\\main\\webapp\\upload\\files";
	//private static  final  String IMAGE_BASE_URL="http://www.redoop.com/upload/files/";
	//http://www.redoop.com/upload/files/8b48de2e7ebc489fbd01e95ae62f4d10.jpg




	@RequestMapping(value = "/upload", method = RequestMethod.POST,produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("uploadFile") MultipartFile uploadFile ,
                         HttpServletResponse response, HttpServletRequest request) throws Exception {

		//路径
		request.setCharacterEncoding( "utf-8" );
		String logoPath = request.getSession().getServletContext().getRealPath("/");
		logoPath = logoPath + Const.UPLOAD_PATH;


		//自动获取域名
		StringBuffer url = request.getRequestURL();
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();

		// 校验图片格式
		boolean isLegal = false;
		for (String type : IMAGE_TYPE) {
			if (StringUtils.endsWithIgnoreCase(uploadFile.getOriginalFilename(), type)) {
				isLegal = true;
				break;
			}
		}

		// 封装Result对象，并且将文件的byte数组放置到result对象中
		PicUploadResult fileUploadResult = new PicUploadResult();

		// 状态
		fileUploadResult.setError(isLegal ? 0 : 1);

		// 文件新路径
		String filePath = getFilePath(uploadFile.getOriginalFilename(),logoPath);

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("Pic file upload .[{}] to [{}] .", uploadFile.getOriginalFilename(), filePath);
		}

		// 生成图片的绝对引用地址
		String picUrl = StringUtils.replace(StringUtils.substringAfter(filePath, logoPath) ,"\\", "/");

		//上线修改存放路径IMAGE_BASE_URL
		//TODO
		fileUploadResult.setUrl(tempContextUrl+Const.UPLOAD_PATH+picUrl);
		File newFile = new File(filePath);

		// 写文件到磁盘
		uploadFile.transferTo(newFile);

		// 校验图片是否合法
		isLegal = false;
		try {
			BufferedImage image = ImageIO.read(newFile);
			if (image != null) {
				fileUploadResult.setWidth(image.getWidth() + "");
				fileUploadResult.setHeight(image.getHeight() + "");
				isLegal = true;
			}
		} catch (IOException e) {
			//System.out.println("图片格式有误~");
		}


		//将java对象序列化成json 数据
		return mapper.writeValueAsString(fileUploadResult);
	}


	private String getFilePath(String sourceFileName,String logoPath) {
		String baseFolder = logoPath;
		Date nowDate = new Date();
		// yyyy/MM/dd
		String fileFolder =  baseFolder ;
		File file = new File(fileFolder);
		if (!file.isDirectory()) {
			// 如果目录不存在，则创建目录
			file.mkdirs();
		}
		// 生成新的文件名
		String fileName = new DateTime(nowDate).toString("yyyyMMddhhmmssSSSS")+ RandomUtils.nextInt(100) + "." +  StringUtils.substringAfterLast(sourceFileName, ".");


		return fileFolder + File.separator + fileName;
	}





}
