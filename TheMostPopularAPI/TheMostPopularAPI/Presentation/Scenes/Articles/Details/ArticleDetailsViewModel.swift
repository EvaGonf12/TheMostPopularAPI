//
//  ArticleDetailsViewModel.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol ArticleDetailsCoordinatorDelegate: AnyObject {
    func goBack()
}

protocol ArticleDetailsViewDelegate: AnyObject {
    func setupUI()
}

class ArticleDetailsViewModel {
    
    weak var coordinatorDelegate: ArticleDetailsCoordinatorDelegate?
    weak var viewDelegate: ArticleDetailsViewDelegate?

    let link: String
    let title: String
    
    init(title: String, link: String) {
        self.title = title
        self.link = link
    }
    
    func didLoad() {
        viewDelegate?.setupUI()
    }
 
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}
