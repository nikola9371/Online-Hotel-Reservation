/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaBean;



/**
 *
 * @author OEM
 */
public class HotelSobeBean {
    private final int idPonude;
    private String Tip;
    private final String datum_postavljanja;
    private float cena;
    private int cenaUpoenima;
    private int zaliha;
    private String imeHotela;
    private int idHotelFK;
    private String imeLanca;
    private String opis;
    
    
    public HotelSobeBean(){
        this.Tip=null;
        this.cena=0;
        this.cenaUpoenima=0;
        this.zaliha=0;
        this.imeHotela=null;
        this.idHotelFK=1;
        this.idPonude=1;
        this.datum_postavljanja=null;
        this.imeLanca=null;
        this.opis=null;
        
    }
    public HotelSobeBean(int idPonude,String Tip,String datum_postavljanja,float cena,int cenaUpoenima,int zaliha,String imeHotela,int idHotelFK,String imeLanca,String opis){
        this.idPonude=idPonude;
        this.Tip=Tip;
        this.datum_postavljanja=datum_postavljanja;
        this.cena=cena;
        this.cenaUpoenima=cenaUpoenima;
        this.zaliha=zaliha;
        this.imeHotela=imeHotela;
        this.idHotelFK=idHotelFK;
        this.imeLanca=imeLanca;
        this.opis=opis;
    }
    public String getImeLanca(){
        return imeLanca;
    }
    public void setIdHotelFK(int idHotelFK){
        this.idHotelFK=idHotelFK;
    }
    public int getIdPonude(){
        return idPonude;
    }
    public String getimeHotela(){
        return imeHotela;
    }
    public void setimeHotel(String imeHotela){
        this.imeHotela=imeHotela;
    }
    public String getTip(){
        return Tip;
    }
    public void setTip(String Tip){
        this.Tip=Tip;
    }
    public String getdatum_postavljanja(){
        return datum_postavljanja;
    }
    public float getCena(){
        return cena;
    }
    public void setCena(float cena){
        this.cena=cena;
    }
    public int getCenaUpoenima(){
        return cenaUpoenima;
    }
    public void setCenaUpoenima(int cenaUpoenima){
        this.cenaUpoenima=cenaUpoenima;
    }
    public int getZaliha(){
        return zaliha;
    }
    public void setZaliha(int zaliha){
        this.zaliha=zaliha;
    }
    public String getOpis(){
        return opis;
    }
    public void setOpis(String opis){
        this.opis=opis;
    }
}
