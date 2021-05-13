<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBManager" %>
<%@ page import="db.Language" %>
<%@ page import="db.Publication" %>
<%@ page import="db.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <%@include file="includes/head.jsp"%>
</head>
<body >

            <%
                News news = (News)request.getAttribute("new_detail");
            %>



            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="row">
                    <div class="col-2"><a class="navbar-brand" href="/" style="color: white;font-weight: bolder" >WORLD NEWS PORTAL</a></div>
                    <div class="col-10">
                        <form class="form-inline my-2 my-lg-0" style="float: right">
                            <input class="form-control"   type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

                        </form>
                    </div>





                </div>
            </nav>


            <div class="row" style="margin-left: 0;margin-right: 0;">
                <div class="col-sm-2"  style="background-color: #f8f9fa">
                    <ul class="nav flex-column" style="width: 100%">
                        <li class="nav-item">
                            <strong class="nav-link" style="font-weight: bolder">ADMIN PANEL </strong>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin">Languages</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/publicationsAdmin">Publications</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/newsAdmin" >News</a>
                        </li>
                    </ul>

                </div>
                <div class="col-sm-10">
                    <nav class="navbar navbar" style="background-color: white">
                        <h3 >News</h3>

                    </nav>
                    <h2><%=news.getTitle()%></h2>
                    <p>At <%=news.getPost_date()%> by <a class="badge badge-primary"  style="font-weight: bolder;font-size: medium" href="/publication?id=<%=news.getPublication().getId()%>"><%=news.getPublication().getName()%></a></p>
                    <hr>
                    <img src="<%=news.getPicture_url()%>" style="width: 800px;">
                    <hr>
                    <strong><%=news.getShort_content()%></strong>
                    <p><%=news.getContent()%></p>

                </div>
            </div>


</body>
</html>
