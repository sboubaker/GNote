
<%@ page import="org.sb.mynotes.domain.Note"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'note.label', default: 'Note')}" />
<title>${fieldValue(bean: noteInstance, field: "title")}</title>
<script src="http://platform.twitter.com/widgets.js"
	type="text/javascript"></script>
<style type="text/css" media="screen">
#nav {
	margin-top: 20px;
	margin-left: 30px;
	width: 228px;
	float: left;
}

.homePagePanel * {
	margin: 0px;
}

.homePagePanel .panelBody ul {
	list-style-type: none;
	margin-bottom: 10px;
}

.homePagePanel .panelBody h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin-bottom: 10px;
}

.homePagePanel .panelBody {
	background: url(images/leftnav_midstretch.png) repeat-y top;
	margin: 0px;
	padding: 15px;
}

.homePagePanel .panelBtm {
	background: url(images/leftnav_btm.png) no-repeat top;
	height: 20px;
	margin: 0px;
}

.homePagePanel .panelTop {
	background: url(images/leftnav_top.png) no-repeat top;
	height: 11px;
	margin: 0px;
}

h2 {
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 1.2em;
}

#pageBody {
	margin-left: 280px;
	margin-right: 20px;
}

#pageBody {
	margin-left: 280px;
	margin-right: 20px;
}
</style>
</head>
<body>
	<div id="nav">
		<div class="homePagePanel">
			<div class="panelTop"></div>
			<div class="panelBody">
				<h1>Application Status</h1>
				<ul>
					<li>App version: <g:meta name="app.version"></g:meta>
					</li>
					<li>Grails version: <g:meta name="app.grails.version"></g:meta>
					</li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}
					</li>
					<li>JVM version: ${System.getProperty('java.version')}
					</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}
					</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}
					</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}
					</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}
					</li>
				</ul>
				<h1>Installed Plugins</h1>
				<ul>
					<g:set var="pluginManager"
						value="${applicationContext.getBean('pluginManager')}"></g:set>

					<g:each var="plugin" in="${pluginManager.allPlugins}">
						<li>
							${plugin.name} - ${plugin.version}
						</li>
					</g:each>

				</ul>
			</div>
			<div class="panelBtm"> <g:loginControl /></div>
		</div>
	</div>
	<div>
		<h1 align="left">
			${fieldValue(bean: noteInstance, field: "title")}
		</h1>

		<table border="0" width="60%">


			<tr class="prop">
				<td valign="top" class="value">
					${fieldValue(bean: noteInstance, field: "text")}
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="value">Date: <g:formatDate
						format="MM/dd/yyyy" date="${noteInstance?.dtcreate}" />
					,&nbsp;&nbsp;Vu: ${fieldValue(bean: noteInstance, field: "views")}
					fois</td>
			</tr>

		</table>
		<br/>
		<div>
			<a href="http://twitter.com/share" class="twitter-share-button"
				data-url="http://localhost:8080/MyNotes/home/show" data-via="sabri_boubaker"
				data-text="Twitter cette note"
				data-related="twitter,twitfond" data-count="horizontal" data-lang="fr">Tweeter</a>
		</div>

	</div>
</body>
</html>
