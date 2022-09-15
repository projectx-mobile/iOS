//
//  ParentHomeScreenInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import Foundation

class ParentHomeScreenInteractor: ParentHomeScreenInteractorInputProtocol {
   
   unowned let presenter: ParentHomeScreenInteractorOutputProtocol
   
   required init(presenter: ParentHomeScreenInteractorOutputProtocol) {
       self.presenter = presenter
   }
}