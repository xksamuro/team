<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
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
    <form class="layui-form" method="post" action="${pageContext.request.contextPath}/user/addAdmin">
        <div class="layui-form-item">
            <label for="name" class="layui-form-label">
                <span class="x-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="name"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" required lay-verify="username"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" required lay-verify="password"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
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
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required lay-verify="email"
                       autocomplete="off" class="layui-input">
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
            <label for="add" class="layui-form-label">
            </label>
            <button id="add" type="submit" class="layui-btn" lay-filter="add" lay-submit="">
                增加
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
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        f

    <%--
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    &lt;%&ndash;<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>&ndash;%&gt;
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Are you OK?</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    </head>

    <body>
    <div class="x-body">
        <form class="layui-form" id="addForm" method="post" action="">

            <div class="layui-form-item">
                <label for="id" class="layui-form-label">
                    <span class="x-red">*</span>id
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="id" name="id" required lay-verify="id"
                           autocomplete="off" class="layui-input" placeholder="请输入id">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>用户名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required lay-verify="name"
                           autocomplete="off" class="layui-input" placeholder="请输入用户名">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>姓名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="username" required lay-verify="username"
                           autocomplete="off" class="layui-input" placeholder="请输入姓名">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required lay-verify="phone"
                           autocomplete="off" class="layui-input" placeholder="手机">
                </div>
            </div>
            &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
            &lt;%&ndash;<label for="departmentId" class="layui-form-label">&ndash;%&gt;
            &lt;%&ndash;<span class="x-red">*</span>所属机构&ndash;%&gt;
            &lt;%&ndash;</label>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<select id="departmentid" name="departmentname"></select>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
            &lt;%&ndash;<label for="insId" class="layui-form-label">&ndash;%&gt;
            &lt;%&ndash;<span class="x-red">*</span>所属分支&ndash;%&gt;
            &lt;%&ndash;</label>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<select id="insId" name="insname"></select>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
            &lt;%&ndash;<label for="majorId" class="layui-form-label">&ndash;%&gt;
            &lt;%&ndash;<span class="x-red">*</span>专业方向&ndash;%&gt;
            &lt;%&ndash;</label>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<select id="majorId" name="majorname"></select>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
            &lt;%&ndash;<label for="planId" class="layui-form-label">&ndash;%&gt;
            &lt;%&ndash;<span class="x-red">*</span>设置方案&ndash;%&gt;
            &lt;%&ndash;</label>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<select id="planId" name="planname"></select>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            <div class="layui-form-item">
                <label for="sex" class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="sex" name="sex" required lay-verify="sex"
                           autocomplete="off" class="layui-input" >
                    &lt;%&ndash;onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>&ndash;%&gt;
                </div>
            </div>

            &lt;%&ndash;<div class="layui-form-item">
                <label for="startTime" class="layui-form-label">
                    <span class="x-red">*</span>开始时间
                </label>
            <div class="layui-input-inline">
                <input type="text" id="startTime" name="startTime" required lay-verify="startTime"
                       autocomplete="off" class="layui-input" >
                &lt;%&ndash;onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>&ndash;%&gt;
            </div>

            <div class="layui-form-item">
                <label for="endTime" class="layui-form-label">
                    <span class="x-red">*</span>结束时间
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="endTime" name="endTime" required lay-verify="endTime"
                           autocomplete="off" class="layui-input" >
                    &lt;%&ndash;onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>&ndash;%&gt;
                </div>
            </div>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
            &lt;%&ndash;<label for="classstatus" class="layui-form-label">&ndash;%&gt;
            &lt;%&ndash;<span class="x-red">*</span>是否启用&ndash;%&gt;
            &lt;%&ndash;</label>&ndash;%&gt;
            &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<select id="classstatus" name="classstatus"></select>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
           &lt;%&ndash; <div class="layui-form-item">
                <label for="classdesc" class="layui-form-label">
                    <span class="x-red">*</span>启用状态
                </label>
                <div class="layui-input-inline">
                        <textarea id="classdesc" name="classdesc" required lay-verify="isdelete"
                                  autocomplete="off" class="layui-input"></textarea>
                </div>
            </div>&ndash;%&gt;
            <div class="layui-form-item">
                <button type="button" class="layui-btn" id="addUser" lay-filter="add" lay-submit="">
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

            form.on('submit(add)', $("#addUser").click(function () {
                    $.post("${pageContext.request.contextPath}/user/addAdmin",
                        $("#addForm").serialize(),
                        function (data) {
                            layer.alert(data, {icon: 5}, function () {
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
        &lt;%&ndash;layui.use(['form','layer'], function(){&ndash;%&gt;
        &lt;%&ndash;$ = layui.jquery;&ndash;%&gt;
        &lt;%&ndash;var form = layui.form&ndash;%&gt;
        &lt;%&ndash;,layer = layui.layer;&ndash;%&gt;
        &lt;%&ndash;&ndash;%&gt;
        &lt;%&ndash;//自定义验证规则&ndash;%&gt;
        &lt;%&ndash;form.verify({&ndash;%&gt;
        &lt;%&ndash;nikename: function(value){&ndash;%&gt;
        &lt;%&ndash;if(value.length < 5){&ndash;%&gt;
        &lt;%&ndash;return '昵称至少得5个字符啊';&ndash;%&gt;
        &lt;%&ndash;}&ndash;%&gt;
        &lt;%&ndash;}&ndash;%&gt;
        &lt;%&ndash;,pass: [/(.+){6,12}$/, '密码必须6到12位']&ndash;%&gt;
        &lt;%&ndash;,repass: function(value){&ndash;%&gt;
        &lt;%&ndash;if($('#L_pass').val()!=$('#L_repass').val()){&ndash;%&gt;
        &lt;%&ndash;return '两次密码不一致';&ndash;%&gt;
        &lt;%&ndash;}&ndash;%&gt;
        &lt;%&ndash;}&ndash;%&gt;
        &lt;%&ndash;});&ndash;%&gt;

        &lt;%&ndash;//监听提交&ndash;%&gt;
        &lt;%&ndash;form.on('submit(add)', function(data){&ndash;%&gt;
        &lt;%&ndash;console.log(data);&ndash;%&gt;
        &lt;%&ndash;//发异步，把数据提交给php&ndash;%&gt;
        &lt;%&ndash;layer.alert("增加成功", {icon: 6},function () {&ndash;%&gt;
        &lt;%&ndash;// 获得frame索引&ndash;%&gt;
        &lt;%&ndash;var index = parent.layer.getFrameIndex(window.name);&ndash;%&gt;
        &lt;%&ndash;//关闭当前frame&ndash;%&gt;
        &lt;%&ndash;parent.layer.close(index);&ndash;%&gt;
        &lt;%&ndash;});&ndash;%&gt;
        &lt;%&ndash;return false;&ndash;%&gt;
        &lt;%&ndash;});&ndash;%&gt;
        &lt;%&ndash;&ndash;%&gt;
        &lt;%&ndash;&ndash;%&gt;
        &lt;%&ndash;});&ndash;%&gt;
    </script>
    </body>

    </html>--%>
