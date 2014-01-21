package com.dao;

import com.entities.User;
import com.entities.UserRole;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
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
     // pour hacher avec SHA1
    ShaPasswordEncoder encoder = new ShaPasswordEncoder();
    /// Hachage du mot de passe avec un gain de sel vari
    String hashedPassword = encoder.encodePassword(user.getPassword(), user.getPseudo());
    
    //Affecter le mot de passe haché
    user.setPassword(hashedPassword);
        
    //Image de base
    user.setImg("https://github.com/patrickkettner/testswarm/diff_blob/6f18cedfdcd99d548d468f33c2ae4e06cf96cdd9/img/unknown.png?raw=true");
      Session session = sessionFactory.getCurrentSession();
      session.save(user);
      

      SQLQuery tempQuery = session.createSQLQuery("INSERT INTO user_role (userId, userRole) VALUES ("+user.getId()+", 'ROLE_USER')");
      tempQuery.executeUpdate();
  }
  
  @Override
  public void deleteUser(int id)
  {
      Session session = sessionFactory.getCurrentSession();
      User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
      if (null != user) 
      {
         session.delete(user);

         Query query = session.createSQLQuery("delete from user_role where userId = "+ user.getId());
         query.executeUpdate();
      }
  }
  
  @Override
  public void updateUser(User user)
    {
         // pour hacher avec SHA1
        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        /// Hachage du mot de passe avec un gain de sel vari
        String hashedPassword = encoder.encodePassword(user.getPassword(), user.getPseudo());

        //Affecter le mot de passe haché
        user.setPassword(hashedPassword);
        
        user.setRegistrationDate(user.getRegistrationDate());
        sessionFactory.getCurrentSession().update(user);
    }
  
  @Override
  public void updateUserByAdmin(User user)
    {
        user.setRegistrationDate(user.getRegistrationDate());
        sessionFactory.getCurrentSession().update(user);
    }
  
  @Override
  public void setRoleUser(int userId, String userRole)
  {
      Session session = sessionFactory.getCurrentSession();
      Query query = session.createSQLQuery("update user_role set userRole = " + userRole + "where userId = " + userId);
      query.executeUpdate();
  }
}
