/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;

/**
 *
 * @author Kimberley
 */
@WebServlet(name = "Comment", urlPatterns = {"/Comment/*"})
public class Comment extends HttpServlet {
        
    Cluster cluster=null;
    private Object PortalUtil;

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/comment.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);
        String comment=request.getParameter("comment");
        uk.ac.dundee.computing.aec.instagrim.stores.Comment c = new uk.ac.dundee.computing.aec.instagrim.stores.Comment();
        HttpSession session=request.getSession();
        LoggedIn lg1 = (LoggedIn)session.getAttribute("LoggedIn");
        String userA = lg1.getUsername();
        UUID id = (UUID) session.getAttribute("pId");
        System.out.println(id);
        tm.insertPicComment(userA, id, comment);
        response.sendRedirect("/InstaKim/Images/" + userA);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
