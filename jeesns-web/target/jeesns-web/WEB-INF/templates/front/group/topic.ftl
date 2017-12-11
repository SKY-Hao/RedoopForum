<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${groupTopic.title} - ${groupTopic.group.name} - ${SITE_NAME}</title>

    <link rel="shortcut icon" href="${basePath}/logo.ico">


    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
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
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <article class="article article-detail">
                    <header>
                        <h1 class="text-center">
                            <#--标题-->
                            ${groupTopic.title}

                            <#if groupTopic.isTop==1>
                                <span class="label label-badge label-primary">置顶</span>
                            <#elseif groupTopic.isTop==2>
                                <span class="label label-badge label-success">超级置顶</span>
                            </#if>
                            <#if groupTopic.isEssence==1>
                                <span class="label label-badge label-danger">精华</span>
                            </#if>
                        </h1>
                        <dl class="dl-inline">
                            <dt></dt>
                            <dd>发帖人:${groupTopic.member.name}</dd>
                            <#--创建时间-->
                            <dd>${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}</dd>
                            <#--查看次数-->
                            <span class="label label-danger"><i class="icon-eye-open"></i> ${groupTopic.viewCount}</span>
                            <dt></dt>
                            <#--管理员操作-->
                            <dd class="pull-right">
                                <#if loginUser?? && (loginUser.id == groupTopic.memberId || loginUser.isAdmin &gt; 0)>
                                    <div class="dropdown dropdown-hover">
                                        <button class="btn" type="button" data-toggle="dropdown">操作 <span class="caret"></span></button>
                                        <ul class="dropdown-menu">

                                            <#if loginUser?? && loginUser.isAdmin &gt; 0>
                                                <#if groupTopic.isTop = 0>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=1" target="_jeesnsLink">普通置顶</a></li>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=2" target="_jeesnsLink">超级置顶</a></li>
                                                <#elseif groupTopic.isTop = 1>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=0" target="_jeesnsLink">取消普通置顶</a></li>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=2" target="_jeesnsLink">超级置顶</a></li>
                                                <#elseif groupTopic.isTop = 2>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=0" target="_jeesnsLink">取消超级置顶</a></li>
                                                    <li><a href="${base}/group/topic/top/${groupTopic.id}?top=1" target="_jeesnsLink">普通置顶</a></li>
                                                </#if>
                                                <#if groupTopic.isEssence = 0>
                                                    <li><a href="${base}/group/topic/essence/${groupTopic.id}?essence=1" target="_jeesnsLink">精华</a></li>
                                                <#elseif groupTopic.isEssence = 1>
                                                    <li><a href="${base}/group/topic/essence/${groupTopic.id}?essence=0" target="_jeesnsLink">取消精华</a></li>
                                                </#if>
                                            </#if>


                                            <#if loginUser.id == groupTopic.memberId>
                                                <li><a href="${basePath}/group/topicEdit/${groupTopic.id}">编辑</a></li>
                                            </#if>
                                            <li><a href="${basePath}/group/delete/${groupTopic.id}" confirm="确定要删除帖子吗？" target="_jeesnsLink">删除</a></li>
                                        </ul>
                                    </div>
                                </#if>
                            </dd>
                        </dl>
                    </header>
                    <#--插入广告-->
                    <#--<@ads id=2>
                        <#include "/tp/ad.ftl"/>
                    </@ads>-->
                    <#--帖子内容-->
                    <section class="content">
                        ${groupTopic.content}
                    </section>
                    <#--选择喜欢不喜欢-->
                    <div class="text-center">
                        <#if groupTopic.isFavor == 0>
                            <a class="btn btn-danger btn-article-favor btn-article-unfavor topic-favor" href="javascript:void(0)" topic-id="${groupTopic.id}">
                                <i class="icon-heart-empty"></i> 喜欢 | ${groupTopic.favor}
                            </a>
                        <#else>
                            <a class="btn btn-danger btn-article-favor topic-favor" href="javascript:void(0)" topic-id="${groupTopic.id}">
                                <i class="icon-heart"></i> 喜欢 | ${groupTopic.favor}
                            </a>
                        </#if>
                    </div>
                </article>
                <#--<@ads id=2>
                    <#include "/tp/ad.ftl"/>
                </@ads>-->

                <#--帖子评论-->
                <div class="comments panel">
                    <div class="panel-heading">帖子评论</div>
                    <header>
                        <div class="reply-form">
                            <form class="form-horizontal jeesns_form"
                                  action="${basePath}/group/comment/${groupTopic.id}" method="post">
                                <div class="form-group">
                                    <textarea name="content" class="form-control new-comment-text" rows="2" placeholder="撰写评论..."></textarea>
                                </div>
                                <div class="form-group comment-user">
                                    <input type="submit" value="评论" class="pull-right btn btn-primary mg-t-10 jeesns-submit">
                                </div>
                            </form>
                        </div>
                    </header>
                    <section class="comments-list" id="commentList">

                    </section>
                    <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i
                            class="fa fa-arrow-down"></i> 加载更多
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <a href="${basePath}/group/post/${groupTopic.group.id}" class="btn btn-block btn-lg btn-info">发帖</a>
                <div class="group white-bg">
                    <div class="group-logo">
                        <img alt="${groupTopic.group.name}" src="${basePath}${groupTopic.group.logo}" width="80px"
                             height="80px"/>
                    </div>
                    <div class="group-detail">
                        <p>
                            <span>
                                <strong>
                                <a href="${basePath}/group/detail/${groupTopic.group.id}">
                                    ${groupTopic.group.name}
                                </a>
                                </strong>
                            </span>
                            <span class="text-right">
                                <#if isfollow == true>
                                    <a title="取消关注" href="${basePath}/group/nofollow/${groupTopic.group.id}"
                                       target="_jeesnsLink"><i class="icon-minus"></i> 取消关注</a>
                                <#else>
                                    <a title="添加关注" href="${basePath}/group/follow/${groupTopic.group.id}"
                                       target="_jeesnsLink"><i
                                            class="icon-plus"></i> 关注</a>
                                </#if>
                                <#if loginUser?? && loginUser.id == groupTopic.group.creator>
                                    . <a href="${basePath}/group/edit/${groupTopic.group.id}">编辑</a>
                                </#if>
                                <#if isManager == 1>
                                    . <a href="${basePath}/group/auditList/${groupTopic.group.id}">审核帖子</a>
                                </#if>
                            </span>
                        </p>
                    </div>
                    <div class="group-introduce">
                    ${groupTopic.group.introduce!''}
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel">
                    <div class="panel-body weibo-author">
                        <div class="avatar">
                            <a href="${basePath}/u/${groupTopic.member.id}" target="_blank">
                                <img alt="image" class="img-circle mg-l-30" src="${basePath}${groupTopic.member.avatar}"/></a>
                        </div>
                        <div class="name">
                            <a href="${basePath}/u/${groupTopic.member.id}"
                               target="_blank">${groupTopic.member.name}</a>
                        </div>
                        <div class="info">
                            <p>
                                <a href="${basePath}/u/${groupTopic.member.id}/home/follows">${groupTopic.member.follows}
                                    关注</a> /
                                <a href="${basePath}/u/${groupTopic.member.id}/home/fans">${groupTopic.member.fans}
                                    粉丝</a>
                            </p>
                            <p>
                            ${groupTopic.member.introduce}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <@ads id=1>
                <#include "/tp/ad.ftl"/>
            </@ads>
            <div class="col-md-4">
                <div class="panel">
                    <div class="panel-heading">
                        最新文章
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@cms_article_list cid=0 sort='id' num=10; article>
                            <#list articleList as article>
                                <li><i class="icon-hand-right main-text-color"></i> <a
                                        href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                            </#list>
                        </@cms_article_list>
                        </ul>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        热门文章
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@cms_article_list cid=0 sort='view-count' num=10 day=30; article>
                            <#list articleList as article>
                                <li><i class="icon-hand-right main-text-color"></i> <a
                                        href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                            </#list>
                        </@cms_article_list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
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