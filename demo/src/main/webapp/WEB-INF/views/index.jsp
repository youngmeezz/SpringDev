<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>Spring Test</title>
	 <!-- jquery load -->
 <script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>

</head>
<script>
 $(document).ready(function(){
 
 
 	function autoBrth(str){
 	
 	 str = str.replace(/[^0-9]/g, ''); //문자열에서 숫자만 가져오기
	  var tmp = ''
	  
	  if(str.length == 8){
	  tmp += str.substr(0, 4);
          tmp += '-';
          tmp += str.substr(4, 2);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
	}
		return str;
 	}
 	
 	$("#captchaTxt").on("keyup", function() {
 	
 	 	this.value = autoBrth(this.value); 
 	});
 		
});
//# sourceURL=index.jsp
</script>
<body>
<!-- 좌측 영역 시작--> 
		<div class="row mt20">
            <div class="col r_box1">
 	<h2 class="title cs"><a href="www.naver.com" target="_blank">1.네이버 입사 성공</a></h2> 
	<div id="visitReserveYesConInnerHtml" style="line-height: 0px;">
	</div>
	<c:choose>
	<c:when test='${interestEmblCdYn == false}'>
		<label for="emblChoise" style="display:none;">공관선택</label>
		<select class="sel01"  title="공관선택" id="emblChoise" name="emblChoise" style="width:100%;" onchange="fn_changeVisitReserveYes(this.value);">
			<option value="">선택</option>
		</select>
 	</c:when>
 	<c:otherwise>
 		<label for="emblChoise" style="display:none;">공관선택</label>
	 		<select style="display:none;" onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;' class="sel01"  title="공관선택" id="emblChoise" name="emblChoise" >
				<option value="">선택</option> 
			</select> 
				<div id="reserveConfirmEmblInnerHtml"></div> 
 	</c:otherwise>
 	</c:choose>
	
	<div id="notChooseEmblCd" class="r_info">
	 	<p> 회원정보 수정에서 관심공관을 등록하시면 <br>방문예약 사용가능 공관이 자동설정 됩니다. </p>  
	</div>

	<div id="changeEmblCd" class="r_info2">
		<span ><b> 주소  </b></span>
		<p id="span-emblAddr" style="overflow:auto; width:380px; height:40px;"></p>
		<span ><b> 대표전화  </b></span>  
		<p id="span-emblTelNo" style="overflow:auto; width:380px; height:40px;"></p>
		<span ><b> 근무시간  </b></span>
		<p id="span-workTimeCnts" style="overflow:auto; width:380px; height:60px;"></p>
		<span ><b> 안내사항 </b></span>  
		<p id="span-visitResveGudneCnts" style="overflow:auto; width:380px; height:150px;"></p>
		</div>
</div>

<!-- 가운데 영역 시작--> 
<div class="col r_box2" >
	<div class="cline">
		<h2 class="title cs">2.민원업무 선택</h2> 
			<label for="bussNmChoise" style="display:none;">업무명 선택</label>
		<select class="sel01"  title="업무명 선택" id="bussNmChoise" name="bussNmChoise" style="width:100%;" onchange="fn_bussContents(this.value)";>
			<option value="">선택</option>
		</select>
		<div id="chooseBusiness" class="r_info">
 			<p>민원업무를 5건까지 선택하실 수 있습니다.</p>  
		</div>
		<!--  업무내용 html 불러오기-->
		<div class ="bussContents mt10" id="bussContentsInnerHtml" style="overflow:auto; height:400px; width:255px;">
		</div>
</div><!-- cline--> 
</div><!-- col r_box2-->
<!-- 가운데 영역 끝--> 	

