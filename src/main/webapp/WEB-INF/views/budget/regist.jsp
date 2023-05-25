<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	background-color:white;
	padding:5px;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 예산수립 등록.css -->
<link rel="stylesheet" href="/resource/css/budget/regist.css" />


<div class="project-part">

	<div class="p-sidbar">
		<div class="p-bt">
			<div class="p-regist">
				<button class="p-rg-bt">
					<i class="fa-regular fa-square-plus"></i>
					프로젝트등록
				</button>
				<div class="p-inend">
					<button class="p-inpro">진행중 </button>
					<button class="p-end">완료 </button>
				</div>
				<div class="p-check">
					<div style="padding-top:3px;">
					  <label class="cursor-pointer label">
					    <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
					    <span class="label-text">&nbsp;전체 프로젝트</span>
					  </label>
					</div>
					<div class="w-42">
						<select class="select w-full max-w-xs">
						  	<option disabled selected>프로젝트명</option>
						  	<option>프로젝트명</option>
						  	<option>업체명</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-searchbar">
				<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
				<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
			</div>
			
		</div>
		<div class="p-list">
 			<c:forEach begin="0" end="4" step="1" >
			    <div class="p-list-box">
					<div style="border-bottom:1px solid #797979;">
						<div class="ellipsis p-list-title">
							<span style="color:red;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
							<span >프로젝트제목들어가야함계속길게적는중</span>
						</div>
						<div class="p-list-date">
							<span>2023.05.02 ~ </span>
							<span> 2023.07.02</span>
						</div>
					</div>
					<div class="p-list-box-bottom">
						<span style="font-size:15px;">(주)오싸거</span>
						<span class="p-list-issu">이슈 3</span>
					</div>
				</div>
			</c:forEach>
		
			<div class="p-list-pagination">
			
			</div>
			
		</div>
	
	</div>
	 <div class="p-body">
		<div class="p-body-header">
	 	 	<div class="p-main-title">
		     	<div>
		     		<i class="fa-solid fa-flag ml-6" style="color:red;"></i> 
		      		<span class="p-main-title-sty">정보통신 연구개발사업($프로젝트명)</span>
		     	</div>
	   			<div class="p-main-reg-date">등록일 : 2023.05.09</div>
		 	 </div>
		 	 
	      	<div class="p-body-header-1">
			      <div style="display: flex;">
			         <div class="header-1-menu"><a href="#">프로젝트</a></div> |
			         <div class="header-1-menu"><a href="#">단위업무</a></div> |
			         <div class="header-1-menu"><a href="#">이슈관리</a></div> |
			         <div class="header-1-menu"><a href="#">예산수립</a></div> |
			         <div class="header-1-menu"><a href="#">회의록</a></div> |
			         <div class="header-1-menu"><a href="#">산출물관리 &nbsp;</a></div>
			      </div>
	      	</div>
	   </div> 
	   <!-- project작업공간 -->
		<div class="p-main-body">
   			
   			<div class="header-2-menu0">
   				<div class="p-body-header-2">
	   				<div style="display:flex;margin-top:5px;height:25px;">
				         <div class="header-2-menu"><a href="#">예산수립</a></div>
				    </div>
	   			</div>
   			</div>
   			
   			<div class="bud_body">
   				<div class="bud_title">
	   				<div  class="bud_title0">
	   					<span>제목</span>
	   					<input class="w-1/3 h-8 rounded-md" type="text" />
	   				</div>
	   			</div>
	   			
   				<div class="bud_conts">
   					<div class="bud_cont">
	   					<div class="bud_regi_cont">
	   						<table border="1" class="w-full">
	   							<thead>
	   								<tr>
	   									<th style="width:6%;">No</th>
	   									<th style="width:12%;">구분</th>
	   									<th style="width:35%;">예산내역</th>
	   									<th style="width:25%;">비고</th>
	   									<th style="width:17%;">예산금액</th>
	   									<th style="width:5%;"></th>
	   								</tr>
	   							</thead>
	   							<tbody>
	   							<!-- 	<tr>
	   									<td >
	   										<div class="p-1 w-full">1</div>
	   									</td>
	   									<td>
	   										<div class="p-1 w-full">
	   											<select class=" w-full">
												  	<option disabled selected>선택</option>
												  	<option>인건비</option>
												  	<option>교통비</option>
												  	<option>기타</option>
												</select>
	   									
	   										</div>
	   									</td>
	   									<td>
	   										<div>
	   											<input class="p-1 w-full" type="text" placeholder="예산내역을 입력하세요." />
	   										</div>
	   									</td>
	   									<td>
	   										<div>
	   											<input class="p-1 w-full" type="text" placeholder="상세내용을 입력하세요."/>
	   										</div>
	   									</td>
	   									<td>
	   										<div>
	   											<input  class="p-1 w-full"type="text" placeholder="예산금액을 입력하세요."/>
	   										</div>
	   									</td>
	   									<td>
	   										<div class="p-1 w-full">
	   											<button class="">
	   											<i class="remove-icon fa-solid fa-circle-xmark"></i></button>
	   										</div>
	   									</td>
	   								</tr> -->
	   							</tbody>
	   						</table>
	   					</div>
	   					
	   					<div class="bud_regi_cont-foots">
							<div class="bud_regi_cont-foot">
	 							<div class="bud_add">
	 								<button class="bud_add_bt"><i class="fa-solid fa-circle-plus text-blue-600"></i>&nbsp;예산항목 추가</button>
	 							</div>
	 						</div>
	 						<div class="w-full bud_regi_cont-foot-1 p-2">
	 							<div style="color:#AAAAAA;font-weight:bold;">총 1 건</div> ㅣ
	 							<div style="color:#153A66;font-weight:bold;">30,000,000 원</div>
	 						</div>
	 					</div>
	   					
	   					
	   				
	   				</div>
	   				<div class="bud_exp shadow-md">
   						<div class="bud_exp_0" style="height:45%;">
   							<div class="progress">
							    <div class="progress__bar"></div>
							    <div class="progress__text">
							      <span>30</span>%
							    </div>
						  </div>
   						</div>
   						<div class="bud_exp_1" style="height:10%;">
   							<div><i class="fa-solid fa-circle mr-2" style="color:skyblue;"></i>예산금액</div>
   							<div><i class="fa-solid fa-circle mr-2" style="color:#e7e7e7;"></i>예산매출</div>
   						</div>
   						<div class="bud_exp_2" style="height:45%;">
   							<div>
   								<span>예상 매출액</span>
   								<span>120.000.000원</span>
   							</div>
   							<div >
   								<span>예상 지출액</span>
   								<span class="pl-4">4건</span>
   								<span>33,000,000원</span>
   							</div>
   							<div class="border-b-2">
   								<span>예상 매축이익률</span>
   								<span id="budget_pro">75%</span>
   							</div>
   							<div style="color: rgb(2 132 199);">
   								<span>예상 매출이익</span>
   								<span>90,000,000원</span>
   							</div>
   						</div>
   						
   					</div>
	   				
 					
   				</div>	
   				<div class="bud_regi-bt">
   					<button class="bud-bt">저장</button>
   					<button style="display:none;" class="bud-bt-1">최종예산 등록</button>
   					<div style="display:block;">
						<button class="a-bud-bt ok-bt bg-green-600">승인</button>
						<button class="a-bud-bt stop-bt bg-red-600">반려</button>
   					</div>
   				</div>
   				
   				
   				
   			</div>
   			
	
   
   
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<!-- project/list.jsp 화면끝나는 태그 -->
</div>
<script>
//예산항목 추가 
const addButton = document.querySelector(".bud_add_bt");
const tbody = document.querySelector("tbody");

