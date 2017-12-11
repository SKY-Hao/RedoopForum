package com.lxinet.jeesns.model.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 友情链接
 * Created by zchuanzhao on 2017-10-13.
 */
public class Link {
    private Integer id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;    //时间
    private String name;        //广告名称
    private String url;         //链接
    private Integer sort;       //排序，越大越靠前
    private Integer recomment;  //推荐，0不推荐，1推荐
    private Integer status;     //状态，0禁用，1启用

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getRecomment() {
        return recomment;
    }

    public void setRecomment(Integer recomment) {
        this.recomment = recomment;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", sort=" + sort +
                ", recomment=" + recomment +
                ", status=" + status +
                '}';
    }
}