<!-- 우측 영역 시작--> 	
<div class="col r_box3">
		<h2 class="title cs">3.예약일시 선택</h2>
	   		<div id="strHtml" class="r_info"> 
			  	<p> 현재일 기준 최대 3개월 내 10회, 1일 2회 신청 가능합니다. 단, 당일은 예약 불가합니다.</p> 
			</div>
	  	  <div class="row nested mt10">
           				<div class="c_box">
	   	   	  <div id="dp1" class="calendar01">
			      	<div id="month-wraps"> 
			      		<button id="btn-prev" type="type" style="cursor: pointer";></button>
	         	<div id="month-title" role="heading" aria-live="assertive" aria-atomic="true"></div>
	         	<button id="btn-next" type="type" style="cursor: pointer";></button>
	      	</div>
	      	<table id="calendar" role="grid" aria-activedescendant="day23" aria-labelledby="month" tabindex="0">
	      		<caption>달력</caption>
	         	<thead>
	            <tr id="weekdays">
	               	<th id="Sunday" style="color:red"><abbr title="Sunday">일</abbr></th>
	               	<th id="Monday"><abbr title="Monday">월</abbr></th>
	               	<th id="Tuesday"><abbr title="Tuesday">화</abbr></th>
	               	<th id="Wednesday"><abbr title="Wednesday">수</abbr></th>
	               	<th id="Thursday"><abbr title="Thursday">목</abbr></th>
	               	<th id="Friday"><abbr title="Friday">금</abbr></th>
	               	<th id="Saturday" style="color:blue"><abbr title="Saturday">토</abbr></th>
	            </tr>
	         	</thead>
	         	<tbody style="cursor: pointer";>
	            	<tr><td id="errMsg" colspan="7">Javascript must be enabled</td></tr>
	         	</tbody>
	      	</table>
	      	<div id="bn_prev-label" class="offscreen">Go to previous month</div>
	      	<div id="bn_next-label" class="offscreen">Go to next month</div>
		</div> <!-- calendar01 -->
	</div><!-- c_box-->
		<!--  방문예약 시간 html 불러오기-->
	 <div class="t_box" id="visitReserveTimeInfoInnerHtml"></div>
</div><!-- row nested mt10-->  
</div> <!-- col r_box3-->  
</div><!-- row mt20-->  
<!-- 우측 영역 끝--> 

<div class="row">
  <div class="col col-span-12">
	<h2 class="title cs">4.예약내용 확인</h2> 
   	<div class="form_tbl">
      	<div class="b_info">
          <div class="b_row">
			<strong>예약자 성명</strong>
              <div>${sessionScope.mberNm}</div>
            <strong>이메일 주소</strong>
             <div>${sessionScope.mberId}</div>
         </div>
           <div class="b_row">
             <strong>예약 공관 <span class="eq">필수</span> </strong>
           <div>
             <div id="reserveConfirmEmblInnerHtml2"></div>
           </div>
             <strong>예약일시 <span class="eq">필수</span></strong>
            	<div>
             <div id="reserveConfirmDayInnerHtml"  style="display:inline-block" ></div>
             <div id="reserveConfirmTimeInnerHtml" style="display:inline-block"></div> 
           </div>
         	</div>
		<div class="b_row">
		  <strong>민원업무 <span class="eq">필수</span> 
			<div id="cntInnerHtml"></div>
		</strong> 
		<div>
	   	<div id="reserveConfirmBussInnerHtml"> 
	   	</div> <!-- div 쓴 이유가 reserveConfirm 막기위함  -->
	   </div>
	  </div>
		<div class="b_row"> 
		  <strong>참고사항</strong> 
		<div> 
		<label for="remk" style="display:none;">참고사항</label>
		<textarea class="txta01" id="remk" cols="20" rows="10" 
			title="참고사항" placeholder="최대 100자 입력" required="required" maxlength="100" ></textarea> 
		</div> 
		</div> 	
		<div class="b_row"> 
		  <strong>생년월일</strong> 
		 	<div> 
               <div id="audiocatpch"></div> 
               <label for="captchaTxt" style="display:none;">생년월일</label>
			<input id="captchaTxt" name="captchaTxt" type="text"  class="security itt01" style="font-size:20px; width:170px; important" title="보안문자를 공백없이 입력해주세요" maxlength="10"/> 
   			</div> 
                   </div>  <!--<div class="b_row"> --> 
                 </div>   <!--<div class="b_info"> --> 
        	</div> <!--<div class="form_tbl"> --> 
      	</div>  <!--<div class="col col-span-12"> -->
   </div> <!--<div class="row"> -->
