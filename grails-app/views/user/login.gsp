

<%@ page import="org.sb.mynotes.domain.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title>Login</title>
</head>
<body>
	<div class="body">
		<h1>
			Login
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<div class="errors">
				<g:renderErrors bean="${userInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="doLogin">
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="email"><g:message
										code="user.email.label" default="Email" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
								<g:textField name="email" value="${userInstance?.email}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="password"><g:message
										code="user.password.label" default="Password" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
								<g:passwordField name="password"
									value="${userInstance?.password}" />
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="login" value="Login" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>
