//
//  CustomViewCell.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    static let identifier = "CustomViewCell"
    let imageBaseUrl = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    
    var movie:Movie? {
        didSet {
            guard let movieItem = movie else {return}
            
            guard let imageUrl = URL(string: imageBaseUrl.appending(movieItem.poster_path)) else { return }
            
            posterView.load(url: imageUrl)
            titleView.text = movieItem.title
            releasedDateView.text = "Released : \(movieItem.release_date)"
            voteAverageView.text = "Score : \(movieItem.vote_average)"
            voteCountView.text = "Total vote : \(movieItem.vote_count)"
            
            let overviewText = {
                movieItem.overview.count > 100 ? "\(movieItem.overview.prefix(100))..." : String(movieItem.overview.prefix(100))
            }()
            
            descView.text = overviewText
        }
    }
    let posterView: UIImageView = {
        let square = UIImageView()
        square.backgroundColor = UIColor.red
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
                                  height: UIScreen.screenHeight/5.5)
        
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
