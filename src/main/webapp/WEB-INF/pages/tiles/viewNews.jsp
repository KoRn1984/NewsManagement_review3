<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />    
<fmt:message bundle="${loc}" key="local.loc.name.newses" var="newses" />
<fmt:message bundle="${loc}" key="local.loc.name.newsView" var="news_view" />
<fmt:message bundle="${loc}" key="local.loc.name.title" var="title" />
<fmt:message bundle="${loc}" key="local.loc.name.date" var="date" />
<fmt:message bundle="${loc}" key="local.loc.name.brief" var="brief" />
<fmt:message bundle="${loc}" key="local.loc.name.content" var="content" />
<fmt:message bundle="${loc}" key="local.loc.name.edit" var="edit" />
<fmt:message bundle="${loc}" key="local.loc.name.delete" var="delete" />
<fmt:message bundle="${loc}" key="local.loc.name.unpublish" var="unpublish" />
<fmt:message bundle="${loc}" key="local.loc.name.back" var="back" />

<div class="body-title">
	<a href="controller?command=go_to_news_list">${newses} >> </a>${news_view}
</div>
<div class="add-table-margin">
	<table class="news_text_format">
		<tr>
			<td class="space_around_title_text">${title}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
			<strong>
				<c:out value="${requestScope.news.title}" />
			</strong>
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${date}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">			
			    <fmt:parseDate value="${requestScope.news.date}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
				<fmt:formatDate value="${parsedDate}" var="newsDate" type="date" pattern="MM/dd/yyyy" />
				<c:out value="${newsDate}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${brief}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${requestScope.news.brief}" />
			</div>
			</td>
		</tr>
		<tr>
			<td class="space_around_title_text">${content}:</td>
			<td class="space_around_view_text">
			<div class="word-breaker">
				<c:out value="${requestScope.news.content}" />
			</div>
			</td>
		</tr>
	</table>
</div>
<c:if test="${sessionScope.role eq 'admin'}">
<div align="right" class="first-view-button">
	<form action="controller" method="post">
		<input type="hidden" name="command" value="go_to_edit_news_page" />
		<input type="hidden" name="id" value="${news.id}" />
		<button type="submit" class="btn btn-warning" value="${edit}">${edit}</button>
	</form>
</div>
<br/><br/>
<div align="right" class="second-view-button">
	<form action="controller" method="post">
		<input type="hidden" name="command" value="do_unpublish_news" />
		<input type="hidden" name="id" value="${news.id}" />
		<button type="submit" class="btn btn-primary" value="${unpublish}">${unpublish}</button>	
	</form>
</div>
<div align="left" class="third-view-button">
	<form action="controller" method="post">
		<input type="hidden" name="command" value="do_delete_news" />
		<input type="hidden" name="id" value="${news.id}" />		
		<button type="submit" class="btn btn-danger" value="${delete}">${delete}</button>			
	</form>
</div>
</c:if>
<br /><br />
<div align="center" class="cancel-button">
	<form action="controller" method="post">
		 <input type="hidden" name="command" value="go_to_news_list" />
		 <button type="submit" class="btn btn-secondary" value="${back}">${back}</button>		
	</form>
</div>