package com.service;

import com.dao.KeyboardDao;
import java.util.List;
import java.util.Random;

import com.dao.KeysDao;
import com.entities.Keyboard;
import com.entities.Keys;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("keyboardService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class KeyboardServiceImpl implements KeyboardService
{
    @Autowired
    KeyboardDao keyboardDao;
    
    
    @Override
    public void update(Keyboard k)
    {
        keyboardDao.update(k);
    }
    
    @Override
    public Keyboard get(int id)
    {
        return keyboardDao.get(id);
    }
    
    @Override
    public void add(Keyboard k)
    {
        keyboardDao.add(k);
    }
    
    @Override
    public void delete(Keyboard k)
    {
        keyboardDao.delete(k);
    }
    
    @Override
    public Integer getNb()
    {
        return keyboardDao.getNb();
    }
    
    public List<Keyboard> liste()
    {
        List<Keyboard> listeK = new ArrayList<Keyboard>();
        int i=0, j=0;
        boolean ok;
        Random rand = new Random();
        List<Integer> list = new ArrayList();
        int nb = this.getNb();
        
        while(i<4)
        {
            int nombre = rand.nextInt(nb);
            ok =  true;
            for(Integer it : list)
            {
                if(it==nombre)
                    ok = false;
            }
            if(ok==true)
            {
                listeK.add(keyboardDao.get(nombre+1));
                list.add(nombre);
                i++;
            }
            
        }
        return listeK;
    }
}
