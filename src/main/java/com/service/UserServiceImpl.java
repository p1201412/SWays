package com.service;

import java.util.List;

import com.dao.UserDao;
import com.entities.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService
{
    @Autowired
    UserDao userDao;
    
    @Override
    public List<User> userList()
    {
        return userDao.userList();
    }

    @Override
    public User getUser(int id) 
    {
        return userDao.getUser(id);
    }
    
    @Override
    public User getUserByPseudo(String pseudo)
    {
        return userDao.getUserByPseudo(pseudo);
    }
    
    @Override
    public User getUserByMail(String mail)
    {
        return userDao.getUserByMail(mail);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void addUser(User user)
    {
        userDao.addUser(user);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void deleteUser(int id)
    {
        userDao.deleteUser(id);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void updateUser(User user)
    {
        userDao.updateUser(user);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void updateUserByAdmin(User user)
    {
        userDao.updateUserByAdmin(user);
    }
    
    public void setRoleUser(int userId, String userRole)
    {
        userDao.setRoleUser(userId, userRole);
    }
}
