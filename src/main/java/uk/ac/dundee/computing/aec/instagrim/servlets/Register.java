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
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;


/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        super.init(config);
        cluster = CassandraHosts.getCluster();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
        rd.forward(request, response);
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
        String firstname=request.getParameter("firstname");
        String surname=request.getParameter("surname");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String dob=request.getParameter("date of birth");
        String gender=request.getParameter("gender");

        UUID picID = null;
        
        //Stops crashing if fields are empty
        if (firstname.isEmpty() || surname.isEmpty() || username.isEmpty() || password.isEmpty() || email.isEmpty() || dob.isEmpty() || gender.isEmpty()){
            response.sendRedirect("/InstaKim/register.jsp");
        } else {
            User us=new User();
            us.setCluster(cluster);        
            //Checks if the username is already taken and if it is then refresh the registration page to try again
            if (us.isValidUsername(username) == true ){
                System.out.println("This username is already taken");
                response.sendRedirect("/InstaKim/register.jsp");
            } else {
                us.RegisterUser(username, password, firstname, surname, email,dob,gender,picID);
                //Automatic login
             //   RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Login");
               // rd.forward(request, response);
                response.sendRedirect("/InstaKim/index.jsp");
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
