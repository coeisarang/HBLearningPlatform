<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%

int count = 0;
if(request.getAttribute("count")!=null)
	count = Integer.parseInt(request.getAttribute("count").toString());
int pageSize = 10;
int pageBlock = 5;

int pageNo = 1;
if(request.getParameter("pageNo")!=null)
	pageNo = Integer.parseInt(request.getParameter("pageNo"));

int lastPage = 1;
if(count > 0) lastPage = (count-1)/pageSize + 1;

int pageStart = ((pageNo-1)/5)*5 + 1;
int pageEnd = pageStart + pageBlock - 1;
pageEnd = Math.min(pageEnd, lastPage);

pageContext.setAttribute("pageNo", pageNo);
pageContext.setAttribute("pageStart", pageStart);
pageContext.setAttribute("pageEnd", pageEnd);
pageContext.setAttribute("lastPage", lastPage);

%>

<style>
 /*페이징 하는 영역 */
        .pagination {
		    display: flex;
		    align-items: center;
		    justify-content: center; /* Center-aligns horizontally */
		    gap: 5px;
		    margin-top: 15px;
		}
		
		.page-btn {
		    border: 1px solid #ddd;
		    background-color: white;
		    color: #333;
		    padding: 5px 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 14px;
		}
		
		.page-btn.active {
		    background-color: #007bff;
		    color: white;
		}
		
		.page-btn:hover {
		    background-color: #f1f1f1;
		}
		
		.page-btn:disabled {
		    cursor: not-allowed;
		    opacity: 0.5;
		}
</style>

<div class="pagination">

				<c:if test="${pageNo gt 1 }">
		        <button class="page-btn" onclick="location.href='${url }pageNo=1'">&laquo;</button>
		        </c:if>
		        <c:if test="${pageStart gt 1 }">
		        <button class="page-btn" onclick="location.href='${url }pageNo=${pageStart-1}'">&lsaquo;</button>
		        </c:if>
		        
		        <c:forEach begin="${pageStart}" end="${ pageEnd }" step="1" var="pv" >
		        <button class="page-btn <c:if test='${pageNo == pv}'>active</c:if>" onclick="location.href='${url }pageNo=${pv}'">${pv}</button>
		        </c:forEach>
		        
		        <c:if test="${pageEnd lt lastPage }">
		        <button class="page-btn" onclick="location.href='${url }pageNo=${pageEnd + 1}'">&rsaquo;</button>
		        </c:if>
		        
		        <c:if test="${pageNo lt lastPage }">
		        <button class="page-btn" onclick="location.href='${url }pageNo=${lastPage }'">&raquo;</button>
		        </c:if>
</div>