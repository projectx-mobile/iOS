//
//  ParentHomeScreenConfigurator.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import Foundation

protocol ParentHomeScreenConfiguratorInputProtocol {
    func configure(with viewController: ParentHomeScreenViewController)
}

class ParentHomeScreenConfigurator: ParentHomeScreenConfiguratorInputProtocol {
    
    func configure(with viewController: ParentHomeScreenViewController) {
        let presenter = ParentHomeScreenPresenter(view: viewController as ParentHomeScreenViewInputProtocol)
        let interactor = ParentHomeScreenInteractor(presenter: presenter)
        let router = ParentHomeScreenRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}