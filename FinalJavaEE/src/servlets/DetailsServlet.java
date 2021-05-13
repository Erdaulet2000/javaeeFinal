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

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<String> themes = new ArrayList<>();
        themes.add("Default");
        themes.add("Light");
        themes.add("Dark");
        themes.add("Monochrome");
        themes.add("Monochrome-Inverse");
        themes.add("Large");
        themes.add("Small");
        themes.add("Facebook");
        themes.add("Instagram");
        String theme = request.getParameter("theme");
        Long id = Long.parseLong(request.getParameter("id"));
        ArrayList<Publication> publications = DBManager.getAllPublications();
        ArrayList<Language> languages = DBManager.getAllLanguages();
        request.setAttribute("publications",publications);
        request.setAttribute("news",DBManager.getNew(id));
        request.setAttribute("languages",languages);
        request.setAttribute("themes",themes);
        request.setAttribute("theme",theme);
        request.getRequestDispatcher("/details.jsp").forward(request,response);

    }
}
