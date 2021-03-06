<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>

<%
  /**
  * @JSP Name : EgovOECmmDetailCodeList.jsp
  * @Description : 운영환경 공통상세코드 관리
  * @Modification Information
  * 
  *   수정일                   수정자                 수정내용
  *  -------      --------    ---------------------------
  *  2010.07.02    이중호                 최초 생성
  *
  * author 운영환경 1팀
  * since  2010.07.02
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="Content-language" content="ko">
<title>운영환경 공통상세코드 관리</title>

<!-- style -->
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>" rel="stylesheet" type="text/css">

<!-- script -->
<script type="text/javascript" language="javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" ></script>
<script type="text/javascript" language="javascript" defer="defer" ></script>

<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>

<script type="text/javascript">
$(function() {
	$("#accordion").accordion({
		collapsible: true
	});	
$("#accordion").css({'background':'#f1f1f1','font-family':'굴림','border':'1px solid #d5d5d5','height':'390px'});	
$(".table_style tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});

$("div.linkdiv a").click(function(){ 	
	var topurl=$(this).attr("href");
	$('#content').load(topurl);
	});	
			
	$(".image_rollover").mouseover(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //ff
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "ff") $(this).attr("src", file_name + "n." + file_type);
	}).mouseout(function(){
	     var temp = $(this).attr("src");
	     var length = temp.length;
	     var file_name = temp.substring(0, length-6);
	     var status = temp.substring(length-6).substring(0,2); //on
	     var file_type = temp.substring(length-6).substring(3);
	     if (status == "on") $(this).attr("src", file_name + "off." + file_type);
	});			
});	
</script>

<!-- 업무 scrpit START -->
<script type="text/javaScript" language="javascript" defer="defer">

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cms/sys/EgovOe1OECmmDetailCodeList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fnSearch(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fnRegist(){
	location.href = "<c:url value='/cms/sys/EgovOe1OECmmDetailCodeRegist.do'/>";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fnModify(){
	location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(codeId, code){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/cms/sys/EgovOe1OECmmDetailCodeDetail.do'/>";
	varForm.codeId.value       = codeId;
	varForm.code.value         = code;
	varForm.submit();
}

</script>
<!-- 업무 scrpit END -->

</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	

<!-- 전체 레이어 시작 -->
<div id="wrap">

	<!-- header 시작 -->
	<div id="header"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovTop.jsp" /></div>
	<div id="topnavi">
		<c:import url="/cms/com/EgovOe1BarMenu.do" charEncoding="utf-8"/>
	</div>	
	<!-- //header 끝 -->	

	<!-- 메인 시작 -->
	<div id="container">
		<!-- 좌메뉴 시작 -->
		<div id="leftmenu">
			<c:import url="/cms/com/EgovOe1LeftMenu.do" charEncoding="utf-8"/>
		</div>
		<!-- 좌메뉴 끝 -->
		
		<div id="content">
		<!-- BODY 내용 START -->

			<form id="Form" name="Form" action="" method="post">
				<input type="hidden" name="pageIndex"       value="<c:out value="${searchVO.pageIndex}"/>"/>
				<input type=hidden name="codeId">
				<input type=hidden name="code">
			</form>
			<form name="listForm" action="<c:url value='/cms/sys/EgovOe1OECmmDetailCodeList.do'/>" method="post" onsubmit="fnSearch();return false;">
				<input type="hidden" name="pageIndex"       value="<c:out value="${searchVO.pageIndex}"/>"/>
			<div id="content_pop">			

				<!-- 타이틀 -->
				<div id="h2_topnav"><h1><strong>운영환경 공통상세코드 관리</strong></h1></div>
				<!-- /타이틀 -->

				<!-- 검색영역 -->
				<div id="search_area01">
				<ul>
					<li><img src="<c:url value='/images/egovframework/oe1/cms/com/img_search01.gif'/>" alt="Search" class="imgs" title="검색" /></li>
					<li>
						<label style="display: none;">사용자 권한 검색</label>
						<select name="searchCondition" class="select" title="검색조건">
							<option value='' selected>--선택하세요--</option>
						   <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드ID</option>
						   <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>코드</option>
						   <option value='3' <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>코드명</option>
						</select>
					</li>
					<li><input name="searchKeyword" type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" title="검색어"/></li>
					<li><a href="#LINK" onClick="fnSearch();return false;">
							<img src="<c:url value='/images/egovframework/oe1/cms/com/btn_search01.gif'/>" alt="검색" class="btn_search" />
						</a></li>
				</ul>
				</div>
				<!-- /검색영역 -->

				<!-- List -->
				<div id="result_table">
				<table summary="순번, 코드ID, 코드, 코드명, 사용여부 목록입니다" class="table_style">
					<caption>사용자 권한 검색 결과</caption>
					<colgroup>
						<col width="50">
						<col width="120">
						<col width="120">
						<col width="120">
						<col width="50">
						<col width="90">
					</colgroup>
					
					<thead>
						<tr>
					        <th scope="col">순번</th>
					        <th scope="col">코드ID</th>
					        <th scope="col">코드</th>
					        <th scope="col">코드명</th>
					        <th scope="col">정렬순서</th>
					        <th scope="col">사용여부</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty resultList}"><tr><td colspan="6">검색 결과가 없습니다.</td></tr></c:if>
					<c:forEach var="resultInfo" items="${resultList}" varStatus="status">
						<tr>
							<td>
								<c:out value="${paginationInfo.totalRecordCount - (searchVO.pageIndex - 1) * searchVO.pageSize - status.count + 1}"/>
							</td>
							<td align="left">
								<c:out value="${resultInfo.codeId}" />
							</td>
							<td scope="row" align="left">
							
								<!-- 2010.11.11 
								<a href="#Link" onclick="fnDetail('<c:out value="${resultInfo.codeId}"/>','<c:out value="${resultInfo.code}"/>'); return false;" class="board_text_link">
									<c:out value="${resultInfo.code}" />
								</a>
								-->
								
								<a href="<c:url value='/cms/sys/EgovOe1OECmmDetailCodeDetail.do'/>?codeId=<c:out value='${resultInfo.codeId}'/>&code=<c:out value='${resultInfo.code}'/>" onclick="fnDetail('<c:out value="${resultInfo.codeId}"/>','<c:out value="${resultInfo.code}"/>'); return false;" class="board_text_link" title="상세조회" >
									<c:out value="${resultInfo.code}" />
								</a>

							</td>
							<td align="left">
								<c:out value="${resultInfo.codeNm}" />
							</td>
							<td>
								<c:out value="${resultInfo.sortOrdr}" />
							</td>
							<td>
								<c:if test="${resultInfo.useAt == 'Y'}">사용</c:if>
								<c:if test="${resultInfo.useAt == 'N'}">미사용</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
				<!-- /List -->				
				
				<!-- 페이지 NAVI -->
				<div id="pagenav_div"><ui:pagination
					paginationInfo="${paginationInfo}" type="image"
					jsFunction="fn_egov_link_page" /></div>
				<!-- /페이지 NAVI -->
				
				<!-- 버튼 -->
				<div class="subbtn_align">          
				<ul>
				    <li class="submit_btn01_left"></li>
				    <li><span class="submit_btn01"><input type="submit" name="submit_btn" value="등록" class="submit_btn_input"  onclick="fnRegist(); return false;" /></span></li>
				    <li class="submit_btn01_right"></li>
				</ul>
				</div>
				<!-- /버튼 -->				

			</div>
			</form>

		<!-- BODY 내용 END -->
		</div>	

		<!-- 카피라이트 시작 -->
		<div id="footer"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
		<!-- //카피라이트 끝 -->
		
	</div>	
	<!-- 메인 끝 -->

</div>
<!-- //전체 DIV끝 -->

</body>
</html>
