package com.dao;

import com.entities.Keyboard;

public interface KeyboardDao 
{
    public void update(Keyboard k);
    
    public Keyboard get(int id);
    
    public void add(Keyboard k);
    
    public void delete(Keyboard k);
    
    public Integer getNb();
    
}
