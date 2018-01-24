<header class="mainHeader">
    <div class="container clearfix">
        <div class="navFR">
            <a href="${basePath}/">首页</a>
            <a href="${basePath}/group/" class="now">主题</a>

            <div  id="down">
                <#if loginUser == null>
                    <a href="${basePath}/member/login" class="loginBtn">登录</a>
                <#else>

                        <a class="header-action-link" href="${basePath}/member/">
                        ${loginUser.name}
                            <#if unReadMessageNum+systemUnReadMessageNum &gt; 0><i class="fa fa-comments"></i></#if>
                        </a>
                    <div id="aa">
                        <ul  style="margin-left: -20px;">
                            <li id="xq"><a href="${basePath}/member/" style=" margin-right: 13px;">个人中心</a></li>
                            <li id="xq"><a href="${basePath}/member/message">私信 ${(unReadMessageNum > 0)?string("("+unReadMessageNum+")","")}</a></li>
                            <li id="xq"><a href="${basePath}/member/editInfo">设置</a></li>
                            <#if loginUser?? && loginUser.isAdmin &gt; 0>
                                <li id="xq"><a href="${managePath}/" target="_blank">管理</a></li>
                            </#if>
                            <li class="divider"></li>
                            <li id="xq"><a href="${basePath}/member/logout">退出</a></li>
                        </ul>
                    </div>
                       <script>
                            $(function () {
                               $('#down').mouseover(function(){
                                   $('#aa').show();
                               }).mouseout(function(){
                                   $('#aa').hide();
                               });
                           })
                        </script>

                </#if>
            </div>

        </div>
        <div class="navFL">
            <img src="${basePath}/res/new/images/mainLog.png" />
            <div class="form">
                <form action="${basePath}/group/solrList/" method="get">
                    <input type="text" class="search-query" name="key" placeholder="查找主题、帖子" />
                </form>


            </div>
        </div>
    </div>
</header>

