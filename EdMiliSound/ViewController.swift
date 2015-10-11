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
    var notmeButton:UIButton!
    var wrongButton2:UIButton!
    var toughButton2:UIButton!
    var notmeButton2:UIButton!
    var background:UIImageView!
    
    var toughSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("toughEnough", ofType: "mp3")!)
    var wrongSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("itsJustWrong", ofType: "mp3")!)
    var notMeSound = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("thatsNotMe", ofType: "mp3")!)
    var toughSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("toughEnough", ofType: "mp3")!)
    var wrongSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("itsJustWrong", ofType: "mp3")!)
    var notMeSound2 = NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("thatsNotMe", ofType: "mp3")!)
    
    var audioPlayerTough = AVAudioPlayer()
    var audioPlayerWrong = AVAudioPlayer()
    var audioPlayerNotMe = AVAudioPlayer()
    var audioPlayerTough2 = AVAudioPlayer()
    var audioPlayerWrong2 = AVAudioPlayer()
    var audioPlayerNotMe2 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        background = UIImageView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
        background.image = UIImage(named: "edbg.jpg")
        background.backgroundColor = UIColor.purpleColor()
        
        self.view.addSubview(background)
        
        scrollView = UIScrollView(frame: CGRectMake(0, screenHeight-135, screenWidth, 200))
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSizeMake(screenWidth*2, 135);
        
        titleText = UILabel(frame:CGRectMake(30, 40, screenWidth-60, 60))
        titleText.text = "Pocket-Miliband"
        titleText.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        titleText.textAlignment = NSTextAlignment.Center
        titleText.font = UIFont(name: "Verdana-Bold", size: 34)
        
        self.view.addSubview(titleText)
        
        wrongButton = UIButton(frame:CGRectMake(30, 0, screenWidth-60, 30))
        wrongButton.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        wrongButton.setTitle("It's Just Wrong", forState: UIControlState.Normal)
        wrongButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        wrongButton.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        wrongButton.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        wrongButton.layer.cornerRadius = wrongButton.frame.height/2

       scrollView.addSubview(wrongButton)
        
        toughButton = UIButton(frame:CGRectMake(30, 45, screenWidth-60, 30))
        toughButton.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        toughButton.setTitle("Tough Enough", forState: UIControlState.Normal)
        toughButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        toughButton.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        toughButton.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        toughButton.layer.cornerRadius = toughButton.frame.height/2

        scrollView.addSubview(toughButton)
        
        notmeButton = UIButton(frame:CGRectMake(30, 90, screenWidth-60, 30))
        notmeButton.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        notmeButton.setTitle("That's Not Me", forState: UIControlState.Normal)
        notmeButton.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        notmeButton.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        notmeButton.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        notmeButton.layer.cornerRadius = notmeButton.frame.height/2
        
        scrollView.addSubview(notmeButton)
        
        wrongButton2 = UIButton(frame:CGRectMake(screenWidth+30, 0, screenWidth-60, 30))
        wrongButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        wrongButton2.setTitle("It's Just Wrong", forState: UIControlState.Normal)
        wrongButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        wrongButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        wrongButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        wrongButton2.layer.cornerRadius = wrongButton.frame.height/2
        
        scrollView.addSubview(wrongButton2)
        
        toughButton2 = UIButton(frame:CGRectMake(screenWidth+30, 45, screenWidth-60, 30))
        toughButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        toughButton2.setTitle("Tough Enough", forState: UIControlState.Normal)
        toughButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        toughButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        toughButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        toughButton2.layer.cornerRadius = toughButton.frame.height/2
        
        scrollView.addSubview(toughButton2)
        
        notmeButton2 = UIButton(frame:CGRectMake(screenWidth+30, 90, screenWidth-60, 30))
        notmeButton2.backgroundColor = UIColor(red: 238/255, green: 38/255, blue: 34/255, alpha: 1.0)
        notmeButton2.setTitle("That's Not Me", forState: UIControlState.Normal)
        notmeButton2.titleLabel!.font = UIFont(name: "Avenir-Heavy", size: 16)
        notmeButton2.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), forState: UIControlState.Normal)
        notmeButton2.addTarget(self, action: "playSound:", forControlEvents: UIControlEvents.TouchUpInside)
        notmeButton2.layer.cornerRadius = notmeButton.frame.height/2
        
        scrollView.addSubview(notmeButton2)

        
        audioPlayerTough = try! AVAudioPlayer(contentsOfURL: toughSound)
        audioPlayerWrong = try! AVAudioPlayer(contentsOfURL: wrongSound)
        audioPlayerNotMe = try! AVAudioPlayer(contentsOfURL: notMeSound)
        audioPlayerTough2 = try! AVAudioPlayer(contentsOfURL: toughSound)
        audioPlayerWrong2 = try! AVAudioPlayer(contentsOfURL: wrongSound)
        audioPlayerNotMe2 = try! AVAudioPlayer(contentsOfURL: notMeSound)
        // Do any additional setup after loading the view, typically from a nib.
     }
    
    func playSound(sender: UIButton!) {
        switch sender {
            
            case wrongButton, wrongButton2:
                audioPlayerWrong.play()
                animateBtn(sender as UIButton)
                
                break
            
            case toughButton, toughButton2:
                audioPlayerTough.play()
                animateBtn(sender as UIButton)
                
                break
            
            case notmeButton, notmeButton2:
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

