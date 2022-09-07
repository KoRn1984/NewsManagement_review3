<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" defer src="scripts/jquery-3.6.1.min.js"></script>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.newsList" var="news_list" />
<fmt:message bundle="${loc}" key="local.loc.name.edit" var="edit" />
<fmt:message bundle="${loc}" key="local.loc.name.view" var="view" />
<fmt:message bundle="${loc}" key="local.loc.name.delete" var="delete" />
<fmt:message bundle="${loc}" key="local.loc.name.noNews" var="no_news" />
<fmt:message bundle="${loc}" key="local.loc.name.regMessage" var="reg_message" />
<fmt:message bundle="${loc}" key="local.loc.name.saveMessage" var="save_message" />
<fmt:message bundle="${loc}" key="local.loc.name.updateMessage" var="update_message" />
<fmt:message bundle="${loc}" key="local.loc.name.deleteMessage" var="delete_message" />

<div class="body-title">
	<a href="controller?command=go_to_news_list">${newses} >> </a>${news_list}
</div>
<form action="controller" method="post">
    <c:if test="${sessionScope.register_user eq 'not_registered'}">
		<c:import url="/WEB-INF/pages/tiles/registration.jsp" />
	</c:if>		     
	<c:if test="${sessionScope.register_user eq 'registered'}">
		<center><font color="green">${reg_message}!</font></center>
	</c:if>				     
	<c:if test="${sessionScope.addNews eq 'command_executed'}">
	    <center><font color="blue">${save_message}!</font></center>
	</c:if>
	<c:if test="${sessionScope.editNews eq 'command_executed'}">
	    <center><font color="orange">${update_message}!</font></center>
	</c:if>
	<c:if test="${sessionScope.deleteNews eq 'command_executed'}">
	    <center><font color="grey">${delete_message}!</font></center>
	</c:if>	
<c:if test="${not(requestScope.news eq null)}">	
<form action="controller" method="post">
	<c:forEach var="news" items="${requestScope.news}">
		<div class="single-news-wrapper">
			<div class="single-news-header-wrapper">			
				<div class="news-title">
				<strong>				
					<c:out value="${news.title}" />
				</strong>			
				</div>							
				<div class="news-date">
				    <fmt:parseDate value="${news.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				    <fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
					<c:out value="${newsDate}" />
				</div>
				<div class="news-content">
					<c:out value="${news.brief}" />
				</div>
				<div class="news-link-to-wrapper">
					<div class="link-position">
						<c:if test="${sessionScope.role eq 'admin'}">
						      <a href="controller?command=go_to_edit_news_page&id=${news.id}">${edit}</a>
						</c:if>&nbsp;&nbsp;				
						      <a href="controller?command=go_to_view_news&id=${news.id}">${view}</a>
   					    <c:if test="${sessionScope.role eq 'admin'}">   					    
   					         <input type="checkbox" name="id" value="${news.id}" />
   					         <input type="hidden" name="command" value="do_delete_news" />
   					    </c:if>
					</div>					
				</div>
			</div>
		</div>
	</c:forEach>
	<c:if test="${sessionScope.role eq 'admin'}">
	<logic:notEmpty name="newsForm" property="newsList">
		<div class="delete-button-position">
			<html:submit>
				<bean:message key="locale.newslink.deletebutton" />				
				<input type="submit" value="${delete}" />
			</html:submit>		                
		</div>
	</logic:notEmpty>
	</c:if>
</form>
<div class="Page navigation">
      <c:if test="${sessionScope.user_status eq 'active'}">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">       
            <c:forEach var="page" begin="1" end="${requestScope.countPage}">
              <c:if test="${param.pageNo eq page}">                   
                <li class="page-item active">
                  <a class="page-link" href="controller?command=go_to_news_list&pageNo=${page}">
                  <c:out value="${page}" /></a>
                </li>                     
              </c:if>
              <c:if test="${not(param.pageNo eq page)}">
                <li class="page-item">
                  <a class="page-link" href="controller?command=go_to_news_list&pageNo=${page}">
                  <c:out value="${page}" /></a>
                </li>
              </c:if>
            </c:forEach>            
          </ul>
        </nav>
      </c:if>
    </div>
    </c:if>
	<c:if test="${sessionScope.showNews eq 'not_show'}">
	  <div class="no-news">
		<c:if test="${requestScope.news eq null}">
		<font color="red">
        ${no_news}!
        </font>
	    </c:if>
	  </div>
	</c:if>	
</form>