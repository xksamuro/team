<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>更新</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
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
    <form class="layui-form" id="updateForm" method="post" action="${pageContext.request.contextPath}/student/updateStudent/${studentList.id}">
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="name"
                       autocomplete="off" class="layui-input" value="${studentList.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="stuname" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stuname" name="stuname" required lay-verify="stuname"
                       autocomplete="off" class="layui-input" value="${studentList.stuname}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" required lay-verify="password"
                       autocomplete="off" class="layui-input" value="${studentList.password}">
            </div>

        </div><%--<div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>--%>
        <%--<div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_repass" name="repass" required lay-verify="repass"
                       autocomplete="off" class="layui-input">
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label for="sex" class="layui-form-label">
                性别
            </label>
            <div class="layui-input-inline">
                <select id="sex" name="sex" required lay-verify="sex"
                        autocomplete="off" class="layui-input">
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${studentList.phone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required lay-verify="email"
                       autocomplete="off" class="layui-input" value="${studentList.email}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <%--<div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>有效期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="validity" name="effdata" required lay-verify="validity"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label for="isdelete" class="layui-form-label">
                是否启用
            </label>
            <div class="layui-input-inline">
                <select id="isdelete" name="isdelete" required lay-verify="isdelete"
                        autocomplete="off" class="layui-input">
                    <option value="1">启用</option>
                    <option value="0">不启用</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <button id="updateStudent" type="submit" class="layui-btn" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#validity' //指定元素
        });

    });
    layui.use(['form','layer'], function() {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;
    });
</script>