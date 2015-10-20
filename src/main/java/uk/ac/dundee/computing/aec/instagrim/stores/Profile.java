/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;
import java.util.UUID;

/**
 *
 * @author Kimberley
 */
public class Profile {
    String firstName = null;
    String secondName = null;
    String email = null;
    String dateOfBirth = null;
    String gender = null;
    UUID profilePicture = null;
    String biography = null;
    
    public void setFirstName (String fname){
        this.firstName=fname;
    }
    
    public String getFirstName (){
        return firstName;
    }
    
    public void setSecondName(String sname){
        this.secondName=sname;
    }
    
    public String getSecondName(){
        return secondName;
    }
    
    public void setEmail(String email){
        this.email=email;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setDateOfBirth(String dob){
        this.dateOfBirth=dob;
    }
    
    public String getDateOfBirth(){
       return dateOfBirth;
    }
    
    public void setGender(String gender){
        this.gender=gender;
    }
    
    public String getGender(){
        return gender;
    }
    
    public void setProfilePicture(UUID dp){
        this.profilePicture=dp;
    }
    
    public UUID getProfilePicture(){
        return profilePicture;
    }
    
    public void setBiography(String bio){
        this.biography=bio;
    }
    
    public String getBiography(){
        return biography;
    }
}
