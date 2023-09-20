//
//  NotificationViewController.swift
//  notificationContent
//
//  Created by Pranjal Choudhary on 20/09/23.
//

import CleverTapSDK
import CTNotificationContent

class NotificationViewController: CTNotificationViewController {

    @IBOutlet var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // register category with actions
        let action1 = UNNotificationAction(identifier: "action_1", title: "Back", options: [])
        let action2 = UNNotificationAction(identifier: "action_2", title: "Next", options: [])
        let action3 = UNNotificationAction(identifier: "action_3", title: "View In App", options: [])
        let category = UNNotificationCategory(identifier: "CTNotification", actions: [action1, action2, action3], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        // Do any required interface initialization here.
    }

    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body

    }

    override func userDidPerformAction(_ action: String, withProperties properties: [AnyHashable : Any]!) {
        print("userDidPerformAction \(action) with props \(String(describing: properties))")
    }

}
