//
//  ViewController.swift
//  PageView
//
//  Created by Sannala on 24/10/16.
//  Copyright © 2016 Sannala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView:UICollectionView!
    var page: UIPageControl!
    var imagesArray: [String]?
    var image = UIImageView()
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesArray = ["1.jpg", "10.jpg", "11.jpg"]
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        collectionView = UICollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.view.frame.size.width, height: 210), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(
            UINib(nibName: "CellViewCollectionViewCell",
                  bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        
        self.view.addSubview(collectionView)
        
        page = UIPageControl(frame: CGRect(
            x: self.view.frame.size.width / 2 - 25,
            y: self.collectionView.frame.size.height - 50, width:50 , height: 50))
        page.currentPage = 0
        page.tintColor = UIColor.red
        page.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
        page.currentPageIndicatorTintColor = UIColor.white
        self.page.numberOfPages = (imagesArray?.count)!
        self.view.addSubview(page)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imagesArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CellViewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellViewCollectionViewCell
        index = indexPath.row
        
        cell.ceImage.image = UIImage(named: (imagesArray?[indexPath.row])!)
        cell.backgroundColor = UIColor.orange
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width + 0.5);
        page.currentPage = currentIndex
        
        
    }
    
    
}

