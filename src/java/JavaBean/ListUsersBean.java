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
public class ListUsersBean {
    private int idUser;
    private String fullName;
    private String username;
    private String AccType;
    private Date reg_date;
    private String email;
    
    public ListUsersBean(){}
    public ListUsersBean(int idUser,String fullName,String username,String AccType,Date reg_date,String email){
        this.idUser=idUser;
        this.fullName=fullName;
        this.username=username;
        this.AccType=AccType;
        this.reg_date=reg_date;
        this.email=email;
    }
    public int getIdUser(){return idUser;}
    public String getFullName(){return fullName;}
    public String getUserName(){return username;}
    public String getAccType(){return AccType;}
    public Date getRegDate(){return reg_date;}
    public String getEmail(){return email;}
}
