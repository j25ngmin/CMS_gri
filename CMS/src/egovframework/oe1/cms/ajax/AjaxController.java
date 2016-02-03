package egovframework.oe1.cms.ajax;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.oe1.cms.com.service.impl.EgovOe1CmmUseDAO;
import egovframework.oe1.cms.srm.service.EgovOe1OperImprovReqVO;
import egovframework.oe1.cms.srm.service.EgovOe1OperProcessVO;
import egovframework.oe1.cms.srm.service.impl.EgovOe1OperImprovReqDAO;
import egovframework.oe1.cms.sys.service.impl.EgovOe1AuthorGroupDAO;
import egovframework.oe1.cms.sys.service.impl.EgovOe1BBSManageDAO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Controller
public class AjaxController {
	
    // EgovOe1BBSManageDAO
    @Resource(name = "BBSManageDAO")
    private EgovOe1BBSManageDAO bbsMngDao;
    
    // EgovOe1OperImprovReqDAO
	@Resource(name="operImprovReqDAO")
	private EgovOe1OperImprovReqDAO operImprovReqDAO;
	
	// EgovOe1OperImprovReqDAO
	// 요청구분코드/긴급처리여부/업무구분 을 갖고 오기 위해.
	@Resource(name="cmmUseDAO")
	private EgovOe1CmmUseDAO cmmUseDAO;
	
	// EgovOe1AuthorGroupDAO
	@Resource(name="egovOe1AuthorGroupDAO")
	private EgovOe1AuthorGroupDAO egovOe1AuthorGroupDAO;
	
	/**
	 * IdGeneration
	 */
	@Resource(name="egovOperImprovReqIdGnrService")
	private EgovIdGnrService operImprovReqIdGnrService;
	
	  
	 SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	 Date currentTime = new Date ( );
	 String dTime = formatter.format ( currentTime );
	
	/* 선택된 운영개선요청 글과 조치이력을 레이어팝업(모달)로 가져오기. */
	 @RequestMapping(value="/cms/ajax/findOperImprovReqest.do", method=RequestMethod.GET)
	 public @ResponseBody Map<String, Object>findOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO)throws Exception  {

		Map<String, Object> map = new HashMap<String, Object>();
		 
		System.out.println("AjaxController - findOperImprovReqest - START!!!");
		 System.out.println("findOperImprovReqest::: 받아온 파라메터 : "+operImprovReqVO);

		
		//검색조건
//		model.addAttribute("searchVO", vo);
	
		EgovOe1OperImprovReqVO reqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);
		map.put("reqVO", reqVO);
		
	
      //조치이력
        EgovOe1OperProcessVO processVO = new EgovOe1OperProcessVO();
        List processList = operImprovReqDAO.selectOperProcessList(operImprovReqVO.getOperImprvmRequstId());
        map.put("processList", processList);
        System.out.println("processList : "+processList);
        
       System.out.println(map);

       System.out.println("AjaxController - findOperImprovReqest - END!!!");
	
       return map;
	}
	 
