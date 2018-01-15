<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改帖子 - ${SITE_NAME}</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <link rel="shortcut icon" href="${basePath}/logo.ico">

    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
   <#-- <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${basePath}/uploadImage";
        $(function () {
            CKEDITOR.replace('content');
        });
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>-->


    <link href="${basePath}/res/plugins/makedown/css/editormd.min.css" rel="stylesheet">
    <script src="${basePath}/res/plugins/makedown/js/editormd.min.js"></script>


</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-12 article-detail">
                <form class="form-horizontal jeesns_form" role="form" action="${basePath}/group/topicUpdate" method="post" onsubmit="ckUpdate();">
                    <input type="hidden" class="form-control" name="id" value="${groupTopic.id}">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" data-type="require" value="${groupTopic.title}">
                        </div>
                    </div>
                   <#-- <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">缩略图</label>
                        <div class="col-sm-10">
                            <div id="uploader">
                                <!--用来存放文件信息&ndash;&gt;
                                <input type="hidden" id="thumbnail" name="thumbnail" value="${groupTopic.thumbnail}">
                                <div id="preview" class="uploader-list">
                                <#if groupTopic.thumbnail??>
                                    <img src="${basePath}${groupTopic.thumbnail}" width="100px" height="100px"/>
                                </#if>
                                </div>
                                <div id="imagesList" class="uploader-list"></div>
                                <h4 class="info"></h4>
                                <p class="state"></p>
                                <div class="btns">
                                    <div id="picker">选择文件</div>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label" style="width: 100px;">帖子类型</label>
                        <div class="col-sm-8">
                            <label><input type="radio" value="0" name="groupstatus"
                                          <#if groupTopic.groupstatus==0>checked</#if>> <i></i>
                                问题帖子</label>
                            <label><input type="radio" value="1" name="groupstatus"
                                          <#if groupTopic.groupstatus==1>checked</#if>> <i></i>
                                文章帖子</label>
                            <span style="color: red;font-weight: bolder;font-family: serif;">*请选择一个帖子类型</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="description" alt="描述">${groupTopic.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">内容</label>
                        <div class="col-sm-10" id="editormd-content">
                            <textarea class="editormd-markdown-textarea" cols="80" name="content" rows="3">${groupTopic.content}</textarea>
                            <textarea class="editormd-html-textarea" cols="80" name="htmlcontent" rows="3">${groupTopic.htmlcontent}</textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                            <a class="btn btn-default" href="${basePath}/group/detail/${groupTopic.group.id}">返回</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>
<script>

    $(function(){
        editormd({
            id:"editormd-content",
            width:"80%",
            height: 300,
            syncScrolling : "single",
            path: "${basePath}/res/plugins/makedown/lib/",
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${basePath}/upload/uploadfile",
            emoji:true,
            previewTheme : "dark",
            saveHTMLToTextarea : true
        });
    });

</script>
