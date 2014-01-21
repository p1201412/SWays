package com.entities;

public class UserRole 
{
    private int userId;
    private String userRole;
    
    public UserRole(){}
    
    public UserRole(int userId, String userRole)
    {
        this.userId = userId;
        this.userRole = userRole;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
    
}
