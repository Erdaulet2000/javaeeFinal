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
                String cookieValue = (String)request.getAttribute("cookieValue");
            %>

            <nav class="navbar navbar-expand-lg navbar-dark">
                <% if(languages!=null){%>

                    <%for(Language l : languages){
                %>.
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

                        <select class="form-control"  onchange="document.getElementById('form_id').submit()" name = "theme">
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


                        <li class="nav-item" >
                            <a id="pub-nav-link" class="nav-link" href="/publication?id=<%=p.getId()%>&theme=<%=theme%>"><%=p.getName()%></a>
                        </li>

<%}%>

                     </ul>
              <%  }%>



            <div class="jumbotron jumbotron-fluid" style="padding: 30px 20px;">
                <div class="container">
                    <h1 class="display-4">All World News</h1>
                    <p class="lead">You can read all news in different languages aruond world</p>
                </div>
            </div>


            <% ArrayList<News> news = (ArrayList<News>)request.getAttribute("news");
                if(news!=null){%>
            <div class="row row-cols-1 row-cols-md-2" >
                    <%for(News n :news){%>

                <div class="col mb-4">
                    <div class="card" id="card">
                        <img src="<%=n.getPicture_url()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p><a class="badge badge-primary"  href="/publication?id=<%=n.getPublication().getId()%>" style="font-weight: bolder;font-size: medium"><%=n.getPublication().getName()%></a></p>
                            <h5 class="card-title"><%=n.getTitle()%></h5>
                            <p class="card-text"><small class="text-muted"><%=n.getPost_date()%></small></p>
                            <p class="card-text"><%=n.getShort_content()%></p>
                        </div>
                        <div class="card-body">
                            <a href="/details?id=<%=n.getId()%>&theme=<%=theme%>" class="card-link" style="font-weight: 500">Read More</a>
                        </div>
                    </div>
                </div>







            <%}%>
            </div>
                <%}%>


        </div>
    </div>
</div>


<footer style="text-align: center;margin-top: 50px;">
    <p id="footer-text">Copyright(C),All Rights Reserved</p>
    <a href="/admin" type="button" id="#admin" class="btn btn-outline-dark btn-sm">Admin</a>
</footer>



</body>
</html>
