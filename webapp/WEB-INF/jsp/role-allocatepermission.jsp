<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
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
        <form class="layui-form" method="post" action="${pageContext.request.contextPath}/permission/setpermissions">
            <input value="${role_id}" style="display: none" name="role_id">
          <div class="layui-form-item">
              <label for="rolename" class="layui-form-label">
                  角色名:
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="rolename" name="rolename" value="${role1.rolename}" required lay-verify="rolename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
            <div class="layui-form-item">
                <label for="rolename" class="layui-form-label">
                    分配权限:
                </label>
                <div class="layui-input-inline">
                    <select class="layui-input" id="per" name="per_id">
                   <c:forEach items="${permissionList}" var="per">
                       <option value="${per.perId}">${per.pername}</option>
                   </c:forEach>
                   </select>
                </div>
            </div>

          <div class="layui-form-item">
              <button type="submit" class="layui-btn" lay-filter="add" lay-submit="" name="setrole" id="">
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
              if(value.length < 1){
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

            form.on('submit(add)', $("#setrole").click(function () {
                    $.post("${pageContext.request.contextPath}/user/setrole",
                        $("#roleset").serialize(),
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