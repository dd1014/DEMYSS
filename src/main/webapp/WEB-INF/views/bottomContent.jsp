<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>   
<script src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
<script src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script> 
<script type="text/x-handlebars-template"  id="projecting-template" >

<div class="pj-list">
	<table class="table w-full">
		<thead>
			<tr>
				<th>사업구분</th>
				<th>프로젝트명</th>
				<th>업체명</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>진행률</th>
				<th>담당자</th>
				<th>이슈</th>
			</tr>
		</thead>
		<tbody>
			{{#each .}}
				<tr class="hover">
					<td>{{pj_FIELD }}</td>
					<td>{{pj_NAME }}</td>
					<td>{{ct_NAME }}</td>
					<td>{{prettifyDate pj_STARTDATE }}</td>
					<td>{{prettifyDate pj_ENDDATE }}</td>
					<td>{{sum_PERCENT }}%</td>
					<td>{{member_NAME }}</td>
					<td>{{issue_COUNT}}개</td>
				</tr>
			{{/each}}
		</tbody>
	</table>
</div>


</script>


<script>
Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"."+month+"."+date;
	},
	"chartHeader":function(){
		var today=new Date();
		var minusfive = today.getMonth()-4;
		var month=[];
		for(var i=0;i<12;i++){
			if(minusfive<1){
				month[i]=minusfive+12;
			}else if(minusfive>12){
				month[i]=minusfive-12;
			}else{
				month[i]=minusfive;
			}
			minusfive++;
		}
		return month[0];
	}
	
});

</script>

<script>
function printData(projectArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(projectArr);
	$('.pj-list').remove();
	target.append(html);
}

function showProjectingList(data){
	printData(data,$('#bottomListContent'),$('#projecting-template'));
}


function projecting_go(MEMBER_NUM,PJ_IMP,SORT){
	
	var data={
			"member_NUM":MEMBER_NUM,
			"pj_IMP":PJ_IMP,
			"sort":SORT
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/projecting",
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json",
		success:function(data){
			console.log(data);
			showProjectingList(data);
		},
		error:function(error){
			alert("실패했습니다.");
		}
	});
}
window.onload=function(){
	projecting_go(0,0,'');
}
function pjarea_go(){
	var MEMBER_NUM = parseInt($('#pjarea').val());
	var PJ_IMP = parseInt($('#important').val());
	var SORT = $('#orderby').val();
	projecting_go(MEMBER_NUM,PJ_IMP,SORT);
}
</script>

<script>
const dataSource = {
		  chart: {
		    dateformat: "mm/dd/yyyy",
		    theme: "fusion",
		    canvasborderalpha: "40",
		    ganttlinealpha: "50"
		  },
		  tasks: {
		    color: "#5D62B5",
		    task: [
		      {
		        start: "03/07/2018",
		        end: "03/17/2018"
		      },
		      {
		        start: "03/14/2018",
		        end: "03/28/2018"
		      },
		      {
		        start: "03/15/2018",
		        end: "03/31/2018"
		      },
		      {
		        start: "04/02/2018",
		        end: "04/12/2018"
		      },
		      {
		        start: "04/12/2018",
		        end: "04/30/2018"
		      },
		      {
		        start: "04/20/2018",
		        end: "05/06/2018"
		      },
		      {
		        start: "04/30/2018",
		        end: "05/10/2018"
		      },
		      {
		        start: "04/30/2018",
		        end: "05/25/2018"
		      },
		      {
		        start: "05/04/2018",
		        end: "06/05/2018"
		      }
		    ]
		  },
		  processes: {
		    headertext: "프로젝트명",
		    headeralign: "left",
		    fontsize: "14",
		    isbold: "0",
		    align: "left",
		    process: [
		      {
		        label: "",
		      },
		      {
		        label: "Source venue options"
		      },
		      {
		        label: "Finalize speaker reach out list"
		      },
		      {
		        label: "Compose sponsorship strategy"
		      },
		      {
		        label: "Reach out to sponsors"
		      },
		      {
		        label: "Create social media campaign"
		      },
		      {
		        label: "Reach out to blogs for backlinks"
		      },
		      {
		        label: "Optimize SEO ranking"
		      },
		      {
		        label: "Publish event lead up vlog series"
		      }
		    ]
		  },
		  categories: [
		    {
		      category: [
		        {
		          start: "03/05/2018",
		          end: "03/31/2018",
		          label: "March"
		        },
		        {
		          start: "04/01/2018",
		          end: "04/30/2018",
		          label: "April"
		        },
		        {
		          start: "05/01/2018",
		          end: "05/31/2018",
		          label: "May"
		        },
		        {
		          start: "06/01/2018",
		          end: "06/10/2018",
		          label: "June"
		        }
		      ]
		    }
		  ]
		};

		FusionCharts.ready(function() {
		  var myChart = new FusionCharts({
		    type: "gantt",
		    renderAt: "chart-container",
		    width: "100%",
		    height: "100%",
		    dataFormat: "json",
		    dataSource
		  }).render();
		});

</script>

