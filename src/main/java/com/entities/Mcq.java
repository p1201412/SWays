package com.entities;

import java.util.ArrayList;
import java.util.List;

public class Mcq
{
    List<Question> mcq = new ArrayList();
    
    public List<Question> getMcq()
    {
        return this.mcq;
    }
    public void addQuestion(Question qu)
    {
        this.mcq.add(qu);
    }
}