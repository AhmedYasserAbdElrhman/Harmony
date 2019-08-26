//
//  MainTableViewCell.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cellImage: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  
  func hideSperatorLines() {
    let indent_large_enought_to_hidden:CGFloat = 10000
    self.separatorInset = UIEdgeInsets(top: 0, left: indent_large_enought_to_hidden, bottom: 0, right: 0)
    self.indentationWidth = indent_large_enought_to_hidden * -1
    self.indentationLevel = 1
    
  }
}
