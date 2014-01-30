package com.service;

import java.util.List;
import java.util.Random;

import com.dao.KeysDao;
import com.dao.QuestionDao;
import com.entities.Keys;
import com.entities.Question;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("questionService")
@Transactional(propagation = Propagation.SUPPORTS)
public class QuestionServiceImpl implements QuestionService
{
    @Autowired
    QuestionDao questionDao;
    
    @Override
    public Question getQuestionObj(int id)
    {
        return questionDao.getQuestionObj(id);
    }
    
    @Override
    public String getQuestion(int id)
    {
        return questionDao.getQuestion(id);
    }
    
    @Override
    public String getAnswer1(int id)
    {
        return questionDao.getAnswer1(id);
    }
    
    @Override
    public String getAnswer2(int id)
    {
        return questionDao.getAnswer2(id);
    }    
    
    @Override
    public String getAnswer3(int id)
    {
        return questionDao.getAnswer3(id);
    }
    
    @Override
    public String getAnswer4(int id)
    {
        return questionDao.getAnswer4(id);
    }
    
    @Override
    public String getAnswer5(int id)
    {
        return questionDao.getAnswer5(id);
    }
    
    @Override
    public void setQuestion(int id,String qu)
    {
        questionDao.setQuestion(id,qu);
    }  
    
    @Override
    public void setAnswer1(int id,String an)
    {
        questionDao.setAnswer1(id,an);
    } 
    
    @Override
    public void setAnswer2(int id,String an)
    {
        questionDao.setAnswer2(id,an);
    }  
    
    @Override
    public void setAnswer3(int id,String an)
    {
        questionDao.setAnswer3(id,an);
    }   
    
    @Override
    public void setAnswer4(int id,String an)
    {
        questionDao.setAnswer4(id,an);
    }   
    
    @Override
    public void setAnswer5(int id,String an)
    {
        questionDao.setAnswer5(id,an);
    } 
}
