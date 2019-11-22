<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
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
    <%--      <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/user/selectByName">--%>
    <div class="layui-row">
        <form id="searchForm" class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <%--<button class="layui-btn" id="search" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>--%>
            <button class="layui-btn" onClick="x_admin_show('添加用户','${pageContext.request.contextPath}/user/selectByName')"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onClick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onClick="x_admin_show('添加用户','${pageContext.request.contextPath}/user/toAddAdmin')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${adminList.size()} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>用户名</th>
            <th>姓名</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>启用</th>
            <th>最后登陆时间</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${adminList}" var="user">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.name}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td class="td-status">
                    <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
                <td>${user.endTime}</td>
                <td class="td-manage">
                    <a onClick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                        <i class="layui-icon">&#xe601;</i>
                    </a>

                    <a title="编辑"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/user/toUpdateUser/${user.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe642;</i>
                    </a>

                    <a title="删除" onClick="member_del(this,'要删除的id')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                    <a onClick="x_admin_show('分配角色','${pageContext.request.contextPath}/user/toallocateRole/${user.id}',600,400)" title="分配角色" href="javascript:;">
                        <i class="layui-icon">&#xe631;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }


    /*form.on('submit(search)', $("#selectByName").click(function () {
      $.post("${pageContext.request.contextPath}/user/selectByName",
                $("#searchForm").serialize(),
                function (data) {
                  layer.alert(data, {icon: 6}, function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.location.reload(); //刷新父窗口
                    parent.layer.close(index);
                  });
                  return false;
                }
        )
      }*/

    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html>

<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
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
&lt;%&ndash;      <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/user/selectByName">&ndash;%&gt;
      <div class="layui-row">
        <form id="searchForm" class="layui-form layui-col-md12 x-so">
          <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
          &lt;%&ndash;<button class="layui-btn" id="search" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>&ndash;%&gt;
          <button class="layui-btn" onclick="x_admin_show('search','${pageContext.request.contextPath}/user/selectByName')"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('delete','${pageContext.request.contextPath}/user/toAddAdmin')"><i class="layui-icon"></i>添加</button>

      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>用户名</th>
            <th>姓名</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>启用</th>
            <th>最后登陆时间</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${adminList.list}" var="user">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
            <td class="td-status">
              <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
            <td>${user.endTime}</td>
            <td class="td-manage">
              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                <i class="layui-icon">&#xe601;</i>
              </a>

              <a title="编辑"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/user/toUpdateUser/${user.id}')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>

              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
              <a onclick="x_admin_show('分配角色','member-password.html',600,400)" title="分配角色" href="javascript:;">
                <i class="layui-icon">&#xe631;</i>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
  <div class="page">
    <div>
      当前 ${adminList.pageNum }页,总${adminList.pages }
      页,总 ${adminList.total } 条记录
      <a href="${pageContext.request.contextPath}/user/admin?pageNo=${adminList.navigateFirstPage}&pageSize=${adminList.pageSize}" class="prev">首页</a>
      <c:if test="${adminList.hasPreviousPage }">
        <a href="${pageContext.request.contextPath}/user/admin?pageNo=${adminList.pageNum-1}&pageSize=${adminList.pageSize}" class="prev">上一页</a>
      </c:if>

      <c:if test="${adminList.hasNextPage }">
        <a href="${pageContext.request.contextPath}/user/admin?pageNo=${adminList.pageNum+1}&pageSize=${adminList.pageSize}" class="next">下一页</a>
      </c:if>
      <a href="${pageContext.request.contextPath}/user/admin?pageNo=${adminList.navigateLastPage}&pageSize=${adminList.pageSize}" class="next">尾页</a>
      转到<input type='text' id="goPage" name='goPage' style='width:40px;text-align: center' />页<input type='button' value='go' onclick="go()" />&nbsp;
      每页显示:<select name='toSize' onchange="to(this)" style="width: 40px;height: 20px;text-align: left;">
      <option value="1" <c:if test='${adminList.pageSize == 1 }'>selected</c:if>>1</option>
      <option value="2" <c:if test='${adminList.pageSize == 2 }'>selected</c:if>>2</option>
      <option value="4" <c:if test='${adminList.pageSize == 4 }'>selected</c:if>>4</option>
      <option value="10" <c:if test='${adminList.pageSize == 10 }'>selected</c:if>>10</option>
    </select>条
    </div>
  </div>
    </div>

    <script>
      function go(){
        var count = document.getElementById("goPage").value;
        var reg = /^[1-9]\d*$/;
        var pageCount = '${adminList.pages}';
        if(reg.test(count)){
          if(count > pageCount){
            alert("不能大于总页数!!!");
          }else {
            window.location="${pageContext.request.contextPath}/user/admin?pageSize=${adminList.pageSize}&pageNo="+count;
          }
        }else {
          alert("数据格式不对");
        }

      }

      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }


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

      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
  </body>

</html>--%>
