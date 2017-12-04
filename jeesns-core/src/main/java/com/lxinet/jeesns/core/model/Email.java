package com.lxinet.jeesns.core.model;

/**
 * 说明：
 * 包名：com.redoop.common.utils
 * 项目名：License-Admin
 * 创建人：Itdeer
 * 创建时间：2017-07-27 上午9:47.
 */
public class Email {

    private String from;
    private String to;
    private String subject;
    private String text;
    private boolean status;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Email() {

    }

    public Email(String from, String to, String subject, String text) {
        this.from = from;
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    @Override
    public String toString() {
        return "Email{" +
                "from='" + from + '\'' +
                ", to='" + to + '\'' +
                ", subject='" + subject + '\'' +
                ", text='" + text + '\'' +
                ", status=" + status +
                '}';
    }
}
