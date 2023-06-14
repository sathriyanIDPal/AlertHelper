//
//  SampleAlert.swift
//  
//
//  Created by Sathriyan on 22/02/23.
//

import UIKit

public class SampleAlert {
    
    private let parentVC: UIViewController
    private let alertView: AlertView
    
    public init(parentVC: UIViewController, title: String, message: String) {
        self.parentVC = parentVC
        alertView = AlertView(title: title, message: message)
    }
    
    /// Function to show alert
    public func showAlert() {
        parentVC.view.addSubview(alertView)
    }
    
    public func hideAlert() {
        alertView.removeFromSuperview()
    }
}

class AlertView: UIView {
    
    private let title: String
    private let message: String
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
        super.init()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:))
    }
    
    lazy var containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.5)
        return view
    }()
    
    lazy var alertTitle: UILabel = {
        let title: UILabel = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var alertMessgae: UILabel = {
        let message: UILabel = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var leftButton: UILabel = {
        let leftButton: UILabel = UILabel()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.isUserInteractionEnabled = true
        return leftButton
    }()
    
    lazy var buttonDivider: UIView = {
        let divider: UIView = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .gray
        return divider
    }()
    
    lazy var rightButton: UILabel = {
        let rightButton: UILabel = UILabel()
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.isUserInteractionEnabled = true
        return rightButton
    }()
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(alertTitle)
        containerView.addSubview(alertMessgae)
        buttonStack.addArrangedSubview(leftButton)
        buttonStack.addArrangedSubview(buttonDivider)
        buttonStack.addArrangedSubview(rightButton)
        containerView.addSubview(buttonStack)
        
        addContraints()
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.85)
        ])
    }
}
