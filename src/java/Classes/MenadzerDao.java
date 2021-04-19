/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import JavaBean.DrzaveBean;
import JavaBean.HotelBean;
import JavaBean.HotelSobeMenzBean;
import JavaBean.LanciHotelBean;
import JavaBean.MenadzerBean;
import JavaBean.StrucnaSpremaBean;
import JavaBean.TipSobeBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author OEM
 */
public class MenadzerDao {
    Connection con=null;
    Statement stm=null;
    ResultSet rs=null;
    
    public ArrayList<MenadzerBean> MenzExportData(int idUser){
        ArrayList<MenadzerBean> mendz=new ArrayList<>();
        
        try {
           String query="select menadzer.*,hoteli.Ime,strucna_sprema.stepenSpreme from menadzer inner join hoteli on menadzer.idHotelFK=hoteli.Id join strucna_sprema on menadzer.IdStrucnaSpremaFK=strucna_sprema.id where idUserFK='"+idUser+"'";
           
           con=DBConnection.createConnection();
           stm=con.createStatement();
           rs=stm.executeQuery(query);
           
           while(rs.next()){
               mendz.add(new MenadzerBean(rs.getInt("id_mandz"), rs.getString("imePrezime"), rs.getString("godina_rodjenja"), rs.getString("prebivaliste"), rs.getString("adresa_stanovanja"), rs.getString("kontakt_telefon"), rs.getString("imeSkole"), rs.getString("Ime"),rs.getString("slika"),rs.getString("stepenSpreme")));
           }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return mendz;
    }
    public ArrayList<MenadzerBean> MenzExportDataAll(){
        ArrayList<MenadzerBean> menz=new ArrayList<>();
        try {
           String query="select menadzer.*,hoteli.Ime,strucna_sprema.stepenSpreme from menadzer inner join hoteli on menadzer.idHotelFK=hoteli.Id join strucna_sprema on menadzer.IdStrucnaSpremaFK=strucna_sprema.id";
           
           con=DBConnection.createConnection();
           stm=con.createStatement();
           rs=stm.executeQuery(query);
           
           while(rs.next()){
               menz.add(new MenadzerBean(rs.getInt("id_mandz"), rs.getString("imePrezime"), rs.getString("godina_rodjenja"), rs.getString("prebivaliste"), rs.getString("adresa_stanovanja"), rs.getString("kontakt_telefon"), rs.getString("imeSkole"), rs.getString("Ime"),rs.getString("slika"),rs.getString("stepenSpreme")));
           }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menz;
    }
    public ArrayList<MenadzerBean> MenzExportDataAdmin(int idUser){
        ArrayList<MenadzerBean> mendz=new ArrayList<>();
        
        try {
           String query="select menadzer.*,hoteli.Ime,strucna_sprema.stepenSpreme from menadzer inner join hoteli on menadzer.idHotelFK=hoteli.Id join strucna_sprema on menadzer.IdStrucnaSpremaFK=strucna_sprema.id where id_mandz='"+idUser+"'";
           
           con=DBConnection.createConnection();
           stm=con.createStatement();
           rs=stm.executeQuery(query);
           
           while(rs.next()){
               mendz.add(new MenadzerBean(rs.getInt("id_mandz"), rs.getString("imePrezime"), rs.getString("godina_rodjenja"), rs.getString("prebivaliste"), rs.getString("adresa_stanovanja"), rs.getString("kontakt_telefon"), rs.getString("imeSkole"), rs.getString("Ime"),rs.getString("slika"),rs.getString("stepenSpreme")));
           }
        } catch (SQLException e) {
            e.printStackTrace();;
        }
        return mendz;
    }
    public ArrayList<StrucnaSpremaBean> StrucnaSpremaDataExport(){
        ArrayList<StrucnaSpremaBean> strucnaSprema=new ArrayList<>();
        try {
            String query="select * from strucna_sprema";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                strucnaSprema.add(new StrucnaSpremaBean(rs.getInt("id"), rs.getString("stepenSpreme")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return strucnaSprema;
    }
    public ArrayList<HotelBean> HotelExportDataMenz(int idUser){
        ArrayList<HotelBean> hotelMendz=new ArrayList<>();
        
        try {
            String query="select hoteli.*,lancihotela.naziv,drzavelista.country_name from menadzer inner join hoteli on menadzer.idHotelFk=hoteli.Id join lancihotela on hoteli.idLanacFK=lancihotela.id join drzavelista on hoteli.idDrzavaFK=drzavelista.id where idUserFk='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                hotelMendz.add(new HotelBean(rs.getInt("Id"), rs.getString("Ime"), rs.getString("Adresa"), rs.getString("Mesto"), rs.getString("Grad"), rs.getString("country_name"), rs.getInt("brZvezdice"), rs.getFloat("guglOcena"), rs.getString("Telefon"), rs.getString("Imejl"), rs.getString("vebStranica"), rs.getString("slika"), rs.getString("naziv")));
            }
        } catch (SQLException e) {
        }
        return hotelMendz;
    }
    public ArrayList<TipSobeBean> TipSobeExportDataMenz(){
        ArrayList<TipSobeBean> tipSobeMenz=new ArrayList<>();
        
        try {
            String query="select * from tip_sobe";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                tipSobeMenz.add(new TipSobeBean(rs.getInt("idSoba"), rs.getString("oznaka_tipa"), rs.getString("tip_sobe")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tipSobeMenz;
    }
    public ArrayList<TipSobeBean> TipSobeExportDataMenz2(int idTipSobe){
        ArrayList<TipSobeBean> tipSobeMenz=new ArrayList<>();
        
        try {
            String query="select * from tip_sobe where idSoba='"+idTipSobe+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                tipSobeMenz.add(new TipSobeBean(rs.getInt("idSoba"), rs.getString("oznaka_tipa"), rs.getString("tip_sobe")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tipSobeMenz;
    }
    public int TipSobeInsert(String Oznaka,String TipSobe){
        int InsertNmb = 0;
        try {
            String query="insert into tip_sobe(oznaka_tipa,tip_sobe) values('"+Oznaka+"','"+TipSobe+"')";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
           InsertNmb=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return InsertNmb;
    }
    public int TipSobeDelete(int idSoba){
        int Uspeh=0;
        try {
            String query="delete from tip_sobe where idSoba='"+idSoba+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            Uspeh=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Uspeh;
    }
    public ArrayList<String> TipSobeSelect(){
        ArrayList<String> TipSobe=new ArrayList<>();
        try {
            String query="select tip_sobe from tip_sobe";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                TipSobe.add(rs.getString("tip_sobe"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return TipSobe;
    }
    public int TipSobeUpdate(int idSoba,String Oznaka,String TipSobe){
        int UpdateCount=0;
        try {
            String query="update tip_sobe set oznaka_tipa='"+Oznaka+"',tip_sobe='"+TipSobe+"' where idSoba='"+idSoba+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            UpdateCount=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return UpdateCount;
    }
    public ArrayList<String> TipSobeImeSort(ArrayList<String> TipSobeIme){
        ArrayList<String> Ime=new ArrayList<>();
       TipSobeIme.forEach((elem) -> {
            if(!Ime.contains(elem)){
                Ime.add(elem);
            }
        });
        return Ime;
    }
    public ArrayList<DrzaveBean> DrzaveInfoExport(){
        ArrayList<DrzaveBean> drzave=new ArrayList<>();
        try {
            String query="select * from drzavelista";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                drzave.add(new DrzaveBean(rs.getInt("id"), rs.getString("country_code"), rs.getString("country_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drzave;
    }
    public ArrayList<LanciHotelBean> LanciHotelaInfoExport(){
        ArrayList<LanciHotelBean> lanci=new ArrayList<>();
        try {
            String query="select * from lancihotela";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                lanci.add(new LanciHotelBean(rs.getInt("id"), rs.getString("naziv"), rs.getInt("kod")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lanci;
    }
    public int HoteliUpdate(int Id,String Ime,String Adresa,String Mesto,String Grad,String Telefon,String Imejl,String vebStranica,int idLanac,int idDrzava){
        int Update=0;
        try {
            String query="update hoteli set Ime='"+Ime+"',Adresa='"+Adresa+"',Grad='"+Grad+"',Telefon='"+Telefon+"',Imejl='"+Imejl+"',vebStranica='"+vebStranica+"',idLanacFK='"+idLanac+"',idDrzavaFK='"+idDrzava+"' where Id='"+Id+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            Update=stm.executeUpdate(query);
        } catch (SQLException e) {
        }
        return Update;
    }
    public ArrayList<HotelSobeMenzBean> ManzHotelSobeExport(int idManz){
        ArrayList<HotelSobeMenzBean> sobe=new ArrayList<>();
        try {
            String query="select hotelponudasobe.*,tip_sobe.tip_sobe from menadzer inner join hotelponudasobe on menadzer.idHotelFK=hotelponudasobe.idHotelFk join tip_sobe on hotelponudasobe.TipSobeFk=tip_sobe.idSoba where idUserFK='"+idManz+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                sobe.add(new HotelSobeMenzBean(rs.getInt("idPonude"), rs.getString("datum_postavljanja"), rs.getFloat("cena"), rs.getInt("cenaUPoenima"), rs.getInt("brPonudaZaliha"), rs.getString("tip_sobe"), rs.getString("opis")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sobe;
    }
    public ArrayList<HotelSobeMenzBean> ManzHotelExportDetail(int idPonude){
                ArrayList<HotelSobeMenzBean> sobe=new ArrayList<>();
        try {
            String query="select hotelponudasobe.*,tip_sobe.tip_sobe from menadzer inner join hotelponudasobe on menadzer.idHotelFK=hotelponudasobe.idHotelFk join tip_sobe on hotelponudasobe.TipSobeFk=tip_sobe.idSoba where idPonude='"+idPonude+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                sobe.add(new HotelSobeMenzBean(rs.getInt("idPonude"), rs.getString("datum_postavljanja"), rs.getFloat("cena"), rs.getInt("cenaUPoenima"), rs.getInt("brPonudaZaliha"), rs.getString("tip_sobe"), rs.getString("opis")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sobe;
    }
    public int ManzHotelSmestajDetailUpdate(int idPonude,int tipSobe,float cena,int CenaUPoenima,int brPonuda,String opis){
        int Uspeh=0;
        try {
            String query="update hotelponudasobe set TipSobeFK='"+tipSobe+"',cena='"+cena+"',cenaUPoenima='"+CenaUPoenima+"',brPonudaZaliha='"+brPonuda+"',opis='"+opis+"' where idPonude='"+idPonude+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            Uspeh=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Uspeh;
    }
    public ArrayList<TipSobeBean> ManzTipSobeFind(){
        ArrayList<TipSobeBean> sobe=new ArrayList<>();
        try {
            String query="select * from tip_sobe";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            rs=stm.executeQuery(query);
            
            while(rs.next()){
                sobe.add(new TipSobeBean(rs.getInt("idSoba"), rs.getString("oznaka_tipa"), rs.getString("tip_sobe")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sobe;
    }
    public int SmestajInsert(int TipSobe,float cena,int cenaB,int Zaliha,String opis,int Hotel){
        int NmbInsert=0;
        try {
            String query="insert into hotelponudasobe(TipSobeFK,cena,cenaUPoenima,brPonudaZaliha,opis,idHotelFK) values('"+TipSobe+"','"+cena+"','"+cenaB+"','"+Zaliha+"','"+opis+"','"+Hotel+"')";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            NmbInsert=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return NmbInsert;
    }
    public int SmestajDelete(int idPonude){
        int NmbDetele=0;
        try {
            String query="delete from hotelponudasobe where idPonude='"+idPonude+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            NmbDetele=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return NmbDetele;
    }
    public int ImageChange(int idUser,String SlikaIme){
        int nmbUpdate=0;
        try {
            String query="update menadzer set slika='"+SlikaIme+"' where idUserFk='"+idUser+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbUpdate=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
    public int ImageChangeHotel(int idHotel,String SlikaIme){
        int nmbUpdate=0;
        try {
            String query="update hoteli set slika='"+SlikaIme+"' where Id='"+idHotel+"'";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbUpdate=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbUpdate;
    }
    public int ImageAddSmestaj(int idPonude,String imeSlike){
        int nmbInsert=0;
        try {
            String query="insert into slikesobe (ime,idPonudeFK) values ('"+imeSlike+"','"+idPonude+"')";
            
            con=DBConnection.createConnection();
            stm=con.createStatement();
            nmbInsert=stm.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nmbInsert;
    }
    public int MendzUpdateData(String ImePrezime,String gRodjenja,String prebivaliste,String Adresa,String telefon,int StrucnaSprema,String skola,int idManz){
           int nmbUpdate=0;
           try {
               String query="update menadzer set imePrezime='"+ImePrezime+"',godina_rodjenja='"+gRodjenja+"',prebivaliste='"+prebivaliste+"',adresa_stanovanja='"+Adresa+"',kontakt_telefon='"+telefon+"',IdStrucnaSpremaFK='"+StrucnaSprema+"',imeSkole='"+skola+"' where id_mandz='"+idManz+"'";
                
               con=DBConnection.createConnection();
               stm=con.createStatement();
               nmbUpdate=stm.executeUpdate(query);
           } catch (SQLException e) {
            e.printStackTrace();
           }
       return nmbUpdate;
    }
}
