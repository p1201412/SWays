package com.entities;

import antlr.StringUtils;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class EmailSender {
    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(final String toEmailAddresses, final String fromEmailAddress, final String subject, final String link) 
    {
        MimeMessagePreparator preparator = new MimeMessagePreparator() 
        {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception 
            {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
                message.setTo(toEmailAddresses);
                message.setFrom(new InternetAddress(fromEmailAddress));
                message.setSubject(subject);
                message.setText(link);
            }
        };
        this.mailSender.send(preparator);
    }
}
