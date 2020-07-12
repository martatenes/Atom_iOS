//
//  MovieCell.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell{
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setContent(movie: Movie){
        if let titleMovie = movie.title{
            title.text = titleMovie
        }
        if let imageMovie = movie.backdrop_path{
       
            self.thumbnail.imageFromUrl(movieUrl: imageMovie)
        }
        else{
            self.thumbnail.image = UIImage(named: "imgPlaceholder")
        
        }
    }
}

extension UIImageView {
    public func imageFromUrl(movieUrl: String) {
        if let baseUrl = UserDefaults.standard.string(forKey: "BASE_URL") {
        let urlString = baseUrl + "w780" + movieUrl
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {
                (response: URLResponse?, data: Data?, error: Error?) -> Void in
                if let imageData = data as Data? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
        }
    }
}
