package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "mydb.user_key")
public class Keys
{
    @Id 
    @GeneratedValue
    @Column(name="user_keyId")
    private int keyId;
    
    @Column(name="user_key")
    private String key;
    
    @Column(name="userId")
    private int userId;
    
    public void setUserId(int id)
    {
        this.userId=id;
    }
    
    public int getUserId()
    {
        return this.userId;
    }
    
    public void setKey(String key)
    {
        this.key=key;
    }
    
    public String getKey()
    {
        return this.key;
    }
    
}