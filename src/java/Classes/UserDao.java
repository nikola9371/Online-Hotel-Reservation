/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import JavaBean.HotelBean;
import JavaBean.IstorijaKupovineBean;
import JavaBean.ListUsersBean;
import JavaBean.LoginBean;
import JavaBean.RacunBean;
import JavaBean.StanjeBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author OEM
 */
public class UserDao {
    Connection con=null;
    Statement stm=null;
    ResultSet rs=null;
    
    public ArrayList<LoginBean> userDataExport(int userID){
        Connection con=null;
        Statement statement=null;
        ResultSet resultSet=null;
        
        ArrayList<LoginBean> profile=new ArrayList<>();
        
        try {
            String query="select id_user,name,username,password,type,email,racun.bodovi,racun.stanje,reg_date from login inner join racun on login.id_user=racun.korisnik_id where id_user='"+userID+"'";
            
            con=DBConnection.createConnection();
            statement=con.createStatement();
            resultSet=statement.executeQuery(query);
            
            while(resultSet.next()){
                profile.add(new LoginBean(resultSet.getInt("id_user"), resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("name"), resultSet.getString("email"), resultSet.getString("bodovi"), resultSet.getString("type"),resultSet.getFloat("stanje"),resultSet.getDate("reg_date")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profile;
    }
    public ArrayList<ListUsersBean> userDataExportAll(int idUser){
        ArrayList<ListUsersBean> listaKorisnika=new ArrayList<>();
        try {
            String query="select * from login where not id_user='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                listaKorisnika.add(new ListUsersBean(rs.getInt("id_user"), rs.getString("name"),rs.getString("username"), rs.getString("type"), rs.getDate("reg_date"), rs.getString("email"))); 
            }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return listaKorisnika;
    }
    public int userDataExport2(String email){
            int userID=0;
            try {
                String query="select * from login where email='"+email+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                rs=stm.executeQuery(query);
                
                if(rs.first()){
                    userID=rs.getInt("id_user");
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return userID;
    }
    public String userStanjeUpdate(int userID,float Sum){
        String succMessage=null;
        try {
            String query="update racun set stanje=stanje+'"+Sum+"' where korisnik_id='"+userID+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            stm.executeUpdate(query);
            succMessage="Iznos uspesno uplacen iznos "+Sum+" na vas racun";
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return succMessage;
    }
    public ArrayList<HotelBean> userHoteliInfo(){
        ArrayList<HotelBean> hoteli=new ArrayList<>();
        try {
            String query="select * from hoteli inner join drzavelista on idDrzavaFK=drzavelista.id join lancihotela on idLanacFK=lancihotela.id";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hoteli.add(new HotelBean(rs.getInt("Id"), rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("country_name"), rs.getInt("brZvezdice"), rs.getInt("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"), rs.getString("naziv")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hoteli;
    }
    public ArrayList<String> userHoteliGradSort(ArrayList<HotelBean> hoteli){
        ArrayList<String> Gradovi=new ArrayList<>();
         hoteli.forEach((elem) -> {
            if(!Gradovi.contains(elem.getGrad())){
                Gradovi.add(elem.getGrad());
            }
        });
                return Gradovi;
    }
    public ArrayList<String> userHoteliMestoSort(ArrayList<HotelBean> hoteli){
        ArrayList<String> Mesto=new ArrayList<>();
        hoteli.forEach((elem) -> {
            if(!Mesto.contains(elem.getMesto())){
                Mesto.add(elem.getMesto());
            }
        });
        
            return Mesto;
    }
    public ArrayList<String> userHoteliImeSort(ArrayList<HotelBean> hoteli){
        ArrayList<String> Ime=new ArrayList<>();
       hoteli.forEach((elem) -> {
            if(!Ime.contains(elem.getIme())){
                Ime.add(elem.getIme());
            }
        });
        return Ime;
    }
    public ArrayList<RacunBean> userRacunExport(int UserId){
        ArrayList<RacunBean> racun=new ArrayList<>();
        
        try {
            String query="SELECT rezervacije.idRez,rezervacije.datum_isteka_rezervacije,rezervacije.datum_rezervacije,hotelponudasobe.cena,hotelponudasobe.cenaUPoenima,hoteli.Ime,login.name FROM rezervacije inner join login on idKorisnikFK=id_user join hotelponudasobe on idPonudeFK=idPonude join hoteli on idHotelFK=Id where idKorisnikFK='"+UserId+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                racun.add(new RacunBean(rs.getInt("idRez"), rs.getString("datum_rezervacije"),rs.getString("Ime") ,rs.getFloat("cena"), rs.getInt("cenaUPoenima"),rs.getString("datum_isteka_rezervacije"),rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return racun;
    }
    public ArrayList<RacunBean> userRacunExportAll(){
        ArrayList<RacunBean> racunAll=new ArrayList<>();
        try {
            String query="SELECT rezervacije.idRez,rezervacije.datum_isteka_rezervacije,rezervacije.datum_rezervacije,hotelponudasobe.cena,hotelponudasobe.cenaUPoenima,hoteli.Ime,login.name FROM rezervacije inner join login on idKorisnikFK=id_user join hotelponudasobe on idPonudeFK=idPonude join hoteli on idHotelFK=Id";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                racunAll.add(new RacunBean(rs.getInt("idRez"), rs.getString("datum_rezervacije"),rs.getString("Ime") ,rs.getFloat("cena"), rs.getInt("cenaUPoenima"),rs.getString("datum_isteka_rezervacije"),rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return racunAll;
    }
    public String userCreditDigitsRegex(String regexDigits){
        String errMessage=null;
        String CreditCardRegex="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}(?:2131|1800|35\\d{3})\\d{11})$";
        if(regexDigits.matches(CreditCardRegex)){
            return "Uspesno";
        }
        else{
            errMessage="Broj kartice nije pravilnog formata!";
        }
        return errMessage;
    }  
    public int userPlacanjeDeleteRecords(int idUser){
                    int nmbDeleted=0;
        try {
            String query="delete from rezervacije where idKorisnikFK='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbDeleted=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbDeleted;
    }
    public String userMailExport(int idUser){
        String email=null;
        try {
            String query="select email from login where id_user='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                email=rs.getString("email");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return email;
    }
    public int userDodelaBodova(int idUser){
        int nmbUpdate=0;
        try {
            Random rand=new Random();
            int i=rand.nextInt(10)+1;
            String query="update racun set bodovi=bodovi+'"+i+"' where korisnik_id='"+idUser+"'";
            
           con=DBConnection.createConnection();
           stm=con.createStatement();
           nmbUpdate=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
    public int userBodoviExport(int idUser){
        int bodovi=0;
        try {
            String query="select bodovi from racun where korisnik_id='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                bodovi=rs.getInt("bodovi");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bodovi;
    }
    public int userPlacanjeBodovima(int idUser,int Sum){
        int nmbUpdate=0;
        try {
            String query="update racun set bodovi=bodovi-'"+Sum+"' where korisnik_id='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbUpdate=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
    public int userIstorijaPlacanje(int idUser,String nacinPlacanja){
        int nmbUpdate=0;
        try {
            String query="insert into placanje_istorija(id_korisnikFK,nacin_placanja) values('"+idUser+"','"+nacinPlacanja+"')";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbUpdate=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
    public ArrayList<IstorijaKupovineBean> userIstorijaPlacanjaExport(int userID){
        ArrayList<IstorijaKupovineBean> IstorijaKupovine=new ArrayList<>();
        try {
            String query="select placanje_istorija.istorijaID,placanje_istorija.datum_uplate,login.name,placanje_istorija.nacin_placanja from placanje_istorija inner join login on placanje_istorija.id_korisnikFK=login.id_user where id_korisnikFK='"+userID+"'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                IstorijaKupovine.add(new IstorijaKupovineBean(rs.getInt("istorijaID"), rs.getString("datum_uplate"), rs.getString("name"), rs.getString("nacin_placanja")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return IstorijaKupovine;
    }
}
