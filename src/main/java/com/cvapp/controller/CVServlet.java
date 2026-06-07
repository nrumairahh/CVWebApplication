package com.cvapp.controller;

import com.cvapp.model.CVModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet(name = "CVServlet", urlPatterns = {"/CVServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class CVServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if ("example".equals(action)) {
            CVModel exampleCV = new CVModel(
                "Siti Nur Umairah Binti Azhar",
                "nrumairahazhr@gmail.com",
                "+6013-8492347",
                "Universiti Teknologi MARA (UiTM)\nBachelor of Computer Science (Hons.)\nCGPA: 3.85 (2024 - 2027)",
                "Junior Data Analyst at Bank Negara Malaysia (Internship)\n- Built responsive enterprise web apps.\n- Collaborated with UI/UX designers using Tailwind CSS.",
                "Java Enterprise (Jakarta EE), Tomcat, JSP, Tailwind CSS, Git & GitHub",
                "images/profile.jpg"
            );
            
            request.setAttribute("cvData", exampleCV);
            request.getRequestDispatcher("cv-template.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("form.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String skills = request.getParameter("skills");

        String imageEmbedSource = "images/profile.jpg"; 
        
        try {
            Part filePart = request.getPart("profilePicFile"); 
            String originalFileName = filePart.getSubmittedFileName();
            
            if (originalFileName != null && !originalFileName.isEmpty()) {
                InputStream inputStream = filePart.getInputStream();
                byte[] imageBytes = inputStream.readAllBytes();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                String contentType = filePart.getContentType();
                imageEmbedSource = "data:" + contentType + ";base64," + base64Image;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        CVModel userCV = new CVModel(name, email, phone, education, experience, skills, imageEmbedSource);

        request.setAttribute("cvData", userCV);
        request.getRequestDispatcher("cv-template.jsp").forward(request, response);
    }
}