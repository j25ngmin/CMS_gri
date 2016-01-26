/**
  * @JavaScript Name : EgovOperImprovReqDetail.js
  * @Description : 운영개선요청 List 에서 원하는 게시글 선택시 나타나는 레이어팝업(모달)창에 대한 JS파일.
  * 
 */

$(document).ready(function() {
	
	$("#modiBtn").click(function(event){
		alert("modiBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_modify();
	});
	
	$("#closeBtn").click(function(event){
		alert("closeBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_close(true);
	});
	
	$("#regBtn").click(function(event){
		alert("regBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_modify(true);
		$(".no_regist").attr('style', 'display: none');
		$("#detailFrstRegisterNm").html($("#s_mberNm").val());
		$("#detailFrstRegisterPnttm").html($("#detailProcessComptDe").val());
		//fn_save();
		
	});

		
//	$('#modal-detail_improv_request').on('hidden.bs.modal', function (e) {
//		console.log("11");
//		 fn_close();
//			console.log("22");
//
//	});
	
});

//@RequestMapping(value="/cms/srm/chrg/selectOperImprovReqProc.do")
//public String selectOperImprovReqProc(@RequestParam("selectedId")String selectedId, @ModelAttribute("vo") EgovOe1OperImprovReqVO vo, ModelMap model)throws Exception  {
//
//	//검색조건
//    model.addAttribute("searchVO", vo);
//    
//	//요청구분코드
//    EgovOe1ComDefaultCodeVO codeVo1 = new EgovOe1ComDefaultCodeVO();
//    codeVo1.setCodeId("OE1012");
//    List srTrgetCode_result1 = egovCmmUseService.selectCmmCodeDetail(codeVo1);
//    model.addAttribute("requstTyCode", srTrgetCode_result1);
//	
//	//긴급처리여부
//    EgovOe1ComDefaultCodeVO codeVo2 = new EgovOe1ComDefaultCodeVO();
//    codeVo2.setCodeId("OE1005");
//    List srTrgetCode_result2 = egovCmmUseService.selectCmmCodeDetail(codeVo2);
//    model.addAttribute("emrgncyProcessAt", srTrgetCode_result2);			
//	
//	EgovOe1OperImprovReqVO vo1 = new EgovOe1OperImprovReqVO();
//	EgovOe1OperImprovReqVO vo2= new EgovOe1OperImprovReqVO();
//	vo1.setOperImprvmRequstId(selectedId);
//	
//	vo2 = operImprovReqService.selectOperImprovReq(vo1);
//	model.addAttribute("vo",vo2);
//	
//    return "cms/srm/EgovOperImprovReqProc";
//}	


/* 선택된 운영개선요청 글과 조치이력을 레이어팝업(모달)로 가져오기. */
function fn_find_oper_improv_req(operImprvmRequstId) {
	
	var param  = '/CMS/cms/ajax/findOperImprovReqest.do'
    var str = "";
	
	console.log(param);
	
	$.ajax ({
		url : param,
		type:'get',
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",	
		data:{
			operImprvmRequstId:operImprvmRequstId, 
		},
		success : function(data) {

			$("#detailFrstRegisterNm").html(data.reqVO.frstRegisterNm);
			$("#detailFrstRegisterPnttm").html(data.reqVO.frstRegisterPnttm);
			$('input[name=deTailFrstRegisterid]').attr('value',data.reqVO.frstRegisterId);
			$('input[name=operImprvmRequstId]').attr('value',data.reqVO.operImprvmRequstId);
			$('input[id=detailOperImprvmRequstSj]').attr('value',data.reqVO.operImprvmRequstSj); 
			$('input[id=detailOperJobSecodeNm]').attr('value',data.reqVO.operJobSeCodeNm); 
			$('input[id=detailComptRequstDe]').attr('value',data.reqVO.comptRequstDe); 
			$('input[id=detailOperImprvmRequstCn]').attr('value',data.reqVO.operImprvmRequstCn);
			
			console.log(data.reqVO.requstTyCode);
			//업무구분/요청코드/우선순위코드/유지보수 담당자
			$('input[name=operJobSeCode]').attr('value',data.reqVO.operJobSeCode);
			$('input[name=requstTyCode]').attr('value',data.reqVO.requstTyCode);
			$('input[name=emrgncyProcessAt]').attr('value',data.reqVO.emrgncyProcessAt);
			$('input[name=chargerId]').attr('value',data.reqVO.chargerId);
			
			//조치이력 List
			var processList= data.processList;
			var $processList= $('#processList');
			//조치이력 초기화
			$processList.empty();
			//조치이력 List 돌기
			   $.each(processList, function(index, data){
				   $processList.append("<tr><td>"+data.operProcessDate+"<br>"+
						   data.operProcessCn+"</td></tr>");
			   });	

			fn_buttonShow_by_authorCode_and_sessionId();
			
			var testOperJobSeCode= data.operJobSeCode;
			var testRequstTyCode= data.requstTyCode;
			var testEmrgncyProcessAt= data.emrgncyProcessAt;
			var testAuthorUser= data.authorUser;
			var $selectoperJobSeCode= $('#detailOperJobSecode');
			var $selectrequstTyCode= $('#detailRequstTyCode');
			var $selectemrgncyProcessAt = $('#detailEmrgncyProcessAt');
			var $selectchargerId = $('#detailChargerId');
			
			console.log(testOperJobSeCode);

			//콤보박스 옵션값 초기화
				$selectoperJobSeCode.find('option').remove()
				$selectrequstTyCode.find('option').remove();
				$selectemrgncyProcessAt.find('option').remove();
				$selectchargerId.find('option').remove();
				$selectoperJobSeCode.append('<option value>--선택하세요--</option>')
				$selectrequstTyCode.append('<option value>--선택하세요--</option>') 
				$selectemrgncyProcessAt.append('<option value>--선택하세요--</option>') 
			   	$selectchargerId.append('<option value>--선택하세요--</option>') 
			   	
			  	//업무구분
			   		console.log("testOperJobSeCode : "+testOperJobSeCode);
					$.each(testRequstTyCode, function(index, data){
						var str;
						console.log("업무구분 forEach  DB 값 :" +$('input[name=operJobSeCode]').val());
						console.log("업무구분 forEach 비교할 값 :" +data.code);
						str = "<option value=\'"+data.code+"\' ";
					if($('input[name=operJobSeCode]').attr("value") == data.code) {
						console.log("요청코드 if문에 들어오긴 하니?");
					str += " selected";
					}
					str += ">"+data.codeNm+"</option>";
					
					$selectoperJobSeCode.append(str);
					console.log("요청코드str :"+str);  
					 });
			   	
			   	//요청코드
			   		console.log("testRequstTyCode : "+testRequstTyCode);
					$.each(testRequstTyCode, function(index, data){
						var str;
						console.log("요청코드 forEach  DB 값 :" +$('input[name=requstTyCode]').val());
						console.log("요청코드 forEach 비교할 값 :" +data.code);
						str = "<option value=\'"+data.code+"\' ";
					if($('input[name=requstTyCode]').attr("value") == data.code) {
						console.log("요청코드 if문에 들어오긴 하니?");
					str += " selected";
					}
					str += ">"+data.codeNm+"</option>";
					
					$selectrequstTyCode.append(str);
					console.log("요청코드str :"+str);  
					 });
				
				//긴급여부
					console.log("testEmrgncyProcessAt : "+testEmrgncyProcessAt);
					$.each(testEmrgncyProcessAt, function(index, data){
					var str;
					console.log("긴급여부 forEach  DB 값 :" +$('input[name=emrgncyProcessAt]').val());
					console.log("긴급여부 forEach 비교할 값 :" +data.code);
					str = "<option value=\'"+data.code+"\' ";
					if($('input[name=emrgncyProcessAt]').attr("value") == data.code) {
						console.log("긴급여부 if문에 들어오긴 하니?");

						str += " selected";
					}
					str += ">"+data.codeNm+"</option>";
					
					 $selectemrgncyProcessAt.append(str);
					 console.log("긴급여부str :"+str); 
					   });
				
					//담당자
					console.log("testAuthorUser : "+testAuthorUser);
					$.each(testAuthorUser, function(index, data){
						var str;
						console.log("담당자 forEach  DB 값 :" +$('input[name=chargerId]').val());
						console.log("담당자 forEach 비교할 값 :" +data.mberId);
						str = "<option value=\'"+data.mberId+"\' ";
						if($('input[name=chargerId]').attr("value") == data.mberId) {
							console.log("담당자 if문에 들어오긴 하니?");

							str += "  selected";
						}
						str += ">"+data.mberNm+"("+data.moblphonNo+','+data.mberEmailAdres+")</option>";
					
						$selectchargerId.append(str);
						console.log("담당자str :"+str); 
						   });
		},
		
	  error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }

	}); /* Ajax function */
	str = "";
} /* fn_egov_inqire_notice  */


/* 운영개선요청 수정한 내용을 저장하기. */
function fn_update_oper_improv_req() {
	
	var url  = '/CMS/cms/ajax/updateOperImprovReqest.do'
		
	var operImprovReqVO = $("#listForm").serializeArray();
	
	console.log(operImprovReqVO);
	console.log(url);

	alert("fn_update_oper_improv_req SERIALIZEARRAY : "+operImprovReqVO);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:	operImprovReqVO,
		success : function(responseData) {
			alert(responseData);
		
			if(responseData) {
				alert("modiInputData 수정한 내용 저장 성공^^. "+responseData);

				 fn_buttonShow_by_authorCode_and_sessionId();

			}else {
				alert("modiInputData 수정한 내용 저장 실패 ㅠㅠ. " +responseData);
			}
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_update_oper_improv_req  */

/* 운영개선요청글 삭제하기. */
function fn_remove_oper_improv_req() {
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		
		var url  = '/CMS/cms/ajax/removeOperImprovReqest.do'
			
			var operImprovReqVO = $("input[name=operImprvmRequstId]").serializeArray();

			console.log(url);

			alert("fn_remove_oper_improv_req SERIALIZEARRAY: "+operImprovReqVO);
			
			$.ajax ({
				url : url ,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				type:'POST',
				data:	operImprovReqVO,
				success : function(responseData) {
				
					if(responseData) {
						alert(responseData);
						
						location.reload();

					}else {
						alert(responseData);
					}
				
				},
				  error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				
			}); /* Ajax function */
	}else{   //취소
	    return;
	}
	
	
} /* fn_remove_oper_improv_req */

/* 운영개선요청글에 조치결과 답글 달기. */
function fn_add_oper_process() {
	var operImprvmRequstId = 	$("input[name=operImprvmRequstId]").val();
	var processCn = $("#detailProcessCn").val();
	var processComptDe = $("#detailProcessComptDe").val();
	
	console.log("processCn : "+processCn);
	console.log("processComptDe : "+processComptDe);

	var url  = '/CMS/cms/ajax/addOperProcess.do'

	console.log(url);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:	{
			operImprvmRequstId:operImprvmRequstId, processCn:processCn, processComptDe:processComptDe
		},
		success : function(responseData) {
			alert("조치결과 들어갓다~~");
			fn_find_oper_improv_req(operImprvmRequstId);
			$("#detailProcessCn").attr("value", ' ');
			

		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_add_oper_process */

/* 운영개선요청게시판에 게시글 등록하기. */
function fn_add_oper_improv_req() {

	var operImprovReqVO = $("#listForm").serializeArray();
	
	var url  = '/CMS/cms/ajax/addOperImprovReq.do'

	console.log(url);

	alert("fn_add_oper_improv_req SERIALIZE: "+operImprovReqVO);
	
	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		type:'POST',
		data:operImprovReqVO,
		success : function(data) {
			alert("운영개선요청 게시글 들어갓다~~");
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_add_oper_process */

/* 운영개선요청게시판에 게시글 등록하기 위한 폼(DB) 받기*/
function fn_add_oper_improv_req_view() {

	var url  = '/CMS/cms/ajax/addOperImprovReqView.do'

	console.log(url);

	$.ajax ({
		url : url ,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data) {
			
			console.log(data);
			
			$('input[name=operJobSeCode]').attr('value',data.operJobSeCode.code);
			var testOperJobSeCode= data.operJobSeCode;
			var $selectoperJobSeCode= $('#detailOperJobSecode');
			$selectoperJobSeCode.find('option').remove();
			$selectoperJobSeCode.append('<option value>--선택하세요--</option>');
			
			//업무구분
	   		console.log("testOperJobSeCode : "+testOperJobSeCode);
			$.each(testOperJobSeCode, function(index, data){
				var str;
				console.log("업무구분 forEach  DB 값 :" +$('input[name=operJobSeCode]').val());
				console.log("업무구분 forEach 비교할 값 :" +data.code);
				str = "<option value=\'"+data.code+"\' ";
				str += ">"+data.codeNm+"</option>";
			
			$selectoperJobSeCode.append(str);
			 });
			
		},
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		
	}); /* Ajax function */
} /* fn_add_oper_process */

function fn_buttonShow_by_authorCode_and_sessionId() {
	var frstRegisterId = $("#deTailFrstRegisterid").attr("value");
	var s_mberId = $("#s_mberId").attr("value");
	var s_authorCode = $("#s_authorCode").attr("value");

	alert("[fn_buttonShow_by_authorCode 1] AJAX에서 값 넣어 가져온 요청자 : "+frstRegisterId);
	alert("[fn_buttonShow_by_authorCode 2] AJAX에서 값 넣어 JSP에서 가져온 요청자= JSP에서 가져온 세션값 : "+frstRegisterId+"="+s_mberId);
	
	if(s_authorCode == 'ROLE_OPER_ADMIN' && frstRegisterId == s_mberId ) {
		console.log("#1  "+s_authorCode);
		
		fn_view();
		}else if(s_authorCode == 'ROLE_OPER_ADMIN' && frstRegisterId != s_mberId ) {
			console.log("#2  "+s_authorCode);
			fn_initBtn(false);
		}else if( (s_authorCode != 'ROLE_OPER_ADMIN' && frstRegisterId == s_mberId) || (s_authorCode == 'ROLE_ADMIN')  ) {
			console.log("#3  "+s_authorCode);
			 fn_modify(); 
		}else if( s_authorCode == 'ROLE_OPER_CHARGER' && frstRegisterId != s_mberId ) {
			console.log("#4  "+s_authorCode);		
			fn_initBtn(true);
		}
}

function fn_close(reload) {
	$('.modiInput').attr('readonly',true);
	$('.modiInput').attr('style','border: 0px');
	if(reload) {
	location.reload();
	}
}

function fn_modify(add) {
	$('#deleteBtn').attr('style','display: inline-block');
	$('#modiBtn').attr('style','display: none'); 
	$('.modiInput').attr('readonly',false);
	$('.modiInput').attr('style','border: 1px');
	$('#detailOperImprvmRequstCn').attr('style', 'height: 100%').attr('style', 'width: 100%');
	if(add) {
		$("#addSaveBtn").attr('style','display:  lnline-block');
	}else {
		$('#updateSaveBtn').attr('style','display: inline-block');
	}
}

function fn_view() {
	$('.modiInput').attr('style','border: 0px');
	$('.modiInput').attr('readonly',true);

	$('#deleteBtn').attr('style','display: lnline-block'); 
	$('#modiBtn').attr('style','display: lnline-block'); 
	$('#updateSaveBtn').attr('style','display: none');
}

function fn_save() {
	var operImprvmRequstId = 	$("input[name=operImprvmRequstId]").val();

	if(operImprvmRequstId == null || operImprvmRequstId.equals('') ){
		initBtn();
		$("#addSaveBtn").attr('style','display:  lnline-block');
	}
}

function fn_initBtn(author) {
	$('#deleteBtn').attr('style','display: none');
	$('#modiBtn').attr('style','display: none'); 
	$('#updateSaveBtn').attr('style','display: none'); 
	if(author) {
		$('#detailProcess').attr('readonly',false);
	}
}