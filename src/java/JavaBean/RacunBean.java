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
public class RacunBean {
    private int idRez;
    private String datum_rezervacije;
    private String datum_isteka;
    private String ime_hotela;
    private float cena;
    private int cenaP;
    private String imeKorisnik;
    
    public RacunBean(){}
    public RacunBean(int idRez,String datum_rezervacije,String ime_hotela,float cena,int cenaP,String datum_isteka,String imeKorisnik){
        this.idRez=idRez;
        this.datum_rezervacije=datum_rezervacije;
        this.ime_hotela=ime_hotela;
        this.cena=cena;
        this.cenaP=cenaP;
        this.datum_isteka=datum_isteka;
        this.imeKorisnik=imeKorisnik;
    }
    public int getIdRez(){
        return idRez;
    }
    public String getDatumRezervacije(){
        return datum_rezervacije;
    }
    public String getImeHotela(){
        return ime_hotela;
    }
    public float getCena(){
        return cena;
    }
    public int getCenaP(){
        return cenaP;
    }
    public String getDatumIsteka(){
        return datum_isteka;
    }
    public String getImeKorisnik(){
        return imeKorisnik;
    }
}
