/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Watto
 */
public class PremiumUser extends User{
    private String cardNumber;
    private String cardDate;
    private String cardCVV;
    
    public PremiumUser(){
    }
    
    public PremiumUser(String cardNumber, String cardDate, String cardCVV){
        this.cardNumber = cardNumber;
        this.cardDate = cardDate;
        this.cardCVV = cardCVV;
    }

    public PremiumUser(String name, String username, String password, String plano, String cardNumber, String cardDate, String cardCVV){
        //JTable builder
        super.name = name;
        super.username = username;
        super.password = password;
        super.plano = plano;
        this.cardNumber = cardNumber;
        this.cardDate = cardDate;
        this.cardCVV = cardCVV;
    }
    
    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardDate() {
        return cardDate;
    }

    public void setCardDate(String cardDate) {
        this.cardDate = cardDate;
    }

    public String getCardCVV() {
        return cardCVV;
    }

    public void setCardCVV(String cardCVV) {
        this.cardCVV = cardCVV;
    }
    
}
