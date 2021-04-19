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
public class DrzaveBean {
    private int id;
    private String country_code;
    private String country_name;
    
    public DrzaveBean(){}
    
    public DrzaveBean(int id,String country_code,String country_name){
        this.id=id;
        this.country_code=country_code;
        this.country_name=country_name;
    }
    
    public int getId(){
        return id;
    }
    public String getCode(){
        return country_code;
    }
    public void setCode(String country_code){
        this.country_code=country_code;
    }
    public String getName(){
        return country_name;
    }
    public void setName(String country_name){
        this.country_name=country_name;
    }
}
