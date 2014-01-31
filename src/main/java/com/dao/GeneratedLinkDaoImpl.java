package com.dao;

import com.entities.GeneratedLink;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class GeneratedLinkDaoImpl implements GeneratedLinkDao
{
    @Autowired 
    private SessionFactory sessionFactory;
    
    @Transactional
    @Override
    public void link(int userId, String link)
    {
        Session session = sessionFactory.getCurrentSession();
        SQLQuery tempQuery = session.createSQLQuery("INSERT INTO user_link (userId,link) VALUES ("+userId+", '" + link +"' )");
        tempQuery.executeUpdate();
    }
    @Transactional
    @Override
    public Integer getUserIdByLink(String link)
    {
       Session session = sessionFactory.getCurrentSession();
      GeneratedLink user = (GeneratedLink) session.createCriteria(GeneratedLink.class).add(Restrictions.eq("link",link)).uniqueResult();
      return user.getUserId();
  }
    
    @Transactional
    @Override
    public void delete(String user_link)
    {
        GeneratedLink generatedLink= new GeneratedLink();
        generatedLink.setUserId(getUserIdByLink(user_link));
        generatedLink.setLink(user_link);
        Session session = sessionFactory.getCurrentSession();
        session.delete(generatedLink);
        Query query = session.createSQLQuery("delete from user_link where userId = '" + getUserIdByLink(user_link)+"'");
        query.executeUpdate();
    }
}
