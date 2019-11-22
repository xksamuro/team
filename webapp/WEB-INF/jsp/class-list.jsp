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
      <%--<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
      <%--<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
    <![endif]-->
  <body>
    <!--<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>-->
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/class/selectByName">
          <table>
              <tr>
                  <td>班级名称：</td>
                  <td><input type="text" id="classname" name="className" class="layui-input"></td>
                  <td>所属机构：</td>
                  <td><select class="layui-select"></select></td>
                  <td>专业方向：</td>
                  <td><select class="layui-select"></select></td>
                  <td><button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button></td>
              </tr>
          </table>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加班级','${pageContext.request.contextPath}/class/toAddClass')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>班级编号</th>
            <th>班级名称</th>
            <th>专业方向</th>
            <th>培养方案</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>是否启用</th>
            <%--<th>状态</th>--%>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${classList.list}" var="banji">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${banji.numName}</td>
            <td>${banji.name}</td>
            <td>${banji.profession.name}</td>
            <td>${banji.plan.planname}</td>
            <td><fmt:formatDate value="${banji.startTime}" pattern="yyyy-MM-dd" /></td>
            <td><fmt:formatDate value="${banji.endTime}" pattern="yyyy-MM-dd" /></td>
            <td>${banji.isused}</td>
            <%--<td class="td-status">--%>
              <%--<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>--%>
            <td class="td-manage">
              <a title="编辑" onclick="x_admin_show('编辑','${pageContext.request.contextPath}/class/toEditClass/${banji.id}')" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del('删除')" href="${pageContext.request.contextPath}/class/classDelete/${banji.id}">
                <i class="layui-icon">&#xe640;</i>
              </a>
              <%--<a title="学生管理"  onclick="x_admin_show('学生管理','class-list-student.html')" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe640;</i>--%>
              <%--</a>--%>
              <%--<a title="资源设置"  onclick="x_admin_show('资源设置','class-list-resource.html')" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe640;</i>--%>
              <%--</a>--%>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <div>
            当前 ${classList.pageNum }页,总${classList.pages }
            页,总 ${classList.total } 条记录
            <a href="${pageContext.request.contextPath}/class/classList?pageNo=${classList.navigateFirstPage}&pageSize=${classList.pageSize}" class="prev">首页</a>
            <c:if test="${classList.hasPreviousPage }">
              <a href="${pageContext.request.contextPath}/class/classList?pageNo=${classList.pageNum-1}&pageSize=${classList.pageSize}" class="prev">上一页</a>
            </c:if>

            <c:if test="${classList.hasNextPage }">
              <a href="${pageContext.request.contextPath}/class/classList?pageNo=${classList.pageNum+1}&pageSize=${classList.pageSize}" class="prev">下一页</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/class/classList?pageNo=${classList.navigateLastPage}&pageSize=${classList.pageSize}" class="prev">尾页</a>
            转到<input type='text' id="goPage" name='goPage' style='width:40px;text-align: center' />页<input type='button' value='go' onclick="go()" />&nbsp;
            每页显示:<select name='toSize' onchange="to(this)" style="width: 40px;height: 20px;text-align: left;">
            <option value="1" <c:if test='${classList.pageSize == 1 }'>selected</c:if>>1</option>
            <option value="2" <c:if test='${classList.pageSize == 2 }'>selected</c:if>>2</option>
            <option value="4" <c:if test='${classList.pageSize == 4 }'>selected</c:if>>4</option>
            <option value="10" <c:if test='${classList.pageSize == 10 }'>selected</c:if>>10</option>
          </select>条
        </div>
      </div>

    </div>
    <script>
        function go(){
            var count = document.getElementById("goPage").value;
            var reg = /^[1-9]\d*$/;
            var pageCount = '${classList.pages}';
            if(reg.test(count)){
                if(count > pageCount){
                    alert("不能大于总页数!!!");
                }else {
                    window.location="${pageContext.request.contextPath }/class/classList?pageSize=${classList.pageSize}&pageNo="+count;
                }
            }else {
                alert("数据格式不对");
            }

        }

        function to(obj){
            var value = obj.value;

            var url = "${pageContext.request.contextPath }/class/classList?pageNo=1&pageSize="+value;

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

      // /*用户-删除*/
      // function member_del(obj,id){
      //     layer.confirm('确认要删除吗？',function(index){
      //         //发异步删除数据
      //         $(obj).parents("tr").remove();
      //         layer.msg('已删除!',{icon:1,time:1000});
      //     });
      // }
      //
      //
      //
      // function delAll (argument) {
      //
      //   var data = tableCheck.getData();
      //
      //   layer.confirm('确认要删除吗？'+data,function(index){
      //       //捉到所有被选中的，发异步进行删除
      //       layer.msg('删除成功', {icon: 1});
      //       $(".layui-form-checked").not('.header').parents('tr').remove();
      //   });
      // }
    </script>
  </body>

</html>