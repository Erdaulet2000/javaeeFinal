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


            <% ArrayList<Publication> publications = (ArrayList<Publication>)request.getAttribute("publications");
                ArrayList<Language> languages = (ArrayList<Language>)request.getAttribute("languages");
                ArrayList<News> news = (ArrayList<News>)request.getAttribute("news");
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
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ADD" data-whatever="@mdo">ADD NEW</button>

                    </nav>

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">TITLE</th>
                            <th scope="col">LANGUAGE</th>
                            <th scope="col">ADDED DATE</th>
                            <th scope="col">PUBLICATION</th>
                            <th  scope="col">DETAILS</th>
                            <th scope="col">OPERATIONS</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%if(news!=null){
                            for(News n : news){
                        %>
                        <tr>
                            <input type="hidden" id="title_<%=n.getId()%>_id" value="<%=n.getTitle()%>">
                            <input type="hidden" id="short_content_<%=n.getId()%>_id" value="<%=n.getShort_content()%>">
                            <input type="hidden" id="l_id_<%=n.getId()%>_id" value="<%=n.getLanguage().getName()%>">
                            <th scope="row"><%=n.getId()%></th>
                            <td width="30%"><%=n.getTitle()%></td>
                            <td><%=n.getLanguage().getName()%></td>
                            <td><%=n.getPost_date()%></td>
                            <td><%=n.getPublication().getName()%></td>
                            <td width="100px">
                                <form action="/getNew" method="get">
                                    <input type="hidden" name="id" value="<%=n.getId()%>">
                                    <button type="submit" class="btn btn-primary btn float-right" data-toggle="modal" data-target="#DETAILS">DETAILS</button> </form></td>

                            <td width="50px"> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="updateNews(<%=n.getId()%>)">EDIT</button>
                                <button type="button" onclick="deleteNews(<%=n.getId()%>)" class="btn btn-danger btn float-right" data-toggle="modal" data-target="#DELETE">
                                    DELETE
                                </button> </td>
                        </tr>
                        <%}}
                        %>
                        </tbody>

                    </table>

                </div>
            </div>





            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/editNews" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" id="id" name="id">
                                    <label class="col-form-label" >TITLE:</label>
                                    <input type="text" class="form-control" id="title" name="title">
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >SHORT CONTENT:</label>
                                    <textarea type="text" style="min-height: 200px;" class="form-control" id="short_content" name="short_content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >CONTENT:</label>
                                    <textarea type="text" style="min-height: 200px;" class="form-control" id="content" name="content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >LANGUAGE:</label>
                                    <select name="language" id="l_id" class="form-control">
                                        <% for(Language l : languages){%>
                                        <option><%=l.getName()%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label  class="col-form-label" >PUBLICATION:</label>
                                    <select name="publication" id="p_id" class="form-control">
                                        <% for(Publication p : publications){%>
                                        <option><%=p.getName()%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label  class="col-form-label" >PICTURE URL:</label>
                                    <input type="text" class="form-control" id="picture_url" name="picture_url">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Edit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>




            <div class="modal fade" id="DELETE" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel2">Are you sure to delete?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                        </div>
                        <div class="modal-footer">
                            <form action="/deleteNews" method="post">
                                <input type="hidden" name="id" id="d_id">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
                                <button type="submit" class="btn btn-danger">YES</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>





            <div class="modal fade" id="ADD" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/addNews" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-form-label" >TITLE:</label>
                                    <input type="text" class="form-control" name="title">
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >SHORT CONTENT:</label>
                                    <textarea style="min-height: 200px;"  type="text" class="form-control" name="short_content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >CONTENT:</label>
                                    <textarea style="min-height: 200px;"  type="text" class="form-control" name="content"></textarea>
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >LANGUAGE:</label>
                                    <select name="language"  class="form-control">
                                        <% for(Language l : languages){%>
                                        <option><%=l.getName()%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label  class="col-form-label" >PUBLICATION:</label>
                                    <select name="publication" class="form-control">
                                        <% for(Publication p : publications){%>
                                        <option><%=p.getName()%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label  class="col-form-label" >PICTURE URL:</label>
                                    <input type="text" class="form-control" name="picture_url">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>




































            <script type="text/javascript">
                const updateNews = (id) =>{
                    document.getElementById("id").value = id;
                    document.getElementById("title").value = document.getElementById("title_"+id+"_id").value;
                    document.getElementById("short_content").value = document.getElementById("short_content_"+id+"_id").value;
                    // document.getElementById("content").value = content;
                    document.getElementById("l_id").value = document.getElementById("l_id_"+id+"_id").value;
                    // document.getElementById("p_id").value = p_id;
                    // document.getElementById("picture_url").value = picture_url;

                }
            </script>

            <script type="text/javascript">
                const deleteNews = (id) =>{
                    document.getElementById("d_id").value = id;
                }
            </script>


</body>
</html>
