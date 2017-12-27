package com.lxinet.jeesns.service.group;

import com.lxinet.jeesns.core.dto.ResponseModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;

import java.util.List;


/**
 * 2017年12月6日15:32:11更新
 * IGroupService群组service接口
 */
public interface IGroupService {
    //根据群组的ID查询群组的信息
    Group findById(int id);

    //群组申请保存
    ResponseModel save(Member loginMember, Group group);
    //添加群组保存
    ResponseModel saveManageGroup(Member loginMember, Group group);

    //前台修改 编辑帖子 保存
    ResponseModel update(Member loginMember, Group group);

    // 群组删除
    ResponseModel delete(Member loginMember, int id);

    //群组列表
    ResponseModel listByPage(int status, Page page, String key);

   // 关注群组
    ResponseModel follow(Member loginMember, Integer groupId,int type);

    //修改状态
    ResponseModel changeStatus(int id);

    //群组主页列表
    List<Group> listByCustom(int status, int num, String sort);

    /**
     * 后台   添加帖子时的群组列表
     * 2017年12月18日14:45:30
     * @return
     */
    List<GroupTopic> list();


}
