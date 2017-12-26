<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="icon" href="plugins/bootstrap-3.3.7/favicon.ico">
    <title>BootStrap</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%@include file="jsp/common/common.jsp"%>
</head>

<body>
    <div class="container">
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div>
                    <!--向左对齐-->
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">联系我</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                传送门
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">文章</a></li>
                                <li><a href="#">音乐</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!--向右对齐-->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <input type="text" class="form-control" placeholder="Search...">
                    </form>
                </div>
             </div>
        </nav>

        <div class="row">
            <div class="col-sm-8">

                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            入门网站包
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            免费域名注册
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            24*7 支持
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            24*7 支持
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            24*7 支持
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                    <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">
                            24*7 支持
                        </h4>
                        <span class="text-muted">It'll blow your mind.</span>
                    </a>
                </div>
            </div>
            <div class="col-sm-3 col-sm-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">公告</h3>
                    </div>
                    <div class="panel-body">
                        这是一个基本的面板,可都是浪费精力是快递费决定联手开发快结束了
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">分类</h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                    </ul>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">归档</h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                        <li class="list-group-item"><a href="#">March 2014</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <ul class="pager">
            <li><a href="#">Previous</a></li>
            <li><a href="#">Next</a></li>
        </ul>
        <footer>
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>
</body>
</html>
