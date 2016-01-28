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
	
/*	$("#closeBtn").click(function(event){
		alert("closeBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_close(true);
	});*/
	
	$("#regBtn").click(function(event){
		alert("regBtn 클릭 시 실행되는 제이쿼리 함수.");
		fn_modify(true);
		$(".no_regist").attr('style', 'display: none');
		
		$("#detailFrstRegisterNm").html($("#s_mberNm").val());
		$("#detailFrstRegisterPnttm").html($("#today").val());
		$('input[name=frstRegisterNm]').attr('value',$("#s_mberNm").val());
		$('input[name=frstRegisterId]').attr('value',$("#s_mberId").val());
		console.log($("#s_mberNm").val());
		console.log($("#today").val());

		console.log("1"+$("#detailFrstRegisterNm").html());
		console.log("2"+$("#detailFrstRegisterPnttm").html());
		console.log("3"+$('input[name=frstRegisterNm]').val());
		console.log("4"+$('input[name=frstRegisterId]').val());

		

		
		//fn_save();
		
	});
	
	$('#detail_improv_request').on('hidden.bs.modal', function () {
		 location.reload();
		})
		
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
		/*	$('input[name=input_operJobSeCode]').attr('value',data.reqVO.operJobSeCode);
			$('input[name=input_requstTyCode]').attr('value',data.reqVO.requstTyCode);
			$('input[name=input_emrgncyProcessAt]').attr('value',data.reqVO.emrgncyProcessAt);
			$('input[name=input_chargerId]').attr('value',data.reqVO.chargerId);*/
			
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
			
//			var testOperJobSeCode= data.operJobSeCode;
//			var testRequstTyCode= data.requstTyCode;
//			var testEmrgncyProcessAt= data.emrgncyProcessAt;
//			var testAuthorUser= data.authorUser;
//			var $selectoperJobSeCode= $('#detailOperJobSecode')
//			var $selectrequstTyCode= $('#detailRequstTyCode');
//			var $selectemrgncyProcessAt = $('#detailEmrgncyProcessAt');
//			var $selectchargerId = $('#detailChargerId');
			
alert("ajax가 먼저 찾나?");
			
	
			 var detailOperJobSeCode = document.getElementById("detailOperJobSeCode"); // 셀렉트를 가져옵니다.
			 var detailRequstTyCode = document.getElementById("detailRequstTyCode");
			 var detailEmrgncyProcessAt = document.getElementById("detailEmrgncyProcessAt"); // 셀렉트를 가져옵니다.
			 var detailChargerId = document.getElementById("detailChargerId"); // 셀렉트를 가져옵니다.
			 
			console.log("#1-1.  ddddd업무구분 legnth  : "+detailOperJobSeCode.length);
			console.log("#2-1.  업무구분 legnth  : "+detailRequstTyCode.length);
			console.log("#3-1.  긴급여부 legnth  : "+detailEmrgncyProcessAt.length); 
			console.log("#4-1.  담당자 legnth  : "+detailChargerId.length);

			console.log("#1.  업무구분   : "+data.reqVO.operJobSeCode);
			console.log("#2.  업무구분   : "+data.reqVO.requstTyCode);
			console.log("#3.  긴급여부   : "+data.reqVO.emrgncyProcessAt); 
			console.log("#4.  담당자   : "+data.reqVO.chargerId);			
			
			console.log("#1. AJAX로 find한 업무구분 : "+data.reqVO.operJobSeCode);
			
			//업무구분
					for( var i =0; i<detailOperJobSeCode.length ; i++ ) {
						console.log("#1-2. forEach로 돌려본 업무구분option : "+detailOperJobSeCode.options[i].value);
						if(detailOperJobSeCode.options[i].value == data.reqVO.operJobSeCode) {
							detailOperJobSeCode.options[i].selected = 'selected';
							console.log("selected 됐다.")
							break
							}
					}
			
			/* 왜 JQuery 는 안될까라는 의문때문에 지우지 않음...
					$.each(detailOperJobSeCode.length, function(index, i){
						console.log("#1-2. forEach로 돌려본 업무구분option : "+$('#detailOperJobSecode').option[i]);
					if($('#detailOperJobSecode').options[i].value == data.reqVO.operJobSeCode) {
						$('#detailOperJobSecode').options[i].selected = 'selected';
						}
					});*/
			   	
				console.log("#2. AJAX로 find한 요청코드 : "+data.reqVO.requstTyCode);
				
				for( var i =0; i<detailRequstTyCode.length ; i++ ) {
					console.log("#1xxxxxxxxxx-2. forEach로 돌려본 업무구분option : "+detailRequstTyCode.options[i].value);
					if(detailRequstTyCode.options[i].value == data.reqVO.requstTyCode) {
						detailRequstTyCode.options[i].selected = 'selected';
						console.log("selected 됐다.")
						break
						}
				}

			   	//요청코드
			/*	$.each(detailRequstTyCode.length, function(index, i){
					console.log("#2-2. forEach로 돌려본 업무구분option : "+$('#detailRequstTyCode').option[i]);
					if($('#detailRequstTyCode').option[i] == data.reqVO.requstTyCode ) {
						$('#detailRequstTyCode').option[i].selected = 'selected';
						}
					});*/
				
				console.log("#3. AJAX로 find한 긴급여부 : "+data.reqVO.emrgncyProcessAt);
				
