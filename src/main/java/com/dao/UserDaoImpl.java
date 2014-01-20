package com.dao;

import com.entities.User;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDaoImpl implements UserDao
{
  @Autowired 
  private SessionFactory sessionFactory;
  
  
   
  /**
   * @Transactional annotation below will trigger Spring Hibernate transaction manager to automatically create
   * a hibernate session. See src/main/webapp/WEB-INF/servlet-context.xml
   */
  @Transactional
  @Override
  public List<User> userList() 
  {
    Session session = sessionFactory.getCurrentSession();
    List users = session.createQuery("from com.entities.User").list();
    return users;
  }
  
  @Transactional
  @Override
  public User getUser(int id)
  {
      Session session = sessionFactory.getCurrentSession();
      User user = (User) session.get(User.class, id);
      return user;
  }
  
  @Transactional
  @Override
  public User getUserByPseudo(String pseudo)
  {
      Session session = sessionFactory.getCurrentSession();
      User user = (User) session.createCriteria(User.class).add(Restrictions.eq("pseudo",pseudo)).uniqueResult();
      return user;
  }
  
  @Transactional
  @Override
  public User getUserByMail(String mail)
  {
      Session session = sessionFactory.getCurrentSession();
      User user = (User) session.createCriteria(User.class).add(Restrictions.eq("mailAddress",mail)).uniqueResult();
      return user;
  }
  
  @Override
  public void addUser(User user)
  {
      Session session = sessionFactory.getCurrentSession();
      session.save(user);
  }
  
  @Override
  public void deleteUser(int id)
  {
      User user = (User) sessionFactory.getCurrentSession().load(
                User.class, id);
        if (null != user) {
            sessionFactory.getCurrentSession().delete(user);
        }
  }
  
  @Override
  public void updateUser(User user)
    {
        user.setRegistrationDate(user.getRegistrationDate());
        sessionFactory.getCurrentSession().update(user);
    }
}
