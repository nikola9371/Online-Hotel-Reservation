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
public class TipSobeBean {
    private int idSoba;
    private String OznakaSobe;
    private String TipSobe;
    
    public TipSobeBean(){}
    public TipSobeBean(int idSoba,String OznakaSobe,String TipSobe){
        this.idSoba=idSoba;
        this.OznakaSobe=OznakaSobe;
        this.TipSobe=TipSobe;
    }
    public int getIdSoba(){
        return idSoba;
    }
    public String getOznakaSobe(){
        return OznakaSobe;
    }
    public void setOznakaSobe(String OznakaSobe){
        this.OznakaSobe=OznakaSobe;
    }
    public String getTipSobe(){
        return TipSobe;
    }
    public void setTipSobe(String TipSobe){
        this.TipSobe=TipSobe;
    }
}
