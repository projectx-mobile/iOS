//
//  WelcomeViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

 protocol WelcomeViewInputProtocol: AnyObject {
 }

 protocol WelcomeViewOutputProtocol {
     init(view: WelcomeViewInputProtocol)
 }