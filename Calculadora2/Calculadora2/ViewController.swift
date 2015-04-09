//
//  ViewController.swift
//  Calculadora2
//
//  Created by Vitor Kawai Sala on 09/04/15.
//  Copyright (c) 2015 Vitor Kawai Sala. All rights reserved.
//

import UIKit

private var num1 : Double?
private var buffer : String = ""

class ViewController: UIViewController {
    @IBOutlet weak var lblScreen: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNumber(sender: UIButton) {
        buffer = buffer + sender.titleLabel!.text!
        lblScreen.text = buffer

        println(buffer)
    }

    @IBAction func btnOperation(sender: UIButton) {
        if(num1 == nil){
            num1 = (buffer as NSString).doubleValue
        }
        else{
            var num2 : Double = (buffer as NSString).doubleValue
            switch(sender.titleLabel!.text!){
            case "+":
                num1! += num2
                break;
            case "-":
                num1! -= num2
                break;
            case "x":
                num1! *= num2
                break;
            case "÷":
                if(num2 == 0){
                    num1 = 0
                }
                else{
                    num1! /= num2
                }
                break;
            default:
                break;
            }
        }
        buffer = ""
        lblScreen.text = "\(num1!)"
    }

    @IBAction func btnClear(sender: AnyObject) {
        num1 = nil
        buffer = "0"
        lblScreen.text = buffer
    }

}

