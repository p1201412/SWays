package com.service;

import com.entities.Keyboard;
import java.util.List;

public interface KeyboardService 
{
    
    public void update(Keyboard k);
    
    public Keyboard get(int id);
    
    public void add(Keyboard k);
    
    public void delete(Keyboard k);
    
    public Integer getNb();
    
    public List<Keyboard> liste();
    
}
