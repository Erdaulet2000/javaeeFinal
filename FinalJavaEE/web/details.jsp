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
    <% String theme = (String)request.getAttribute("theme");%>
    <link rel="stylesheet" href="vendor/themes/<%=theme%>.css">
</head>
<body >



<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <% ArrayList<Language> languages = (ArrayList<Language>)request.getAttribute("languages");
                ArrayList<String> themes = (ArrayList<String>)request.getAttribute("themes");
            %>
            <nav class="navbar navbar-expand-lg navbar-dark">
                <% if(languages!=null){%>

                <%for(Language l : languages){
                %>
                <form action="/setCookie" method="post">
                    <input type="hidden"  value="<%=l.getCode()%>" name="cookie_value" >
                    <button class="btn btn-sm"><%=l.getCode()%></button>
                </form>
                <%
                    }%>

                <%}
                %>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent" style="text-align: center">


                    <ul class="navbar-nav offset-3 mr-auto">
                        <li class="nav-item active">
                            <a class="navbar-brand" href="/"  >WORLD NEWS PORTAL</a>
                        </li>
                    </ul>

                    <div class="row" id="nav-admin">

                        <form id="form_id" action="/cookieTheme" method="post" >

                            <select class="form-control"  onkeypress="document.getElementById('form_id').submit()" name = "theme">
                                <% if(themes!=null){%>
                                <% for(String t : themes){
                                    if(t.equals(theme)){
                                %>
                                <option selected><%=t%></option>
                                <%}
                                else{%>
                                <option ><%=t%></option>
                                <%}%>
                                <%}}%>
                            </select>
                        </form>
                    </div>
                </div>
            </nav>


            <% ArrayList<Publication> publications = (ArrayList<Publication>)request.getAttribute("publications");
                if(publications!=null){%>
            <ul class="nav" id="nav"  >
                <%for(Publication p :publications){%>


                <li class="nav-item"  >
                    <a id="pub-nav-link" class="nav-link"  href="/publication?id=<%=p.getId()%>&theme=<%=theme%>"><%=p.getName()%></a>
                </li>

                <%}%>

            </ul>
            <%  }%>



            <% News news = (News)request.getAttribute("news");
                if(news!=null){%>

            <div class="row">
                <div class="col-8">
                    <h2 id="h22"><%=news.getTitle()%></h2>
                    <p class="pp">At <%=news.getPost_date()%> by <a style="font-size: medium" class="badge badge-primary" href="/publication?id=<%=news.getPublication().getId()%>"><%=news.getPublication().getName()%></a></p>
                    <hr>
                    <img class="card-img-top" src="<%=news.getPicture_url()%>" style="width: 100%">
                    <hr>
                    <h5 id="h55"><strong><%=news.getShort_content()%></strong></h5>
                    <p></p>
                    <p  class="pp"><%=news.getContent()%></p>
                </div>

                <div class="col-4">
                    <div id="details-card" class="card text-white bg-info mb-3" style="width:100%;">
                        <div class="card-header" id="card-h"><h4 style="font-weight: bolder">ABOUT <%=news.getPublication().getName()%></h4></div>
                        <div class="card-body" id="card-b">
                            <h6 class="card-title"><%=news.getPublication().getDescription()%></h6>
                            <h4 class="card-text">RATING : <%=news.getPublication().getRating()%></h4>
                        </div>
                    </div>
                    <br/>
                    <div class="col">
                    <ul class="nav flex-column" >
                        <h3 id="h33" class="nav-link" style="padding: 0 0">Archives</h3>
                        <li class="nav-item" >
                            <a  class="nav-link active" style="padding: 0 0" href="#">September 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">August 2020</a>
                        </li>
                        <li class="nav-item" >
                        <a class="nav-link" style="padding: 0 0" href="#">July 2020</a>
                    </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">June 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">May 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">April 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">March 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">February 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">January 2020</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">December 2019</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">November 2019</a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" style="padding: 0 0" href="#">October 2019</a>
                        </li>
                    </ul>
                    </div>
                    <br/>

                    <div class="col">
                        <ul class="nav flex-column" >
                            <h3 id="h333" class="nav-link" style="padding: 0 0">Follow us</h3>
                            <li class="nav-item" >
                                <a  class="nav-link active" style="padding: 0 0" href="#">Instagram</a>
                            </li>
                            <li class="nav-item" >
                                <a class="nav-link" style="padding: 0 0" href="#">Twitter</a>
                            </li>
                            <li class="nav-item" >
                                <a class="nav-link" style="padding: 0 0" href="#">Facebook</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
<%}%>








        </div>
    </div>
</div>


<footer style="text-align: center;margin-top: 50px;">
    <p class="pp">Copyright(C),All Rights Reserved</p>
    <a href="/admin" type="button" id="#admin" class="btn btn-outline-dark btn-sm">Admin</a>
</footer>



</body>
</html>
