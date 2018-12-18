//
//  FirstViewController.swift
//  PhotoFrame
//
//  Created by 윤동민 on 17/12/2018.
//  Copyright © 2018 윤동민. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var firstDescription: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(#file, #line, #function, #column)
        self.firstLabel.text = "저스틴의 사진액자"
        self.firstLabel.textColor = UIColor.gray
        self.firstLabel.shadowColor = UIColor.black
        self.firstDescription.text = "첫번째 사진앨범"
        self.firstDescription.textColor = UIColor.gray
        self.firstDescription.shadowColor = UIColor.black
        self.firstLabel.font = self.firstLabel.font.withSize(40.0)
        self.firstDescription.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.firstDescription.font = UIFont.italicSystemFont(ofSize: 16.0)
    }
}

