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
public class IstorijaKupovineBean {
    private int id;
    private String datum_uplate;
    private String imeKorisnik;
    private String nacin_placanja;
    
    public IstorijaKupovineBean(){}
    public IstorijaKupovineBean(int id,String datum_uplate,String imeKorisnika,String nacin_placanja){
        this.id=id;
        this.datum_uplate=datum_uplate;
        this.imeKorisnik=imeKorisnika;
        this.nacin_placanja=nacin_placanja;
    }
    public int getId(){
        return id;
    }
    public String getDatumUplate(){
        return datum_uplate;
    }
    public void setDatumUplate(String datum_uplate){
        this.datum_uplate=datum_uplate;
    }
    public String getImeKorisnika(){
        return imeKorisnik;
    }
    public void setImeKorisnika(String imeKorisnika){
        this.imeKorisnik=imeKorisnika;
    }
    public String getNacinPlacanja(){
        return nacin_placanja;
    }
    public void setNacinPlacanja(String nacin_placanja){
        this.nacin_placanja=nacin_placanja;
    }
}
