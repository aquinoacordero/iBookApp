//
//  ViewController.swift
//  iBookApp
//
//  Created by oem on 04/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    
    var imgPre="virgen"
    var img=1
    var text = " Swift seleccionando una palabra para linkear a un sitio rfrferfe erferfer bbtybyt egtreg rutnui tg gtr grtg rtggunuig rwtgtg nuin nvriunv reujk " as NSString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("AQUI LLEGA")
        
        var texto = NSMutableAttributedString(string: text as String)
        let myCustomAtri = [NSForegroundColorAttributeName: UIColor.blueColor(), NSUnderlineStyleAttributeName: 1]
        texto.addAttributes(myCustomAtri, range: text.rangeOfString("palabra"))
        textView.attributedText = texto
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapTextView:"))
        tap.delegate = self
        textView.addGestureRecognizer(tap)
        
        var imgName=imgPre+String(img)
        
        println(imgName)
        
        imagen.image=UIImage(named: imgName)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapTextView(sender: UITapGestureRecognizer){
        
        var substring:String=""
        var poststring:String=""
        var palabraSub:String=""
        var palabraPos:String=""
        
        print("Entro\n")
        
        let myTextView = sender.view as UITextView
        let layoutManager = myTextView.layoutManager
        
        // location of tap in myTextView coordinates and taking the inset into account
        var location = sender.locationInView(myTextView)
        location.x -= myTextView.textContainerInset.left;
        location.y -= myTextView.textContainerInset.top;
        
        // character index at tap location
        var characterIndex = layoutManager.characterIndexForPoint(location, inTextContainer: myTextView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        // if index is valid then do something.
        if characterIndex < myTextView.textStorage.length {
            
            // print the character index
            print("character index: \(characterIndex) \n")
            
            // print the character at the index
            let myRange = NSRange(location: characterIndex, length: 1)
            substring = (myTextView.attributedText.string as NSString).substringWithRange(myRange)
            print("\(substring)\n")
            
        }
        
        var characterIndexSave=characterIndex
        var substringSave = substring
        
        while substring != " "{
            
            let myRange = NSRange(location: characterIndex, length: 1)
            substring = (myTextView.attributedText.string as NSString).substringWithRange(myRange)
            palabraSub=palabraSub+substring
            characterIndex=characterIndex-1
            //print(palabraSub)
        }
        
        characterIndex=characterIndexSave+1
        substring=substringSave
        print("\(substring)\n")
        
        while substring != " "{
            
            println("\n \(characterIndex)\n")
            let myRange = NSRange(location: characterIndex, length: 1)
            substring = (myTextView.attributedText.string as NSString).substringWithRange(myRange)
            palabraPos=palabraPos+substring
            characterIndex=characterIndex+1
            //println(palabraPos)
        }
        
        var palabraSubFin = String(seq: Array(palabraSub).reverse())
        var palabraPosFin = String(palabraPos)
        
        var palabraFin = String(palabraSubFin)+palabraPosFin
        var palabraFinArray = Array(palabraFin)
        
        print("\(palabraFin)a\n")
        
        if palabraFin == "" {
            
            println("caracter vacio")

        }else{
            
            palabraFinArray.removeAtIndex(0)
            palabraFinArray.removeLast()
            var link = String(seq: palabraFinArray)
            print("\n\(palabraFinArray)\n")
            println(link)
            
            intTransWord(link)
        }
        
    }
    
    func intTransWord(palabra:String){
        if palabra == "palabra"{
            transition(palabra)
        }else{
            println("\n ninguna coincidencia \n")
        }
    }
    
    func transition(link:String){
        
        println("Comunicador \(link)")
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController2") as ViewController2
        self.presentViewController(nextView, animated: true, completion: nil)
        
    }
    
    @IBAction func tapImagen(sender: AnyObject) {
        
        println("tap imagen")
        
    }
    
    @IBAction func swipeImagen(sender: AnyObject) {
        
        if img<4{
            img++
        }
        var imgName=imgPre+String(img)
        println(imgName)
        
        chargueImage(imgName)
    }
    
    @IBAction func swipeImagenRight(sender: AnyObject) {
        
        if img>1{
            img--
        }
        var imgName=imgPre+String(img)
        println(imgName)
        
        chargueImage(imgName)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var transp: ViewController2=segue.destinationViewController as ViewController2
        
        var imgName=imgPre+String(img)
        
        transp.imgName=imgName
        
        println("\n PASANDO DATOS \n")
    }
    
    func chargueImage(img:String){
        
        println(img)
        imagen.image=UIImage(named: img)
        
    }
    
}





