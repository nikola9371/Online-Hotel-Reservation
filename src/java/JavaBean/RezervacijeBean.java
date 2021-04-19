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
public class RezervacijeBean {
    private final int idRez;
    private String datum_rezervacije;
    private String datum_isteka_rezervacije;
    private final String imeHotela;
    
    public RezervacijeBean(int idRez,String datum_rezervacije,String datum_isteka_rezervacije,String imeHotela){
        this.idRez=idRez;
        this.datum_isteka_rezervacije=datum_isteka_rezervacije;
        this.datum_rezervacije=datum_rezervacije;
        this.imeHotela=imeHotela;
    }
    public int getIdRez(){
        return idRez;
    }
    public String getDatumRezervacije(){
        return datum_rezervacije;
    }
    public void setDatumRezervacije(String datum_rezervacije){
        this.datum_rezervacije=datum_rezervacije;
    }
    public String getDatumIstekaRezervacije(){
        return datum_isteka_rezervacije;
    }
    public void setDatumIstekaRezervacije(String datum_isteka_rezervacije){
        this.datum_isteka_rezervacije=datum_isteka_rezervacije;
    }
    public String getImeHotela(){
        return imeHotela;
    }
}
