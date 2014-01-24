package com.service;

import com.dao.GeneratedLinkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("generatedLinkService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class GeneratedLinkServiceImpl implements GeneratedLinkService
{
    @Autowired
    GeneratedLinkDao generatedLinkDao;
    
    @Override
    public Integer getUserIdByLink(String link)
    {
       return generatedLinkDao.getUserIdByLink(link); 
    }
    
    @Override
    public void link(int id, String link)
    {
        generatedLinkDao.link(id,link);
    }
    
    @Override
    public void delete(String link)
    {
        generatedLinkDao.delete(link);
    }
    
    
}
