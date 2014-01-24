package com.service;

import java.util.List;
import java.util.Random;

import com.dao.KeysDao;
import com.entities.Keys;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("keysService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class KeysServiceImpl implements KeysService
{
    @Autowired
    KeysDao keysDao;
    
    @Override
    public void deleteKey(Keys key)
    {
        keysDao.deleteKey(key);
    }
    
    @Override
    public void updateKey(Keys key)
    {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; // Tu supprimes les lettres dont tu ne veux pas
	    String pass = "";
	    for(int x=0;x<20;x++)
	    {
	       int i = (int)Math.floor(Math.random() * 62); // Si tu supprimes des lettres tu diminues ce nb
	       pass += chars.charAt(i);
	    }
	    
        key.setKey(pass);
        keysDao.updateKey(key);
    }
  
    @Override
    public String getKeyByUserId(int id)
    {
        return keysDao.getKeyByUserId(id);
    }
}
