	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
	<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css" />
	<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.metro.min.css" />
	<style>
	html {
		font-size: 14px;
		font-family: Arial, Helvetica, sans-serif;
	}
	</style>
	
	<script src="//kendo.cdn.telerik.com/2015.3.930/js/jquery.min.js"></script>
	<script src="//kendo.cdn.telerik.com/2015.3.930/js/kendo.all.min.js"></script>
	
	
	
	<!--  Page styles  -->
	<style>
	.k-gantt-treelist span>strong {
		background: pink;
	}
	</style>
	
	
	
	
	<%-- <c:set var="unitworkData" value="${unitworkData }" /> --%>
	<!--  Page styles  -->
	
	</head>
	
	<body>
	
	
			<div id="gantt">
			
			</div>
			 	
			<script>
				var tasksDataSource = new kendo.data.GanttDataSource({
					batch : false,
					transport : {
						read : {
							url : "/project/unitwork/load",
							dataType : "json"
						},
						update : {
							url : "/project/unitwork/update",
							dataType : "json"
	
						},
						create : {
							url : "/project/unitwork/create",
							dataType : "json"
	
						}
					},
					schema : {
						model : {
							id : "num",
							fields : {
								num : {
									from : "uw_NUM",
									type : "int"
								},
								title : {
									from : "uw_NAME",
									type : "String"
								},
								start : {
									from : "uw_STARTDATE",
									type : "date"
								},
								end : {
									from : "uw_ENDDATE",
									type : "date"
								},
								percentComplete : {
									from : "uw_PERCENT",
									type : "int"
								},
								status : {
									from : "uw_STATUS",
									type : "int"
								},
								summary : {
									from : "uw_NOTE",
									type : "string"
								},
								member : {
									from : "member_NUM",
									type : "int"
								},
								pjNum : {
									from : "pj_NUM",
									type : "int"
								}
							}
						}
					}
				});
	
				var dependenciesDataSource = new kendo.data.GanttDependencyDataSource(
						{
							batch : false,
							transport : {
								read : {
									url : "/project/unitwork/load",
									dataType : "json"
								},
								update : {
									url : "/project/unitwork/update",
									dataType : "json"
								},
								create : {
									url : "/project/unitwork/create",
									dataType : "json"
	
								}
							},
							schema : {
								model : {
									num : "num",
									fields : {
										num : {
											from : "uw_NUM",
											type : "int"
										},
										parentId : {
											from : "uw_NUM",
											type : "int"
										},
										orderId : {
											from : "uw_NUM",
											type : "int"
										},
										title : {
											from : "uw_NAME",
											type : "String"
										},
										start : {
											from : "uw_STARTDATE",
											type : "date"
										},
										end : {
											from : "uw_ENDDATE",
											type : "date"
										},
										percentComplete : {
											from : "uw_PERCENT",
											type : "int"
										},
										status : {
											from : "uw_STATUS",
											type : "int"
										},
										summary : {
											from : "uw_NOTE",
											type : "string"
										},
										member : {
											from : "member_NUM",
											type : "int"
										},
										pjNum : {
											from : "pj_NUM",
											type : "int"
										}
									}
								}
							}
						});
	
				$("#gantt").kendoGantt({
					dataSource : tasksDataSource,
					dependencies : dependenciesDataSource,
					views : ["week",{
						type : "month",
						selected : true
					}, "year"],
					columns : [ {
						field : "num",
						title : "번호",
						width : 50
					}, {
						field : "title",
						title : "단위업무명",
						width : 300,
						editable : true,
						sortable : true
					}, {
						field : "member",
						title : "담당자",
						width : 100
					}, {
						field : "start",
						title : "시작일",
						format : "{0:yyyy-MM-dd}",
						width : 130,
						editable : true
					}, {
						field : "end",
						title : "종료일",
						format : "{0:yyyy-MM-dd}",
						width : 130,
						editable : true
					}, {
						field : "percentComplete",
						title : "진행률",
						format : "{0:0.##%}",
						width : 65,
						editable : true
					}, {
						field : "status",
						title : "상태",
						width : 70,
						editable : true
					}, {
						field : "note",
						title : "비고",
						width : 300,
						editable : true
					} ],
					showWorkHours : true,
					showWorkDays : true,
	
	                snap: true,
	              
	              	//add: addTask,
	            	edit: editTask
	              
	            }).data("kendoGantt");
	
				const createUnitwork = () => {
					  const unitworkData = {
					    property1: "unitwork",
					    // Add more properties as needed
					  };

					  fetch('/project/unitwork/create', {
					    method: 'POST',
					    headers: {
					      'Content-Type': 'application/json',
					    },
					    body: JSON.stringify(unitworkData),
					  })
					    .then(response => {
					      if (response.ok) {
					        console.log('Unitwork created successfully');
					      } else {
					        console.error('Failed to create unitwork');
					      }
					    })
					    .catch(error => {
					      console.error('Error:', error);
					    });
					};

	
	            function editTask(e) {
	                var clickHandler = function(e) {
	                	
	                    console.log("Save button is clicked");
	                    
	                    $(this).off("click", clickHandler);
	                    
	                    history.go(0);
	                };
	
	                $(e.container).find(".k-gantt-update").on("click", clickHandler);
	            };
	
				
				
				
				$(document).keyup(function(event) {
					if (window.event.keyCode == 13) {
						location.reload();
					}
				});
			</script>
			
	</body>
	</html>