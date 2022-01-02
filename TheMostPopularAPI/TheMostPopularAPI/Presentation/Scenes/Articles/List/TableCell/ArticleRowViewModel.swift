//
//  ArticleRowViewModel.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

class ArticleRowViewModel {
    
    let image: String
    let title: String
    let author: String
    let date: String
    let section: String
    
    init(article: Article) {
        self.image = article.image
        self.title = article.title
        self.author = article.author
        self.date = article.date
        self.section = article.section
    }

}
