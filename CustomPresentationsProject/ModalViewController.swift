//
//  ModalViewController.swift
//  CustomPresentationsProject
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public class ModalViewController: UIViewController {

    private lazy var button: UIButton = {
        let button =  UIButton(type: .roundedRect)
        button.setTitle("Dismiss!", for: .normal)
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        configureLayout()
    }

    private func configureLayout() {
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
