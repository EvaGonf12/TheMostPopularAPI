//
//  FilterViewModel.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation
import RxSwift

protocol FilterCoordinatorDelegate: AnyObject {
    func applyFilters(_ filters: FiltersSelected)
}

protocol FilterViewDelegate: AnyObject {
    func setupUI()
}

class FilterViewModel {
    
    weak var coordinatorDelegate: FilterCoordinatorDelegate?
    weak var viewDelegate: FilterViewDelegate?
    var types: [ArticleType]
    var intervals: [ArticlesInterval]
    
    init() {
        self.types = ArticleType.allCases
        self.intervals = ArticlesInterval.allCases
    }
    
    func didLoad() {
        viewDelegate?.setupUI()
    }
    
    func applyFilter(type: ArticleType, interval: ArticlesInterval, articleSource: [MostSharedSource]) {
        let filters = FiltersSelected(articleType: type, interval: interval, mostSharedSource: articleSource)
        coordinatorDelegate?.applyFilters(filters)
    }
}
