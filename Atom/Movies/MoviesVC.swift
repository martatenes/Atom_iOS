//
//  MoviesVC.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import UIKit


class MoviesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MoviesView{
   
    

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    
    
    var movies : [Movie] = []
    fileprivate let presenter = MoviesPresenter(moviesService: MoviesService())
    let reuseIdentifier = "MovieCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier,bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        presenter.getMovies()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
        cell.setContent(movie: movies[indexPath.row])
        return cell;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func startLoading() {
        spinner.startAnimating()
    }
    
    func stopLoading() {
        spinner.stopAnimating()
    }
    
    func setMovies(movies: [Movie]?) {
        if (movies != nil){
            self.movies.removeAll()
            self.movies = movies!;
        }
        
        self.collectionView?.reloadData()
    }
    
    func showError() {
        
    }
}
