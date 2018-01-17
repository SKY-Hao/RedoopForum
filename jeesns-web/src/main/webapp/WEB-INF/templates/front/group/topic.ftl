<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${groupTopic.title} - ${groupTopic.group.name} - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">
<#--<link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
<link href="${basePath}/res/front/css/app.css" rel="stylesheet">-->

    <link href="${basePath}/res/new/css/groupCss/group/style.css" rel="stylesheet">
    <link href="${basePath}/res/new/css/groupCss/group/topic.css" rel="stylesheet">

    <link href="${basePath}/res/new/css/pageCss/page.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script>
        var base = "${basePath}";
        var groupTopicId = ${groupTopic.id};
    </script>
    <script src="${basePath}/res/front/js/group.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/newCommon/header.ftl"/>



<div class="block clearfix">
    <div class="container clearfix">
        <div class="span8">
            <div class="theamLine">
                <h3>
                    <a href="/">所有</a></h3>
                <h3><a href="${basePath}/group/solrWenTi" style="margin: 0 10px;">问题</a></h3>
                <h3><a href="${basePath}/group/solrWenZhang">文章</a></h3>
            </div>
            <div class="TermCon">
                <div class="author clearfix">

                <#--鼠标滑过显示-->
                <#--<div class="tagTips clea rfix" style="display: none;">
                    <img src="images/face.png"  class="tipsFace"/>
                    <p class="tipsTitle"><a href="#">Hadoop</a></p>
                    <div class="numCounts">
                        <p><span>124</span><br />帖子</p>
                        <p><span>124</span><br />关注</p>
                        <p class="last"><span>1204</span><br />关注者</p>
                    </div>
                    <a href="#" class="addBtn">+关注</a>
                    <div class="tagInfo">Since its incubation in 2008, Apache Hive is considered the defacto standard for interactive SQL queries over petabytes of data in Hadoop.</div>
                </div>-->
                <#-- <a href="#" class="faceQ"><img src="images/face.png" /></a>-->
                    <div class="detailInfo">
                        <h4> ${groupTopic.title}</h4>
                        <p style="width:150px;">${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}</p>
                        <div class="counts">
                            <a class="discu" title="评论">${groupTopic.topicComment}</a>
                        <#--选择喜欢不喜欢-->

                        <#if groupTopic.isFavor == 0>
                            <a class=" like" href="javascript:void(0)" topic-id="${groupTopic.id}">
                            ${groupTopic.favor}
                            </a>
                        <#else>
                            <a class="like" href="javascript:void(0)" topic-id="${groupTopic.id}">
                            ${groupTopic.favor}
                            </a>
                        </#if>


                        <#--<a class="like" title="喜欢">0</a>-->
                            <a class="views" title="阅读">${groupTopic.viewCount}</a>
                        </div>
                    </div>
                </div>
                <div class="detailContent">
                ${groupTopic.htmlcontent}
                </div>
                <div class="detailDiscu">
                    <p class="theamTag">所属主题：<a href="${basePath}/group/detail/${groupTopic.group.id}">${groupTopic.group.name}</a></p>
                    <a href="#jump" class="addBtn">评论</a>

                    <section class="comments-list" id="commentList">

                    </section>
                    <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i
                            class="fa fa-arrow-down"></i> 加载更多
                    </button>

                    <div class="publishCon clearfix" id="jump">
                        <h4>评论</h4>
                        <form class="form-horizontal jeesns_form"
                              action="${basePath}/group/comment/${groupTopic.id}" method="post">

                            <textarea name="content" rows="2"  class="discuContent" placeholder="撰写评论..."></textarea>

                            <input type="submit" value="发布" class="pull-right btn btn-primary mg-t-10 jeesns-submit" style="float:right;">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="span4" style="margin-top:45px;">
            <img src="images/imgAD.png" />
            <div class="widget">
                <h3>热门问题</h3>
            <#list byGroupStatusList as groupTopic>
                <div class="question-block">
                    <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a>
                    <div>
                        <span class="answer">点击：</span>
                        <span>${groupTopic.viewCount}</span>
                    </div>
                </div>
            </#list>
            </div>
            <div class="fengeLine"></div>
            <div class="widget">
                <h3>热门文章</h3>
            <#list byGroupStatus as groupTopic>
                <div class="question-block">
                    <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a>
                    <div>
                        <span class="answer">点击：</span>
                        <span>${groupTopic.viewCount}</span>
                    </div>
                </div>
            </#list>
            </div>
            <div class="fengeLine"></div>
            <div class="widget">
                <h3>热门主题</h3>
            <@group_list status=1 sort='topicCount' num=5 day=30; group>
                <#list groupList as group>
                    <div class="tags">
                        <a href="${basePath}/group/detail/${group.id}">${group.name}</a>
                    </div>
                </#list>
            </@group_list>
            </div>
        </div>
    </div>
</div>




<#include "/${frontTemplate}/common/newCommon/footer.ftl"/>
<script>
    $(document).ready(function () {
        var pageNo = 1;
        group.commentList(groupTopicId, pageNo);
        $("#moreComment").click(function () {
            pageNo++;
            group.commentList(articleId, pageNo);
        });
        $(".topic-favor").click(function () {
            group.favor($(this), "${basePath}")
        });
    });
</script>
</body>
</html>