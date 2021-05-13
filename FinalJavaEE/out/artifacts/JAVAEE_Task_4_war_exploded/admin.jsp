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



            <% ArrayList<Language> languages = (ArrayList<Language>)request.getAttribute("languages");%>




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
                        <h3 >Languages</h3>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#ADD" data-whatever="@mdo">ADD NEW</button>

                    </nav>

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">NAME</th>
                            <th scope="col">CODE</th>
                            <th scope="col">OPERATIONS</th>
                        </tr>
                        </thead>
                        <tbody>
                <%if(languages!=null){
                for(Language l : languages){
            %>
                        <tr>
                            <th width="5%" scope="row"><%=l.getId()%></th>
                            <td width="40%"><%=l.getName()%></td>
                            <td width="40%"><%=l.getCode()%></td>
                            <td width="15%"> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="updateLanguage(<%=l.getId()%>,'<%=l.getName()%>', '<%=l.getCode()%>')">EDIT</button>
                                <button type="button" onclick="deleteLanguage(<%=l.getId()%>)" class="btn btn-danger btn float-right" data-toggle="modal" data-target="#DELETE">
                                    DELETE
                                </button> </td>
                        </tr>
                        </tbody>
            <%}}
            %>
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
                        <form action="/editLanguage" method="post">
                        <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" id="update_id" name="update_id">
                                    <label for="update_name" class="col-form-label">NAME:</label>
                                    <input type="text" class="form-control" id="update_name" name="update_name" >
                                </div>
                                <div class="form-group">
                                    <label for="update_code" class="col-form-label">CODE:</label>
                                    <input class="form-control" id="update_code" name="update_code" >
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
                            <form action="/deleteLanguage" method="post">
                                <input type="hidden" name="id" id="id">
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
                        <form action="/addLanguage" method="post">
                        <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-form-label" >NAME:</label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="form-group">
                                    <label  class="col-form-label" >CODE:</label>
                                    <input type="text" class="form-control" name="code">
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
            const updateLanguage = (id, name, code) =>{
                document.getElementById("update_id").value = id;
                document.getElementById("update_name").value = name;
                document.getElementById("update_code").value = code;

            }
        </script>

            <script type="text/javascript">
                const deleteLanguage = (id) =>{
                    document.getElementById("id").value = id;
                }
            </script>

</body>
</html>
