//
//  ChildHomeScreenViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 25.10.22.
//

import Foundation

protocol ChildHomeScreenViewInputProtocol: AnyObject {
    func receiveNumberOfNotifications(number: Int)
    func receiveTextOfNotification(text: String)
    func receiveActiveTasksLabelText(text: String)
}

protocol ChildHomeScreenViewOutputProtocol: AnyObject {
    init(view: ChildHomeScreenViewInputProtocol)
    func getNumberOfNotifications()
    func getNumberOfActiveTasks()
    func getTextOfNotification()
    func deleteFirstNotification()
}