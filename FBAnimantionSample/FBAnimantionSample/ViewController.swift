//
//  ViewController.swift
//  FBAnimantionSample
//
//  Created by Harsha Agarwal on 11/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let curvedView = CurvedView(frame: view.frame)
//        curvedView.backgroundColor = .yellow
//        view.addSubview(curvedView)
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap() {
        
        for _ in 0...10 {
            generateAnimatedFunction()
        }
        
    }
    
    func generateAnimatedFunction() {
        let imageView = UIImageView()
        let image = drand48() > 0.5 ? "thumbs_up" : "heart"
        imageView.image = UIImage(named: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        imageView.layer.add(animation, forKey: nil)
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.addSubview(imageView)
    }

}

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 200))
    let endPoint = CGPoint(x: 400, y: 200)
    let dimension = drand48() * 300 + 100
    let cp1 = CGPoint(x: 100, y: 100 - dimension)
    let cp2 = CGPoint(x: 200, y: 300 + dimension)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return path
}

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
}
