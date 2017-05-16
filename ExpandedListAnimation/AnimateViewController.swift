//
//  AnimateViewController.swift
//  ExpandedListAnimation
//
//  Created by admin1 on 15/05/17.
//  Copyright © 2017 admin1. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {
    
    var aniamtionIndex = -1

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var animateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.layer.addSublayer(setUp())
//        self.view.layoutIfNeeded()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let caAnim = CAKeyframeAnimation(keyPath: "position")
        caAnim.path = AnimationHelper.curvyZigZag(startingPoint: CGPoint(x: 0 , y: 200), endPoint: CGPoint(x: 300 , y: 200), noOfPoints: 2).cgPath
        caAnim.repeatCount = 2
        caAnim.duration = 5.0
        caAnim.fillMode = kCAFillModeForwards
        self.animateImage.layer.add(caAnim, forKey: "position")
    }
    
    
    func setUp() -> CAShapeLayer {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.path = AnimationHelper.sakPath(view: self.view).cgPath
        caShapeLayer.lineWidth = 2
        caShapeLayer.fillColor = UIColor.cyan.cgColor
        caShapeLayer.strokeColor = UIColor.brown.cgColor
        return caShapeLayer
    }
    
    
    
    func animateImageSak(){
        
        print("keys :: \(String(describing: self.animateImage.layer.animationKeys()))")
    }
    

    
    
    
    

}
