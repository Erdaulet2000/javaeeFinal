package servlets;

import db.DBManager;
import db.Language;
import db.News;
import db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
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

        Cookie[] cookies = request.getCookies();
        String cookieValue = "ENG";
        String cookieTheme = "Default";
        if(cookies!=null){
            for(Cookie c : cookies){
                if(c.getName().equals("my_cookie")){
                    cookieValue = c.getValue();
                    break;
                }
            }
                for(Cookie c1 : cookies){
                    if(c1.getName().equals("Theme")){
                        cookieTheme = c1.getValue();
                        break;
                    }

            }
        }
        ArrayList<Publication> publications = DBManager.getAllPublications();
        ArrayList<News> news = DBManager.getAllNewsByLangCode(cookieValue);
        ArrayList<Language> languages = DBManager.getAllLanguages();
        request.setAttribute("publications",publications);
        request.setAttribute("news",news);
        request.setAttribute("themes",themes);
        request.setAttribute("languages",languages);
        request.setAttribute("cookieValue",cookieValue);
        request.setAttribute("theme",cookieTheme);
        request.getRequestDispatcher("/home.jsp").forward(request,response);

    }
}
