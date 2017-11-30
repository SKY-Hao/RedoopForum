<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="container" style="position:relative;">
                    <div class="navbar-header jeesns-logo">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                                class="navbar-toggle collapsed" type="button">
                            <i class="fa fa-reorder"></i>
                        </button>
                        <a href="${basePath}/" class="navbar-brand" style="background-color: #353535">
                            <img src="${basePath}/res/common/images/RedoopLogo.png" height="51px"/>
                        </a>
                    </div>
                    <div class="navbar-collapse collapse" id="navbar" style="float:right; background-color: #353535; text-align:right;margin-right:-38px; margin-top:15px;">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="${basePath}/"> 首页</a>
                            </li>
                            <li>
                                <a href="${basePath}/article/list"> 文章</a>
                            </li>
                          <#--  <li>
                                <a href="${basePath}/weibo/list"> ${WEIBO_ALIAS}</a>
                            </li>-->
                            <li>
                                <a href="${basePath}/group/"> ${GROUP_ALIAS}</a>
                            </li>
                           <#-- <li>
                                <a href="${basePath}/action/list"> 动态</a>
                            </li>-->
                        </ul>
                        <ul class="nav navbar-top-links navbar-right" style="position: absolute; top:-18px; right:-50px;">
                            <div class="header-action-btn">
                            <#if loginUser == null>
                                <li><a href="${basePath}/member/login">登录</a></li>
                                <li><a href="${basePath}/member/register">注册</a></li>
                            <#else>
                                <div class="btn-group nav-username">
                                    <img src="${basePath}${loginUser.avatar}" class="img-circle" width="25px" height="25px" style="margin-top: 1px;margin-right:5px;"/>
                                    <a class="header-action-link" href="javascript:void(0)" style="color: #fff">
                                    ${loginUser.name}
                                        <#if unReadMessageNum+systemUnReadMessageNum &gt; 0><i class="fa fa-comments"></i></#if>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="${basePath}/member/">个人中心</a></li>
                                        <li><a href="${basePath}/member/systemMessage">系统信息 ${(systemUnReadMessageNum > 0)?string("("+systemUnReadMessageNum+")","")}</a></li>
                                        <li><a href="${basePath}/member/message">私信 ${(unReadMessageNum > 0)?string("("+unReadMessageNum+")","")}</a></li>
                                        <li><a href="${basePath}/member/editInfo">设置</a></li>
                                        <#if loginUser?? && loginUser.isAdmin &gt; 0>
                                            <li><a href="${managePath}/" target="_blank">管理</a></li>
                                        </#if>
                                        <li class="divider"></li>
                                        <li><a href="${basePath}/member/logout">退出</a></li>
                                    </ul>
                                    <script>
                                        $(function () {
                                            $(".nav-username").hover(function(){
                                                $(this).addClass("open");
                                            },function(){
                                                $(this).removeClass("open");
                                            });
                                        })
                                    </script>
                                </div>
                            </#if>
                            </div>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
