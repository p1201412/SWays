package com.service;


import java.util.Random;
import com.dao.QuestionDao;
import com.entities.Mcq;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("mcqService")
@Transactional(propagation = Propagation.SUPPORTS)
public class McqServiceImpl implements McqService
{
    @Autowired
    QuestionDao questionDao;

    @Override
    public Mcq generateMcq(int nb) {
        int i = 0;
        int nombre;
        boolean ok;
        Mcq mcq = new Mcq();
        
        Random rand = new Random();
        List<Integer> list = new ArrayList();
        int nbQu = questionDao.getNbQuestion();
       
        
        while(i<nb)
        {
            
            nombre = rand.nextInt(10);
            ok = true;
            for(Integer it : list)
            {
                if(it==nombre)
                    ok = false;
            }
            if(ok==true)
            {
                 mcq.addQuestion(questionDao.getQuestionObj(nombre+1));
                 list.add(nombre);
                 i++;
            }
        }
        return mcq;
    }
    
    
}
