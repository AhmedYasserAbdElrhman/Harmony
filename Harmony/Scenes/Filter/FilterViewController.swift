//
//  FilterViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  private let sliderTextLabel = UILabel()
  @IBAction func sliderMoving(_ sender: Any) {
    sliderTextLabel.text = "\(sliderBar.value)"
    self.view.addSubview(sliderTextLabel)
    sliderTextLabel.frame = sliderBar.frame
  }
  @IBOutlet weak var sliderBar: UISlider!
  override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  @IBAction func cancelFilterButtonTapped(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("HideFilterMenu"), object: nil)
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
