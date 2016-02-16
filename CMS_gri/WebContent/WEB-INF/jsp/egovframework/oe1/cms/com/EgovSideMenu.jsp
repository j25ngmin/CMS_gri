<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
function actionLogout(){
	alert("로그아웃?!");
	document.form.action = "<c:url value='/cms/com/actionLogout.do'/>";
	document.form.submit();
}
</script>
<form name="form">
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                      ${sessionScope.s_mberNm} 님 안녕하세요 :)
                    </a>
                </li>
                <li>
                   <a href="#"><span class="glyphicon glyphicon-envelope"></span></a>
                </li>
                <li>
                    <a href="#">내 정보 보기</a>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">다른 Helpdesk로 이동 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <!-- <li class="dropdown-header">Dropdown heading</l -->
                    <li><a href="#">경기도청</a></li>
                    <li><a href="#">경기연구원</a></li>
                  </ul>
                </li>
                <li>
                    <a href="javascript:actionLogout()">로그아웃</a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->
 </form>
