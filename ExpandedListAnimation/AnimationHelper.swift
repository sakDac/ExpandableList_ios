    //
    //  File.swift
    //  ExpandedListAnimation
    //
    //  Created by admin1 on 15/05/17.
    //  Copyright © 2017 admin1. All rights reserved.
    //

    import Foundation
    import UIKit


    class AnimationHelper {
        
     static func sakPath(view : UIView) -> UIBezierPath {
            let path = curvyZigZagAlternate(startingPoint: CGPoint(x: 0 , y: 200), endPoint: CGPoint(x: 300 , y: 200), noOfPoints: 4) //UIBezierPath()
            return path
        }
        
        
     static  func curvyZigZag(startingPoint : CGPoint , endPoint : CGPoint, noOfPoints : Int) -> UIBezierPath {
            let path = UIBezierPath()
            path.move(to: startingPoint)
        
            let distX = (startingPoint.x - endPoint.x)
            let distY = (startingPoint.y - endPoint.y)
        
            let x_2 = pow(distX, 2)
            let y_2 = pow(distY, 2)
            let sum_x_2_y_2 = x_2 + y_2
            let totalDistance = pow(sum_x_2_y_2,0.5)
            let bufferDistance = totalDistance/CGFloat(noOfPoints)
        var loopCount = 1
        while loopCount <= noOfPoints {
            let bd = (CGFloat(loopCount) * bufferDistance)
            let distanceRatio =  bd/totalDistance
            let pt_X_on_line_d_distance_away = (((1 - distanceRatio) * (startingPoint.x)) + (distanceRatio * (endPoint.x)))
            let pt_Y_on_line_d_distance_away = (((1 - distanceRatio) * (startingPoint.y)) + (distanceRatio * (endPoint.y)))
            
            let  to_CG_Point    = CGPoint(x: pt_X_on_line_d_distance_away , y: pt_Y_on_line_d_distance_away)
            let  cp_1           = CGPoint(x: pt_X_on_line_d_distance_away , y: pt_Y_on_line_d_distance_away/4)
            let  cp_2           = CGPoint(x: pt_X_on_line_d_distance_away , y: pt_Y_on_line_d_distance_away/4)

            path.addCurve(to: to_CG_Point, controlPoint1: cp_1, controlPoint2: cp_2)
            loopCount = loopCount+1
        }
        return path
        
     }
        
        
        static  func curvyZigZagAlternate(startingPoint : CGPoint , endPoint : CGPoint, noOfPoints : Int) -> UIBezierPath {
            let path = UIBezierPath()
            path.move(to: startingPoint)
            
            let distX = (startingPoint.x - endPoint.x)
            let distY = (startingPoint.y - endPoint.y)
            
            let x_2 = pow(distX, 2)
            let y_2 = pow(distY, 2)
            let sum_x_2_y_2 = x_2 + y_2
            let totalDistance = pow(sum_x_2_y_2,0.5)
            let bufferDistance = totalDistance/CGFloat(noOfPoints)
            var loopCount = 1
            while loopCount <= noOfPoints {
                let bd = (CGFloat(loopCount) * bufferDistance)
                let distanceRatio =  bd/totalDistance
                let pt_X_on_line_d_distance_away = (((1 - distanceRatio) * (startingPoint.x)) + (distanceRatio * (endPoint.x)))
                let pt_Y_on_line_d_distance_away = (((1 - distanceRatio) * (startingPoint.y)) + (distanceRatio * (endPoint.y)))
                
                let  to_CG_Point    = CGPoint(x: pt_X_on_line_d_distance_away , y: pt_Y_on_line_d_distance_away)
                
                let var_Y = loopCount % 2 == 0 ? (7*pt_Y_on_line_d_distance_away)/4 :  pt_Y_on_line_d_distance_away/4
                
                let  cp_1           = CGPoint(x: pt_X_on_line_d_distance_away , y: var_Y)
                let  cp_2           = CGPoint(x: pt_X_on_line_d_distance_away , y: var_Y)
                
                path.addCurve(to: to_CG_Point, controlPoint1: cp_1, controlPoint2: cp_2)
                loopCount = loopCount+1
            }
            return path
            
        }
        
    }





