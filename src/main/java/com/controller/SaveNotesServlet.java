package com.controller;

import java.io.*;

import java.util.Date;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "SaveNotesServlet",urlPatterns ="/SaveNotesServlet")
public class SaveNotesServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SaveNotesServlet");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Date date = new Date();
        Note note = new Note(title, content, date);
        System.out.println(note);
       try{
           System.out.println("try catch save notes");
           Session session = FactoryProvider.getFactory().openSession();

           Transaction transaction = session.beginTransaction();
           System.out.println("Transaction begin");
           session.save(note);
           System.out.println("data saved : "+note.getTitle()+note.getContent());
           transaction.commit();

           response.setContentType("text/html");
           PrintWriter out = response.getWriter();
           out.println("<h1 style='text-align:center'>Note is added successfully</h1>");
           out.println("<h4 style='text-align:center'><a href=\"Shownotes.jsp\">View all notes</a></h4>");
           session.close();
       }catch (Exception e){
           System.out.println("SaveNotesServelet : "+e);
           e.printStackTrace();
       }

    }

    public void destroy() {
    }
}