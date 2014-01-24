package com.dao;

import com.entities.User;

public interface GeneratedLinkDao 
{
    public void link(int userId, String link);
    public Integer getUserIdByLink(String link);
    public void delete(String link);
    
}
