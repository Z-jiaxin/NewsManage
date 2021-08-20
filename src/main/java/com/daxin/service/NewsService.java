package com.daxin.service;

import com.daxin.bean.News;
import com.daxin.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    NewsMapper newsMapper;

    /**
     * 保存新闻
     * @param news
     */
    public void saveNews(News news){
        newsMapper.insertSelective(news);
    }

    /**
     * 获取新闻列表
     */
    public List getNews() {
        List<News> news = newsMapper.selectByExampleWithCategory(null);
        return news;
    }

    /**
     * 删除指定新闻
     * @param id
     */
    public void deleteNews(Integer id) {
        newsMapper.deleteByPrimaryKey(id);
    }

    /**
     * 获取指定的新闻
     * @param id
     */
    public News getNewsById(Integer id) {
        News news = newsMapper.selectByPrimaryKeyWithCategory(id);
        return news;
    }

    /**
     * 更新新闻
     * @param news
     */
    public void updateNews(News news) {
        newsMapper.updateByPrimaryKeySelective(news);
    }
}
