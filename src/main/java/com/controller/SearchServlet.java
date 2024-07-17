package com.controller;

import java.io.*;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("searchid").trim());
        System.out.println("SearchServlet "+noteId);
        try {
                Session session = FactoryProvider.getFactory().openSession();
                Note note = session.get(Note.class,noteId);
                Transaction transaction = session.beginTransaction();
                session.get(Note.class , noteId);
                transaction.commit();
                session.close();

                if(note!=null){
                    request.setAttribute("note",note);
                    request.getRequestDispatcher("Displaynotes.jsp").forward(request,response);
                }else{
                    response.getWriter().println("No such note");
                }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("SearchServlet : "+e);
        }
    }

    public void destroy() {
    }
}