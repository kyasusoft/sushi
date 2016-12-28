//
//  InterfaceController.swift
//  sushi WatchKit Extension
//
//  Created by kyasu on 2016/12/27.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WKCrownDelegate {
    
    @IBOutlet var textLabel1: WKInterfaceLabel!
    @IBOutlet var textLabel2: WKInterfaceLabel!
    @IBOutlet var textLabel3: WKInterfaceLabel!
    @IBOutlet var leftMarginLabel1: WKInterfaceLabel!
    @IBOutlet var leftMarginLabel2: WKInterfaceLabel!
    @IBOutlet var leftMarginLabel3: WKInterfaceLabel!
    
    var leftMargin1: CGFloat = 150.0
    var leftMargin2: CGFloat = 200.0
    var leftMargin3: CGFloat = 250.0
    
    var mark = "🍣"
    var fontSize: CGFloat = 25.0
    var speed: CGFloat = 2.0
    
    //🍣🍓
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        leftMarginLabel1.setWidth(leftMargin1)
        leftMarginLabel2.setWidth(leftMargin2)
        leftMarginLabel3.setWidth(leftMargin3)
        
        // タイマー
        let timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.moveSushi), userInfo: nil, repeats: true)
        timer.fire()
        
        // デジタルクラウン
        let sequencer = self.crownSequencer
        sequencer.delegate = self
        sequencer.focus()
        
        // 
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //MARK: -
    
    // デジタルクラウン delegate
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        //print("rotationalDelta:\(rotationalDelta) rotationsPerSecond:\(self.crownSequencer.rotationsPerSecond)")
        
        //fontSize += CGFloat(rotationalDelta) * 10.0
        //print("\(fontSize)")
        //textLabel1.setAttributedText(NSAttributedString(string: mark, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]))
        
        speed += CGFloat(rotationalDelta) * 3.0
        if speed >  12.0 { speed =  12.0 }
        if speed < -12.0 { speed = -12.0 }
        if -0.1 < speed && speed < 0.1 { speed = 0.0 }
        print("\(speed)")
    }
    
    //MARK: -
 
    func moveSushi() {
        //
        leftMargin1 -= speed
        if leftMargin1 < 0.0   { leftMargin1 = 150.0 }
        if leftMargin1 > 150.0 { leftMargin1 =   0.0 }
        leftMarginLabel1.setWidth(leftMargin1)
        
        //
        leftMargin2 -= speed
        if leftMargin2 < 0.0   { leftMargin2 = 200.0 }
        if leftMargin2 > 200.0 { leftMargin2 =   0.0 }
        leftMarginLabel2.setWidth(leftMargin2)
        
        //
        leftMargin3 -= speed
        if leftMargin3 < 0.0   { leftMargin3 = 250.0 }
        if leftMargin3 > 250.0 { leftMargin3 =   0.0 }
        leftMarginLabel3.setWidth(leftMargin3)
    }

    func setMark() {
        textLabel1.setText(mark)
        textLabel2.setText(mark)
        textLabel3.setText(mark)
    }
    
    // MARK: - Action
    
    @IBAction func sushi() {
        mark = "🍣"
        setMark()
    }
    
    @IBAction func ichigo() {
        mark = "🍓"
        setMark()
    }
}
