package com.dao;

import com.entities.Question;


public interface QuestionDao {
    
    public Integer getNbQuestion();
    
    public Question getQuestionObj(int id);
    
    public String getQuestion(int id);
    public String getAnswer1(int id);
    public String getAnswer2(int id);
    public String getAnswer3(int id);
    public String getAnswer4(int id);
    public String getAnswer5(int id);
    public int getAns(int id);
    public int getPoints(int id);
    
    public void setQuestion(int id,String qu);
    public void setAnswer1(int id,String an);
    public void setAnswer2(int id,String an);
    public void setAnswer3(int id,String an);
    public void setAnswer4(int id,String an);
    public void setAnswer5(int id,String an);
    public void setAns(int id,int an);
    public void setPoints(int id,int pts);
    
    
    
}
