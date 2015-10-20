/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Profile;
/**
 *
 * @author Administrator
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    Cluster cluster=null;


    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        //Stops page crashing if the user logs in without typing in a username or password
        if (username.isEmpty() || password.isEmpty()){
            response.sendRedirect("/Instagrim/login.jsp");
        } else {
            User us=new User();
            us.setCluster(cluster);
            boolean isValid=us.IsValidUser(username, password);
            HttpSession session=request.getSession();
            System.out.println("Session in servlet "+session);
            //Checks if the user is a register user
            if (isValid){
                LoggedIn lg= new LoggedIn();
                lg.setLogedin();
                lg.setUsername(username);
                session.setAttribute("LoggedIn", lg);
                //Sets up the users profile
                Profile p = new Profile();
                p = us.getProfile(p, username);
                session.setAttribute("Profile", p);
                
                System.out.println("Session in servlet "+session);
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response);
                //doesn't work ->
                response.sendRedirect("/Instagrim/profile.jsp");
            }else{
                response.sendRedirect("/Instagrim/login.jsp");
            }
        }
        
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
