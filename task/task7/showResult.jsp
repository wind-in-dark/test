<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>

<% String s = request.getParameter("title"); %>
<%
	ArrayList<String>  results = new ArrayList<String>();
	Class.forName("com.mysql.jdbc.Driver");//new出一个mysql提供的JDBC中的Driver实例，以初始化DriverManager
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webwork", "root", "zenghw_008");//通过DriverManager的静态方法得到一个到指定数据库的连接。
	Statement stat = conn.createStatement();
	String sql = "select * from search where title=" + "'" +s +"'";
	ResultSet rs = stat.executeQuery(sql);//rs类似于iterator//from经常写成form导致出错
		
			
		
		
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= s+"_医搜" %></title>
    <style>
        body{
            margin:0;
            padding:0;
        }
        #header{
            width:100%;
            height:50px;
            border-bottom:1px solid #aaa;
            background-color:#eee;
            position:fixed;
            top:0px;
        }
        #wrap{
            width:742px;
            height:20px;
            margin-left:120px;
            margin-top:51px;
        }
        img{
            height:40px;
            margin:5px 30px;
            float:left;
        }
        input[type="text"]{
            height:30px;
            width:600px;
            margin:8px 20px;
            font-size:20px;
            vertical-align:middle;
            padding-left: 5px;

        }
        input[type="submit"]{
            height:32px;
            width:100px;
            margin-left:10px;
        }
         .result{
            font-size:20px;
            margin:5px;
            border-bottom:1px solid #eee;
            line-height:50px;
        }
        .result:last-child{
            border-bottom:none;
        }
        a{
            text-decoration: none;
            color:#333;
        }

        a:visited{
            color:#888;
        }
        a:hover{
            color:blue;
        }
        a:active{
            color:red;
        }
        span{
            color:red;
        }
        p{
        	font-size:20px;
        	color:#333;
        }
    </style>

</head>
<body>
    <div id="header">
        <img src="images/webICon.jpg">
        <form action="showResult.jsp">
            <input type="text" name="title" id="title"/>
            <input type="submit" value="搜索" />
        </form>
    </div>
    <div id="wrap">
		<%
		if(!rs.next())
		{
			String url = "common.jsp?title=" + s;
		%>
		<jsp:forward page="<%=url%>"/>
		<% 
		}
		rs.previous();
		while(rs.next())
		{
			out.println(" <div class='result' >\r\n" + 
				"            <a href=" +rs.getString("content")+ ">"+"<span>"+rs.getString("title") + "</span>" + "&nbsp&nbsp" +rs.getString("source")+"</a>\r\n" + 
				"        </div>");
		}
		 %>
    </div>
    <script>
        document.getElementById("title").focus();
    </script>
</body>
</html>

<%		
		rs.close();
		stat.close();
		conn.close();
		
 %>