
import Foundation
import UIKit

enum ArticleType: String, CaseIterable {
    case mostemailed, mostshared, mostviewed
}

enum ArticlesInterval: String, CaseIterable {
    case day = "1"
    case days7 = "7"
    case days30 = "30"
}

enum MostSharedSource: String, CaseIterable {
    case facebook, twitter
}

struct FiltersSelected {

    let articleType: ArticleType
    let interval: ArticlesInterval
    let mostSharedSource: [MostSharedSource]?

    internal init(articleType: ArticleType,
                  interval: ArticlesInterval,
                  mostSharedSource: [MostSharedSource]? = nil) {
        
        self.articleType = articleType
        self.interval = interval
        self.mostSharedSource = mostSharedSource
    }
}
