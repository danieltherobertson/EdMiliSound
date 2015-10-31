//
//  ViewController.swift
//  EdMiliSound
//
//  Created by Daniel Robertson on 10/10/2015.
//  Copyright © 2015 Daniel Robertson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var scrollView: UIScrollView!

    var titleText: UILabel!
    var wrongButton:UIButton!
    var toughButton:UIButton!
    var notMeButton:UIButton!
    var wrongButton2:UIButton!
    var toughButton2:UIButton!
    var notmeButton2:UIButton!
    var wrongButton3:UIButton!
    var toughButton3:UIButton!
    var notmeButton3:UIButton!
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
        
        scrollView = UIScrollView(frame: CGRectMake(0, screenHeight-150, screenWidth, 200))
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSizeMake(screenWidth*3, 135);
        
        titleText = UILabel(frame:CGRectMake(30, 40, screenWidth-60, 60))
        titleText.text = "Pocket-Miliband"
        titleText.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        titleText.textAlignment = NSTextAlignment.Center
        titleText.font = UIFont(name: "Verdana-Bold", size: 34)
        
        self.view.addSubview(titleText)
       
        //PAGE 1 BUTTONS
        
        wrongButton = layout("It's Just Wrong", xPos: 30, yPos: 0)
        scrollView.addSubview(wrongButton)
        
        toughButton = layout("Tough Enough", xPos: 30, yPos: 50)
        scrollView.addSubview(toughButton)
        
        notMeButton = layout("That's Not Me", xPos: 30, yPos: 100)
        scrollView.addSubview(notMeButton)
        
        //PAGE 2 BUTTONS
        
//        wrongButton2 = UIButton(frame:CGRectMake(screenWidth+30, 0, screenWidth-60, 35))
//        wrongButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        wrongButton2.setTitle("It's Just Wrong", forState: UIControlState.Normal)
//        wrongButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        wrongButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        wrongButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        wrongButton2.layer.cornerRadius = wrongButton.frame.height/2
//        
//        scrollView.addSubview(wrongButton2)
//        
//        toughButton2 = UIButton(frame:CGRectMake(screenWidth+30, 50, screenWidth-60, 35))
//        toughButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        toughButton2.setTitle("Tough Enough", forState: UIControlState.Normal)
//        toughButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        toughButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        toughButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        toughButton2.layer.cornerRadius = toughButton.frame.height/2
//        
//        scrollView.addSubview(toughButton2)
//        
//        notmeButton2 = UIButton(frame:CGRectMake(screenWidth+30, 100, screenWidth-60, 35))
//        notmeButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        notmeButton2.setTitle("That's Not Me", forState: UIControlState.Normal)
//        notmeButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        notmeButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        notmeButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        notmeButton2.layer.cornerRadius = notmeButton.frame.height/2
//        
//        scrollView.addSubview(notmeButton2)
//        
//        //PAGE 3 BUTTONS
//        
//        wrongButton3 = UIButton(frame:CGRectMake(screenWidth*2+30, 0, screenWidth-60, 35))
//        wrongButton3.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        wrongButton3.setTitle("It's Just Wrong", forState: UIControlState.Normal)
//        wrongButton3.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        wrongButton3.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        wrongButton3.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        wrongButton3.layer.cornerRadius = wrongButton.frame.height/2
//        
//        scrollView.addSubview(wrongButton3)
//        
//        toughButton3 = UIButton(frame:CGRectMake(screenWidth*2+30, 50, screenWidth-60, 35))
//        toughButton3.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        toughButton3.setTitle("Tough Enough", forState: UIControlState.Normal)
//        toughButton3.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        toughButton3.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        toughButton3.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        toughButton3.layer.cornerRadius = toughButton.frame.height/2
//        
//        scrollView.addSubview(toughButton3)
//        
//        notmeButton3 = UIButton(frame:CGRectMake(screenWidth*2+30, 100, screenWidth-60, 35))
//        notmeButton3.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
//        notmeButton3.setTitle("That's Not Me", forState: UIControlState.Normal)
//        notmeButton3.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
//        notmeButton3.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
//        notmeButton3.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
//        notmeButton3.layer.cornerRadius = notmeButton.frame.height/2
        
     //   scrollView.addSubview(notmeButton3)

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
    
    
    
    

    
    func playSound(sender: UIButton!) {
        switch sender {
            
        case wrongButton:
                audioPlayerWrong.play()
                animateBtn(sender as UIButton)
                
                break
            
            case toughButton:
                audioPlayerTough.play()
                animateBtn(sender as UIButton)
                
                break
            
            case notMeButton:
                audioPlayerNotMe.play()
                animateBtn(sender as UIButton)
            
            default:
                break
        }
    }
    
//    func snap(scrollPoint: Int){
//        
//        let snapPoint1 = screenWidth*2
//        let snapPoint2 = screenWidth*3
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}