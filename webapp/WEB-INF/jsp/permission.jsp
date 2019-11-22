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

      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加权限','${pageContext.request.contextPath}/permission/')"><i class="layui-icon"></i>添加</button>
        <%--<span class="x-right" style="line-height:40px">共有数据：${roleList.size()} 条</span>--%>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>权限名</th>
            <th>权限描述</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${permissionList.list}" var="role">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${role.pername}</td>
            <td>${role.perdesc}</td>

            <td class="td-manage">
              <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                <i class="layui-icon">&#xe601;</i>
              </a>
              <a title="编辑" href="${pageContext.request.contextPath}/permissionlist?id=${role.perId}">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除"  href="${pageContext.request.contextPath}/permissionlist?id=${role.perId}">
                <i class="layui-icon">&#xe640;</i>
              </a>

            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
          <div>
            当前 ${permissionList.pageNum }页,总${permissionList.pages }
            页,总 ${permissionList.total } 条记录
            <a href="${pageContext.request.contextPath}/permissionlist?pageNo=${permissionList.navigateFirstPage}&pageSize=${permissionList.pageSize}" class="prev">首页</a>
            <c:if test="${permissionList.hasPreviousPage }">
              <a href="${pageContext.request.contextPath}/permissionlist?pageNo=${permissionList.pageNum-1}&pageSize=${permissionList.pageSize}" class="prev">上一页</a>
            </c:if>

            <c:if test="${permissionList.hasNextPage }">
              <a href="${pageContext.request.contextPath}/permissionlist?pageNo=${permissionList.pageNum+1}&pageSize=${permissionList.pageSize}" class="next">下一页</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/permissionlist?pageNo=${permissionList.navigateLastPage}&pageSize=${permissionList.pageSize}" class="next">尾页</a>
            转到<input type='text' id="goPage" name='goPage' style='width:40px;text-align: center' />页<input type='button' value='go' onclick="go()" />&nbsp;
            每页显示:<select name='toSize' onchange="to(this)" style="width: 40px;height: 20px;text-align: left;">
            <option value="1" <c:if test='${permissionList.pageSize == 1 }'>selected</c:if>>1</option>
            <option value="2" <c:if test='${permissionList.pageSize == 2 }'>selected</c:if>>2</option>
            <option value="4" <c:if test='${permissionList.pageSize == 4 }'>selected</c:if>>4</option>
            <option value="10" <c:if test='${permissionList.pageSize == 10 }'>selected</c:if>>10</option>
          </select>条
        </div>
    </div>
    <script>
        function go(){
            var count = document.getElementById("goPage").value;
            var reg = /^[1-9]\d*$/;
            var pageCount = '${roleList.pages}';
            if(reg.test(count)){
                if(count > pageCount){
                    alert("不能大于总页数!!!");
                }else {
                    window.location="${pageContext.request.contextPath}/permissionlist?pageSize=${permissionList.pageSize}&pageNo="+count;
                }
            }else {
                alert("数据格式不对");
            }

        }

        function to(obj){
            var value = obj.value;

            var url = "${pageContext.request.contextPath }/permissionlist?pageNo=1&pageSize="+value;

            window.location=url;
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