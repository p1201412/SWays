package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "mydb.user")
public class User
{
    @Id 
    @GeneratedValue 
    @Column(name="userId")
    private int id;
    
    @Column(name="userPseudo")
    private String pseudo;
    
    @Column(name="userPassword")
    private String password;
    
    @Transient
    private String confirmPassword;
    
    @Column(name="userName")
    private String name;
    
    @Column(name="userSurname")
    private String surname;
    
    @Column(name="userRegistrationDate")
    private String registrationDate;
    
    @Column(name="userPoints")
    private int points;
    
    @Column(name="userMailAddress")
    private String mailAddress;
    
    @Transient
    private String confirmMailAddress;
    
    @Column(name="userRights")
    private int rights;

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }
    
    public String getConfirmMailAddress() {
        return confirmMailAddress;
    }

    public void setConfirmMailAddress(String confirmMailAddress) {
        this.confirmMailAddress = confirmMailAddress;
    }

    public int getRights() {
        return rights;
    }

    public void setRights(int rights) {
        this.rights = rights;
    }
    
    public void setId(int id)
    {
        this.id = id;
    }

    public int getId()
    {
        return id;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
}