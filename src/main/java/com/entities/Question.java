package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mydb.game_mcq_question")
public class Question
{
    @Id 
    @GeneratedValue 
    @Column(name="questionId")
    private Integer id;
    
    @Column(name="question")
    private String question;
    
    @Column(name="ans1")
    private String ans1;
    
    @Column(name="ans2")
    private String ans2;
    
    @Column(name="ans3")
    private String ans3;
    
    @Column(name="ans4")
    private String ans4;
    
    @Column(name="ans5")
    private String ans5;
    
    @Column(name="ans")
    private int ans;
    
    @Column(name="point")
    private int points;

    public int getPoints() {
        return points;
    }

    public void setPoints(int point) {
        this.points = point;
    }

    public int getAns() {
        return ans;
    }

    public void setAns(int ans) {
        this.ans = ans;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAns1() {
        return ans1;
    }

    public void setAns1(String ans1) {
        this.ans1 = ans1;
    }

    public String getAns2() {
        return ans2;
    }

    public void setAns2(String ans2) {
        this.ans2 = ans2;
    }

    public String getAns3() {
        return ans3;
    }

    public void setAns3(String ans3) {
        this.ans3 = ans3;
    }

    public String getAns4() {
        return ans4;
    }

    public void setAns4(String ans4) {
        this.ans4 = ans4;
    }

    public String getAns5() {
        return ans5;
    }

    public void setAns5(String ans5) {
        this.ans5 = ans5;
    }
}