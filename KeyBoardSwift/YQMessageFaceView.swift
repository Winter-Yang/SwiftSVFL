//
//  YQMessageFaceView.swift
//  KeyBoardSwift
//
//  Created by 杨雯德 on 15/10/27.
//  Copyright © 2015年 杨雯德. All rights reserved.
//

import UIKit

typealias YQFaceItemDidSelect = (String!) ->Void

class YQMessageFaceView: UIView {

    var pageOnelastView:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }

    // 两边边缘间隔
    let EdgeDistance:CGFloat = 20.0
    // 上下边缘间隔
    let EdgeInterVal:CGFloat = 15
    // 表情视图大小
    let FaceWidth:CGFloat = 24
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    let number:Int! = 70
    func setUI(){
        for var i = 0;i<number;i++ {
            print(i)
            let expressionButton:UIButton! = UIButton(type:UIButtonType.Custom)
            self.addSubview(expressionButton)
            expressionButton.translatesAutoresizingMaskIntoConstraints = false
            let imageStr:String = "Expression_\(i+1).png"
            expressionButton.setImage(UIImage.init(named: imageStr), forState: UIControlState.Normal)
            expressionButton.tag = i+1
            expressionButton.frame = CGRect.init(x: 20, y:30*i, width: 30, height: 30)
            //表情上下间距
            let verticalInterval:CGFloat = (CGRectGetHeight(self.bounds) - 3*FaceWidth-EdgeInterVal*2)/3;
            //表情左右间距
            let horizontalInterval:CGFloat = (CGRectGetWidth(self.bounds)/3-8*FaceWidth-EdgeDistance*2)/7;
            //每一页第一个表情距离父视图左距离
            let leftdistance = Float(20.0) + Float(CGRectGetWidth(self.bounds))/3.0  * Float((i/24))
            if ( pageOnelastView != nil && i%8 != 0)
            {
                //设置每一横排表情的位置
                //设置横坐标和宽度
                let views = ["pageOnelastView":pageOnelastView,"expressionButton":expressionButton]
                let constraints1 = NSLayoutConstraint.constraintsWithVisualFormat("H:[pageOnelastView]-(\(horizontalInterval))-[expressionButton(\(FaceWidth))]", options: NSLayoutFormatOptions(), metrics: nil, views: views)
                let views1 = ["pageOnelastView":pageOnelastView,"expressionButton":expressionButton]
                let constraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:[pageOnelastView]-(-\(FaceWidth))-[expressionButton(\(FaceWidth))]", options: NSLayoutFormatOptions(), metrics: nil, views: views1)
                self.addConstraints(constraints1)
                self.addConstraints(constraints2)
            }else {
                //设置第一竖排表情的位置
                //设置横坐标和宽度
                let views1 = ["expressionButton":expressionButton]
                let constraints1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(leftdistance)-[expressionButton(\(FaceWidth))]", options: NSLayoutFormatOptions(), metrics: nil, views: views1)
                var bindView:String
                var vertical:CGFloat
                var views2:[String : AnyObject]
                if pageOnelastView != nil{
                    bindView = "[pageOnelastView]"
                    vertical = verticalInterval
                    views2 = ["expressionButton":expressionButton,"pageOnelastView":pageOnelastView]
                }else{
                    bindView = "|"
                    vertical = EdgeInterVal
                    views2 = ["expressionButton":expressionButton]
                }
                let constraints2 = NSLayoutConstraint.constraintsWithVisualFormat("V:\(bindView)-(\(vertical))-[expressionButton(\(FaceWidth))]", options: NSLayoutFormatOptions(), metrics: nil, views: views2)
                self.addConstraints(constraints1)
                self.addConstraints(constraints2)
            }
            
            //每一页显示24个  每一页重新开始标识视图
            if ((i+1)%24 == 0) {
                pageOnelastView = nil;
            }else{
                pageOnelastView = expressionButton;
            }
 
        }
        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
