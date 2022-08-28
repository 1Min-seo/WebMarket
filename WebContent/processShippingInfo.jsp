<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("utf-8");

	Cookie cartId=new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	Cookie name=new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"),"utf-8"));
	Cookie shippingDate=new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
	Cookie country=new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"),"utf-8"));
	Cookie zipCode=new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
	Cookie addressName=new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
	
	cartId.setMaxAge(24*60*60); //쿠키의 유효기간 24시간 24x60x60초 설정
	name.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
%>