/*	 @RequestMapping(value="/cms/srm/gnrl/updateOperImprovReq.do")
		public String updateOperImprovReq(
				final MultipartHttpServletRequest multiRequest,
				@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, 
				SessionStatus status)throws Exception  {
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}	
			
		    String _atchFileId = vo.getRequstAtchFileId();// 해당 업무기능에 따라서 수정되는 기능의 파일 ID를 불러온다.
		    
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if(!files.isEmpty()){
	            if("".equals(_atchFileId) || _atchFileId == null){
	                List<EgovOe1FileVO> _result = fileUtil.parseFileInf(files, "", 0, _atchFileId, "");        
	                _atchFileId = fileMngService.insertFileInfs(_result); // 기존에 첨부파일 ID가 없다.
	                vo.setRequstAtchFileId(_atchFileId); // 관련 비즈니스 규칙에 따라서 생성된 첨부파일 ID 정보를 세팅한다.
	            }else{
	            	EgovOe1FileVO fvo = new EgovOe1FileVO();
	                fvo.setAtchFileId(_atchFileId); // 최종 파일 순번을 획득하기 위하여 VO에 현재 첨부파일 ID를 세팅한다.
	                int _cnt = fileMngService.getMaxFileSN(fvo); // 해당 첨부파일 ID에 속하는 최종 파일 순번을 획득한다.
	                List<EgovOe1FileVO> _result = fileUtil.parseFileInf(files, "", _cnt, _atchFileId, "");     
	                fileMngService.updateFileInfs(_result);
	            }
		    }  		
			
			operImprovReqService.updateOperImprovReq(vo);
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
		}*/
	 
	 /* 운영개선요청 수정한 내용을 저장하기. */
	 @RequestMapping(value="/cms/ajax/updateOperImprovReqest.do", method=RequestMethod.POST)
	 public  void updateOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status, HttpServletResponse response)throws Exception  {
		
		 System.out.println("AjaxController - updateSelectOperImprovReqest - START!!!");
	
		System.out.println("updateOperImprovReqest ::: 받아온 파라메터 값 BEFORE : "+operImprovReqVO);
		System.out.println("updateOperImprovReqest ::: 자세히 찍어보자! : "+operImprovReqVO.getOperImprvmRequstSj()+"//"+operImprovReqVO.getRequstTyCode()+"//"+operImprovReqVO.getEmrgncyProcessAt()+"//"+operImprovReqVO.getChargerId());

		 //처리상태(요청코드)값에 따라서 접수일/처리완료일이 변경된다.

		 System.out.println("newwwwwwwww : "+operImprovReqVO.getRequstSttusCode());
		 System.out.println("asdfasff : "+operImprovReqVO.getRceptDt());

		 if(operImprovReqVO.getRequstSttusCode().equals("02")) {			// 접수
			 operImprovReqVO.setRceptDt(dTime);
			 System.out.println("##############접수..:"+dTime);
			 //operImprovReqVO.setProcessComptDe();
		 }else if(operImprovReqVO.getRequstSttusCode().equals("07")) {	// 완료
			 System.out.println("##############완료.."+dTime);
			/* EgovOe1OperImprovReqVO findreqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);
			 System.out.println(findreqVO.getRceptDt());
			 operImprovReqVO.setRceptDt(operImprovReqVO.);*/
			 System.out.println("asdfasff : "+operImprovReqVO.getRceptDt());
			 operImprovReqVO.setProcessComptDe(dTime);
		 }
		
		
//		우선 보류.
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		
//		if(!isAuthenticated){
//		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
//		}	

		ObjectMapper mapper = new ObjectMapper();
		
		//검색조건
//		model.addAttribute("searchVO", vo);
		
		operImprovReqDAO.updateOperImprovReq(operImprovReqVO);
		
		EgovOe1OperImprovReqVO reqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);

		System.out.println("updateOperImprovReqest :::다시 find한 값 AFTER : "+reqVO);

		System.out.println("AjaxController - updateSelectOperImprovReqest  - END!!!");
		
		boolean aaa = true;
		
		 response.getWriter().print(mapper.writeValueAsString(aaa));		 
	}
	 
	/*   @RequestMapping(value="/cms/srm/gnrl/deleteOperImprovReq.do")
		public String deleteOperImprovReq(@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, ModelMap model)throws Exception  {
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}
	    	
	    	//파일삭제
	    	if(!vo.getAtchFileId().equals("")){
	        	EgovOe1FileVO fvo = new EgovOe1FileVO();
	            fvo.setAtchFileId(vo.getAtchFileId()); 
	        	fileMngService.deleteAllFileInf(fvo);
	    	}
	    	operImprovReqService.deleteOperImprovReq(vo);
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
	    	
		}*/
	 
	 
	 /* 운영개선요청글 삭제하기. */
	 @RequestMapping(value="/cms/ajax/removeOperImprovReqest.do", method=RequestMethod.POST)
	 public  void removeOperImprovReqest(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, SessionStatus status, HttpServletResponse response)throws Exception  {
		
		 System.out.println("AjaxController - removeOperImprovReqest - START!!!");
		 
    	//세션확인
/*    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}*/

		ObjectMapper mapper = new ObjectMapper();
		
	 	//파일삭제
/*    	if(!vo.getAtchFileId().equals("")){
        	EgovOe1FileVO fvo = new EgovOe1FileVO();
            fvo.setAtchFileId(vo.getAtchFileId()); 
        	fileMngService.deleteAllFileInf(fvo);
    	}*/
    	operImprovReqDAO.deleteOperImprovReq(operImprovReqVO);
    	
		System.out.println("AjaxController - removeOperImprovReqest  - END!!!");
		
		boolean aaa = true;
		
		 response.getWriter().print(mapper.writeValueAsString(aaa));		 
	}
	    
	 /* 운영개선요청글에 조치결과 답글 달기. */
	 @RequestMapping(value="/cms/ajax/addOperProcess.do", method=RequestMethod.POST)
	 public  void addOperProcess(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status, HttpServletResponse response)throws Exception  {
		
		 System.out.println("AjaxController - addOperProcess - START!!!");
		
		System.out.println("받아온 파라메터 값 BEFORE : "+operImprovReqVO);
		 
//		우선 보류.
		/*Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}	*/

		ObjectMapper mapper = new ObjectMapper();
		
		//검색조건
//		model.addAttribute("searchVO", vo);
		
		//지금 등록한 조치결과를 요청DB에 저장한다.
		operImprovReqDAO.addOperImprovReqProcess(operImprovReqVO);
	
		//저장된 요청DB에 있는 조치결과 값을 ProcessVO에 setting한다. 
		operProcessVO.setOperProcessCn(operImprovReqVO.getProcessCn());

		operProcessVO.setOperImprvmRequstId(operImprovReqVO.getOperImprvmRequstId());
		
		operImprovReqDAO.addOperProcess(operProcessVO);

		System.out.println("AjaxController - addOperProcess  - END!!!");
		
		boolean aaa = true;
		
		 response.getWriter().print(mapper.writeValueAsString(aaa));		 
	}
	 
