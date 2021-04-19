/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import JavaBean.DodelaMengBean;
import JavaBean.HotelBean;
import JavaBean.IstorijaKupovineBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author OEM
 */
public class AdminDao {
    Connection con=null;
    Statement stm=null;
    ResultSet rs=null;
    
        public ArrayList<HotelBean> HotelExportDataMenz(int idHotel){
        ArrayList<HotelBean> hotelAdmin=new ArrayList<>();
        
        try {
            String query="select hoteli.*,lancihotela.naziv,drzavelista.country_name from hoteli inner join lancihotela on hoteli.idLanacFK=lancihotela.id join drzavelista on hoteli.idDrzavaFK=drzavelista.id where hoteli.Id='"+idHotel+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hotelAdmin.add(new HotelBean(rs.getInt("Id"), rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("country_name"), rs.getInt("brZvezdice"), rs.getFloat("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"), rs.getString("naziv")));
            }
        } catch (SQLException e) {
        }
        return hotelAdmin;
    }
        public int HotelAdd(String Ime,String Adresa,String Mesto,String Grad,String Telefon,String Imejl,String vebStranica,int idLanac,int idDrzava){
            int nmbInsert=0;
            try {
                String query="insert into hoteli(Ime,Adresa,Mesto,Grad,Telefon,Imejl,vebStranica,idLanacFK,idDrzavaFK) values('"+Ime+"','"+Adresa+"','"+Mesto+"','"+Grad+"','"+Telefon+"','"+Imejl+"','"+vebStranica+"','"+idLanac+"','"+idDrzava+"')";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                nmbInsert=stm.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();;
            }
            return nmbInsert;
        }
        public int MendzUpdateData(String ImePrezime,String gRodjenja,String prebivaliste,String Adresa,String telefon,int StrucnaSprema,String skola,int Hotel,int idManz){
            int nmbUpdate=0;
            try {
                String query="update menadzer set imePrezime='"+ImePrezime+"',godina_rodjenja='"+gRodjenja+"',prebivaliste='"+prebivaliste+"',adresa_stanovanja='"+Adresa+"',kontakt_telefon='"+telefon+"',IdStrucnaSpremaFK='"+StrucnaSprema+"',imeSkole='"+skola+"',idHotelFK='"+Hotel+"' where id_mandz='"+idManz+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                nmbUpdate=stm.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbUpdate;
        }
        public int MendzDeleteData(int idMendz){
            int nmbDelete=0;
            try {
                String query="delete from manadzer where id_mandz='"+idMendz+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                nmbDelete=stm.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDelete;
        }
        public String EmailRegex(String email){
             String errMessage=null;
             String regexEmail="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
             
             if(email.matches(regexEmail)){
                 return "Uspesno";
             }else{
                    errMessage="Imejl nije pravilnog formata!";
             }
             return errMessage;
        }
        public String TelephoneRegex(String telefon){
            String errMessage=null;
            String regexTelefon="([\\d\\(][\\(\\)\\s\\.\\-\\d]{4,}\\d)";
            
            if(telefon.matches(regexTelefon)){
                return "Uspesno";
            }else{
                errMessage="Telefon nije pravilnog formata!";
            }
            return errMessage;
        }
        public String UrlRegex(String vebStranica){
            String errMessage=null;
            String regexUrl="(http[s]?:\\/\\/|www.|ftp:\\/\\/){1,2}([-a-zA-Z0-9_]{2,256}\\.[a-z]{2,4}\\b(\\/?[-a-zA-Z0-9@:%_\\+.~#?&\\/=]+)?)";
            
            if(vebStranica.matches(regexUrl)){
                return "Uspesno";
            }else{
                errMessage="Link nije pravilnog formata!";
            }
            return errMessage;
        }

        public int DeleteHotel(int idHotel){
            int nmbDeleted=0;
            try {
                String query="delete from hotelponudasobe where idHotelFK='"+idHotel+"'";
                String query2="delete from menadzer where idHotelFK='"+idHotel+"'";
                String query3="delete from hoteli where Id='"+idHotel+"'";
                String query4="delete from rezervacije where idPonuda";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                if(stm.executeUpdate(query)>=0&&stm.executeUpdate(query2)>=0){
                    nmbDeleted=stm.executeUpdate(query3);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDeleted;
        }
        public int DeleteManagerUser(int idUser){
            int nmbDelete=0;
            try {
                String query="delete from menadzer where idUserFK='"+idUser+"'";
                String query2="delete from login where id_user='"+idUser+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                if(stm.executeUpdate(query)>=0){
                    nmbDelete=stm.executeUpdate(query2);
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDelete;
        }
        public int DeleteAdminUser(int idUser){
                     int nmbDelete=0;
            try {
                String query="delete from login where id_user='"+idUser+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                    nmbDelete=stm.executeUpdate(query);
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDelete;
        }
        public int DeleteUser(int idUser){
                     int nmbDelete=0;
            try {
                String query="delete from login where id_user='"+idUser+"'";
                String query2="delete from placanje_istorija where id_korisnikFK='"+idUser+"'";
                String query3="delete from racun where idKorisnikFK='"+idUser+"'";
                String query4="delete from rezervacije where idKorisnikFK='"+idUser+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                if(stm.executeUpdate(query2)>=0&&stm.executeUpdate(query3)>=0&&stm.executeUpdate(query4)>=0){
                    nmbDelete=stm.executeUpdate(query);
                }
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDelete;
        }
        public int LoginExport(int idManz){
            int idUser = 0;
            try {
                String query="select idUserFK from menadzer where id_mandz='"+idManz+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                rs=stm.executeQuery(query);
                if(rs.first()){
                 idUser=rs.getInt("idUserFK");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return idUser;
        }
        public int InsertNalog(String FullName,String username,String password,String type,String email){
            int nmbInsert=0;
            try {
                String query="insert into login (name,username,password,type,email) values ('"+FullName+"','"+username+"','"+MD5Hash.Hash2(password)+"','"+type+"','"+email+"')";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                nmbInsert=stm.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbInsert;
        }
        public ArrayList<IstorijaKupovineBean> userIstorijaPlacanjaExport(){
            ArrayList<IstorijaKupovineBean> IstorijaKupovine=new ArrayList<>();
        try {
            String query="select placanje_istorija.istorijaID,placanje_istorija.datum_uplate,login.name,placanje_istorija.nacin_placanja from placanje_istorija inner join login on placanje_istorija.id_korisnikFK=login.id_user";
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
        public ArrayList<DodelaMengBean> menzDodela(){
            ArrayList<DodelaMengBean> menzDodelaLista=new ArrayList<>();
            try {
                String query="select * from menadzer";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                rs=stm.executeQuery(query);
                
                while(rs.next()){
                    menzDodelaLista.add(new DodelaMengBean(rs.getInt("id_mandz"),rs.getInt("idHotelFK"), rs.getInt("idUserFK")));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return menzDodelaLista;
        }
        public int DodelaMang(int idUser,int idHotel,String imePrezime,String gRodj,String prebivaliste,String adresa,String telefon,int StrucnaSprema,String skola){
            int nmbInserted=0;
            try {
                String query="inser into menadzer (imePrezime,godina_rodjenja,prebivaliste,adresa_stanovanja,kontakt_telefon,IdStrucnaSpremaFK,imeSkole,idHotelFK,idUserFK) values ('"+imePrezime+"','"+gRodj+"','"+prebivaliste+"','"+adresa+"','"+telefon+"','"+StrucnaSprema+"','"+skola+"','"+idHotel+"','"+idUser+"')";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                nmbInserted=stm.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();;
            }
            return nmbInserted;
        }
        public int DeletePonude(int idPonude){
            int nmbDeleted=0;
            try {
                String query="delete from hotelponudasobe where idPonude='"+idPonude+"'";
                String query2="delete from rezervacije where idPonudeFK='"+idPonude+"'";
                String query3="delete from slikesobe where idPonudeFK='"+idPonude+"'";
                
                con=DBConnection.createConnection();
                stm=con.createStatement();
                
                if(stm.executeUpdate(query2)>=0&&stm.executeUpdate(query3)>=0){
                    nmbDeleted=stm.executeUpdate(query);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return nmbDeleted;
        }
}
