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
public class StrucnaSpremaBean {
    private int id;
    private String stepenSpreme;
    
    public StrucnaSpremaBean(){}
    public StrucnaSpremaBean(int id,String stepenSpreme){
        this.id=id;
        this.stepenSpreme=stepenSpreme;
    }
    public int getId(){
        return id;
    }
    public String getStepenSpreme(){
        return stepenSpreme;
    }
    public void setStepenSpreme(String stepenSpreme){
        this.stepenSpreme=stepenSpreme;
    }
}
