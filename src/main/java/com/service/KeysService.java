package com.service;

import java.util.List;

import com.entities.Keys;

public interface KeysService 
{
    
    public void deleteKey(Keys key);
    
    public void updateKey(Keys key);
    
    public String getKeyByUserId(int id);
    
}
