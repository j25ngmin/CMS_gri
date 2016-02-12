<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @JSP Name : EgovSanctnDspthDetail.jsp
  * @Description : 통보상세
  * @Modification Information
  * 
  *   수정일                   수정자                 수정내용
  *  -------      --------    ---------------------------
  *  2010.07.02    조수정                 최초 생성
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
<title>통보상세</title>

<!-- style -->
<link href="<c:url value='/css/egovframework/oe1/cms/com/common.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/oe1/cms/com/themes/ui-lightness/jquery.ui.all.css'/>" rel="stylesheet" type="text/css">

<!-- script -->
<script type="text/javascript" language="javascript" src="<c:url value='/js/egovframework/oe1/cms/com/EgovMainMenu.js' />" ></script>

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
function fn_selectList(){
	document.detail_form.action = "<c:url value = '/cms/cmm/inquirySanctionDispatchList.do'/>";
	document.detail_form.submit();
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

		<!-- form 시작 -->
		<form:form commandName="sanctionSubmitVO" name="detail_form">

			<!-- 목록조회로 돌아갈 때 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${sanctionSubmitVO.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${sanctionSubmitVO.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${sanctionSubmitVO.pageIndex}'/>"/>
						
			<!-- 상신번호 유지 -->
			<input type="hidden" name="drftSn" value="<c:out value='${sanctionSubmitVO.drftSn}'/>"/>
						
							<!-- content_pop 시작 -->	
							<div id="content_pop">
						<!-- 타이틀 -->
						<div id="h2_topnav">
						<h1><strong>통보상세</strong></h1>
						</div>
						<!-- // 타이틀 -->
								
								<!-- 목록 시작 -->
								<div id="datail_table">
									<table summary="상신번호,기안자,제목,내용,상태 ,기안의견 .. 입니다.  " rules="rows" frame="void" class="table_style">
									<caption>통보상세</caption>
									
									<tr>
										<th scope="row">상신번호</th>
										<td>
											<c:out value="${sanctionSubmitVO.drftSn}"/>
										</td>
									</tr>

									<tr>
										<th scope="row">기안자</th>
										<td>
											<c:out value="${sanctionSubmitVO.mberNm}"/>
										</td>
									</tr>
																		
									<tr>
										<th scope="row">제목</th>
										<td>
											<c:out value="${sanctionSubmitVO.drftSj}"/>
										</td>
									</tr>										

									<tr>
										<th scope="row">내용</th>
										<td>
											<pre><c:out value="${sanctionSubmitVO.drftCn}"/></pre>
										</td>
									</tr>			

									<tr>
										<th scope="row">상태</th>
										<td>
											<c:out value="${sanctionSubmitVO.drftSttus}"/>
										</td>
									</tr>

								<c:if test="${sanctionSubmitVO.drftSttusCode != '4'}">																					
										<tr>
											<th scope="row">기안의견</th>
											<td><pre><c:out value="${sanctionSubmitVO.drftOpinion}"/></pre></td>
										</tr>														

										<tr>
											<th scope="row">기안일자</th>
											<td><c:out value="${sanctionSubmitVO.drftDt}"/></td>
										</tr>		
								</c:if>												

								<c:if test="${sanctionSubmitVO.drftSttusCode == '2'}">																													
										<tr>
											<th scope="row">승인의견</th>
											<td><pre><c:out value="${sanctionSubmitVO.afterOpinion}"/></pre></td>
										</tr>			

										<tr>
											<th scope="row">승인일자</th>
											<td><c:out value="${sanctionSubmitVO.afterConfmDt}"/></td>
										</tr>	
								</c:if>
																
								<c:if test="${sanctionSubmitVO.drftSttusCode == '3'}">
										<tr>
											<th scope="row">반려의견</th>
											<td><pre><c:out value="${sanctionSubmitVO.afterOpinion}"/></pre></td>
										</tr>			

										<tr>
											<th scope="row">반려일자</th>
											<td><c:out value="${sanctionSubmitVO.afterConfmDt}"/></td>
										</tr>			
								</c:if>								
									
										<tr>
											<th scope="row">첨부파일</th>
											<td >
											    <div id="file">
										  			<c:import url="/cms/cmm/selectFileInfs.do"  charEncoding="utf-8">
										    			<c:param name="param_atchFileId" value="${sanctionSubmitVO.atchFileId}" />
										    		</c:import> 
												</div>
											</td>
										</tr>													

									<tr>
										<th scope="row">삭제여부</th>
										<td>
											<c:out value="${sanctionSubmitVO.deleteYn}"/>
										</td>
									</tr>				
																																					
									</table>
								</div>
								<!-- 목록 끝 -->


	<!-- List -->
	<div id="result_table">
	<table summary="순서, 결재구분 ,ID ,이름   목록입니다" class="table_style">
		<caption>결재자 검색 결과</caption>
		<colgroup>
			<col width="60">
			<col width="80">
			<col width="100">
			<col width="120">
		</colgroup>
		<thead>
			<tr>
		        <th scope="col">순서</th>
		        <th scope="col">결재구분</th>
		        <th scope="col">ID</th>
		        <th scope="col">이름</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty courseList}">
  			<tr>    
				<td  colspan="4"> 	검색 결과가 없습니다.  </td>
  			</tr>
  			</c:if>
		
		
		<c:forEach var="resultInfo" items="${courseList}" varStatus="status">
			<tr>
				<td>${resultInfo.confmOrdr}</td>
				<td>${resultInfo.confmSe}</td>
				<td>${resultInfo.confmer}</td>
				<td align="left">${resultInfo.mberNm}</td>
			</tr>
		</c:forEach>
		</tbody>

	</table>
	</div>
	<!-- /List -->		
							  <!-- 버튼 시작 -->
							<div class="subbtn_align">          
							<ul>
							    <li class="submit_btn01_left"></li>
							    <li><span class="submit_btn01"><input type="submit" name="submit_btn" value="목록" class="submit_btn_input"  onclick="fn_selectList(); return false;" /></span></li>
							    <li class="submit_btn01_right"></li>
							</ul>
							</div>
					  		<!-- 버튼 끝 -->
										
							</div>
							<!-- content_pop 시작 -->
			
						</form:form>								
						<!-- form 끝 -->
						


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
						