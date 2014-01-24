package com.service;

import com.dao.EmailDao;
import com.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("emailService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class EmailServiceImpl implements EmailService
{
    @Autowired
    EmailDao emailDao;
    
    @Override
    public void sendEmail(final String toEmailAddresses, final String fromEmailAddress, final String subject, final String text)
    {
        emailDao.sendEmail(toEmailAddresses,fromEmailAddress,subject,text);
    }
    
    @Override
    public String generateEmailLink()
    {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; // Tu supprimes les lettres dont tu ne veux pas
	    String pass = "";
	    for(int x=0;x<7;x++)
	    {
	       int i = (int)Math.floor(Math.random() * 62); // Si tu supprimes des lettres tu diminues ce nb
	       pass += chars.charAt(i);
	    }
	    
        return pass;
    }
}
