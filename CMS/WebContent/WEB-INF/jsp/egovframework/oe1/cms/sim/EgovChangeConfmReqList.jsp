<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
  /**
  * @JSP Name    : EgovChangeConfmReqList.jsp
  * @Description : 변경 검토 요청건 목록 
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.08.16  김아름          최초 생성
  *
  * author 운영환경 1팀 
  * Copyright (C) 2010 by MOPAS  All right reserved.
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-language" content="ko">
<title>변경 검토 요청건 목록</title>
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>"	rel="stylesheet" type="text/css" >
<link	href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>"	rel="stylesheet" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovCalPopup.js' />"></script>
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

/* 페이지 처리 function */
function fn_egov_link_page(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cms/sim/admin/selectChangeConfmReqList.do'/>";
   	document.listForm.submit();
}

/* 목록 화면 function */
function fn_egov_selectList() {
	if( (document.listForm.fromDate.value != "" && document.listForm.toDate.value == "") || (document.listForm.fromDate.value == "" && document.listForm.toDate.value != "") )
		alert("접수일로 검색을 원하시면 from 과 to 를 선택해 주세요");
	else{
		if(document.listForm.fromDate.value > document.listForm.toDate.value)
			alert("올바른 from 과 to를 선택해 주세요");
		else{
			document.listForm.pageIndex.value = 1;
			document.listForm.action = "<c:url value='/cms/sim/admin/selectChangeConfmReqList.do'/>";
		   	document.listForm.submit();
		}
	}
}

/* 상세  function 
- 처리상태에 따라 분기 화면을 다르게 처리
*/
function fn_egov_select_detail(id, code){
	document.listForm.code.value = code;
	document.listForm.id.value = id;
	document.listForm.action = "<c:url value='/cms/sim/admin/branchChangeWorkConfm.do'/>";
  	document.listForm.submit();	
}
</script>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	

<div id="wrap">
<!-- 전체 레이어 시작 -->
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

<div id="content"><!-- BODY 내용 START -->

<form name="listForm" method="post" action="<c:url value='/cms/sim/admin/selectChangeConfmReqList.do'/>" onsubmit="javascript:fn_egov_selectList(); return false;">
<input name="code" type="hidden" />
<input name="id" type="hidden" /> 

<div id="content_pop"><!-- 타이틀 -->
<div id="h2_topnav"><h1><strong> 변경검토 요청 건 목록</strong></h1></div>
<!-- // 타이틀 -->

<!-- 검색 -->
<div class="search_area_submit">
<ul>
	<li>
		<img src="<c:url value='/images/egovframework/oe1/cms/com/img_search01.gif'/>" alt="Search" class="imgs" />
	</li>
	<li>
		<select name="changeProcessSttusCode" id="changeProcessSttusCode" tabindex="1" style="width:120px"  title="검토요청구분">
			<option value=''>--검토요청구분--</option>
			<c:forEach items="${changeProcessSttusCode_result}" var="codeInfo" varStatus="status">
			<c:if test="${codeInfo.codeNm eq '계획검토' or codeInfo.codeNm eq '완료검토'  }">
			<option value="${codeInfo.code}" <c:if test="${searchVO.changeProcessSttusCode eq codeInfo.code}">selected="selected"</c:if>>${codeInfo.codeNm}</option>
			</c:if>
			</c:forEach>
		</select>    
	</li>
	<li>
		<select name="emrgncyProcessAt" id="emrgncyProcessAt" tabindex="2" style="width:120px" title="긴급처리">
		<option value=''>--긴급처리--</option>
		<c:forEach items="${emrgncyProcessAt_result}" var="codeInfo" varStatus="status">
		<option value="${codeInfo.code}" <c:if test="${searchVO.emrgncyProcessAt eq codeInfo.code}">selected="selected"</c:if>>${codeInfo.codeNm}</option>
		</c:forEach>
		</select>
	 </li>
	 <li> 
		&nbsp;&nbsp;&nbsp;&nbsp;접수일 : &nbsp;
		<input type="hidden" name="cal_url" value="<c:url value='/com/EgovNormalCalPopup.do'/>" />
		<input name="fromDate" value="${searchVO.fromDate }" maxlength="10" class="inputsmall01" style="width:80px;" title="접수일(from)" tabindex="3"/>
		<img name="calImg" src="<c:url value='/images/egovframework/oe1/cms/com/bu_icon_carlendar.gif'/>" alt="달력"  width="16" height="16" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.fromDate); return false;" />
		&nbsp;~&nbsp; 
		<input name="toDate" value="${searchVO.toDate }" maxlength="10" class="inputsmall01" style="width:80px;" title="접수일(to)" tabindex="4"/>
		<img name="calImg" src="<c:url value='/images/egovframework/oe1/cms/com/bu_icon_carlendar.gif'/>" alt="달력"  width="16" height="16" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.toDate); return false;" />
		&nbsp;&nbsp;
	</li>
	<li>	
		 <div class="submit_gray_btn_top">		
			<ul>
				<li class="submit_gray_btn_left"></li>
				<li><span class="submit_gray_btn_middle"><input type="submit" value="검색" onclick="fn_egov_selectList(); return false;" class="submit_btn_input" tabindex="5"/></span></li>
				<li class="submit_gray_btn_right"></li>
			</ul>
		</div>
	</li>
