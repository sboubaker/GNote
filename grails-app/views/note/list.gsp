
<%@ page import="org.sb.mynotes.domain.Note" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'note.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'note.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'note.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="dtcreate" title="${message(code: 'note.dtcreate.label', default: 'Dtcreate')}" />
                        
                            <th><g:message code="note.user.label" default="User" /></th>
                        
                            <g:sortableColumn property="views" title="${message(code: 'note.views.label', default: 'Views')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${noteInstanceList}" status="i" var="noteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${noteInstance.id}">${fieldValue(bean: noteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: noteInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: noteInstance, field: "text")}</td>
                        
                            <td><g:formatDate date="${noteInstance.dtcreate}" /></td>
                        
                            <td>${fieldValue(bean: noteInstance, field: "user")}</td>
                        
                            <td>${fieldValue(bean: noteInstance, field: "views")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${noteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
