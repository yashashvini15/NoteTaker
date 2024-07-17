package com.controller;

import java.io.*;
import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try{
            System.out.println("Delete servlet");
            int noteId= Integer.parseInt(request.getParameter("note_id").trim());
            System.out.println("Delete servlet noteid : "+noteId);
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            Note note = (Note)session.get(Note.class,noteId);
            System.out.println(note);
            session.delete(note);
            transaction.commit();
            session.close();
            response.sendRedirect("Shownotes.jsp");
        }catch(Exception e){
            System.out.println("DeleteServlet : "+e);
            e.printStackTrace();
        }
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        try{
//            int noteId= Integer.parseInt(request.getParameter("note_id").trim());
//
//            Session session = FactoryProvider.getFactory().openSession();
//
//            Note note = (Note)session.get(Note.class,noteId);
//
//            session.delete(note);
//            session.close();
//            response.sendRedirect("Shownotes.jsp");
//        }catch(Exception e){
//            System.out.println("DeleteServlet : "+e);
//            e.printStackTrace();
//        }
//
//
//    }

    public void destroy() {
    }
}