package db;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/task4_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", "root", "");
        }  catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static ArrayList<Language> getAllLanguages(){
        ArrayList<Language> languages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from languages");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String code = resultSet.getString("code");
                languages.add(new Language(id,name,code));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return languages;
    }


    public static Language getLanguage(Long id){
        Language language = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from languages where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                language = new Language(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return language;
    }


    public static Language getLanguage(String name){
        Language language = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from languages where name = ?");
            statement.setString(1,name);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                language = new Language(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("code")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return language;
    }



    public static ArrayList<Publication> getAllPublications(){
        ArrayList<Publication> publications = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from publications");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double rating = resultSet.getDouble("rating");
                publications.add(new Publication(id,name,description,rating));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return publications;
    }




    public static ArrayList<Publication> getPublicationsById(Long idd){
        ArrayList<Publication> publications = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from publications where id = ?");
            statement.setLong(1,idd);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double rating = resultSet.getDouble("rating");
                publications.add(new Publication(id,name,description,rating));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return publications;
    }



    public static Publication getPublication(Long id){
        Publication publication = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from publications where id = ?");
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                publication = new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return publication;
    }



    public static Publication getPublication(String name){
        Publication publication = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from publications where name = ?");
            statement.setString(1,name);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                publication = new Publication(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("rating")
                );
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return publication;
    }



    public static ArrayList<News> getAllNews(){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from news");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String short_content = resultSet.getString("short_content");
                String content = resultSet.getString("content");
                String post_date = resultSet.getString("post_date");
                String picture_url = resultSet.getString("picture_url");
                Long pub_id = resultSet.getLong("publication_id");
                Long lang_id = resultSet.getLong("language_id");

                news.add(new News(id,title,short_content,content,post_date,picture_url, DBManager.getLanguage(lang_id), DBManager.getPublication(pub_id)));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }


    public static News getNew(Long idd){
        News news = null;
        try {
            PreparedStatement statement = connection.prepareStatement("select * from news where id=?");
            statement.setLong(1,idd);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String short_content = resultSet.getString("short_content");
                String content = resultSet.getString("content");
                String post_date = resultSet.getString("post_date");
                String picture_url = resultSet.getString("picture_url");
                Long pub_id = resultSet.getLong("publication_id");
                Long lang_id = resultSet.getLong("language_id");

                news = new News(id,title,short_content,content,post_date,picture_url, DBManager.getLanguage(lang_id), DBManager.getPublication(pub_id));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }



    public static ArrayList<News> getAllNewsByLangCode(String code){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select n.id,n.title,n.short_content,n.content,n.post_date,n.picture_url,n.language_id,n.publication_id " +
                    "from news n " +
                    "INNER JOIN languages l on n.language_id = l.id " +
                    "INNER JOIN publications p on n.publication_id = p.id " +
                    "where l.code = ?");
            statement.setString(1,code);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String short_content = resultSet.getString("short_content");
                String content = resultSet.getString("content");
                String post_date = resultSet.getString("post_date");
                String picture_url = resultSet.getString("picture_url");
                Long pub_id = resultSet.getLong("publication_id");
                Long lang_id = resultSet.getLong("language_id");

                news.add(new News(id,title,short_content,content,post_date,picture_url, DBManager.getLanguage(lang_id), DBManager.getPublication(pub_id)));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }



    public static ArrayList<News> getAllNewsByPublication(Long idd){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select n.id,n.title,n.short_content,n.content,n.post_date,n.picture_url,n.language_id,n.publication_id " +
                    "from news n " +
                    "INNER JOIN languages l on n.language_id = l.id " +
                    "INNER JOIN publications p on n.publication_id = p.id " +
                    "where p.id= ?");
            statement.setLong(1,idd);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String short_content = resultSet.getString("short_content");
                String content = resultSet.getString("content");
                String post_date = resultSet.getString("post_date");
                String picture_url = resultSet.getString("picture_url");
                Long pub_id = resultSet.getLong("publication_id");
                Long lang_id = resultSet.getLong("language_id");

                news.add(new News(id,title,short_content,content,post_date,picture_url, DBManager.getLanguage(lang_id), DBManager.getPublication(pub_id)));
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static boolean addLanguage(Language language){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO languages" +
                    " (id,name,code) " +
                    "VALUES(NULL,?,?)");
            ps.setString(1,language.getName());
            ps.setString(2,language.getCode());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }



    public static boolean editLanguage(Language language){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE languages SET name=?,code=? where id=?");
            ps.setString(1,language.getName());
            ps.setString(2,language.getCode());
            ps.setLong(3,language.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }


    public static void deleteLanguage(Long id){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM languages where id = ?");
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }





    public static boolean addPublication(Publication publication){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO publications" +
                    " (id,name,description,rating) " +
                    "VALUES(NULL,?,?,?)");
            ps.setString(1,publication.getName());
            ps.setString(2,publication.getDescription());
            ps.setDouble(3,publication.getRating());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }


    public static boolean editPublication(Publication publication){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE publications SET name=?,description=?,rating=? where id=?");
            ps.setString(1,publication.getName());
            ps.setString(2,publication.getDescription());
            ps.setDouble(3,publication.getRating());
            ps.setLong(4,publication.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }


    public static void deletePublication(Long id){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM publications where id = ?");
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }


    public static boolean addNews(News news){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "INSERT INTO news" +
                    " (id,title,short_content,content,post_date,picture_url,language_id,publication_id) " +
                    "VALUES(NULL,?,?,?,?,?,?,?)");
            ps.setString(1,news.getTitle());
            ps.setString(2,news.getShort_content());
            ps.setString(3,news.getContent());
            System.out.println(news.getPost_date()+"this");
            ps.setTimestamp(4,Timestamp.valueOf(news.getPost_date()));
            ps.setString(5,news.getPicture_url());
            ps.setLong(6,news.getLanguage().getId());
            ps.setLong(7,news.getPublication().getId());

            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }



    public static boolean editNews(News news){
        int rows = 0;
        try{
            PreparedStatement ps = connection.prepareStatement("" +
                    "UPDATE news SET title=?,short_content=?,content=?,post_date=?,picture_url=?,language_id=?,publication_id=? where id=?");
            ps.setString(1,news.getTitle());
            ps.setString(2,news.getShort_content());
            ps.setString(3,news.getContent());
            ps.setTimestamp(4,Timestamp.valueOf(news.getPost_date()));
            ps.setString(5,news.getPicture_url());
            ps.setLong(6,news.getLanguage().getId());
            ps.setLong(7,news.getPublication().getId());
            ps.setLong(8,news.getId());
            rows = ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return rows>0;
    }




    public static void deleteNews(Long id){
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM news where id = ?");
            ps.setLong(1, id);
            ps.executeUpdate();
            ps.close();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }


}
