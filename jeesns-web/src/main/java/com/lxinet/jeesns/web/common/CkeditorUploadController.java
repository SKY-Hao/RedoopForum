package com.lxinet.jeesns.web.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/ckeditorUpload")
public class CkeditorUploadController extends BaseController {
    @RequestMapping(value = "/uploadImage")
    public void uploadImage(@RequestParam MultipartFile[] upload)
    {
        String callback = this.request.getParameter("CKEditorFuncNum");
        PrintWriter out = null;
        try {
            String fullContentType = "text/html;charset=UTF-8";
            this.response.setContentType(fullContentType);
            out = this.response.getWriter();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        if (!(ServletFileUpload.isMultipartContent(this.request))) {
            out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'请选择文件');</script>");
            out.flush();
            out.close();
        }

        for (MultipartFile file : upload) {
            if (file.getSize() > 1048576L) {
                out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于10M');</script>");
                out.flush();
                out.close();
            }

            String fileName = file.getOriginalFilename();
            String suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();
            String[] imageExtensionNameArray = { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
            String allImageExtensionName = "";
            boolean isContain = false;
            for (int i = 0; i < imageExtensionNameArray.length; ++i) {
                if (suffix.equals(imageExtensionNameArray[i])) {
                    isContain = true;
                }
                if (i == 0)
                    allImageExtensionName = allImageExtensionName + imageExtensionNameArray[i];
                else {
                    allImageExtensionName = allImageExtensionName + " , " + imageExtensionNameArray[i];
                }

            }

            String newFileName = UUID.randomUUID() + suffix;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String ymd = sdf.format(new Date());
            String path = "/upload/images/" + ymd + "/";
            String savePath = this.request.getServletContext().getRealPath(path);
            if (isContain) {
                File baseFile = new File(savePath);
                if (!(baseFile.exists())) {
                    baseFile.mkdirs();
                }
                File targetFile = new File(baseFile, newFileName);
                try {
                    file.transferTo(targetFile);
                } catch (IOException e) {
                    out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'" + e + "');</script>");
                    out.flush();
                    out.close();
                }
                String imageUrl = this.request.getContextPath() + path + newFileName;

                out.write("<script  type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageUrl + "'," + "'');</script>");

                out.flush();
                System.out.println("imageUrl=====" + imageUrl);
                System.out.println("====ckeditorUpload>out.print=====<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageUrl + "'," + "'');</script>");
                out.close();
            }
            else {
                out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件格式不正确（必须为" + allImageExtensionName + "文件）');</script>");
                out.flush();
                out.close();
            }
        }
    }
}