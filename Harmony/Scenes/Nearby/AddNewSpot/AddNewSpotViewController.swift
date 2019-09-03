//
//  AddNewSpotViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/3/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class AddNewSpotViewController: UIViewController {

  @IBOutlet weak var coverButton: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func addCoverButton(_ sender: UIButton) {
    ImagePickerManager().pickImage(self) { image in
      self.coverButton.setImage(image, for: .normal)
    }
  }
  
}
