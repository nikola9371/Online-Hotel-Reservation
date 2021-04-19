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
public class SlikeSobaBean {
    private int id_slike;
    private String ime;
    private String datum_dodavanja;
    
    public SlikeSobaBean(){}
    public SlikeSobaBean(int id_slike,String ime,String datum_dodavanja){
        this.id_slike=id_slike;
        this.ime=ime;
        this.datum_dodavanja=datum_dodavanja;
    }
    public int getIdSlike(){
        return id_slike;
    }
    public String getIme(){
        return ime;
    }
    public void setIme(String ime){
        this.ime=ime;
    }
    public String getDatumDodavanja(){
        return datum_dodavanja;
    }
}
