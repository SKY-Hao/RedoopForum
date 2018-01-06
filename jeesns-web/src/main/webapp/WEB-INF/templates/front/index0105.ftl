<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>红象云腾社区</title>
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

    <div class="main-content m-t-10">
        <div class="row">

            <!--帖子-->
            <div class="col-md-12">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        最新帖子
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="${basePath}/group/" );">阅读更多</a>
                        </span>
                    </div>
                    <div class="panel-body">
                        <div class="items">
                            <div class="col-md-4">
                                <div class="article-hot-list">
                                        <!--左侧list列表-->
                                        <#list model.data as groupTopic>
                                            <li>
                                                <i class="main-text-color"></i>
                                                <a href="${basePath}/group/topic/${groupTopic.id}">
                                                    <#--<#if groupTopic.title?length &gt; 18>
                                                    ${groupTopic.title?substring(0,18)}...
                                                    <#else>
                                                    ${groupTopic.title}
                                                    </#if>-->
                                                    ${groupTopic.title}

                                                </a>
                                            喜欢次数${groupTopic.favor}
                                            查看次数${groupTopic.viewCount}
                                            评论次数${groupTopic.topicComment}
                                            </li>
                                            <li>

                                            </li>

                                        </#list>
                                    </ul>
                                    <#--分页-->
                                        <ul class="pager pagination pagination-sm no-margin pull-right"
                                            url="${basePath}/"
                                            currentPage="${model.page.pageNo}"
                                            pageCount="${model.page.totalPage}">
                                     </ul>
                                </div>
                            </div>

                        </div>
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
    function autorunA()//帖子点查看更多的时候跳转隐藏的那个GroupId去查询,仅限一个群组的时候
    {
        var dtx=document.getElementById('divTest');
        dtx.click();
    }
</script>
</body>
</html>