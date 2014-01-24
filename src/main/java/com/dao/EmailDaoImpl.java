package com.dao;

import com.entities.EmailSender;
import com.entities.User;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDaoImpl implements EmailDao
{
    @Autowired
    private JavaMailSender mailSender;
    @Override
    public void sendEmail(final String toEmailAddresses, final String fromEmailAddress,
                           final String subject,
                          final String text) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
                message.setTo(toEmailAddresses);
                message.setFrom(new InternetAddress(fromEmailAddress));
                message.setSubject(subject);
                message.setText(text);
            }
        };
        this.mailSender.send(preparator);
    }
}
