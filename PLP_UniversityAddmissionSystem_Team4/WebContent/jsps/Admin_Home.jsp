<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin</title>
		
		<style type="text/css">
			#leftside{
				position:fixed;
				left:0%;
				width:20%;
				height:100%;
				background-color:#CD853F;
			}
			#rightside{
			background-image:url("/PLP_UniversityAddmissionSystem_Team4/WebContent/images/frontpage.jpg");
				position:absolute;
				right:0%;	
				width:79%;	
				height:auto;
				background-color:#FFFACD;
			}
			/* #fillright{
				/* background-image:url("/PLP_UniversityAddmissionSystem_Team4/WebContent/images/frontpage.jpg"); */
				position:absolute;
				right:0%;	
				width:79%;	
				height:100;
				background-color:#FFFACD;
			} */
			#top{
				text-align:center;
					
			}
			#back{
			position:absolute;
				right:0%;	
				width:80%;	
				height:auto;
				background-image:url("images/frontpage.jpg");
					
			}
			#tablehead{
				font-weight: bold;
				text-align: center;
			}
			table{
				border-collapse: collapse;
				border: 2px solid grey;				
			}
			th, td {
				padding: 10px;
				text-align: center;
			}
			button{
				text-align: center;
				width: 250px;
				height: 38px;
				font-size:15px;
			}
			div{
				border: solid;				
			}
			body{
				background-color:grey;
			}
			input{
				background-color: #FFFACD;
			}
			[name="error"]{
				color:red;
			}
	</style>
	
	</head>
	<body>
		<h3 id="top">Welcome to Admin ${loginId}</h3>	
	<!--Left side navigation Bar  -->	
		<div id="leftside">
			<table>
			<tr><td><button onclick="window.location.href='HomePage.do';" ><b>Home</b></button></td></tr>
				<tr><td><button onclick="window.location.href='AdminSheduledProgramlist.do';" ><b>Scheduled Program</b></button></td></tr>
				<tr><td><button onclick="window.location.href='AdminOfferedProgramlist.do';" ><b>Offered Program</b></button></td></tr>
				<tr><td><button onclick="window.location.href='SearchApplicantPage.do';" ><b>Applicant Details</b></button></td></tr>
				<tr><td><button onclick="window.location.href='getEntryPage.do';"><b>Add program Offered</b></button> </td> </tr>
				<tr><td><button onclick="window.location.href='AdminDeleteOffered.do';"> <b>Delete Program Offered</b></button></td></tr>
				<tr><td><button onclick="window.location.href='getScheduleProgramPage.do';" ><b>Schedule A Program</b></button></td></tr>
				<tr><td><button onclick="window.location.href='DeleteScheduledProgramPage.do';" ><b>Delete Scheduled Program </b></button></td></tr>
				<tr><td><button onclick="window.location.href='UpdateScheduledProgramPage.do';" ><b>Update Schedule </b></button></td></tr>
			
			</table>
		</div>
		
		
		<!-- Right side dispaly Page -->	
		
		<div id="rightside">
		
			<c:if test="${home eq true}" >
				<div id="back">
				</div>
			</c:if>
		
			<c:if test="${scheduleList ne null }">
				<c:if test="${msg eq true}">
					<h2 id="tablehead">Scheduled Program Deleted.Please see the Updated List</h2>
				</c:if>
			
				<h2 align="center">Scheduled Programs</h2>
			
				<table border="1" id="scheduleList" align="center">
						<tr>
							<th>Program Id</th>
							<th>Program Name</th>				
							<th>location</th>
							<th>Start date</th>
							<th>End Date</th>
							<th>Session per Week</th>
							<c:if test="${delete eq true}"><th>Delete</th></c:if>								
							    <c:if test="${update eq true}"><th>Update</th></c:if>							
						</tr>
							<c:forEach items="${scheduleList }" var="scheduledPrg">
							<tr>
								<td>${scheduledPrg.scheduledProgramId }</td>
								<td>${scheduledPrg.programName }</td>
								<td>${scheduledPrg.location }</td> 
								<td>${scheduledPrg.startDate }</td>
								<td>${scheduledPrg.endDate }</td>	
								<td>${scheduledPrg.sessionPerWeek }</td>
								<c:if test="${delete eq true}"><td><a href="FinalDeleteScheduledProgram.do?pId=${scheduledPrg.scheduledProgramId}"><b>Delete</b></a></td></c:if>								
							    <c:if test="${update eq true}"><td><a href="FinalUpdateScheduledProgramPage.do?pId=${scheduledPrg.scheduledProgramId}"><b>Update</b></a></td></c:if>
							</tr>
						</c:forEach>
				</table>				
			</c:if>
			
			
			<c:if test="${offeredList ne null }">
					<h2 align="center">Offered Program list</h2>
					<c:if test="${msg eq true}">
						<h2 id="tablehead">Selected Program Deleted. See the Updated List</h2>
					</c:if>	
					
					<table border="1" id="offrdlist" align="center">
						<tr>
							<th>Program Name</th>
							<th>Description</th>
							<th>Eligibility</th>
							<th>Duration(in Months)</th>
							<th>Degree Certificate</th>
							<c:if test="${delete eq true}"><th>Delete</th></c:if>	
								<c:if test="${schedule eq true}"><th>Schedule</th></c:if>				
						</tr>
						<c:forEach items="${offeredList}" var="offeredprogram">
							<tr>
								<td>${offeredprogram.programName }</td>
								<td>${offeredprogram.description }</td>
								<td>${offeredprogram.applicantEligiblity }</td> 
								<td>${offeredprogram.duration }</td>
								<td>${offeredprogram.degreeCertificate }</td>
								<c:if test="${delete eq true}"><td><a href="FinalDeleteOffered.do?prog=${offeredprogram.programName}"><b>Delete</b></a></td></c:if>	
								<c:if test="${schedule eq true}"><td><a href="FinalScheduleProgramPage.do?prog=${offeredprogram.programName}"><b>Schedule</b></a></td></c:if>				
							</tr>
						</c:forEach>
					</table>				
			</c:if >
			
			<c:if test="${var eq true}">
				<h2 id="tablehead">Enter Program Offered Details</h2>
				
			<table border="1" align="center" >
				<sf:form action="addProgramOffered.do" modelAttribute="poffered" method="post">
			  	<tr>
				  	<td> Enter Program Name :</td>
				  	<td>
				   		<sf:input path="programName"  type="text" placeholder="Enter a Program Name"/><br/>
				   		<sf:errors path="programName" name="error" type="text"></sf:errors>
				   	</td>
			   	</tr>
				
				<tr>
					<td>Enter Description :</td>
					<td>
						<sf:input path="description" type="text" /><br/>
						<sf:errors path="description" name="error"></sf:errors>
					</td>
				</tr>
				
				<tr>
					<td>Enter Eligibility :</td>
					<td>
						<sf:input path="applicantEligiblity" type="text"/><br/>
						<sf:errors path="applicantEligiblity" name="error"></sf:errors>
					</td>
				</tr>
				
			    <tr>
				    <td>Enter Program Duration :</td>
				    <td> 
						<sf:input path="duration" /><br/>
						<sf:errors path="duration" type="text" name="error" ></sf:errors>
					</td>
				</tr>
				
				<tr>
				<td>Enter Degree : </td>
				 <td>
				<sf:input path="degreeCertificate" type="text"/><br/>
				<sf:errors path="degreeCertificate" type="text" name="error" ></sf:errors>
				</td>
				</tr>
				
				<tr><td><input type="reset" value="Reset"/></td><td><input type="submit" value="Add Programm"/></td></tr>
				</sf:form>
				</table>
			</c:if>
			
			
			<c:if test="${pscheduleform eq true}">
			 <c:if test="${key eq 1}">
				<h2 id="tablehead">Already Existing Schedules for the Program Selected</h2>
			
			<table border="1" align="center">
						<tr>
							<th>Program Id</th>
							<th>Program Name</th>				
							<th>location</th>
							<th>Start date</th>
							<th>End Date</th>
							<th>Session per Week</th>
						</tr>
							<c:forEach items="${pscheduledList}" var="scheduledPrg">
							<tr>
								<td>${scheduledPrg.scheduledProgramId }</td>
								<td>${scheduledPrg.programName }</td>
								<td>${scheduledPrg.location }</td> 
								<td>${scheduledPrg.startDate }</td>
								<td>${scheduledPrg.endDate }</td>	
								<td>${scheduledPrg.sessionPerWeek }</td>								
							</tr>
						</c:forEach>
					</table>
					
			</c:if>
			
			<h2 id="tablehead">Schedule a Program</h2>
			
			<table border="1" align="center">
			
				<sf:form action="addProgramSchedule.do" modelAttribute="pschedule" method="post">
			  		<tr>
			  			<td> Enter Program ID :</td>
			  			<td>
						   	<sf:input path="scheduledProgramId"  type="text" /><br/>
						   	<sf:errors path="scheduledProgramId" name="error"></sf:errors>
						</td>
					</tr>
				
					<tr>
						<td>Enter Program Name :</td>
						<td>
							<sf:input path="programName" type="text" value="${prog}" readonly="true"/>
						</td>
					</tr>
				
					<tr>
						<td>Enter Location :</td>
						<td>
							<sf:input path="location" type="text"/><br/>
							<sf:errors path="location" name="error"></sf:errors>
						</td>
					</tr>
				
			    	<tr>
				    	<td>Enter Start Date :</td>
				    	<td> 
							<sf:input path="startDate" type="text"/><br/>
							<sf:errors path="startDate" type="text" name="error"></sf:errors>
						</td>
					</tr>
				
				 	<tr>
				 		<td>Enter End Date : </td><td>
							<sf:input path="endDate" type="text"/><br/>
							<sf:errors path="endDate" type="text" name="error"></sf:errors>
						</td>
					</tr>
				
				<tr><td>Enter No. Of Sessions per week: </td><td>
				<sf:input path="sessionPerWeek" type="text"/><br/>
				<sf:errors path="sessionPerWeek" type="text" name="error"></sf:errors></td></tr>
				
				<input type="hidden" name="prog" value="${prog}">
				<tr><td><input type="reset" value="Reset"/></td>
				<td><input type="submit" value="Schedule Programm"/></td></tr>
				
				</sf:form>
				</table>
			</c:if>
				<c:if test="${app eq true}">
					<center>
						<h2>Search Applicants By </h2>:<br/>
					<c:if test="${op_1 eq true}"><button onclick="window.location.href='SearchApplicantbystatusPage.do';" ><b>Status</b></button></c:if>
					<c:if test="${op_2 eq true}">	<button onclick="window.location.href='SearchApplicantbyprogscheduleidPage.do';" ><b>Program Scheduled Id</b></button></c:if>
						
							<br/><br/><c:if test="${bystatus_key eq true}">
							<form action="finalsearchbystatus.do" method="post">
							<b><select name="status">
							<option value="applied">Applied</option>
							<option value="accepted">Accepted</option>
							<option value="rejected">Rejected</option>
							<option value="confirmed">Confirmed</option>
							</select>
							<input type="submit" value="Search"></b>
							</form>
							</c:if>
						
							<c:if test="${bypsId_key eq true}">
							<form action="finalsearchbyprogschid.do" method="post">
							<select name="psId">
							<c:forEach var="val" items="${psIdlist}">
							<option value="${val}">${val}</option>
							</c:forEach>
							</select>
							<b><input type="submit" value="Search"></b>
							</form>
							</c:if>
						
			<c:if test="${key eq 0}"><h3>${errorMsg}</h3></c:if>			
			<c:if test="${key eq 1}">
				<h2 id="tablehead">Applicants Details</h2>
			
			<table border="1" align="center">
						<tr>
							<th>Application Id</th>
							<th>Full Name</th>				
							<th>DOB</th>
							<th>Highest Qualification</th>
							<th>Marks Obtained</th>
							<th>Goals</th>
							<th>Email-Id</th>
							<th>Program Schedule Id</th>
							<th>Status</th>
							<th>Date Of Interview</th>
							
						</tr>
							<c:forEach items="${applist}" var="applist">
							<tr>
								<td>${applist.applicationId }</td>
								<td>${applist.fullName }</td>
								<td>${applist.dateOfBirth }</td> 
								<td>${applist.highestQualification }</td>
								<td>${applist.marksObtained }</td>	
								<td>${applist.goals }</td>	
								<td>${applist.emailId }</td>
								<td>${applist.scheduledProgramId }</td>	
								<td>${applist.status }</td>	
								<td>${applist.dateOfInterview }</td>								
							</tr>
						</c:forEach>
					</table>
					
			</c:if>
						</center>
				</c:if>
		<c:if test="${updateform eq true}">	
		<c:if test="${key eq 1}">
			<h2 id="tablehead">Update a Scheduled Program</h2>
			<table border="1" align="center">
				<sf:form action="FinalUpdateScheduledProgram.do" modelAttribute="schedule" method="post">
			  <tr><td> Program ID :</td><td>
			   	<sf:input path="scheduledProgramId"  type="text" value="${schedule.scheduledProgramId}" readonly="true" />
			   	<sf:errors path="scheduledProgramId" name="error"></sf:errors></td></tr>
				
				<tr><td>Program Name :</td><td>
				<sf:input path="programName" type="text" value="${schedule.programName}" readonly="true"/>
				<sf:errors path="programName" name="error"></sf:errors></td></tr>
				
				<tr><td>Update Location :</td><td>
				<sf:input path="location" type="text" value="${scheduledPrg.location}" />
				<sf:errors path="location" name="error"></sf:errors></td></tr>
				
			    <tr><td>Update Start Date :</td><td> 
				<sf:input path="startDate" type="text" value="${scheduledPrg.startDate}"/>
				<sf:errors path="startDate" type="text" name="error"></sf:errors></td></tr>
				
				 <tr><td>Update End Date : </td><td>
				<sf:input path="endDate" type="text" value="${scheduledPrg.endDate}"/>
				<sf:errors path="endDate" type="text" name="error"></sf:errors></td></tr>
				
				<tr><td>Update No. Of Sessions per week: </td><td>
				<sf:input path="sessionPerWeek" type="text" value="${scheduledPrg.sessionPerWeek}"/>
				<sf:errors path="sessionPerWeek" type="text" name="error"></sf:errors></td></tr>
				
				<%-- <input type="hidden" name="prog" value="${prog}"> --%>
				<tr><td><input type="reset" value="Reset"/></td>
				<td><input type="submit" value="Update Scheduled Programm"/></td></tr>
				
				</sf:form>
				</table>
				</c:if>
			<c:if test="${msg eq true}"><h2 id="tablehead">Scheduled Programm has been Updated</h2></c:if>
			</c:if>	
		</div>
		
	</body>
</html>





		
		