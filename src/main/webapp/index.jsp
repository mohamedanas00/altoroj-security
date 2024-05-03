<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="com.ibm.security.appscan.altoromutual.util.ServletUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>

<%
	/**
	 This application is for demonstration use only. It contains known application security
	 vulnerabilities that were created expressly for demonstrating the functionality of
	 application security testing tools. These vulnerabilities may present risks to the
	 technical environment in which the application is installed. You must delete and
	 uninstall this demonstration application upon completion of the demonstration for
	 which it is intended.

	 IBM DISCLAIMS ALL LIABILITY OF ANY KIND RESULTING FROM YOUR USE OF THE APPLICATION
	 OR YOUR FAILURE TO DELETE THE APPLICATION FROM YOUR ENVIRONMENT UPON COMPLETION OF
	 A DEMONSTRATION. IT IS YOUR RESPONSIBILITY TO DETERMINE IF THE PROGRAM IS APPROPRIATE
	 OR SAFE FOR YOUR TECHNICAL ENVIRONMENT. NEVER INSTALL THE APPLICATION IN A PRODUCTION
	 ENVIRONMENT. YOU ACKNOWLEDGE AND ACCEPT ALL RISKS ASSOCIATED WITH THE USE OF THE APPLICATION.

	 IBM AltoroJ
	 (c) Copyright IBM Corp. 2008, 2013 All Rights Reserved.
	 */
%>

<jsp:include page="header.jspf"/>

<div id="wrapper" style="width: 99%;">
	<jsp:include page="toc.jspf"/>
	<td valign="top" colspan="3" class="bb">
		<%
			String content = request.getParameter("content");
			if (content == null || content.isEmpty()) {
				content = "default.htm";
			}

			if (ServletUtil.isAppPropertyTrue("advancedStaticPageProcessing")) {
				String path = request.getSession().getServletContext().getRealPath("/static");

				String text = "";
				try {
					// Load file content directly without using shell commands
					File file = new File(path, content);
					if (file.exists() && file.isFile()) {
						BufferedReader reader = new BufferedReader(new FileReader(file));
						String line;
						while ((line = reader.readLine()) != null) {
							text += line + "\n";
						}
						reader.close();
					} else {
						text = "File not found";
					}
				} catch (Exception e) {
					text = "Failed due to " + ServletUtil.sanitzieHtmlWithRegex(e.getLocalizedMessage());
				}
		%>
		<%= text %>
		<%
		} else {
			// Handle static content without command execution
			content = "static/" + content;
			try {
		%>
		<jsp:include page="<%= content %>"/>
		<%
		} catch (Exception e) {
		%>
		<p>Failed due to <%= ServletUtil.sanitzieHtmlWithRegex(e.getLocalizedMessage()) %></p>
		<%
				}
			}
		%>
	</td>

</div>

<jsp:include page="footer.jspf"/>
