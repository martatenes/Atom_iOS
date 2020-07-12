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

    var urlImages = UserDefaults.standard.string(forKey: "BASE_URL")
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setContent(movie: Movie){
        title.text = movie.title
        if (urlImages != nil){
            self.thumbnail.imageFromUrl(urlString: urlImages! +  movie.backdrop_path)
        }
        else{
            self.thumbnail.image = UIImage(named: "imgPlaceholder")
        }
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
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
