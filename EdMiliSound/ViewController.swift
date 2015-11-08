//
//  ViewController.swift
//  EdMiliSound
//
//  Created by Daniel Robertson on 10/10/2015.
//  Copyright © 2015 Daniel Robertson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate{
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var scrollView: UIScrollView!

    var titleText: UILabel!
    
    var wrongButton:UIButton!, wrongButton2:UIButton!, wrongButton3:UIButton!
    var toughButton:UIButton!, toughButton2:UIButton!, toughButton3:UIButton!
    var notMeButton:UIButton!, notMeButton2:UIButton!, notMeButton3:UIButton!

    var background:UIImageView!
    
    var toughSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("toughEnough", ofType: "mp3")!)
    var wrongSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("itsJustWrong", ofType: "mp3")!)
    var notMeSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("thatsNotMe", ofType: "mp3")!)
    var toughSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("toughEnough", ofType: "mp3")!)
    var wrongSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("itsJustWrong", ofType: "mp3")!)
    var notMeSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("thatsNotMe", ofType: "mp3")!)
    var toughSound3 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("toughEnough", ofType: "mp3")!)
    var wrongSound3 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("itsJustWrong", ofType: "mp3")!)
    var notMeSound3 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("thatsNotMe", ofType: "mp3")!)
    
    var audioPlayerTough = AVAudioPlayer()
    var audioPlayerWrong = AVAudioPlayer()
    var audioPlayerNotMe = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        background = UIImageView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
        background.image = UIImage(named: "edbg.jpg")
        background.backgroundColor = UIColor.purpleColor()
        
        self.view.addSubview(background)
        
        scrollView = UIScrollView(frame: CGRectMake(0, screenHeight-175, screenWidth, 200))
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSizeMake(screenWidth*3, 135);
        
        titleText = UILabel(frame:CGRectMake(30, 40, screenWidth-60, 60))
        titleText.text = "Pocket-Miliband"
        titleText.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        titleText.textAlignment = NSTextAlignment.Center
        titleText.font = UIFont(name: "Verdana-Bold", size: 34)
        
        self.view.addSubview(titleText)
       
        //PAGE 1 BUTTONS
        
        wrongButton = layout("It's Just Wrong", xPos: 30, yPos: 25)
        scrollView.addSubview(wrongButton)
        
        toughButton = layout("Tough Enough", xPos: 30, yPos: 75)
        scrollView.addSubview(toughButton)
        
        notMeButton = layout("That's Not Me", xPos: 30, yPos: 125)
        scrollView.addSubview(notMeButton)
        
        //PAGE 2 BUTTONS
        
        wrongButton2 = layout("It's Just Wrong", xPos: screenWidth+30, yPos: 25)
        scrollView.addSubview(wrongButton2)
        
        toughButton2 = layout("Tough Enough", xPos: screenWidth+30, yPos: 75)
        scrollView.addSubview(toughButton2)
        
        notMeButton2 = layout("That's Not Me", xPos: screenWidth+30, yPos: 125)
        scrollView.addSubview(notMeButton2)
        
        //PAGE 3 BUTTONS
        
        wrongButton3 = layout("It's Just Wrong", xPos: screenWidth*2+30, yPos: 25)
        scrollView.addSubview(wrongButton3)
        
        toughButton3 = layout("Tough Enough", xPos: screenWidth*2+30, yPos: 75)
        scrollView.addSubview(toughButton3)
        
        notMeButton3 = layout("That's Not Me", xPos: screenWidth*2+30, yPos: 125)
        scrollView.addSubview(notMeButton3)


        audioPlayerTough = try! AVAudioPlayer(contentsOfURL: toughSound)
        audioPlayerWrong = try! AVAudioPlayer(contentsOfURL: wrongSound)
        audioPlayerNotMe = try! AVAudioPlayer(contentsOfURL: notMeSound)
     }
    
    func layout(title: String, xPos: CGFloat, yPos: CGFloat) -> UIButton {

        let button = UIButton(frame:CGRectMake(xPos, yPos, screenWidth-60, 35))

        button.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        button.setTitle(title, forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        button.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        button.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        button.layer.cornerRadius = button.frame.height/2
    
        return button
    }
    
//    func scroll(){
//     
//        if scrollView.scrollEnabled {
//            
//        }
//    }
    
    func playSound(sender: UIButton!) {
        switch sender {
            
        case wrongButton, wrongButton2, wrongButton3:
                audioPlayerWrong.play()
                animateBtn(sender as UIButton)
                
                break
            
            case toughButton, toughButton2, toughButton3:
                audioPlayerTough.play()
                animateBtn(sender as UIButton)
                
                break
            
            case notMeButton, notMeButton2, notMeButton3:
                audioPlayerNotMe.play()
                animateBtn(sender as UIButton)
            
            default:
                break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}