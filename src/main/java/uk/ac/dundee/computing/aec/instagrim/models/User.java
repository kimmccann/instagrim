/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String password, String firstName, String surname, String email, String dateOfBirth, String gender){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password, first_name, last_name, email, date_of_birth, gender) Values(?,?,?,?,?,?,?)");
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword,firstName,surname,email,dateOfBirth,gender));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }    
    return false;  
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    //This method checks if the username is already taken
    public boolean isValidUsername(String username){
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()){
            System.out.println("No users returned");
            return false;
        } else {
            for (Row row : rs) {
                String StoredUser = row.getString("login");
                if (StoredUser.compareTo(username) == 0)
                    return true;
            }
        }
        return false;
    }
    
    //This method checks if this email address has already been used to stop people setting up duplicate accounts
    public boolean isValidEmail(String email){
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select email from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(email));
        if (rs.isExhausted()){
            System.out.println("No users returned");
            return false;
        } else {
            for (Row row : rs) {
                String StoredUser = row.getString("email");
                if (StoredUser.compareTo(email) == 0)
                    return true;
            }
        }
        return false;
    }
    
    //Setting up a user profile by retrieving info from database
    public Profile getProfile(){
        Profile user = new Profile();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select * from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind());
        if (rs.isExhausted()){
            System.out.println("No users returned");
        } else {
            for (Row row : rs) {
                String fname = row.getString("first_name");
                String sname = row.getString("last_name");
                String email = row.getString("email");
                String dob = row.getString("date_of_birth");
                String gender = row.getString("gender");
                user.setFirstName(fname);
                user.setSecondName(sname);
                user.setEmail(email);
                user.setDateOfBirth(dob);
                user.setGender(gender);
            }
        }
        return user;
    }
    
}
