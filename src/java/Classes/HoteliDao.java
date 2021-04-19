/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import Classes.DBConnection;
import JavaBean.HotelBean;
import JavaBean.HotelSobeBean;
import JavaBean.RezervacijeBean;
import JavaBean.SlikeSobaBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import org.json.JSONArray;
/**
 *
 * @author OEM
 */
public class HoteliDao {
        Connection con=null;
        Statement stm=null;
        ResultSet rs=null;
        
    public ArrayList<HotelBean> prikaziPonude(){
        
        ArrayList<HotelBean> hoteliPonuda=new ArrayList<>();
        
        try {
            String query="SELECT hoteli.Id,hoteli.Ime,hoteli.Adresa,hoteli.Mesto,hoteli.Grad,hoteli.brZvezdice,hoteli.guglOcena,hoteli.Telefon,hoteli.Imejl,hoteli.vebStranica,hoteli.slika,drzavelista.country_name AS 'Drzava',lancihotela.naziv as 'ImeLanca' FROM `hoteli` INNER JOIN drzavelista ON hoteli.idDrzavaFK=drzavelista.id join lancihotela on hoteli.idLanacFK=lancihotela.id";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hoteliPonuda.add(new HotelBean(rs.getInt("Id"),rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("Drzava"),rs.getInt("brZvezdice"), rs.getFloat("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"),rs.getString("ImeLanca")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hoteliPonuda;
    }
    public ArrayList<HotelSobeBean> prikaziPonudeSobe(int IdHotel){
        
        ArrayList<HotelSobeBean> hoteliPonudeSobe=new ArrayList<>();
        
        try {
            String query="select hotelponudasobe.idPonude,tip_sobe.tip_sobe as 'Tip',hotelponudasobe.datum_postavljanja,hotelponudasobe.cena,hotelponudasobe.cenaUPoenima,hotelponudasobe.brPonudaZaliha,hotelponudasobe.opis,hoteli.Ime as 'ime_hotel',hoteli.Id as 'idHotelFK',lancihotela.naziv as 'ime_lanca' from hotelponudasobe inner join hoteli on hotelponudasobe.idHotelFK=hoteli.Id join lancihotela on lancihotela.id=hoteli.idLanacFK join tip_sobe on hotelponudasobe.TipSobeFK=tip_sobe.idSoba where hoteli.Id='"+IdHotel+"'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hoteliPonudeSobe.add(new HotelSobeBean(rs.getInt("idPonude"), rs.getString("Tip"), rs.getString("datum_postavljanja"), rs.getFloat("cena"), rs.getInt("cenaUPoenima"), rs.getInt("brPonudaZaliha"), rs.getString("ime_hotel"), rs.getInt("idHotelFK"),rs.getString("ime_lanca"),rs.getString("opis")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hoteliPonudeSobe;
    }
    public ArrayList<SlikeSobaBean> slikesoba(int idPonude){
        
        ArrayList<SlikeSobaBean> slikesoba=new ArrayList<>();
        try {
            String query="select * from slikesobe where idPonudeFK='"+idPonude+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                slikesoba.add(new SlikeSobaBean(rs.getInt("id_slike"), rs.getString("ime"),rs.getString("datum_dodavanja")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slikesoba;
    }
    public ArrayList<RezervacijeBean> userRezervacije(int idUser){

        ArrayList<RezervacijeBean> userRezervacije=new ArrayList<>();
        try {
            String query="SELECT rezervacije.idRez,rezervacije.datum_rezervacije,rezervacije.datum_isteka_rezervacije,hoteli.Ime FROM `rezervacije` INNER join hotelponudasobe ON rezervacije.idPonudeFK=hotelponudasobe.idPonude join hoteli on hotelponudasobe.idHotelFK=hoteli.Id where idKorisnikFK='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                userRezervacije.add(new RezervacijeBean(rs.getInt("idRez"), rs.getString("datum_rezervacije"), rs.getString("datum_isteka_rezervacije"), rs.getString("Ime")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userRezervacije;
    }
    public void userBrisanjeRezervacije(int idRez){
        
        try {
            String query="delete from rezervacije where idRez='"+idRez+"'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            stm.executeUpdate(query);
               
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void userDodavanjeRezervacije(int idKor,int idPonude,String rezDate,String odlazakDate){
        LocalDate now=LocalDate.now();
        Calendar cal=Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            cal.setTime(sdf.parse(rezDate));
            cal.add(Calendar.DAY_OF_MONTH, 10);
            String istek=sdf.format(cal.getTime());
            
            String query="insert into rezervacije (datum_rezervacije,datum_isteka_rezervacije,idKorisnikFK,idPonudeFK) values('"+rezDate+"','"+odlazakDate+"','"+idKor+"','"+idPonude+"')";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            stm.executeUpdate(query);
               
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
    }
    public String ProveraDaLiJeRezervisano(int idKor,int idPonude){
        
        String succMsg=null;
        
        try {
            String query="select * from rezervacije where idKorisnikFK='"+idKor+"' and idPonudeFK='"+idPonude+"'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            if(rs.next()==false){
                succMsg="Uspesno";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return succMsg;
    }
    public void OduzimanjeIzZalihe(int idPonude){
        
        try {
            con=DBConnection.createConnection();
            
            int brZalihe=BrojZalihaOstalih(idPonude)-1;
            String query="update hotelponudasobe set brPonudaZaliha='"+brZalihe+"' where idPonude='"+idPonude+"'";
            
            stm=con.createStatement();
            stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void OduzimanjeIzZalihe2(int idPonude,int brSobe){
        try {
            con=DBConnection.createConnection();
            
            int brZalihe=BrojZalihaOstalih(idPonude)-brSobe;
            String query="update hotelponudasobe set brPonudaZaliha='"+brZalihe+"' where idPonude='"+idPonude+"'";
            
            stm=con.createStatement();
            stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int BrojZalihaOstalih(int idPonude){
        int brZalihe=0;
        try {
            con=DBConnection.createConnection();
            String query1="select brPonudaZaliha from hotelponudasobe where idPonude='"+idPonude+"'";
            stm=con.createStatement();
            rs=stm.executeQuery(query1);
            
            while(rs.next()){
                brZalihe=rs.getInt("brPonudaZaliha");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brZalihe;
    }
    public ArrayList<HotelBean> PretragaHotela(String recPretrage){
        ArrayList<HotelBean> hotel=new ArrayList<>();
        try {
            String query="SELECT hoteli.Id,hoteli.Ime,hoteli.Adresa,hoteli.Mesto,hoteli.Grad,hoteli.brZvezdice,hoteli.guglOcena,hoteli.Telefon,hoteli.Imejl,hoteli.vebStranica,hoteli.slika,drzavelista.country_name AS 'Drzava',lancihotela.naziv as 'ImeLanca' FROM `hoteli` INNER JOIN drzavelista ON hoteli.idDrzavaFK=drzavelista.id join lancihotela on hoteli.idLanacFK=lancihotela.id where hoteli.Ime like '%"+recPretrage+"%'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hotel.add(new HotelBean(rs.getInt("Id"),rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("Drzava"),rs.getInt("brZvezdice"), rs.getFloat("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"),rs.getString("ImeLanca")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  hotel;
    }
    public JSONArray ImenaHotela(){
        ArrayList<String> hoteliLista=new ArrayList<>();
        try {
            String query="select Ime from hoteli";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
               hoteliLista.add(rs.getString("Ime"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        JSONArray  jsArrayHoteli=new JSONArray(hoteliLista);
        return jsArrayHoteli;
    }
    public ArrayList<HotelBean> NaprednaPretraga(String recPretrage){
        ArrayList<HotelBean> listaHotela=new ArrayList<>();
        try {
            String query="SELECT hoteli.Id,hoteli.Ime,hoteli.Adresa,hoteli.Mesto,hoteli.Grad,hoteli.brZvezdice,hoteli.guglOcena,hoteli.Telefon,hoteli.Imejl,hoteli.vebStranica,hoteli.slika,drzavelista.country_name AS 'Drzava',lancihotela.naziv as 'ImeLanca' FROM `hoteli` INNER JOIN drzavelista ON hoteli.idDrzavaFK=drzavelista.id join lancihotela on hoteli.idLanacFK=lancihotela.id ";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                listaHotela.add(new HotelBean(rs.getInt("Id"),rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("Drzava"),rs.getInt("brZvezdice"), rs.getFloat("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"),rs.getString("ImeLanca")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaHotela;
    }
    public int HotelIzmenaSlike(int Id,String Slika){
        int nmbUpdate=0;
        try {
            String query="update hoteli set slika='"+Slika+"' where Id='"+Id+"'";
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbUpdate=stm.executeUpdate(Slika);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
}
