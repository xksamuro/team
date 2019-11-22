<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" id="editForm" method="post" action="">
            <div class="layui-form-item">
                <%--<label for="classname" class="layui-form-label">--%>
                    <%--<span class="x-red">*</span>班级ID--%>
                <%--</label>--%>
                <div class="layui-input-inline">
                    <input type="text" id="" name="id" required lay-verify="id"
                           autocomplete="off" class="layui-input" value="${classList.id}" style="display: none">
                </div>
                <!--<div class="layui-form-mid layui-word-aux">-->
                <!--<span class="x-red">*</span>将会成为您唯一的登入名-->
                <!--</div>-->
            </div>
            <div class="layui-form-item">
                <label for="numName" class="layui-form-label">
                    <span class="x-red">*</span>班级编号
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="numName" name="numName" required lay-verify="numName"
                           autocomplete="off" class="layui-input" value="${classList.numName}">
                </div>
            </div>
            <div class="layui-form-item">
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>班级名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required lay-verify="name"
                  autocomplete="off" class="layui-input" value="${classList.name}">
              </div>
              <!--<div class="layui-form-mid layui-word-aux">-->
                  <!--<span class="x-red">*</span>将会成为您唯一的登入名-->
              <!--</div>-->
          </div>
          <%--<div class="layui-form-item">--%>
              <%--<label for="departmentId" class="layui-form-label">--%>
                  <%--<span class="x-red">*</span>所属机构--%>
              <%--</label>--%>
              <%--<div class="layui-input-inline">--%>
                  <%--<select id="departmentid" name="departmentname"></select>--%>
                  <%--<!--<input type="text" id="phone" name="phone" required lay-verify="phone"-->--%>
                  <%--<!--autocomplete="off" class="layui-input">-->--%>
              <%--</div>--%>
              <%--<!--<div class="layui-form-mid layui-word-aux">-->--%>
                  <%--<!--<span class="x-red">*</span>将会成为您唯一的登入名-->--%>
              <%--<!--</div>-->--%>
          <%--</div>--%>
          <%--<div class="layui-form-item">--%>
              <%--<label for="insId" class="layui-form-label">--%>
                  <%--<span class="x-red">*</span>所属分支--%>
              <%--</label>--%>
              <%--<div class="layui-input-inline">--%>
                  <%--<select id="insId" name="insname"></select>--%>
                  <%--<!--<input type="text" id="L_email" name="email" required lay-verify="email"-->--%>
                  <%--<!--autocomplete="off" class="layui-input">-->--%>
              <%--</div>--%>
              <!--<div class="layui-form-mid layui-word-aux">-->
                  <!--<span class="x-red">*</span>-->
              <!--</div>-->
          <%--</div>--%>
          <!--<div class="layui-form-item">
              <label class="layui-form-label"><span class="x-red">*</span>角色</label>
              <div class="layui-input-block">
                <input type="checkbox" name="like1[write]" lay-skin="primary" title="超级管理员" checked="">
                <input type="checkbox" name="like1[read]" lay-skin="primary" title="编辑人员">
                <input type="checkbox" name="like1[write]" lay-skin="primary" title="宣传人员" checked="">
              </div>
          </div>-->
            <div class="layui-form-item">
                <label for="id" class="layui-form-label">
                    <span class="x-red">*</span>专业方向
                </label>
                <div class="layui-input-inline">
                    <select class="layui-input" id="id" name="professionName">
                        <c:forEach items="${professionList}" var="profession">
                            <%--<option value="${major}">--%>
                            <option value="${profession.id}">${profession.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <!--<div class="layui-form-mid layui-word-aux">-->
                <!--6到16个字符-->
                <!--</div>-->
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
                    <!--<input type="password" id="L_repass" name="repass" required lay-verify="repass"-->
                    <!--autocomplete="off" class="layui-input">-->
                </div>
            </div>
          <div class="layui-form-item">
              <label for="startTime" class="layui-form-label">
                  <span class="x-red">*</span>开始时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="startTime" name="timeStart" required lay-verify="startTime"
                         autocomplete="off" class="layui-input" value="<fmt:formatDate value='${classList.startTime }'
                  pattern='yyyy-MM-dd' />">
              </div>
              <!--<button  class="layui-btn" lay-filter="add" lay-submit="">-->
                  <!--增加-->
              <!--</button>-->
          </div>
          <div class="layui-form-item">
              <label for="endTime" class="layui-form-label">
                  <span class="x-red">*</span>结束时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="endTime" name="timeEnd" required lay-verify="endTime"
                         autocomplete="off" class="layui-input" value="<fmt:formatDate value='${classList.endTime }'
                  pattern='yyyy-MM-dd' />">
              </div>
           </div>
            <div class="layui-form-item">
                <label for="classstatus" class="layui-form-label">
                    <span class="x-red">*</span>是否启用
                </label>
                <div class="layui-input-inline">
                    <select id="classstatus" name="classstatus"></select>
                </div>
            </div>
            <%--<div class="layui-form-item">--%>
                <%--<label for="classdesc" class="layui-form-label">--%>
                    <%--<span class="x-red">*</span>班级介绍--%>
                <%--</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<textarea id="classdesc" name="classdesc" required lay-verify="required"--%>
                    <%--autocomplete="off" class="layui-input" value="${classList.classdesc}"></textarea>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="layui-form-item">
                <button type="button" id="editClazz" class="layui-btn" lay-filter="edit" lay-submit="">
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
            //执行一个laydate实例
            laydate.render({
                elem: '#endTime' //指定元素
            });

        });
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
                , layer = layui.layer;

            form.on('submit(edit)', $("#editClazz").click(function () {
                    $.post("${pageContext.request.contextPath}/class/classEditReturn",
                        $("#editForm").serialize(),
                        function (data) {
                            layer.alert(data, {icon: 6}, function () {
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.location.reload(); //刷新父窗口
                                parent.layer.close(index);
                            });
                            return false;
                        }
                    )
                }
                )
            )
        });
    </script>
  </body>

</html>