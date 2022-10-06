//
//  ChildHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

final class ChildHomeScreenViewController: UIViewController {
    
    var presenter: ChildHomeScreenViewOutputProtocol!
    private let configurator: ChildHomeScreenConfiguratorInputProtocol = ChildHomeScreenConfigurator()
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let notificationView = NotificationView()
    private let noNotificationView = NoNotificationView()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryJuicyGrape
        view.layer.cornerRadius = LayoutConstants.cornerRadius10
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var numberOfNotifications = 0 {
        didSet {
            setUpNotificationView()
        }
    }
    
    private var textOfNotification = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        checkNumberOfNotifications()
    }
}

//MARK: - Private extension
private extension ChildHomeScreenViewController {
    
    func setupViews() {
        view.addSubview(backgroundView)
        backgroundView.transform = backgroundView.transform.rotated(by: CGFloat(-0.05))
        view.addSubview(titleLabel)
        view.addSubview(activeTasksLabel)
        view.addSubview(notificationView)
        view.addSubview(noNotificationView)
    }
    
    func setupNavigationBar() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.backgroundColor = .clear
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func checkNumberOfNotifications() {
        presenter.getNumberOfNotifications()
        setUpNotificationView()
    }
    
    func setUpNotificationView() {
        if numberOfNotifications == 0 {
            notificationView.isHidden = true
            noNotificationView.isHidden = false
            backgroundView.isHidden = true
        } else if numberOfNotifications == 1{
            backgroundView.isHidden = true
            notificationView.isHidden = false
            noNotificationView.isHidden = true
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        } else {
            backgroundView.isHidden = false
            notificationView.isHidden = false
            noNotificationView.isHidden = true
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        }
    }
    
    func setDelegates() {
        notificationView.closeDelegate = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.inset76),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            activeTasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            activeTasksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            activeTasksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset40),
            notificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            notificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            notificationView.heightAnchor.constraint(equalToConstant: LayoutConstants.height64)
        ])
        
        NSLayoutConstraint.activate([
            noNotificationView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset40),
            noNotificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            noNotificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            noNotificationView.heightAnchor.constraint(equalToConstant: LayoutConstants.height64)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor, constant: -LayoutConstants.inset14),
            backgroundView.widthAnchor.constraint(equalTo: notificationView.widthAnchor, constant: -LayoutConstants.inset32),
            backgroundView.heightAnchor.constraint(equalToConstant: LayoutConstants.height60)
        ])
        
    }
}

//MARK: - CloseProtocol
extension ChildHomeScreenViewController: CloseProtocol{
    func closeButtonTapped() {
        presenter.deleteFirstNotification()
    }
}

//MARK: - ChildHomeScreenViewInputProtocol
extension ChildHomeScreenViewController: ChildHomeScreenViewInputProtocol {
    func receiveNumberOfNotifications(number: Int) {
        numberOfNotifications = number
    }
    
    func receiveTextOfNotification(text: String) {
        textOfNotification = text
    }
}
