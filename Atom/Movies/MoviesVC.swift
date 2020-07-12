//
//  MoviesVC.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import UIKit


class MoviesVC: UIViewController,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, MoviesView{    

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    
    
    var movies : [Movie] = []
    fileprivate let presenter = MoviesPresenter(moviesService: MoviesService())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.getMovies()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 3
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Navegación a detalle película
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
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
        //TODO: Mostrar Alert con error
    }
}
