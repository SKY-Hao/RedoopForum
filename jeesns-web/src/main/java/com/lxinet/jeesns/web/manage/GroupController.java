package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.common.utils.MemberUtil;
import com.lxinet.jeesns.core.annotation.Before;
import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * Created by zchuanzhao on 16/12/23.
 */
@Controller("manageGroupController")
@RequestMapping("/")
@Before(AdminLoginInterceptor.class)
public class GroupController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/group/";
    @Resource
    private IGroupService groupService;

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
     * 去添加群组
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "${managePath}/group/applyAdd")
    public Object applyAdd(Model model){

        return MANAGE_FTL_PATH + "/applyAdd";
    }

    /**
     * 添加群组保存
     * @param group
     * @return
     */
    @RequestMapping(value = "${managePath}/group/save",method = RequestMethod.POST)
    @ResponseBody
    public Object save(@Valid Group group, BindingResult bindingResult){

        if(bindingResult.hasErrors()){
            return new ResponseModel(-1,getErrorMessages(bindingResult));
        }
        Member loginMember = MemberUtil.getLoginMember(request);
        ResponseModel responseModel = groupService.saveManageGroup(loginMember,group);
       /* if(responseModel.getCode() == 0){
            //成功并刷新父页面
            responseModel.setCode(3);
        }*/
        return responseModel;
    }

    /**
     * 后台 帖子列表
     * @param status
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(value = "${managePath}/group/topic/index")
    public String topicindex(@RequestParam(value = "status",required = false,defaultValue = "-1") Integer status,
                        String key,
                        Model model) {


        return MANAGE_FTL_PATH + "topic/index";
    }

}
