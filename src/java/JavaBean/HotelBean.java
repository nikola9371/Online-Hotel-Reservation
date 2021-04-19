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
public class HotelBean {
    private int id;
    private String ime;
    private String Adresa;
    private String Mesto;
    private String Grad;
    private String Drzava;
    private int brZvezdica;
    private float guglOcena;
    private String telefon;
    private String imejl;
    private String vebStranica;
    private String slika;
    private String imeLanca;
    
    public HotelBean(int id,String ime,String Adresa,String Mesto,String Grad,String Drzava,int brZvezdica,float guglOcena,String telefon,String imejl,String vebStranica,String slika,String imeLanca){
        this.id=id;
        this.ime=ime;
        this.Adresa=Adresa;
        this.Mesto=Mesto;
        this.Grad=Grad;
        this.Drzava=Drzava;
        this.brZvezdica=brZvezdica;
        this.guglOcena=guglOcena;
        this.telefon=telefon;
        this.imejl=imejl;
        this.vebStranica=vebStranica;
        this.slika=slika;
        this.imeLanca=imeLanca;
    }
    public HotelBean(){
        this.id=0;
        this.ime=null;
        this.Adresa=null;
        this.Mesto=null;
        this.Grad=null;
        this.Drzava=null;
        this.brZvezdica=0;
        this.guglOcena=0;
        this.telefon=null;
        this.imejl=null;
        this.vebStranica=null;
        this.slika=null;
        this.imeLanca=null;
        
    }
    public int getId(){
        return id;
    }
    
    public String getIme(){
        return ime;
    }
    public void setIme(String ime){
        this.ime=ime;
    }
    public String getAdresa(){
        return Adresa;
    }
    public void setAdresa(String Adresa){
        this.Adresa=Adresa;
    }
    public String getMesto(){
        return Mesto;
    }
    public void setMesto(String mesto){
        this.Mesto=mesto;
    }
    public String getGrad(){
        return Grad;
    }
    public void setGrad(String grad){
        this.Grad=grad;
    }
    public String getDrzava(){
        return Drzava;
    }
    public void setDrzava(String drzava){
        this.Drzava=drzava;
    }
    public int getBrZvezdica(){
        return brZvezdica;
    }
    public void setBrZvezdica(int brZvezda){
        this.brZvezdica=brZvezda;
    }
    public float getGuglOcena(){
        return guglOcena;
    }
    public void setGuglOcena(float guglOcena){
        this.guglOcena=guglOcena;
    }
    public String getTelefon(){
        return telefon;
    }
    public void setTelefon(String telefon){
        this.telefon=telefon;
    }
    public String getImejl(){
        return imejl;
    }
    public void setImejl(String imejl){
        this.imejl=imejl;
    }
    public String getVebStranica(){
        return vebStranica;
    }
    public void setVebStranica(String vebStranica){
        this.vebStranica=vebStranica;
    }
    public String getSlika(){
        return slika;
    }
    public void setSlika(String slika){
        this.slika=slika;
    }
    public String getImeLanca(){
       return imeLanca;
    }
    public void setImeLanca(String ImeLanca){
        this.imeLanca=ImeLanca;
    }
    
}
