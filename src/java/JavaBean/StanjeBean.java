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
public class StanjeBean {
    private float stanje;
    
    public StanjeBean(){}
    public StanjeBean(float stanje){
        this.stanje=stanje;
    }
    public float getStanje(){
        return stanje;
    }
    public void setStanje(float stanje){
        this.stanje=stanje;
    }
}
