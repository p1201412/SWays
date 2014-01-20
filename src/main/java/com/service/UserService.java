package com.service;

import java.util.List;

import com.entities.User;

public interface UserService 
{
    public List<User> userList();
    
    public User getUser(int id);
    
    public User getUserByPseudo(String pseudo);
    
    public User getUserByMail(String mail);
    
    public void addUser(User user);
    
    public void deleteUser(int id);
    
    public void updateUser(User user);
}