/*				for( var i =0; i<detailEmrgncyProcessAt.length ; i++ ) {
					console.log("#3-2. forEach로 돌려본 긴급여부 option : "/+detailEmrgncyProcessAt.options[i].value+"/");
					if(detailEmrgncyProcessAt.options[i].value == data.reqVO.operJobSeCode) {
						detailEmrgncyProcessAt.options[i].selected = 'selected';
						console.log("selected 됐다.")
						break
						}
				}*/
				
				for( var i =0; i<detailEmrgncyProcessAt.length ; i++ ) {
					console.log("#1xxxxxxxxxx-2. forEach로 돌려본 업무구분option : "+detailEmrgncyProcessAt.options[i].value);
					if(detailEmrgncyProcessAt.options[i].value == data.reqVO.emrgncyProcessAt) {
						detailEmrgncyProcessAt.options[i].selected = 'selected';
						console.log("selected 됐다.")
						break
						}
				}

				//긴급여부
			/*	$.each(detailEmrgncyProcessAt.length, function(index, i){
					console.log("#3-2. forEach로 돌려본 긴급여부 option : "+$('#detailEmrgncyProcessAt').option[i]);
					if($('#detailEmrgncyProcessAt').option[i] == data.reqVO.emrgncyProcessAt ) {
						$('#detailEmrgncyProcessAt').option[i].selected = 'selected';
						}
					});*/
					
				console.log("#4. AJAX로 find한 담당자 : "+data.reqVO.chargerId);
				
				for( var i =0; i<detailChargerId.length ; i++ ) {
					console.log("#1xxxxxxxxxx-2. forEach로 돌려본 업무구분option : "+detailChargerId.options[i].value);
					if(detailChargerId.options[i].value == data.reqVO.chargerId) {
						detailChargerId.options[i].selected = 'selected';
						console.log("selected 됐다.")
						break
						}
				}

				//담당자
			/*	$.each(detailChargerId.length, function(index, i){
					console.log("#4-2. forEach로 돌려본 담당자 option : "+$('#detailChargerId').option[i]);
					if($('#detailChargerId').option[i] == data.reqVO.chargerId ) {
						$('#detailChargerId').option[i].selected = 'selected';
					}
				});*/
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }


	}); /* Ajax function */

} /* fn_egov_inqire_notice  */


/* 운영개선요청 수정한 내용을 저장하기. */
function fn_update_oper_improv_req() {
	
	var url  = '/CMS/cms/ajax/updateOperImprovReqest.do'
		
	var operImprovReqVO = $("#listForm").serialize();
	
	console.log(operImprovReqVO);
	console.log(url);

	alert("어레이 아님 fn_update_oper_improv_req SERIALIZE : "+operImprovReqVO);
	
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
	var processComptDe = $("input[name=processComptDe").val();
	
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

	var operImprovReqVO = $("#listForm").serialize();
	
	var url  = '/CMS/cms/ajax/addOperImprovReq.do'

	console.log(url);

	alert("어레이 아님 !!! fn_add_oper_improv_req SERIALIZE: "+operImprovReqVO);
	
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

/*function fn_close(reload) {
	$('.modiInput').attr('readonly',true);
	$('.modiInput').attr('style','border: 0px');
	if(reload) {
	location.reload();
	}
}*/

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
	console.log("??????????????.");
	$('.modiInput').attr('style','border: 0px');
	$('.modiInput').attr('readonly',true);
/*	$('.modiSelect').prop('onFocus','this.initialSelect = this.selectedIndex;');
	$('.modiSelect').prop('onChange', 'this.selectedIndex = this.initialSelect;');*/
	
/*	$('.modiSelect').attr('title1', function(){
		onFocus='this.initialSelect = this.selectedIndex;'
	});
	$('.modiSelect').attr('title2', function(){
		onChange='this.selectedIndex = this.initialSelect';
	});
	title1();
	title2();*/
	
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