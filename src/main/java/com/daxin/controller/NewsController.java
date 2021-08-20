package com.daxin.controller;

import com.daxin.bean.Msg;
import com.daxin.bean.News;
import com.daxin.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.time.DateTimeException;
import java.util.List;

@Controller
public class NewsController {

    @Autowired
    NewsService newsService;

    /**
     * 跳转到新闻详情页
     */
    @RequestMapping("/toNewsDetail/{id}")
    public String toNewsDetail(@PathVariable(value = "id")Integer id,Model model){
        News news = newsService.getNewsById(id);
        model.addAttribute("news",news);
        return "newsDetail";
    }

    /**
     * 更新新闻
     */
    @RequestMapping("/updateNews/{id}")
    public String updateNews(News news,Model model){
        newsService.updateNews(news);
        System.out.println(news);
        model.addAttribute("news",news);
        return "newsDetail";
    }


    /**
     * 跳转到修改界面
     */
    @RequestMapping("/toNewsUpdate/{id}")
    public String toNewsUpdate(@PathVariable(value = "id") Integer id,Model model) throws ParseException {
        News news = newsService.getNewsById(id);
        Timestamp date = new Timestamp(news.getIssuetime().getTime());
        news.setIssuetime(date);
        model.addAttribute("news",news);
        return "newsUpdate";
    }

    /**
     * 删除数据
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/deleteNews/{id}",method = RequestMethod.DELETE)
    public Msg deleteNews(@PathVariable(value = "id") Integer id){
        newsService.deleteNews(id);
        return Msg.success();
    }

    /**
     * 保存数据
     * @param news
     * @param model
     * @return
     */
    @RequestMapping("/saveNews")
    public String saveNews(News news,Model model){
        newsService.saveNews(news);
        model.addAttribute("news",news);
        return "newsDetail";
    }

    /**
     * 跳转到添加页面
     */
    @RequestMapping("/toNewsAdd")
    public String toNewsAdd(){
        return "newsAdd";
    }

    /**
     * 获取新闻列表
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/newsList/{pn}")
    public String getNews(@PathVariable(value = "pn")Integer pn, Model model){
        //引入PageHelper分页插件
        //在查询之前只需要调用,，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是一个分页查询
        List news = newsService.getNews();
        //使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据
        PageInfo pageInfo = new PageInfo(news,5);
        model.addAttribute("pageInfo",pageInfo);
        return "newsList";
    }
}
