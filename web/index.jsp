<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
    application.setAttribute("order_num_sub", application.getAttribute("order_num_sub") == null ? "1" : application.getAttribute("order_num_sub"));
    response.sendRedirect("Index.credu");
%>
