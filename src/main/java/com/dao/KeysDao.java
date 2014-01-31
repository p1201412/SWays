package com.dao;

import com.entities.Keys;


public interface KeysDao 
{
    public void deleteKey(Keys key);
    
    public void updateKey(Keys key);
    
    public String getKeyByUserId(int id);
    
}
