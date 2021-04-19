/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import JavaBean.LoginBean;
import Classes.DBConnection;
import Classes.MD5Hash;
import java.sql.PreparedStatement;
/**
 *
 * @author OEM
 */
public class LoginDao {
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
    public String authenticateUser(LoginBean loginBean){
        String userName=loginBean.getUserName();
        String password=MD5Hash.Hash(loginBean);
        
        Connection con=null;
        Statement statement=null;
        ResultSet resultSet=null;
        
        String userNameDb="";
        String passwordDb="";
        
        try{
            con=DBConnection.createConnection();
            statement=con.createStatement();
            resultSet=statement.executeQuery("select username,password from login");
            
            while(resultSet.next()){
                userNameDb=resultSet.getString("username");
                passwordDb=resultSet.getString("password");
                
                if(userName.equals(userNameDb)&&password.equals(passwordDb)){
                    return "Uspesno";
                }
                
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return "Neispravna lozinka i/ili korisnicko ime!";
    }
    public String confirmPasswords(LoginBean loginBean){
        String password=loginBean.getPassword();
        String passwordConfirm=loginBean.getPasswordConfirm();
        
        String errMessage=null;
        
            if (password!=null && password.length()>0 || passwordConfirm!=null && passwordConfirm.length()>0) {
                if(password.equals(passwordConfirm)){
                loginBean.setPassword(MD5Hash.Hash(loginBean));
                return "Uspesno";
            }
            else{
                errMessage="Unete lozinke se ne podudaraju!";
            }
        }
        else{
            errMessage="Polja sa lozinkama ne smeju biti prazna!";
        }
        return errMessage;
    }
    public void userInfoImport(LoginBean loginBean){
        Connection con=null;
        Statement stm=null;
        try {
            con=DBConnection.createConnection();
            String query="insert into login (name,username,password,type,email)"+" values(?,?,?,?,?)";
            String query2="insert into racun (korisnik_id) values((select max(id_user) from login))";
            
            stm=con.createStatement();
            
            PreparedStatement preparedStmt=con.prepareStatement(query);
            preparedStmt.setString(1, loginBean.getFullName());
            preparedStmt.setString(2, loginBean.getUserName());
            preparedStmt.setString(3, loginBean.getPassword());
            preparedStmt.setString(4, loginBean.getUserType());
            preparedStmt.setString(5, loginBean.getEmail());
            
            if(preparedStmt.executeUpdate()>0){
            stm.executeUpdate(query2);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public String userInfoExtractAccountType(LoginBean loginBean){
        String userName=loginBean.getUserName();
        
        Connection con=null;
        ResultSet resultSet=null;
        
        String userTypeDb="";
        
        try {
            con=DBConnection.createConnection();
            String Query="select * from login where username=?";
            PreparedStatement preparedStmt=con.prepareStatement(Query);
            preparedStmt.setString(1, userName);
            resultSet=preparedStmt.executeQuery();
                while(resultSet.next()){
                userTypeDb=resultSet.getString("type");
                }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return userTypeDb;
    }
    public String userEmailvalidation(LoginBean loginBean){
        String email=loginBean.getEmail();
        
        String errMessage=null;
        
        String regexEmail="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
        
        if(email.matches(regexEmail)){
            return "Uspesno";
        }
        else {
            errMessage="Imejl adresa nije pravilnog formata!";
        }
        return errMessage;
    }
    public String userSumValidation(String Sum){
        String errMessage=null;
        String regexSum="([0-9]*[.])?[0-9]+";
        
        if(Sum.matches(regexSum)){
            return "Uspesno";
        }
        else{
            errMessage="Iznos nije pravilnog formata!";
        }
        return errMessage;
    }
    public String userUsernameValidation(LoginBean loginbean){
        String userName=loginbean.getUserName();
        String query="select * from login where username='"+userName+"'";
        String errMessage=null;
        
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
        try {
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            if(rs.next()==false){
                return "Uspesno";
            }
            else{
                errMessage="Vec postoji korisnicko ime, molimo vas izaberite drugo!";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return errMessage;
    }
    public String userEmailValidation(LoginBean loginbean){
        String email=loginbean.getEmail();
        String query="select * from login where email='"+email+"'";
         String errMessage=null;
        
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
        try {
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            if(rs.next()==false){
                return "Uspesno";
            }
            else{
                errMessage="Imejl adresa je vec iskoriscena, molimo vas unesite drugu!";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return errMessage;
    }
    public String userEmailChange(String email){
        String errMessage=null;
        
        try {
            String query="select * from login where email='"+email+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            if(rs.first()==true){
                return "Uspesno";
            }
            else{
                errMessage="Ne postoji korisnik sa zadatom imejl adresom";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return errMessage;
    }
    public int userIDReturn(String username){
        int userID = 0;
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
        try {
            String query="select id_user from login where username='"+username+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                userID=rs.getInt("id_user");
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userID;
    }
    public String userPasswordChange(int userID,String oldPassword,String newPassword){
        Connection con=null;
        Statement stm=null;
        Statement stm2=null;
        ResultSet rs=null;
        
        String succMessage=null;
        
        try {
            String query="select password from login where id_user='"+userID+"'";
            String query2="update login set password='"+MD5Hash.Hash2(newPassword)+"' where id_user='"+userID+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            stm2=con.createStatement();
            
            
            
            while(rs.next()){
                if(MD5Hash.Hash2(oldPassword).equals(rs.getString("password"))){
                    stm2.executeUpdate(query2);
                    succMessage="Uspesno";
                }
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return succMessage;
    }
    public int userPasswordChange2(int userID,String newPassword){
        int NmbUpdate=0;
        try {
            String query="update login set password='"+MD5Hash.Hash2(newPassword)+"' where id_user='"+userID+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
                NmbUpdate=stm.executeUpdate(query);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return NmbUpdate;
    }
    public String userPasswordVerification(int userID,String password){
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
        String errMessage=null;
        try {
            String query="select * from login where id_user='"+userID+"' and password='"+MD5Hash.Hash2(password)+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            if(rs.first()==false){
                errMessage="Stara lozinka nije dobra, ukucajte ponovo!";
            }
            else{
                return "Uspesno";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return errMessage;
        
    }
}
