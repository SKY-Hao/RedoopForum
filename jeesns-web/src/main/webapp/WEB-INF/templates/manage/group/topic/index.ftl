<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>群组管理 - ${SITE_NAME} - RedoopForum后台管理系统 </title>
    <link rel="shortcut icon" href="${basePath}/logo.ico">
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>帖子管理</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">群组管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">

                                <a href="${managePath}/group/applyAdd" target="_jeesnsOpen"
                                   title="添加群组" width="1000px" height="600px">
                                    <span class="label label-info">添加群组</span>
                                </a>

                            </h3>
                            <!--搜索-->
                            <div class="box-tools">
                                <form method="get" action="${managePath}/group/index">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" class="form-control pull-right"
                                               placeholder="请输入关键词">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--列表-->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">#</th>
                                        <th>群组名字</th>
                                        <th>帖子标题</th>
                                        <th>创建时间</th>
                                        <th>状态</th>
                                        <th width="50px">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list model.data as topic>
                                    <tr>
                                        <td>${topic.id}</td>
                                        <td>${topic.group.name}</td>
                                        <td>${topic.name}</td>
                                        <td>${topic.collect_time}</td>
                                        <td>
                                            <#if topic.status==0>
                                                <a class="marg-l-5" target="_jeesnsLink" href="#">
                                                    <span class="label label-danger">未审核</span>
                                                </a>
                                            <#elseif topic.status==1>
                                                <a class="marg-l-5" target="_jeesnsLink" href="${managePath}/group/changeStatus/${topic.id}">
                                                    <span class="label label-success">已审核</span>
                                                </a>
                                            </#if>
                                        </td>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/group/topic/index?key=${key}"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>

