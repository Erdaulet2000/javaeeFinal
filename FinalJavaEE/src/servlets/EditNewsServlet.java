package servlets;

import db.DBManager;
import db.Language;
import db.News;
import db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(value = "/editNews")
public class EditNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String short_content = request.getParameter("short_content");
        String content = request.getParameter("content");
        Language language = DBManager.getLanguage(request.getParameter("language"));
        Publication publication = DBManager.getPublication(request.getParameter("publication"));
        String url = request.getParameter("picture_url");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        News news = new News(id,title,short_content,content,timestamp+"",url,language,publication);
        DBManager.editNews(news);
        response.sendRedirect("/newsAdmin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
