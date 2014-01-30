package com.dao;

import com.entities.Keyboard;
import java.math.BigInteger;
import org.hibernate.SQLQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class KeyboardDaoImpl implements KeyboardDao
{
  @Autowired 
  private SessionFactory sessionFactory;
  
  @Transactional
  @Override
  public void delete(Keyboard k)
  {
    Session session = sessionFactory.getCurrentSession();
    session.delete(k);
  }
  
  @Transactional
  @Override
  public void update(Keyboard k)
  {
      Session session = sessionFactory.getCurrentSession();
      session.update(k);
      
  }
  
  @Transactional
  @Override
  public Keyboard get(int id)
  {
      Session session = sessionFactory.getCurrentSession();
      Keyboard k = (Keyboard) session.createCriteria(Keyboard.class).add(Restrictions.eq("id",id)).uniqueResult();
      return k;
  }
  
  @Transactional
  @Override
  public void add(Keyboard k)
  {
      Session session = sessionFactory.getCurrentSession();
      session.save(k);
  }
  
  @Transactional
  @Override
  public Integer getNb()
  {
      Session session = sessionFactory.getCurrentSession();
      SQLQuery query = session.createSQLQuery("SELECT count(id) FROM mydb.game_keyboard");
      BigInteger result = (BigInteger) query.uniqueResult();
      return result.intValue();
  }
}
