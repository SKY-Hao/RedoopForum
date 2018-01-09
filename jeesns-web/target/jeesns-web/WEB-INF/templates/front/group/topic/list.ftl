<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><#if articleCate??>${articleCate.name}<#else>所有帖子列表</#if></title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
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
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <div class="items">
                   <#-- &lt;#&ndash;文章列表    左侧&ndash;&gt;-->
                    <#list model.data as topic>
                        <div class="item article-list shadow">
                            <div class="item-content">

                                <div class="text">
                                    <a href="${basePath}/group/detail/${topic.group.id}">
                                        <div class="pull-right label label-success">
                                            ${topic.group.name} <#--&lt;#&ndash;帖子的群组名称&ndash;&gt;-->
                                        </div>
                                    </a>
                                    <h3>
                                        <a href="${basePath}/group/topic/${topic.id}">
                                            ${topic.title}<#--&lt;#&ndash;文章标题&ndash;&gt;-->
                                        </a>
                                    </h3>
                                    <p>
                                        <span class="text-muted">
                                            <i class="icon-comments"></i>
                                            ${topic.viewCount} <#--&nbsp;&lt;#&ndash;查看次数&ndash;&gt;-->
                                            <i class="icon-time"></i>
                                            ${topic.createTime?string('yyyy-MM-dd HH:mm')}<#--&lt;#&ndash;创建时间&ndash;&gt;-->
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </#list>
                       <#-- &lt;#&ndash;分页&ndash;&gt;-->
                    <ul class="pager pagination pagination-sm no-margin pull-right"
                        url="${basePath}/group/topicList"
                        currentPage="${model.page.pageNo}"
                        pageCount="${model.page.totalPage}">
                    </ul>
                </div>
            </div>
            <div class="col-md-4 float-left">
                <form action="${basePath}/group/solrList/" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="key">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit"><i class="icon-search"></i></button>
                        </span>
                    </div>
                </form>
                <div class="panel">
                    <div class="panel-heading">
                        群组栏目
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="">申请群组</a>
                        </span>
                    </div>
                    <div class="panel-body">
                        <a href="" class="btn btn-primary">全部</a>
                        <#list groupLists as group>
                            <a href="${basePath}/group/detail/${group.id}" class="btn btn-primary">${group.name}</a>
                        </#list>
                    </div>
                </div>
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel">
                    <div class="panel-heading">
                        热门帖子
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                       <@group_topic_list  sort='view_count' num=10 day=30; groupTopic>
                            <#list groupTopicList as groupTopic>
                                <li><i class="icon-hand-right main-text-color"></i> <a href="${basePath}/group/topic/${groupTopic.id}">${groupTopic.title}</a></li>
                            </#list>
                        </@group_topic_list>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>