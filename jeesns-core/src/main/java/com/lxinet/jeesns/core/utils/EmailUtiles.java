package com.lxinet.jeesns.core.utils;

import com.lxinet.jeesns.core.model.Email;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

/**
 * Created by Administrator on 2017/12/4.
 */
public class EmailUtiles {

    /**
     * 发送邮件
     * @param to
     * @param content
     */
    public void sendMail(JavaMailSender javaMailSender, String from, String to, String subject, String content){
        Email email = new Email(from,to,subject,content);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("huangtianhao@redoop.com");
        message.setTo(email.getTo());
        message.setSubject(email.getSubject());
        message.setText(email.getText());

        javaMailSender.send(message);
        email.setStatus(true);
    }


}
