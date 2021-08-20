package com.daxin.test;

import com.daxin.bean.Category;
import com.daxin.bean.News;
import com.daxin.bean.User;
import com.daxin.dao.CategoryMapper;
import com.daxin.dao.NewsMapper;
import com.daxin.dao.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.time.ZoneId;
import java.util.Date;
import java.time.LocalDateTime;
import java.util.List;


/**
 * 测试dao层的工作
 * @author W10
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    NewsMapper newsMapper;

    @Test
    public void testCRUD(){
//        categoryMapper.insertSelective(new Category(null,"体育"));

//        userMapper.insertSelective(new User(null,"han","1234569","545@qq.com","12312345645"));

       /* LocalDateTime localDateTime = LocalDateTime.now();
        Date date = Date.from( localDateTime.atZone( ZoneId.systemDefault()).toInstant());
        java.sql.Date sdate = new java.sql.Date(date.getTime());
        newsMapper.insertSelective(new News(null,"新闻标题","新闻内容",sdate,10,"中国新闻网","rrrr.jpg",1));*/

        //News news = newsMapper.selectByPrimaryKey(2);
        //User user = userMapper.selectByPrimaryKey(1);
        Category category = categoryMapper.selectByPrimaryKey(1);
        System.out.println(category);

    }
}
