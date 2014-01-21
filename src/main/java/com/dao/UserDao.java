package com.dao;

import com.entities.User;

import java.util.List;

public interface UserDao 
{
    @SuppressWarnings("unchecked")
    public List<User> userList();
    
    @SuppressWarnings("unchecked")
    public User getUser(int id);
    
    @SuppressWarnings("unchecked")
    public User getUserByPseudo(String pseudo);
    
    @SuppressWarnings("unchecked")
    public User getUserByMail(String mail);
    
    public void deleteUser(int id);
    
    public void addUser(User user);
    
    public void updateUser(User user);
    
    public void setRoleUser(int userId, String userRole);
    
}
