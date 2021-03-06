<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @JSP Name : EgovDicWordList.jsp
  * @Description : 단어사전 List 화면
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.07.16  김민수          최초 생성
  *
  * author 운영환경 1팀
  * since 2010.07.16
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta http-equiv="Content-language" content="ko">
<title>단어사전 목록</title>
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>"	rel="stylesheet" type="text/css">
<link	href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>"	rel="stylesheet" type="text/css">

<script type="text/javascript" language="javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" ></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery-1.4.2.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.core.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.widget.js'/>"></script>
<script type="text/javascript"	src="<c:url value='/js/egovframework/oe1/cms/com/jquery.ui.accordion.js'/>"></script>
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
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 상세 화면 function */
function fn_egov_select(id) {
	document.listForm.selectedId.value = id;
   	document.listForm.action = "<c:url value='/cms/cmm/selectDicWord.do'/>";
   	document.listForm.submit();		
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.listForm.action = "<c:url value='/cms/cmm/addDicWord.do'/>";
   	document.listForm.submit();		
}

/* 글 목록 화면 function */
function fn_egov_selectList() {
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/cms/cmm/selectDicWordList.do'/>";
   	document.listForm.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cms/cmm/selectDicWordList.do'/>";
   	document.listForm.submit();
}
/* 엑셀등록 화면으로 이동 */
function fn_egov_addExcelView() {
   	document.listForm.action = "<c:url value='/cms/cmm/addDicWordExcel.do'/>";
   	document.listForm.submit();		
}

/*엑셀다운로드*/
function fn_egov_addExcelDown(){
   	document.listForm.action = "<c:url value='/cms/cmm/addDicWordExcelDwon.do'/>";
   	document.listForm.submit();	
}

