package com.linn.home.service;

import com.linn.home.entity.Archive;
import com.linn.home.entity.Article;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface ArticleService {

    List<Article> selectArticleByCategoryId(int categoryId) throws Exception;

    List<Article> selectArticleByArchiveDate(HashMap<String,Date> hashMap) throws Exception;

    Article selectArticleById(int articleId) throws Exception;

    List<Archive> selectAllArchive() throws Exception;
}