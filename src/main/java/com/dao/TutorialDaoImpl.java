package com.dao;

import com.entities.Tutorial;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository  // indiquer a Spring que notre classe est un DAO
public class TutorialDaoImpl implements TutorialDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Transactional
    @Override
    public List<Tutorial> tutorialList() {
        Session session = sessionFactory.getCurrentSession();
        List tutorials = session.createQuery("from com.entities.Tutorial").list();
        return tutorials;   
    }
    
    @Transactional
    @Override
    public Tutorial getTutorial(int id){
        Session session = sessionFactory.getCurrentSession();
        Tutorial tutorial = (Tutorial)session.get(Tutorial.class, id);
        return tutorial;  
    }
    
    @Transactional
    @Override
    public Tutorial getTutorialByAuthor(String authorName){
        Session session = sessionFactory.getCurrentSession();
        Tutorial tutorial = (Tutorial) session.createCriteria(Tutorial.class).add(Restrictions.eq("authorName",authorName)).uniqueResult();
        return tutorial;    
    }
    
    @Override
    public void addTutorial(Tutorial tuto){
         Session session = sessionFactory.getCurrentSession();
         session.save(tuto);   
    }
    
    @Override
    public void deleteTutorial(int id){
      Session session = sessionFactory.getCurrentSession();
      Tutorial tuto = (Tutorial) sessionFactory.getCurrentSession().load(Tutorial.class, id);
      if (null != tuto) 
      {
         session.delete(tuto);
      }
        
    }

    @Override
    public Tutorial getTutorialBySubject(String subject) {
      Session session = sessionFactory.getCurrentSession();
      Tutorial tuto = (Tutorial) session.createCriteria(Tutorial.class).add(Restrictions.eq("subject",subject)).uniqueResult();
      return tuto;
    }

    @Override
    public void updateTutorial(Tutorial tuto) {
        sessionFactory.getCurrentSession().update(tuto);   
    }

    
    
    
    
    
}
