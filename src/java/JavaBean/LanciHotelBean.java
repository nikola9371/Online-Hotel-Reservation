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
public class LanciHotelBean {
    private int id;
    private String naziv;
    private int kod;
    
    public LanciHotelBean(){}
    
    public LanciHotelBean(int id,String naziv,int kod){
        this.id=id;
        this.naziv=naziv;
        this.kod=kod;
    }
    public int getId(){
        return id;
    }
    public String getNaziv(){
        return naziv;
    }
    public void setNaziv(String naziv){
        this.naziv=naziv;
    }
    public int getKod(){
        return kod;
    }
    public void setKod(int kod){
        this.kod=kod;
    }
}
