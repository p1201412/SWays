package com.dao;

import com.entities.Keys;


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
public class KeysDaoImpl implements KeysDao
{
  @Autowired 
  private SessionFactory sessionFactory;
  
  @Transactional
  @Override
  public void deleteKey(Keys key)
  {
    Session session = sessionFactory.getCurrentSession();
    session.delete(key);
        Query query = session.createSQLQuery("delete from user_key where userId ="+key.getUserId());
        query.executeUpdate();
  }
  
  @Transactional
  @Override
  public void updateKey(Keys key)
  {
      Session session = sessionFactory.getCurrentSession();
      SQLQuery tempQuery = session.createSQLQuery("INSERT INTO user_key (userId,user_key) VALUES ("+key.getUserId()+", '" + key.getKey() +"' )");
      tempQuery.executeUpdate();
      
  }
  
  @Transactional
  @Override
  public String getKeyByUserId(int id)
  {
      Session session = sessionFactory.getCurrentSession();
      Keys key = (Keys) session.createCriteria(Keys.class).add(Restrictions.eq("userId",id)).uniqueResult();
      return key.getKey();
  }
}
