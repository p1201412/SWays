package com.method;

import com.entities.User;

public class UserMethod 
{
    public String canAdd(User user, User uTemp, User uTemp2)
    {
        if(!"".equals(user.getPseudo()) && !"".equals(user.getMailAddress()) && !"".equals(user.getConfirmMailAddress()) && !"".equals(user.getConfirmPassword()) && !"".equals(user.getName()) && !"".equals(user.getSurname()) && !"".equals(user.getPassword()))
        {
            if(uTemp==null)
            {
                if(uTemp2==null)
                {
                    if(user.getConfirmPassword().equals(user.getPassword()))
                    {
                        if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                        {
                            return "";
                        }
                        else
                        {
                            return "Emails don't match !";
                        }
                    }
                    else
                    {
                        return "Passwords don't match !";
                    }
                }
                else
                {
                     return "Email is already used !";
                }
                    
            }
            else
            {
                return "Pseudo is already used !";
            }
        }
        else
        {
            return "Please complete all the input !";
        }
    }
    
    public String canUpdate(User user, User uSameId, User uSamePseudo, User uSameEmail)
    {
        if(!"".equals(user.getPseudo()) && !"".equals(user.getMailAddress()) && !"".equals(user.getConfirmMailAddress()) && !"".equals(user.getName()) && !"".equals(user.getSurname()) &&  !"".equals(user.getPassword()) && !"".equals(user.getConfirmPassword()))
        {
            //TRAITEMENT DU PSEUDO
            if(uSamePseudo!=null)
            {
                if(uSamePseudo.getId()==uSameId.getId())
                {
                    //TRAITEMENT DE L'EMAIL
                    if(uSameEmail!=null)
                    {
                        if(uSameEmail.getId()==uSameId.getId())
                        {
                            if(user.getConfirmPassword().equals(user.getPassword()))
                            {
                                if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                                {
                                    return "";
                                }
                                else
                                {
                                    return "Emails don't match !";
                                }
                            }
                            else
                            {
                                return "Passwords don't match !";
                            }
                        }
                        else
                        {
                            return "Email already used !";
                        }
                    }
                    else
                    {
                        if(user.getConfirmPassword().equals(user.getPassword()))
                        {
                            if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                            {
                                return "";
                            }
                            else
                            {
                                return "Emails don't match !";
                            }
                        }
                        else
                        {
                            return "Passwords don't match !";
                        }
                    }
                }
                else
                {
                    return "Pseudo already used !";
                }
            }
            else
            {
                //TRAITEMENT DE L'EMAIL
                if(uSameEmail!=null)
                {
                    if(uSameEmail.getId()==uSameId.getId())
                    {
                        if(user.getConfirmPassword().equals(user.getPassword()))
                        {
                            if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                            {
                                return "";
                            }
                            else
                            {
                                return "Emails don't match !";
                            }
                        }
                        else
                        {
                            return "Passwords don't match !";
                        }
                    }
                    else
                    {
                        return "Email already used !";
                    }
                }
                else
                {
                    if(user.getConfirmPassword().equals(user.getPassword()))
                    {
                        if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                        {
                            return "";
                        }
                        else
                        {
                            return "Emails don't match !";
                        }
                    }
                    else
                    {
                        return "Passwords don't match !";
                    }
                }
            }
        }
        else
        {
            return "Please complete all the inputs !";
        }
    }
    
    public String canUpdateByAdmin(User user, User uSameId, User uSamePseudo, User uSameEmail)
    {
        if(!"".equals(user.getPseudo()) && !"".equals(user.getMailAddress()) && !"".equals(user.getConfirmMailAddress()) && !"".equals(user.getName()) && !"".equals(user.getSurname()) &&  !"".equals(user.getPassword()) && !"".equals(user.getConfirmPassword()))
        {
            //TRAITEMENT DU PSEUDO
            if(uSamePseudo!=null)
            {
                if(uSamePseudo.getId()==uSameId.getId())
                {
                    //TRAITEMENT DE L'EMAIL
                    if(uSameEmail!=null)
                    {
                        if(uSameEmail.getId()==uSameId.getId())
                        {
                                if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                                {
                                    return "";
                                }
                                else
                                {
                                    return "Emails don't match !";
                                }
                        }
                        else
                        {
                            return "Email already used !";
                        }
                    }
                    else
                    {
                            if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                            {
                                return "";
                            }
                            else
                            {
                                return "Emails don't match !";
                            }
                    }
                }
                else
                {
                    return "Pseudo already used !";
                }
            }
            else
            {
                //TRAITEMENT DE L'EMAIL
                if(uSameEmail!=null)
                {
                    if(uSameEmail.getId()==uSameId.getId())
                    {
                            if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                            {
                                return "";
                            }
                            else
                            {
                                return "Emails don't match !";
                            }
                    }
                    else
                    {
                        return "Email already used !";
                    }
                }
                else
                {
                        if(user.getConfirmMailAddress().equals(user.getMailAddress()))
                        {
                            return "";
                        }
                        else
                        {
                            return "Emails don't match !";
                        }
                }
            }
        }
        else
        {
            return "Please complete all the inputs !";
        }
    }
}
