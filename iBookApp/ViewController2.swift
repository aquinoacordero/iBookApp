//
//  ViewController2.swift
//  iBookApp
//
//  Created by oem on 04/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController{
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var textViewNote: UITextView!
    
    var imgName=""
    var aZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*scrollView.contentSize.height=1000
        scrollView.contentSize.width=1000*/
        
        imagen.image=UIImage(named: imgName)
        textViewNote.hidden=true
        
        println("\(imgName) View2")
        
        createButton()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButton(){
        
        if imgName=="virgen1"{
            var button1 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button1.frame = CGRectMake(20,20,25,25)
            button1.addTarget(self, action: "button1Action:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var button2 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button2.frame = CGRectMake(220,220,25,25)
            button2.addTarget(self, action: "button2Action:", forControlEvents: UIControlEvents.TouchUpInside)
            imagen.addSubview(button1)
            imagen.addSubview(button2)
            
        }
        else{
            var button2 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button2.frame = CGRectMake(0,20,25,25)
            button2.addTarget(self, action: "button1Action:", forControlEvents: UIControlEvents.TouchUpInside)
            imagen.addSubview(button2)
            
        }
        
    }
    
    func button1Action(sender: UIButton!){
        
        println("BUTTON1")
        var x=imagen.bounds.height
        var y=imagen.bounds.width
        println(x)
        println(y)
        
        textViewNote.layer.cornerRadius = 5
        textViewNote.alpha = 0.5
        textViewNote.hidden=false
        
        if aZoom==false{
            self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 2, 2)
            self.imagen.transform=CGAffineTransformTranslate(self.imagen.transform, 160, 220)
            aZoom=true
        }else{
            
        }
        
    }
    
    func button2Action(sender: UIButton){
        println("BUTTON2")
        
        var x=imagen.bounds.size
        println(x)
        
        textViewNote.layer.cornerRadius = 5
        textViewNote.alpha = 0.5
        textViewNote.hidden=false
        
        if aZoom==false{
            self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 2, 2)
            self.imagen.transform=CGAffineTransformTranslate(self.imagen.transform, -40, 20)
            aZoom=true
        }else{
            
        }
        
    }

    @IBAction func tapImagenZoom(sender: AnyObject) {
        
        if aZoom==true{
            self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 0.5, 0.5)
            self.imagen.transform=CGAffineTransformMakeTranslation(0, 0)
            aZoom=false
        }else{
            
        }
        
    }
    
}