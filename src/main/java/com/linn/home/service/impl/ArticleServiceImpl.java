package com.linn.home.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linn.frame.util.SysContent;
import com.linn.home.dao.ArticleDao;
import com.linn.home.entity.Archive;
import com.linn.home.entity.Article;
import com.linn.home.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleDao articleDao;

    @Override
    public PageInfo selectArticleList(PageInfo page) throws Exception {
        Article article = new Article();
        article.setIsDraft(SysContent.NOTDRAFT);
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Article> articles = articleDao.selectArticleList(article);
        page = new PageInfo(articles);
        return page;
    }

    @Override
    public PageInfo selectArticleByCategoryId(int categoryId,PageInfo page) throws Exception {

        Article article = new Article();
        article.setCategoryId(categoryId);
        article.setIsDraft(SysContent.NOTDRAFT);//不是草稿
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        //紧跟着的第一个select方法会被分页
        List<Article> articles = articleDao.selectArticleByCategoryId(article);
        //用PageInfo对结果进行包装
        page = new PageInfo(articles);
        return page;
    }

    @Override
    public PageInfo selectArticleByArchiveDate(Date firstDay, Date lastDay, PageInfo page) throws Exception {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("firstDay", firstDay);
        hashMap.put("lastDay", lastDay);
        hashMap.put("isDraft", SysContent.NOTDRAFT);
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Article> articles = articleDao.selectArticleByArchiveDate(hashMap);
        //用PageInfo对结果进行包装
        page = new PageInfo(articles);
        return page;
    }

    @Override
    public Article selectArticleById(int articleId) throws Exception {

        return articleDao.selectArticleById(articleId);
    }

    @Override
    public List<Archive> selectAllArchive() throws Exception {

        return articleDao.selectAllArchive();
    }

    @Override
    public List<Article> findArticleListAdmin() throws Exception {
        return articleDao.findArticleListAdmin();
    }

    @Override
    public int addArticle(Article article) throws Exception {
        return articleDao.addArticle(article);
    }

    @Override
    public int deleteArticle(int id) throws Exception {
        return articleDao.deleteArticleById(id);
    }

    @Override
    public int updateArticle(Article article) throws Exception {
        return articleDao.updateArticle(article);
    }

    @Override
    public PageInfo selectArticleBySearch(String searchContent,PageInfo pageInfo) throws Exception {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("searchContent", searchContent);
        hashMap.put("isDraft", SysContent.NOTDRAFT);

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        List<Article>  articles= articleDao.selectArticleBySearch(hashMap);
        //用PageInfo对结果进行包装
        pageInfo = new PageInfo(articles);
        return pageInfo;
    }

}