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
public class MenadzerBean {
    private int idManz;
    private String imePrezime;
    private String godina_rodjenja;
    private String prebivaliste;
    private String adresa;
    private String telefon;
    private String skola;
    private String slika;
    private String hotelIme;
    private String strucna_sprema;
    
    public MenadzerBean(){}
    public MenadzerBean(int idManz,String imePrezime,String godina_rodjenja,String prebivaliste,String adresa,String telefon,String skola,String hotelIme,String slika,String strucna_sprema){
        this.idManz=idManz;
        this.imePrezime=imePrezime;
        this.godina_rodjenja=godina_rodjenja;
        this.prebivaliste=prebivaliste;
        this.adresa=adresa;
        this.telefon=telefon;
        this.skola=skola;
        this.hotelIme=hotelIme;
        this.slika=slika;
        this.strucna_sprema=strucna_sprema;
    }
    public int getIdManz(){
        return idManz;
    }
    public String getImePrezime(){
        return imePrezime;
    }
    public void setImePrezime(String imePrezime){
        this.imePrezime=imePrezime;
    }
    public String getGodinaRodjenja(){
        return godina_rodjenja;
    }
    public void setGodinaRodjenja(String godina_rodjenja){
        this.godina_rodjenja=godina_rodjenja;
    }
    public String getPrebivaliste(){
        return prebivaliste;
    }
    public void setPrebivaliste(String prebivaliste){
        this.prebivaliste=prebivaliste;
    }
    public String getAdresa(){
        return adresa;
    }
    public void setAdresa(String adresa){
        this.adresa=adresa;
    }
    public String getTelefon(){
        return telefon;
    }
    public void setTelefon(String telefon){
        this.telefon=telefon;
    }
    public String getSkola(){
        return skola;
    }
    public void setSkola(String skola){
        this.skola=skola;
    }
    public String getImeHotel(){
        return hotelIme;
    }
    public void setImeHotel(String imeHotel){
        this.hotelIme=imeHotel;
    }
    public String getSlika(){
        return slika;
    }
    public void setSlika(String slika){
        this.slika=slika;
    }
    public String getStrucnaSprema(){
        return strucna_sprema;
    }
    public void setStrucnaSprema(String strucna_sprema){
        this.strucna_sprema=strucna_sprema;
    }
    
}
