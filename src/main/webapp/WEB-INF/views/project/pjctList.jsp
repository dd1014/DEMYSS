<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:forEach var="pjctList" items="${pjctList }" varStatus="status">
		<input type="hidden" value="${pjctList.PJCT_NUM }" name="PJCT_NUM" />
		<tr id="remove_row_${status.index}">
				<td>${status.index+1 }</td>
				<td>${pjctList.CT_NAME }</td>
				<td>${pjctList.CT_TEL }</td>
				<td>${pjctList.CT_FAX }</td>
				<td>${pjctList.CT_ADDR }</td>
				<td>${pjctList.CT_MANAGER }</td>
				<td>
						<button class="remove-btt" data-row-id="${status.index}" onclick="PJCT_REMOVE_go();">
								<i class="fa-solid fa-circle-xmark" style="color: red; font-size: 23px; padding-right: 5px;"></i>
						</button>
				</td>
		</tr>
</c:forEach> --%>