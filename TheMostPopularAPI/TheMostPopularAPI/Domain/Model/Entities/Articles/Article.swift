//
//  Article.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import Foundation

struct Article {
    
    let image: String
    let url: String
    let title: String
    let author: String
    let date: String
    let section: String
    
    init(from response: ArticlesAPIResult) {
        self.image = response.media.filter { $0.type?.rawValue ?? "" == "image" }.first?.mediaMetadata.first?.url ?? ""
        self.url = response.url ?? ""
        self.title = response.title ?? "-"
        self.author = response.byline ?? "-"
        self.date = response.publishedDate ?? "-"
        self.section = response.section ?? "-"
    }
    
    init(image: String,
         url: String,
         title: String,
         author: String,
         date: String,
         section: String) {
        
        self.image = image
        self.url = url
        self.title = title
        self.author = author
        self.date = date
        self.section = section
    }
    
}

extension Article {
    static let mockURLFail = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "http://asdad.com",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock2 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock3 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock4 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock5 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock6 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mock7 = Article(image: "https://static01.nyt.com/images/2021/12/30/science/00-omicron-biology1/00-omicron-biology1-thumbStandard.jpg",
                               url: "https://www.nytimes.com/2021/12/31/health/covid-omicron-lung-cells.html",
                               title: "Studies Suggest Why Omicron Is Less Severe: It Spares the Lungs",
                               author: "By Carl Zimmer and Azeen Ghorayshi",
                               date: "2021-12-31",
                               section: "Health")
    
    static let mockList = [mockURLFail, mock2, mock3, mock4, mock5, mock6, mock7]
}
