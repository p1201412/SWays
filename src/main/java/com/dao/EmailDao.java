package com.dao;

import com.entities.User;

public interface EmailDao 
{
    public void sendEmail(final String toEmailAddresses, final String fromEmailAddress, final String subject, final String text);
    
}
