/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.service;

import com.dao.TutorialDao;
import com.entities.Tutorial;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("tutorialService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TutorialServiceImpl implements TutorialService {
    
    @Autowired
    TutorialDao tutoDao;
    
    @Override
    public List<Tutorial> tutorialList(){
       return tutoDao.tutorialList(); 
    }
    
    @Override
    public Tutorial getTutorial(int id){
        return tutoDao.getTutorial(id);
    }
    
    @Override
    public Tutorial getTutorialByAuthor(String authorName){
        return tutoDao.getTutorialByAuthor(authorName);
    }
    
    @Override
    public Tutorial getTutorialBySubject(String subject){
        return tutoDao.getTutorialBySubject(subject);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void deleteTutorial(int id){
        tutoDao.deleteTutorial(id);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void addTutorial(Tutorial tuto){
       tutoDao.addTutorial(tuto);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Override
    public void updateTutorial(Tutorial tuto){
      tutoDao.updateTutorial(tuto);
    }
}
