//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Álvaro Ávalos Hernández on 7/1/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1. Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        //2. Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "1 notification"
        content.body = "Look at me!"
        
        //3. Create the notification trigger
        let date = Date().addingTimeInterval(20)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //4. Create request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //5. Register the request
        center.add(request) { (error) in
            //Check the error parameter and handle any errors
        }
    }


}

