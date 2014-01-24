package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "mydb.user_link")
public class GeneratedLink
{
    @Id 
    @GeneratedValue
    @Column(name="user_linkId")
    private int linkId;
    
    @Column(name="link")
    private String link;
    
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
    
    public void setLink(String link)
    {
        this.link=link;
    }
    
    public String getLink()
    {
        return this.link;
    }
    
}