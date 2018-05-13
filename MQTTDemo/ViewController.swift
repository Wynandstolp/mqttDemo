//
//  ViewController.swift
//  MQTTDemo
//
//  Created by Wynand Stolp on 2018/05/12.
//  Copyright © 2018 Wynand Stolp. All rights reserved.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController {

  // Initiate CocoaMQTT as mqttclient
    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "10.0.0.12", port: 1883)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Executes when switch changes states (It can either be ON or OFF)
    @IBAction func gpio40SW(sender: UISwitch) {
        if sender.isOn {
            mqttClient.publish("rpi/gpio", withString: "on")
        }
        else {
            mqttClient.publish("rpi/gpio", withString: "off")
        }
    }
    
    // Executes when Connect button gets pressed
    @IBAction func connectButton(_ sender: UIButton) {
        mqttClient.connect()
    }
    
    // Executes when Disconnect button gets pressed
    @IBAction func disconnectButton(_ sender: UIButton) {
        mqttClient.disconnect()
    }
}