/*		*//**
		 * 운영개선요청을 등록한다.
		 * 
		 * @param EgovOe1OperImprovReqVO
		 * @param model
		 * @return "forward:/cms/srm/gnrl/selectOperImprovReqList.do"
		 * @exception Exception
		 *//*
		@RequestMapping(value="/cms/srm/gnrl/insertOperImprovReq.do")
		public String insertOperImprovReq(
				final MultipartHttpServletRequest multiRequest,
				@ModelAttribute("vo") EgovOe1OperImprovReqVO vo, 
				SessionStatus status)throws Exception{
	    	//세션확인
	    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
			if(!isAuthenticated){
			     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
			}
			
			*//** 파일 처리 *//*
			 List<EgovOe1FileVO> _result = null;
			 String _atchFileId = "";
			 final Map<String, MultipartFile> files = multiRequest.getFileMap();
			 if(!files.isEmpty()){
				 _result = fileUtil.parseFileInf(files, "", 0, "", "");  
				 _atchFileId = fileMngService.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
			 }
			 vo.setRequstAtchFileId(_atchFileId);  
			 
			operImprovReqService.insertOperImprovReq(vo);
			status.setComplete();
			return "forward:/cms/srm/gnrl/selectOperImprovReqList.do";
		}   */
	 
	 
	 /* 운영개선요청게시판에 게시글 등록하기. */
	 @RequestMapping(value="/cms/ajax/addOperImprovReq.do", method=RequestMethod.POST)
	 public  @ResponseBody void addOperImprovReq(@ModelAttribute("operImprovReqVO") EgovOe1OperImprovReqVO operImprovReqVO, EgovOe1OperProcessVO operProcessVO, SessionStatus status, HttpServletResponse response)throws Exception  {
		
		 System.out.println("#. AjaxController - addOperImprovReq.do  - START!!!");
		
		System.out.println("받아온 파라메터(serializeArray)  값  : "+operImprovReqVO);
	/*	//세션확인
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated){
		     return "forward:/cms/com/EgovOe1LoginUsr.do";  //임시로그온페이지 이동
		}
		
		*//** 파일 처리 *//*
		 List<EgovOe1FileVO> _result = null;
		 String _atchFileId = "";
		 final Map<String, MultipartFile> files = multiRequest.getFileMap();
		 if(!files.isEmpty()){
			 _result = fileUtil.parseFileInf(files, "", 0, "", "");  
			 _atchFileId = fileMngService.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		 }
		 vo.setRequstAtchFileId(_atchFileId);  */
		 
		/** ID Generation Service */
    	String id = operImprovReqIdGnrService.getNextStringId();
    	
    	operImprovReqVO.setOperImprvmRequstId(id);
    	
    	operImprovReqDAO.insertOperImprovReq(operImprovReqVO);    	
		
//		status.setComplete();
		
	 }
	 
	 /*  운영개선요청을 리스트에서 '처리상태' 콤보박스 값을 변경하기. */
	 @RequestMapping(value="/cms/ajax/updateRequstSttusCode.do", method=RequestMethod.POST)
	 public  @ResponseBody void updateRequstSttusCode(@RequestParam("requstSttusCode") String requstSttusCode, @RequestParam("operImprvmRequstId") String operImprvmRequstId, EgovOe1OperImprovReqVO operImprovReqVO)throws Exception  {
		
		 System.out.println("#. AjaxController - updateRequstSttusCode.do  - START!!!");
		 
		 operImprovReqVO.setOperImprvmRequstId(operImprvmRequstId);
		 operImprovReqVO.setRequstSttusCode(requstSttusCode);
		
		 
		 //처리상태(요청코드)값에 따라서 접수일/처리완료일이 변경된다.

		 System.out.println(requstSttusCode);
	
		 if(requstSttusCode.equals("02")) {			// 접수
			 System.out.println(dTime);
			 operImprovReqVO.setRceptDt(dTime);
			 System.out.println("접수..:"+dTime);
			 //operImprovReqVO.setProcessComptDe();
		 }else if(requstSttusCode.equals("07")) {	// 완료
			 System.out.println("완료.."+dTime);
			 EgovOe1OperImprovReqVO findreqVO = operImprovReqDAO.selectOperImprovReq(operImprovReqVO);
			 System.out.println(findreqVO.getRceptDt());
			 operImprovReqVO.setRceptDt(findreqVO.getRceptDt());
			 operImprovReqVO.setProcessComptDe(dTime);
		 }
		 
		 operImprovReqDAO.updateRequstSttusCode(operImprovReqVO);
		 
		 System.out.println("#. AjaxController - updateRequstSttusCode.do  - END!!!");

	 }
	 
}
