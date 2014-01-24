package com.service;
import com.entities.User;
public interface EmailService 
{
     public void sendEmail(final String toEmailAddresses, final String fromEmailAddress, final String subject, final String text);
     public String generateEmailLink();
}
