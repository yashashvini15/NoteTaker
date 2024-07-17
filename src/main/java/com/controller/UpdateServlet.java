package com.controller;

import java.io.*;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("note_id").trim());
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        System.out.println("Update Servlet : "+noteId+title+content);
        try{

            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();
            Note note = session.get(Note.class, noteId);
            note.setTitle(title);
            note.setContent(content);
            note.setId(noteId);
            session.update(note);
            transaction.commit();
            System.out.println("Notes updated");
            session.close();
            response.sendRedirect("Shownotes.jsp");
        }catch(Exception e){
            System.out.println("Delete Servelet : "+e);
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}