function init(){
	<c:if test="${not empty resultMsg}">
		alert('<c:out value="${resultMsg}"/>');
	</c:if>
}
-->
</script>
</head>
<body onload="init()">
<!-- 전체 레이어 시작 -->
<div id="wrap">
	<!-- header 시작 -->
	<div id="header"><jsp:include page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovTop.jsp" /></div>
	<div id="topnavi"><c:import url="/cms/com/EgovOe1BarMenu.do" charEncoding="utf-8"/></div>
	<!-- //header 끝 --> 
	
	<!-- 메인 시작 -->
	<div id="container">
		<!-- 좌메뉴 시작 -->
		<div id="leftmenu"><c:import url="/cms/com/EgovOe1LeftMenu.do" charEncoding="utf-8"/></div>
		<!-- 좌메뉴 끝 -->


		<!-- BODY 내용 START -->
		<div id="content">
			<form:form commandName="egovOe1DicWordVO" name="listForm" action="/oe1/cms/cmm/selectDicWordList.do" method="post" onsubmit="fn_egov_selectList(); return false;">
			<input type="hidden" name="selectedId" />
			<input type="hidden" name="pageIndex" value="<c:out value="${egovOe1DicWordVO.pageIndex}"/>"/>
			<div id="content_pop">
				<div id="content_pop2">
				<!-- 타이틀 -->
				<div id="h2_topnav"><h1><strong><label for="searchCondition">단어사전 목록</label></strong></h1></div>
				<!-- // 타이틀 -->
				<div class="search_area_submit">
					<ul>
					<li><img src="<c:url value='/images/egovframework/oe1/cms/com/img_search01.gif'/>" alt="Search" class="imgs" /></li>
					<li>
			          <select name="searchCondition" id="searchCondition" style="width:100px" tabindex="1" title="검색조건">
					    <option value='wordNm' <c:if test="${egovOe1DicWordVO.searchCondition == 'wordNm'}">selected="selected"</c:if>>단어명</option>
					    <option value='wordEngNm' <c:if test="${egovOe1DicWordVO.searchCondition == 'wordEngNm'}">selected="selected"</c:if>>영문명</option>
					    <option value='wordDc' <c:if test="${egovOe1DicWordVO.searchCondition == 'wordDc'}">selected="selected"</c:if>>단어설명</option>
			          </select>
					</li>
					<li>
					<input name="searchKeyword" id="searchKeyword" value="<c:out value='${egovOe1DicWordVO.searchKeyword}'/>" tabindex="2"  class="input01"  style="width:150px;" title="검색어"/>
					</li>
					<li>
					    <div class="submit_gray_btn_top">		
						<ul>
							<li class="submit_gray_btn_left"></li>
							<li><span class="submit_gray_btn_middle"><input type="submit" value="검색" onclick="fn_egov_selectList(); return false;" class="submit_btn_input" /></span></li>
							<li class="submit_gray_btn_right"></li>
						</ul>
						</div>						
					</li>
					</ul>
				</div>
				
								
				<!-- List -->
				<div id="result_table">
					<table summary="순번, 단어명, 영문명, 영문명약어, 사용여부, 등록자 , 등록일자, 조회수  목록입니다" width="100%" border="0" cellpadding="0" cellspacing="0"  class="table_style">
					<caption>단어사전 목록</caption>
						<colgroup>
							<col width="50">				
							<col width="125">
							<col>
							<col width="125">	
							<col width="70">
							<col width="70">	
							<col width="80">
							<col width="60">
						</colgroup>	
						<thead>  
						<tr>
							<th scope="col" align="center">순번</th>
							<th scope="col" align="center">단어명</th>
							<th scope="col" align="center">영문명</th>
							<th scope="col" align="center">영문약어</th>
							<th scope="col" align="center">사용여부</th>
							<th scope="col" align="center">등록자</th>
							<th scope="col" align="center">등록일자</th>
							<th scope="col" align="center">조회수</th>							
						</tr>												
						</thead>
						<tbody>
			    		<c:if test="${empty resultList}">
			    			<tr>    
			   		  			<td colspan="8">
				    			검색 결과가 없습니다.
			  	  				</td>
			    			</tr>
			    		</c:if>			
			    		<c:if test="${!empty resultList}">								
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td align="center" 	class="listtd"><c:out value="${paginationInfo.totalRecordCount - (egovOe1DicWordVO.pageIndex - 1) * egovOe1DicWordVO.pageSize - status.count + 1}"/></td>
								<td scope="row" align="left" 	class="listtd">
									<a href="<c:url value='/cms/cmm/selectDicWord.do'/>?selectedId=<c:out value="${result.wrdId}"/>" onClick="fn_egov_select('<c:out value="${result.wrdId}"/>'); return false;" class="board_text_link"> <c:out value="${result.wrdNm}"/></a>
								</td>							
								<td align="left" 	class="listtd"><c:out value="${result.wrdEngNm}"/>&nbsp;</td>
								<td align="left" 	class="listtd"><c:out value="${result.wrdEngAbrv}"/>&nbsp;</td>
								<td align="center" 	class="listtd"><c:out value="${result.useAt}"/>&nbsp;</td>
								<td align="center" 	class="listtd"><c:out value="${result.frstRegisterName}"/>&nbsp;</td>
								<td align="center" 	class="listtd"><c:out value="${result.frstRegisterPnttm}"/>&nbsp;</td>
								<td align="center" 	class="listtd"><c:out value="${result.rdcnt}"/>&nbsp;</td>							
							</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>
				<!-- /List -->
				<div id="pagenav_div">
					<ui:pagination paginationInfo = "${paginationInfo}"	 type="image"	 jsFunction="fn_egov_link_page"	   />
					<!--<form:hidden path="pageIndex" />-->
				</div>			
				<div class="subbtn_align">  
				    <ul>
						<li class="btn02_leftbg"></li>
						<li class="btn02_middlebg"><a href="<c:url value='/cms/cmm/addDicWord.do'/>" onclick="fn_egov_addView(); return false;" class="btn_link">등록</a></li>
						<li class="btn02_rightbg"></li>
						<c:if test="${authorCode eq 'ROLE_ADMIN' }">
						<li class="btn02_leftbg"></li>
						<li class="btn02_middlebg"><a href="<c:url value='/cms/cmm/addDicWordExcel.do'/>" onclick="fn_egov_addExcelView(); return false;" class="btn_link">엑셀등록</a></li>
						<li class="btn02_rightbg"></li>
						</c:if>
						<li class="btn02_leftbg"></li>
						<li class="btn02_middlebg"><a href="<c:url value='/cms/cmm/addDicWordExcelDwon.do'/>" onclick="fn_egov_addExcelDown(); return false;" class="btn_link">엑셀다운로드</a></li>
						<li class="btn02_rightbg"></li>												
				    </ul>
				</div>						
			</div>
			
			<!-- 2010.11.17 div 추가 -->
			</div>
			</form:form>

		<!-- BODY 내용 END -->
		</div>
	
	</div>

	<!-- 카피라이트 시작 -->
	<div id="footer"><jsp:include 	page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
	<!-- //카피라이트 끝 -->
	<!-- 메인 끝 -->

</div>
<!-- //전체 DIV끝 -->
</body>
</html>