</ul>
</div>
</div>

<!-- List -->   
<div id="result_table">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  class="table_style" summary="이표는 변경검토 요청 건 정보를 제공하며, 처리상태, 변경요청명, 긴급처리, 접수일 정보등으로 구성되어 있습니다.">
<caption>변경검토 요청 건 검색목록</caption>
	<colgroup>
		<col width="5%">				
		<col width="10%">
		<col width="35%">
		<col width="10%">
		<col width="10%">			
		<col width="10%">
		<col width="10%">    
		<col width="10%"> 
	</colgroup>	
	<thead>
	<tr>  
	    <th scope="col">순번</th>
	    <th scope="col">처리상태</th>
	    <th scope="col">변경요청명</th>
	     <th scope="col">긴급</th>
	    <th scope="col">접수일</th>
	    <th scope="col">변경담당자</th>
	    <th scope="col">계획검토<br>요청일</th>
	    <th scope="col">완료검토<br>요청일</th>
	</tr>
	</thead>
	<!-- 목록 시작 -->
	<tbody>
    <c:if test="${empty resultList}">
    <tr>    
		<td  colspan="8"> 	검색 결과가 없습니다.  </td>
    </tr>
    </c:if>
	<c:if test="${!empty resultList}">
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
		<td><a href="<c:url value='/cms/sim/admin/branchChangeWorkConfm.do'/>?id=<c:out value="${resultInfo.changeRequstProcessId}"/>&amp;code=<c:out value="${resultInfo.changeProcessSttusCode}"/>" onclick="fn_egov_select_detail('${resultInfo.changeRequstProcessId}' ,'${resultInfo.changeProcessSttusCode}' ); return false;" class="board_text_link" ><c:out value="${resultInfo.changeProcessSttusCodeNm}"/></a></td>
	    <td   align="left"><c:out value="${resultInfo.changeRequstNm}"/></td>
	    <c:choose>
	    <c:when test="${resultInfo.emrgncyProcessAt == '긴급'}"><td><font color="red"><c:out value="${resultInfo.emrgncyProcessAt}"/></font></td></c:when>
		<c:when test="${resultInfo.emrgncyProcessAt == '일반'}"><td><font color="green"><c:out value="${resultInfo.emrgncyProcessAt}"/></font></td></c:when>
		</c:choose>  
	    <td><c:out value="${resultInfo.changeRceptDe}"/></td>
	    <td><c:out value="${resultInfo.changeOpertorNm}"/></td>
	    <td>
	    <c:choose>
	    <c:when test="${resultInfo.planExmntReqDt eq null}">   	-    </c:when>
	    <c:otherwise> <c:out value="${resultInfo.planExmntReqDt}"/>  </c:otherwise>
	    </c:choose>
	     </td>
		<td >
		<c:choose>
		<c:when test="${resultInfo.comptExmntReqDt eq null}">   	-    </c:when>
	    <c:otherwise>   <c:out value="${resultInfo.comptExmntReqDt}"/>    </c:otherwise>
	    </c:choose>
		</td>
	</tr>
	</c:forEach>
	</c:if>  
	</tbody>
	<!-- 목록 끝 -->
</table>
</div>
<br>

<!--  page start -->
<div id="pagenav_div">
	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_linkPage" />
</div>
<!--  page end -->
	
<a href="#top_menu" class="hide_a"> </a>
<!-- Pagination 끝-->

<!-- 검색조건유지 데이터 -->
<input name="searchCondition" type="hidden" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input name="searchKeyword" type="hidden" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="pageSize" type="hidden" value="<c:out value='${searchVO.pageSize}'/>"/>
<input name="changeRequstProcessId" type="hidden" value="<c:out value='${searchVO.changeRequstProcessId}'/>"/>
</form>
</div>

<!-- BODY 내용 END --></div>

<!-- 카피라이트 시작 -->
<div id="footer"><jsp:include 	page="/WEB-INF/jsp/egovframework/oe1/cms/com/EgovBottom.jsp" /></div>
<!-- //카피라이트 끝 -->
<!-- 메인 끝 -->
<!-- //전체 DIV끝 --></div>
</body>
</html>