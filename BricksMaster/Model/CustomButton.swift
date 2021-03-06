//
//  CustomButton.swift
//  DataModel
//
//  Created by Вячеслав Казаков on 14.01.2019.
//  Copyright © 2019 Вячеслав Казаков. All rights reserved.
//

import Foundation
import UIKit

enum CustomButtonAction {
    case nextBank
    case disableAllBricks
}

class CustomButton: NSObject {
    var longTapAction: CustomButtonAction = .nextBank
    var shortTapAction: CustomButtonAction = .disableAllBricks
    
    var longTapTimeout: TimeInterval = 2.0
    var pendedAction: Bool = false
    var tapTime: TimeInterval?
    var longTapOccures: Bool = false
    
    func startPendedAction() {
        pendedAction = true
        perform(#selector(longTapOccured), with: self, afterDelay: longTapTimeout)
    }
    
    func tap() {
        print("5 Button tap")
    }
    
    func longTap() {
        print("5 Button LOOOONG tap")
    }
    
    @objc func longTapOccured() {
        longTapOccures = true
        longTap()
        perform(#selector(longTapOccured), with: self, afterDelay: longTapTimeout)
    }
    
    func finishPendedAction() {
        pendedAction = false
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        if !longTapOccures {
            tap()
        } else {
            
        }
    }
}
