<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tf blog</title>
    <%@include file="./common/include.jsp" %>
</head>
<body ng-app="frontApp">

<div id="logo">
    <img src="resources/images/2.png" class="img-responsive" alt="Cinque Terre">
    <div class="container">

        <div class="row">
            <div class="col-sm-9 col-sm-offset-2" style="padding-bottom: 0;margin-bottom: 0">
                <img src="resources/images/logo.png" class="img-responsive" alt="Cinque Terre">
            </div>
        </div>
    </div>
</div>

<div class="container">

    <div class="row">
        <div class="col-sm-9 col-sm-offset-2" style="padding-bottom: 0;margin-bottom: 0">
            <nav class="navbar navbar-default" role="navigation" ng-controller="searchCtrl">
                <div class="container-fluid">
                    <div>
                        <ul class="nav navbar-nav navbar-left">
                            <li style="font-size:18px">
                                <a href="#/">首页</a>
                            </li>
                            <li style="font-size:18px"><a href="#/contactMe">联系我</a></li>
                        </ul>
                        <form class="navbar-form navbar-right" role="form">
                            <input type="text" class="form-control" ng-model="searchContent" placeholder="Search...">
                            <button type="submit" ng-click="search()" id="btnSearch" class="btn btn-info btn-sm">搜索
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2">
            <!--备用空间-->
        </div>
        <div class="col-sm-7">
            <!-- 路由出口 -->
            <div ng-view="">
            </div>
        </div>

        <div class="col-sm-2" id="test">
            <!-- 通知面板 -->
            <div class="panel panel-default" ng-controller="noticeCtrl">
                <div class="panel-heading">
                    <h3 class="panel-title">{{notice.title}}</h3>
                </div>
                <div class="panel-body">
                    {{notice.content}}
                </div>
            </div>
            <!--分类面板-->
            <div class="panel panel-default" ng-controller="catgsCtrl">
                <div class="panel-heading">
                    <h3 class="panel-title">分类</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item" ng-repeat="c in catgs">
                        <a href="#/articleList/{{c.id}}">{{ c.title }}</a>
                    </li>
                </ul>
            </div>
            <!--归档面板-->
            <div class="panel panel-default" ng-controller="archsCtrl">
                <div class="panel-heading">
                    <h3 class="panel-title">归档</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item" ng-repeat="a in archs">
                        <a href="#/articleList/{{''}}/{{a.date}}">{{ a.date }} ({{a.count}})</a>
                    </li>
                </ul>
            </div>
            <!-- 友链 -->
            <div class="panel panel-default" ng-controller="linksCtrl">
                <div class="panel-heading">
                    <h3 class="panel-title">友链</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item" ng-repeat="l in links">
                        <a href="{{l.url}}" target="_blank">{{ l.title }}</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-1">
            <!--//备用空间-->
        </div>
    </div>
    <!--start-->
    <div id="pop" style="display:none;">
        <div id="popHead">
            <a id="popClose" title="关闭">关闭</a>
            <h2>赞助广告</h2>
        </div>
        <div id="popContent">
            <a href="#" target="_blank"><img src="resources/images/ad/ad2.jpg"></a>
        </div>
    </div>
    <!--end-->
</div>
<!--底部链接-->
<footer>
    <p class="pull-right">
        <back-Top-Directive></back-Top-Directive>
    </p>
    <p class="text-center">&copy; 2018 Design by &middot; <a href="https://github.com/754594774/blog" target="_blank">李难难</a>
        &middot;<a href="http://www.miitbeian.gov.cn/." target="_blank">皖ICP备17026796号-1</a>
    </p>
</footer>

<script type="text/javascript">
    //    固定右侧导航栏
    //    $(function(){
    //        $("#test").floatdiv({top:"70px",right:"80px"});//righttop
    //    });
    //右下角广告
    var popad = new Pop();

</script>
</body>
</html>
