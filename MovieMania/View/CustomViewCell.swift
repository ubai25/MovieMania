//
//  CustomViewCell.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    static let identifier = "CustomViewCell"
    let apiConnection = APIConnection()
    
    var movie:MovieRealm? {
        didSet {
            guard let movieItem = movie else {return}
            
            posterView.image = UIImage(data: movieItem.poster_path! as Data)
            print("height : \(posterView.frame.height)")
            titleView.text = movieItem.title
            releasedDateView.text = "Released : \(movieItem.release_date)"
            voteAverageView.text = "Score : \(movieItem.vote_average)"
            voteCountView.text = "Total vote : \(movieItem.vote_count)"
            
            let max: Int = 80 - movieItem.title.count
            
            let overviewText = {
                movieItem.overview.count > max ? "\(movieItem.overview.prefix(max))..." : movieItem.overview
            }()
            
            descView.text = overviewText
        }
    }
    let posterView: UIImageView = {
        let square = UIImageView()
        square.backgroundColor = UIColor.white
        square.layer.cornerRadius = 10
        
        return square
    }()
    
    let titleView: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.font = .systemFont(ofSize: 19, weight: .bold)
        
        return title
    }()

    let voteAverageView: UILabel = {
        let average = UILabel()
        average.font = .systemFont(ofSize: 13, weight: .thin)
        
        return average
    }()
    
    let voteCountView: UILabel = {
        let count = UILabel()
        count.font = .systemFont(ofSize: 13, weight: .thin)
        
        return count
    }()
    
    let releasedDateView: UILabel = {
        let released = UILabel()
        released.font = .systemFont(ofSize: 13, weight: .thin)
        
        return released
    }()
    
    let descView: UILabel = {
        let decs = UILabel()
        decs.numberOfLines = 0
        decs.lineBreakMode = .byWordWrapping
        decs.font = .systemFont(ofSize: 14, weight: .ultraLight)
        
        return decs
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterView)
        contentView.addSubview(titleView)
        contentView.addSubview(releasedDateView)
        contentView.addSubview(voteAverageView)
        contentView.addSubview(voteCountView)
        contentView.addSubview(descView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterView.frame = CGRect(x: 10,
                                  y: 10,
                                  width: UIScreen.screenWidth/4,
                                  height: (UIScreen.screenWidth/4)*1.5)
        
        titleView.frame = CGRect(x: 20 + posterView.frame.width,
                                 y: 10,
                                 width: UIScreen.screenWidth - posterView.frame.width - 30,
                                 height: posterView.frame.height/4)
        titleView.sizeToFit()
        
        voteAverageView.frame = CGRect(x: 20 + posterView.frame.width,
                                       y: 13 + titleView.frame.height,
                                       width: UIScreen.screenWidth - posterView.frame.width - 30,
                                       height: 10)
        voteAverageView.sizeToFit()
        
        voteCountView.frame = CGRect(x: 20 + posterView.frame.width,
                                     y: 13 + titleView.frame.height + voteAverageView.frame.height,
                                width: UIScreen.screenWidth - posterView.frame.width - 30,
                                height: 10)
        voteCountView.sizeToFit()
        
        releasedDateView.frame = CGRect(x: 20 + posterView.frame.width,
                                        y: 13 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height,
                                width: UIScreen.screenWidth - posterView.frame.width - 30,
                                height: 10)
        releasedDateView.sizeToFit()
        
        descView.frame = CGRect(x: 20 + posterView.frame.width,
                                y: 20 + titleView.frame.height + releasedDateView.frame.height + voteAverageView.frame.height + voteCountView.frame.height,
                                width: UIScreen.screenWidth - posterView.frame.width - 30,
                                height: 10)
        descView.sizeToFit()
    }
    
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
