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
                <div class="layui-input-inline">
                    <input type="text" id="homeworkId" name="homeworkId" required lay-verify="homeworkId"
                           autocomplete="off" class="layui-input" value="${homeworkList.homeworkId}" style="display: none">
                </div>
            </div>
          <div class="layui-form-item">
              <label for="classId" class="layui-form-label">
                  <span class="x-red">*</span>所属班级
              </label>
              <div class="layui-input-inline">
                  <select class="layui-input" id="classId" name="classname">
                      <c:forEach items="${classList}" var="clazz">
                          <option value="${clazz.classId}">${clazz.classname}</option>
                      </c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="courseId" class="layui-form-label">
                  <span class="x-red">*</span>课程
              </label>
              <div class="layui-input-inline">
                  <select class="layui-input" id="courseId" name="coursename">
                      <c:forEach items="${courseList}" var="course">
                          <option value="${course.courseId}">${course.coursename}</option>
                      </c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="chapId" class="layui-form-label">
                  <span class="x-red">*</span>所属章
              </label>
              <div class="layui-input-inline">
                  <select class="layui-input" id="chapId" name="chapname">
                      <c:forEach items="${chapterList}" var="chapter">
                          <option value="${chapter.chapId}">${chapter.chapname}</option>
                      </c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="secId" class="layui-form-label">
                  <span class="x-red">*</span>所属节
              </label>
              <div class="layui-input-inline">
                  <select class="layui-input" id="secId" name="secname">
                      <c:forEach items="${sectionList}" var="section">
                          <option value="${section.secId}">${section.secname}</option>
                      </c:forEach>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="worktitle" class="layui-form-label">
                  <span class="x-red">*</span>作业标题
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="worktitle" name="worktitle" required lay-verify="worktitle"
                         autocomplete="off" class="layui-input" value="${homeworkList.worktitle}">
              </div>
          </div>
            <div class="layui-form-item">
                <label for="workFile" class="layui-form-label">
                    <span class="x-red">*</span>附件上传
                </label>
                <div class="layui-input-inline">
                    <select id="workFile" name="workFile"></select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="workcontent" class="layui-form-label">
                    <span class="x-red">*</span>作业内容
                </label>
                <div class="layui-input-inline">
                    <textarea id="workcontent" name="workcontent" required lay-verify="workcontent" autocomplete="off" class="layui-input"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <button type="button" id="editHomeWork" class="layui-btn" lay-filter="edit" lay-submit="">
                    保存
                </button>
            </div>
      </form>
    </div>
    <script>
        document.getElementById("workcontent").value="${homeworkList.workcontent}"
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
                , layer = layui.layer;

            form.on('submit(edit)', $("#editHomeWork").click(function () {
                    $.post("${pageContext.request.contextPath}/class/homeWorkEditReturn",
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