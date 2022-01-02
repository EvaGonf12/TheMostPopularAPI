//
//  ArticleTableViewCell.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 2/1/22.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var authorCell: UILabel!
    @IBOutlet weak var sectionCell: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    
    var viewModel: ArticleRowViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            self.titleCell?.text = viewModel.title
            self.authorCell?.text = viewModel.author
            self.sectionCell?.text = viewModel.section
            self.dateCell?.text = viewModel.date
            
            if let url = URL(string: viewModel.image) {
                self.imageCell?.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.5)),
                        .cacheOriginalImage
                    ])
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    func setUp() {
        imageCell.layer.cornerRadius = 8.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
