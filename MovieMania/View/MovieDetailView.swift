//
//  MovieDetailView.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 11/07/21.
//

import UIKit

class MovieDetailView: UIViewController {
    
    let imageBaseUrl = "https://www.themoviedb.org/t/p/w440_and_h660_face"
    
    var movie:Movie? {
        didSet{
            guard let movieItem = movie else {return}
            guard let imageUrl = URL(string: imageBaseUrl.appending(movieItem.poster_path)) else { return }
            guard let imageUrl2 = URL(string: imageBaseUrl.appending(movieItem.backdrop_path)) else { return }
            
            posterView.load(url: imageUrl)
            poster2View.load(url: imageUrl2)
            
            titleView.text = movieItem.title
            descView.text = movieItem.overview
            voteAverageView.text = "Rate : \(movieItem.vote_average)"
            voteCountView.text = "Total votes : \(movieItem.vote_count)"
            releasedDateView.text = "Released : \(movieItem.release_date)"
            originalLangView.text = "Language : \(movieItem.original_language)"
            popularityView.text = "Popularity : \(movieItem.popularity)"
        }
    }
    
    let backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.white
        
        return background
    }()

    let posterView: UIImageView = {
        let poster = UIImageView()
        poster.backgroundColor = UIColor.white
        poster.layer.cornerRadius = 10
        
        return poster
    }()
    
    let poster2View: UIImageView = {
        let poster2 = UIImageView()
        poster2.backgroundColor = UIColor.white
        poster2.layer.cornerRadius = 10
        
        return poster2
    }()
    
    let titleView: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.font = .systemFont(ofSize: 25, weight: .bold)
        
        return title
    }()
    
    let descView: UILabel = {
        let desc = UILabel()
        desc.font = .systemFont(ofSize: 16, weight: .thin)
        desc.numberOfLines = 0
        desc.lineBreakMode = .byWordWrapping
        
        return desc
    }()
    
    let voteAverageView: UILabel = {
        let average = UILabel()
        average.font = .systemFont(ofSize: 15, weight: .light)
        
        return average
    }()
    
    let voteCountView: UILabel = {
        let count = UILabel()
        count.font = .systemFont(ofSize: 15, weight: .light)
        
        return count
    }()
    
    let releasedDateView: UILabel = {
        let released = UILabel()
        released.font = .systemFont(ofSize: 15, weight: .light)
        
        return released
    }()
    
    let originalLangView: UILabel = {
        let language = UILabel()
        language.font = .systemFont(ofSize: 15, weight: .light)
        
        return language
    }()
    
    let popularityView: UILabel = {
        let popularity = UILabel()
        popularity.font = .systemFont(ofSize: 15, weight: .light)
        
        return popularity
    }()
    
    let overview: UILabel = {
        let popularity = UILabel()
        popularity.font = .systemFont(ofSize: 15, weight: .medium)
        popularity.text = "Overview : "
        
        return popularity
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.frame = UIScreen.main.bounds
        
        posterView.frame = CGRect(x: 10,
                                  y: 50,
                                  width: UIScreen.screenWidth/3,
                                  height: (UIScreen.screenWidth/3)*1.5)
        
        poster2View.frame = CGRect(x: 10,
                                  y: 60 + posterView.frame.height,
                                  width: UIScreen.screenWidth/3,
                                  height: (UIScreen.screenWidth/3)*1.5)
        
        titleView.frame = CGRect(x: 20 + posterView.frame.width,
                                 y: 55,
                                 width: UIScreen.screenWidth - posterView.frame.width - 30,
                                 height: 10)
        titleView.sizeToFit()
        
        voteAverageView.frame = CGRect(x: 20 + posterView.frame.width,
                                       y: 65 + titleView.frame.height,
                                       width: UIScreen.screenWidth - posterView.frame.width - 30,
                                       height: 10)
        voteAverageView.sizeToFit()
        
        voteCountView.frame = CGRect(x: 20 + posterView.frame.width,
                                     y: 67 + titleView.frame.height + voteAverageView.frame.height,
                                     width: UIScreen.screenWidth - posterView.frame.width - 30,
                                     height: 10)
        voteCountView.sizeToFit()
        
        releasedDateView.frame = CGRect(x: 20 + posterView.frame.width,
                                        y: 69 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height,
                                        width: UIScreen.screenWidth - posterView.frame.width - 30,
                                        height: 10)
        releasedDateView.sizeToFit()
        
        popularityView.frame = CGRect(x: 20 + posterView.frame.width,
                                      y: 71 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height + releasedDateView.frame.height,
                                        width: UIScreen.screenWidth - posterView.frame.width - 30,
                                        height: 10)
        popularityView.sizeToFit()
        
        originalLangView.frame = CGRect(x: 20 + posterView.frame.width,
                                        y: 73 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height + releasedDateView.frame.height + popularityView.frame.height,
                                        width: UIScreen.screenWidth - posterView.frame.width - 30,
                                        height: 10)
        originalLangView.sizeToFit()
        
        overview.frame = CGRect(x: 20 + posterView.frame.width,
                                y: 85 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height + releasedDateView.frame.height + popularityView.frame.height + originalLangView.frame.height,
                                width: UIScreen.screenWidth - posterView.frame.width - 30,
                                height: 10)
        overview.sizeToFit()
        
        descView.frame = CGRect(x: 20 + posterView.frame.width,
                                y: 87 + titleView.frame.height + voteAverageView.frame.height + voteCountView.frame.height + releasedDateView.frame.height + popularityView.frame.height + originalLangView.frame.height + overview.frame.height,
                                width: UIScreen.screenWidth - posterView.frame.width - 40,
                                height: 10)
        descView.sizeToFit()
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(posterView)
        self.view.addSubview(poster2View)
        self.view.addSubview(titleView)
        self.view.addSubview(descView)
        self.view.addSubview(voteAverageView)
        self.view.addSubview(voteCountView)
        self.view.addSubview(releasedDateView)
        self.view.addSubview(popularityView)
        self.view.addSubview(originalLangView)
        self.view.addSubview(overview)
    }
}
