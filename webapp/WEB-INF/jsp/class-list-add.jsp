<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
      <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
      <%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/My97DatePicker/calendar.js"></script>--%>
      <%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>--%>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" id="addForm" method="post" action="">
            <div class="layui-form-item">
                <label for="numName" class="layui-form-label">
                    <span class="x-red">*</span>班级编号
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="numName" name="numName" required lay-verify="numName"
                           autocomplete="off" class="layui-input" placeholder="请输入班级编号">
                </div>
            </div>
          <div class="layui-form-item">
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>班级名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required lay-verify="name"
                  autocomplete="off" class="layui-input" placeholder="请输入班级名称">
              </div>
          </div>

            <div class="layui-form-item">
                <label for="professionId" class="layui-form-label">
                    <span class="x-red">*</span>专业方向
                </label>
                <div class="layui-input-inline">
                    <select class="layui-input" id="professionId" name="professionName">
                        <c:forEach items="${professionList}" var="profession">
                            <%--<option value="${major}">--%>
                            <option value="${profession.id}">${profession.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="planId" class="layui-form-label">
                    <span class="x-red">*</span>设置方案
                </label>
                <div class="layui-input-inline">
                    <select class="layui-input" id="planId" name="planName">
                        <c:forEach items="${planList}" var="plan">
                            <%--<option value="${major}">--%>
                            <option value="${plan.planId}">${plan.planname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
          <div class="layui-form-item">
              <label for="startTime" class="layui-form-label">
                  <span class="x-red">*</span>开始时间
              </label>
              <div class="layui-input-inline">
                      <input type="text" id="startTime" name="timeStart" required lay-verify="startTime"
                             autocomplete="off" class="layui-input" >
                             <%--onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>--%>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="endTime" class="layui-form-label">
                  <span class="x-red">*</span>结束时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="endTime" name="timeEnd" required lay-verify="endTime"
                         autocomplete="off" class="layui-input" >
                         <%--onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>--%>
              </div>
           </div>
            <%--<div class="layui-form-item">--%>
                <%--<label for="classstatus" class="layui-form-label">--%>
                    <%--<span class="x-red">*</span>是否启用--%>
                <%--</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<select id="classstatus" name="classstatus"></select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <%--<label for="classdesc" class="layui-form-label">--%>
                    <%--<span class="x-red">*</span>班级介绍--%>
                <%--</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<textarea id="classdesc" name="classdesc" required lay-verify="classdesc"--%>
                    <%--autocomplete="off" class="layui-input"></textarea>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="layui-form-item">
                <button type="button" class="layui-btn" id="addClazz" lay-filter="add" lay-submit="">
                    保存
                </button>
            </div>
      </form>
    </div>
    <script>
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#startTime' //指定元素
            });
            laydate.render({
                elem: '#endTime' //指定元素
            });

        });
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
                , layer = layui.layer;

            form.on('submit(add)', $("#addClazz").click(function () {
                    $.post("${pageContext.request.contextPath}/class/addClass",
                        $("#addForm").serialize(),
                        function (data) {
                            layer.alert(data, {icon: 6}, function () {
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.location.reload();//刷新
                                parent.layer.close(index);
                            });
                            return false;
                        }
                    )
                }
                )
            )
        });
        <%--layui.use(['form','layer'], function(){--%>
            <%--$ = layui.jquery;--%>
          <%--var form = layui.form--%>
          <%--,layer = layui.layer;--%>
        <%----%>
          <%--//自定义验证规则--%>
          <%--form.verify({--%>
            <%--nikename: function(value){--%>
              <%--if(value.length < 5){--%>
                <%--return '昵称至少得5个字符啊';--%>
              <%--}--%>
            <%--}--%>
            <%--,pass: [/(.+){6,12}$/, '密码必须6到12位']--%>
            <%--,repass: function(value){--%>
                <%--if($('#L_pass').val()!=$('#L_repass').val()){--%>
                    <%--return '两次密码不一致';--%>
                <%--}--%>
            <%--}--%>
          <%--});--%>

          <%--//监听提交--%>
          <%--form.on('submit(add)', function(data){--%>
            <%--console.log(data);--%>
            <%--//发异步，把数据提交给php--%>
            <%--layer.alert("增加成功", {icon: 6},function () {--%>
                <%--// 获得frame索引--%>
                <%--var index = parent.layer.getFrameIndex(window.name);--%>
                <%--//关闭当前frame--%>
                <%--parent.layer.close(index);--%>
            <%--});--%>
            <%--return false;--%>
          <%--});--%>
          <%----%>
          <%----%>
        <%--});--%>
    </script>
  </body>

</html>