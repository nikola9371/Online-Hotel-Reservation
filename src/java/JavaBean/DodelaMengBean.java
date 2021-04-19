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
public class DodelaMengBean {
    private int id_mandz;
    private int idHotel;
    private int idMang;
    
    public DodelaMengBean(){}
    public DodelaMengBean(int id_mandz,int idHotel,int idMang){
        this.id_mandz=id_mandz;
        this.idHotel=idHotel;
        this.idMang=idMang;
    }
    public int getIdManz(){return id_mandz;}
    public int getIdHotel(){return idHotel;}
    public int getIdUser(){return idMang;}
}
