<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\upload";
	int maxSize=5*1024*1024;
	String encType="utf-8";
	
	//MultipartRequest는 웹 페이지에서 서버로 업로드되는 파일 자체만 다루는 클래스
	//post방식이며, 요청 파라미터를 분석한 후 파일 데이터에 접근
	//특징 : 한글 인코딩 값을 얻기 쉽고, 저장 폴더에 동일한 파일명이 있으면 파일명을 자동으로 변경
	MultipartRequest multi=new MultipartRequest(request,realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId=multi.getParameter("ProductId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String manufacturer=multi.getParameter("manufacturer");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	String condition=multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
		
	long stock;
	
	if(unitsInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock);
	
	Enumeration files=multi.getFileNames();
	String fname=(String)files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	
	ProductRepository dao=ProductRepository.getInstance();
	
	Product newProduct=new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitInstock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(filename);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
		
%>