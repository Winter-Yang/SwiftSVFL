//
//  ViewController.swift
//  KeyBoardSwift
//
//  Created by 杨雯德 on 15/10/27.
//  Copyright © 2015年 杨雯德. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var faceView:YQMessageFaceView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.faceView = YQMessageFaceView(frame:CGRect.init(x: 0, y: 0, width: CGRectGetWidth(self.view.bounds)*3, height: 196) )
        self.view.addSubview(self.faceView)
        self.faceView.backgroundColor = UIColor.brownColor()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

