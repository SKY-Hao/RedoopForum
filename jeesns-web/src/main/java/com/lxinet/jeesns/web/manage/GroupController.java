package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.common.utils.MemberUtil;
import com.lxinet.jeesns.core.annotation.Before;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.*;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.interceptor.UserLoginInterceptor;
import com.lxinet.jeesns.model.cms.Article;
import com.lxinet.jeesns.model.cms.ArticleCate;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.service.group.IGroupTopicService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by zchuanzhao on 16/12/23.
 */
@Controller("manageGroupController")
@RequestMapping("/")
@Before(AdminLoginInterceptor.class)
public class GroupController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/group/";
    @Resource
    private JeesnsConfig jeesnsConfig;
    @Resource
    private IGroupService groupService;
    @Resource
    private IGroupTopicService groupTopicService;

    /**
     * 群组列表
     * @param status
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(value = "${managePath}/group/index")
    public String index(@RequestParam(value = "status",required = false,defaultValue = "-1") Integer status,
                        String key,
                        Model model) {
        Page page = new Page(request);
        ResponseModel responseModel = groupService.listByPage(status,page,key);
        model.addAttribute("model",responseModel);
        model.addAttribute("key",key);
        return MANAGE_FTL_PATH + "index";
    }

    /**
     * 群组删除
     * @param id
     * @return
     */
    @RequestMapping(value = "${managePath}/group/delete/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@PathVariable("id") int id){
        Member loginMember = MemberUtil.getLoginMember(request);
        ResponseModel response = groupService.delete(loginMember,id);
        return response;
    }

    /**
     * 修改状态
     * @param id
     * @return
     */
    @RequestMapping(value = "${managePath}/group/changeStatus/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Object changeStatus(@PathVariable("id") int id){
        ResponseModel response = groupService.changeStatus(id);
        return response;
    }

    /**
     * 后台去添加群组
     *2017年12月15日11:21:32
     * @param model
     * @return
     */
    @RequestMapping(value = "${managePath}/group/applyAdd")
    public Object applyAdd(Model model){

        return MANAGE_FTL_PATH + "/applyAdd";
    }

    /**
     * 后台添加群组保存
     * 2017年12月15日11:21:37
     * @param group
     * @return
     */
    @RequestMapping(value = "${managePath}/group/save",method = RequestMethod.POST)
    @ResponseBody
    public Object save(@Valid Group group, BindingResult bindingResult,HttpServletRequest request,
                       @RequestParam(value = "logo", required = false) MultipartFile attach) throws Exception {


       /* if(bindingResult.hasErrors()){
            return new ResponseModel(-1,getErrorMessages(bindingResult));
        }*/

        request.setCharacterEncoding( "utf-8" );
        String logoPath = request.getSession().getServletContext().getRealPath("/");


        Member loginMember = MemberUtil.getLoginMember(request);
        ResponseModel responseModel = groupService.saveManageGroup(loginMember,group,logoPath,attach);
       /* if(responseModel.getCode() == 0){
            //成功并刷新父页面
            responseModel.setCode(3);
        }*/
        return responseModel;
    }


    /**
     * 后台去修改主题
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="${managePath}/group/topic/editGroup/{id}",method = RequestMethod.GET)
    public String editGroup(@PathVariable("id") Integer id, Model model){

        Group group = groupService.findById(id);
        model.addAttribute("group",group);

        return MANAGE_FTL_PATH + "editGroup";
    }




    /**
     * 后台   帖子列表
     * 2017年12月18日14:27:31
     * @return
     */
    @RequestMapping(value = "${managePath}/group/topic/index")
    public String topicindex(Model model) {

        Page page = new Page(request);
        ResponseModel responseModel = groupTopicService.listByTopicPage(page);
        model.addAttribute("model",responseModel);
        return MANAGE_FTL_PATH + "topic/index";
    }

    /**
     * 后台   修改帖子状态
     * @param id
     * @return
     */
    @RequestMapping(value = "${managePath}/group/changeTopicStatus/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Object changeTopicStatus(@PathVariable("id") int id){
        ResponseModel response = groupTopicService.changeTopicStatus(id);
        return response;
    }

    /**
     * 后台   去添加群组问题帖子
     *       并查询群组列表
     * @param model
     * @return
     */
    @RequestMapping(value = "${managePath}/group/index/topicAdd")
    public Object topicAdd (Model model){

        List<GroupTopic> groupList=groupService.list();//群组列表
        model.addAttribute("groupList",groupList);

        return MANAGE_FTL_PATH + "topic/addTopic";
    }


    /**
     * 后台保存帖子
     * @param groupTopic
     * @param bindingResult
     * @return
     */
    @RequestMapping(value="${managePath}/group/toTopicAdd/add",method = RequestMethod.POST)
    @ResponseBody
    public Object save(@Valid GroupTopic groupTopic, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return new ResponseModel(-1,getErrorMessages(bindingResult));
        }
        Member loginMember = MemberUtil.getLoginMember(request);

        ResponseModel responseModel = groupTopicService.add(loginMember,groupTopic);
        if(responseModel.getCode() == 0){
            responseModel.setCode(3);
        }
        return responseModel;
    }

    /**
     * 后台 删除帖子
     * @param id
     * @return
     */
    @RequestMapping(value="${managePath}/group/deleteTopic/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteTopic(@PathVariable("id") int id) {
        Member loginMember = MemberUtil.getLoginMember(request);
        ResponseModel responseModel = groupTopicService.deleteTopic(request, loginMember, id);
        return responseModel;
    }


    /**
     * 后台修改贴子
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="${managePath}/group/topic/edit/{id}",method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model){
        Member loginMember = MemberUtil.getLoginMember(request);
        List<Group> groupList = groupService.groupList();
        model.addAttribute("groupList",groupList);
        GroupTopic topic = groupTopicService.findById(id,loginMember);
        model.addAttribute("topic",topic);
        return MANAGE_FTL_PATH + "topic/updateTopic";
    }

    /**
     * 后台修改贴子
     * @param groupTopic
     * @param bindingResult
     * @return
     */
    @RequestMapping(value="${managePath}/group/topic/update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(@Valid GroupTopic groupTopic,BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            new ResponseModel(-1,getErrorMessages(bindingResult));
        }
        if(groupTopic.getId() == null){
            return new ResponseModel(-2);
        }
        Member loginMember = MemberUtil.getLoginMember(request);
        ResponseModel responseModel = groupTopicService.update(loginMember,groupTopic);
        if(responseModel.getCode() == 0){
            responseModel.setCode(3);
        }
        return responseModel;
    }


}
