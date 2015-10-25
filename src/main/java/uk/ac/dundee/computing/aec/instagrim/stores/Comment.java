/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author Kimberley
 */
public class Comment {
    String comment = null;
    String user = null;
    
        
    public void setComment (String comment){
        this.comment=comment;
    }
    
    public String getComment (){
        return comment;
    }
    
        
    public void setUser (String user){
        this.user=user;
    }
    
    public String getUser (){
        return user;
    }
}
