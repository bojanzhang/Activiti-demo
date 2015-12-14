<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
  <title>实验管理|运行中的流程</title>
  <link href="<%=path%>/plugins/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
  <link href="<%=path%>/plugins/scojs/css/scojs.css" type="text/css" rel="stylesheet">
  <link href="<%=path%>/plugins/scojs/css/sco.message.css" type="text/css" rel="stylesheet">
  <script src="<%=path%>/plugins/jquery/jquery-2.1.4.min.js"></script>
  <script src="<%=path%>/static/activiti/common.js"></script>
  <script src="<%=path%>/plugins/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=path%>/plugins/scojs/js/sco.message.js"></script>
  <script type="text/javascript">
  </script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=path%>/experiment/list/task">实验管理</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">实验管理 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=path%>/experiment/list/task">实验进程显示 </a></li>
            <li><a href="<%=path%>/experiment/list/running">在运行流程</a></li>
            <li><a href="<%=path%>/experiment/list/finished">已结束流程</a></li>
          </ul>
        </li>
        <li class="dropdown active">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">工作区 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=path%>/workflow/process-list">流程定义与部署管理 </a></li>
            <li><a href="<%=path%>/workflow/processinstance/process-list">所有流程 </a></li>
            <li><a href="<%=path%>/workflow/processinstance/running">在运行流程</a></li>
            <li class="active"><a href="<%=path%>/workflow/model/list">模型工作区</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.getFirstName()}  ${user.getLastName()} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">个人信息</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="<%=path%>/user/logout">注销</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div>
  <div class="well">
    <h1>工作区/<small>模型工作区</small></h1>
  </div>
  <div class="well">
    <button class="btn btn-success" style="float:right;">创建模型</button>
  </div>
  <div class="well">
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>ID</th>
        <th>KEY</th>
        <th>Name</th>
        <th>Version</th>
        <th>创建时间</th>
        <th>最后更新时间</th>
        <th>元数据</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${list }" var="model">
        <tr>
          <td>${model.id }</td>
          <td>${model.key }</td>
          <td>${model.name}</td>
          <td>${model.version}</td>
          <td>${model.createTime}</td>
          <td>${model.lastUpdateTime}</td>
          <td>${model.metaInfo}</td>
          <td>
            <a href="<%=path%>/modeler.html?modelId=${model.id}" target="_blank">编辑</a>
            <a href="<%=path%>/workflow/model/deploy/${model.id}">部署</a>
            导出(<a href="<%=path%>/workflow/model/export/${model.id}/bpmn" target="_blank">BPMN</a>
            |&nbsp;<a href="<%=path%>/workflow/model/export/${model.id}/json" target="_blank">JSON</a>)
            <a href="<%=path%>/workflow/model/delete/${model.id}">删除</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<!-- 删除模态框 -->
<div class="modal fade" id="show-model" tabindex="-1" role="dialog" aria-labelledby="model2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="model2">
          <span class="glyphicon glyphicon-search"></span> 流程图
        </h4>
      </div>
      <div class="modal-body">
        <img src="" id="img">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
  <c:if test="${not empty error}">
  $.scojs_message("${error}", $.scojs_message.TYPE_ERROR);
  </c:if>
  <c:if test="${not empty message}">
  $.scojs_message("${message}", $.scojs_message.TYPE_OK);
  </c:if>
</script>
</body>
</html>
