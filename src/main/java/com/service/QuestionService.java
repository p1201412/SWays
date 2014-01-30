package com.service;


import com.entities.Question;

public interface QuestionService 
{
    
    public Question getQuestionObj(int id);
    
    public String getQuestion(int id);
    public String getAnswer1(int id);
    public String getAnswer2(int id);
    public String getAnswer3(int id);
    public String getAnswer4(int id);
    public String getAnswer5(int id);
    
    public void setQuestion(int id,String qu);
    public void setAnswer1(int id,String an);
    public void setAnswer2(int id,String an);
    public void setAnswer3(int id,String an);
    public void setAnswer4(int id,String an);
    public void setAnswer5(int id,String an);
    
}
