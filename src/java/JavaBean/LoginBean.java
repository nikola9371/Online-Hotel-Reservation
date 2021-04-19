/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaBean;

import java.util.Date;

/**
 *
 * @author OEM
 */
public class LoginBean {
    private int id;
    private String userName;
    private String password;
    private String passwordConfirm;
    private String fullName;
    private String email;
    private String bodovi;
    private String userType;
    private float stanje;
    private Date datum_registracije;
    
    public LoginBean(){}
    public LoginBean(int id,String userName,String password,String fullName,String email,String bodovi,String userType,float stanje,Date datum_registracije){
        this.id=id;
        this.userName=userName;
        this.password=password;
        this.fullName=fullName;
        this.email=email;
        this.bodovi=bodovi;
        this.userType=userType;
        this.stanje=stanje;
        this.datum_registracije=datum_registracije;
    }
    
    public int getId(){
        return id;
    }
    public void setID(int ID){
        this.id=ID;
    }
    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        this.password=password;
    }
    public String getPasswordConfirm(){
        return passwordConfirm;
    }
    public void setPasswordConfirm(String passwordConfirm){
        this.passwordConfirm=passwordConfirm;
    }
    public String getFullName(){
        return fullName;
    }
    public void setFullName(String fullName){
        this.fullName=fullName;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public String getUserType(){
        return userType;
    }
    public void setUserType(String userType){
        this.userType=userType;
    }
    public String getBodovi(){
        return bodovi;
    }
    public void setBodovi(String bodovi){
        this.bodovi=bodovi;
    }
    public float getStanje(){
        return stanje;
    }
    public Date getDatumRegistracije(){
        return datum_registracije;
    }
}