addButton.addEventListener("click", function(){
	// 새로운 tr요소 생성
	const newRow = document.createElement("tr");
	
	// tr요소 갯수 증가 -> No.가 1씩 증가하게
	const rowNum = tbody.children.length+1;
	
	// tr요소의 내용 추가
	newRow.innerHTML = `
		<td>
		    <div class="p-1 w-full">${rowNum}</div>
		  </td>
		  <td>
		    <div class="p-1 w-full">
		      <select class="w-full">
		        <option disabled selected>선택</option>
		        <option>인건비</option>
		        <option>교통비</option>
		        <option>기타</option>
		      </select>
		    </div>
		  </td>
		  <td>
		    <div>
		      <input class="p-1 w-full" type="text" placeholder="예산내역을 입력하세요." />
		    </div>
		  </td>
		  <td>
		    <div>
		      <input class="p-1 w-full" type="text" placeholder="상세내용을 입력하세요."/>
		    </div>
		  </td>
		  <td>
		    <div>
		      <input  class="p-1 w-full"type="text" placeholder="예산금액을 입력하세요."/>
		    </div>
		  </td>
		  <td>
		    <div class="p-1 w-full">
		      <button class="">
		        <i class="remove-icon fa-solid fa-circle-xmark"></i>
		      </button>
		    </div>
		  </td>
	`;
	// tr요소에 No. 추가
	newRow.querySelector("div:first-child").textContent = rowNum;
	// tbody에 새로운 tr요소 추가
	tbody.appendChild(newRow);
});
</script>

<script>
let bar = document.querySelectorAll('.progress__bar'),
val = document.querySelectorAll('.progress__text > span');
for (let i = 0; i < bar.length; i++) {
let percent = parseInt(val[i].innerHTML);
bar[i].style.transform = 'rotate(' + (percent * 1.8 - 45) + 'deg)';
}
</script>

<%@ include file="../common/foot.jsp" %>