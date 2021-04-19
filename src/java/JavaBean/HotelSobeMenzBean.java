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
public class HotelSobeMenzBean {
    private int idPonude;
    private String datum_postavljanja;
    private float cena;
    private int cenaUpoenima;
    private int brPonudaZaliha;
    private String tip_sobe;
    private String opis;
    
    public HotelSobeMenzBean(){}
    public HotelSobeMenzBean(int idPonude,String datum_postavljanja,float cena,int cenaUpoenima,int brPonudaZaliha,String tip_sobe,String opis){
        this.idPonude=idPonude;
        this.datum_postavljanja=datum_postavljanja;
        this.cena=cena;
        this.cenaUpoenima=cenaUpoenima;
        this.brPonudaZaliha=brPonudaZaliha;
        this.tip_sobe=tip_sobe;
        this.opis=opis;
    }
    public int getIdPonude(){
        return idPonude;
    }
    public String getDatumPostavljanja(){
        return datum_postavljanja;
    }
    public void setDatumPostavljanja(String datum_postavljanja){
        this.datum_postavljanja=datum_postavljanja;
    }
    public float getCena(){
        return cena;
    }
    public void setCena(float Cena){
        this.cena=Cena;
    }
    public int getCenaUpoenima(){
        return cenaUpoenima;
    }
    public void setCenaUpoenima(int cenaUpoenima){
        this.cenaUpoenima=cenaUpoenima;
    }
    public int getBrPonudaZaliha(){
        return brPonudaZaliha;
    }
    public void setBrPonudaZaliha(int brPonudaZaliha){
        this.brPonudaZaliha=brPonudaZaliha;
    }
    public String getTipSobe(){
        return tip_sobe;
    }
    public void setTipSobe(String tip_sobe){
        this.tip_sobe=tip_sobe;
    }
    public String getOpis(){
        return opis;
    }
    public void setOpis(String opis){
        this.opis=opis;
    }
}
