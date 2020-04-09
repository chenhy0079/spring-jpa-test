package com.lagou.controller;

import com.lagou.edu.dao.ResumeDao;
import com.lagou.pojo.Resume;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private ResumeDao resumeDao;

    @RequestMapping("/query")
    public ModelAndView query(){

        ModelAndView modelAndView = new ModelAndView();
        List<Resume> all = resumeDao.findAll();
        modelAndView.addObject("resumes",all);
        modelAndView.setViewName("list");

        return modelAndView;
    }

    @RequestMapping("/queryOne")
    public ModelAndView queryOne(Long id){

        ModelAndView modelAndView = new ModelAndView();
        Optional<Resume> all = resumeDao.findById(id);
        modelAndView.addObject("resume",all.get());
        modelAndView.setViewName("update");

        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(Resume resume){

        resumeDao.save(resume);

        return "redirect:/resume/query";
    }

    @RequestMapping("/delete")
    public String delete(String id){

        Long idLong = Long.valueOf(id);

        resumeDao.deleteById(idLong);

        return "redirect:/resume/query";
    }

    @RequestMapping("/add")
    public String add(Resume resume){

        resumeDao.save(resume);

        return "redirect:/resume/query";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){

        String username = httpServletRequest.getParameter("username");
        String password = httpServletRequest.getParameter("password");

        if("admin".equals(username)&&"admin".equals(password)){
            httpServletRequest.getSession().setAttribute("username","admin");
            return "redirect:/resume/query";
        }else{

            return "redirect:/index.jsp";
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){

        httpServletRequest.getSession().removeAttribute("username");
        return "redirect:/index.jsp";


    }
}
