//
//  MyFavPlacesViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/30/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MyFavPlacesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Fav Places Cell", for: indexPath)
    return cell
    
  }
  
  



}
