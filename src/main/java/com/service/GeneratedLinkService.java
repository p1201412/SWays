package com.service;

public interface GeneratedLinkService {
    public Integer getUserIdByLink(String link);
    public void link(int userId, String link);
    public void delete(String link);
}
