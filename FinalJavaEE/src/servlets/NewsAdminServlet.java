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
import java.util.ArrayList;

@WebServlet(value = "/newsAdmin")
public class NewsAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<Publication> publications = DBManager.getAllPublications();
        ArrayList<News> news = DBManager.getAllNews();
        ArrayList<Language> languages = DBManager.getAllLanguages();
        request.setAttribute("publications",publications);
        request.setAttribute("news",news);
        request.setAttribute("languages",languages);
        request.getRequestDispatcher("/news.jsp").forward(request,response);

    }
}
