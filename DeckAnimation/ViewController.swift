//
//  ViewController.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var button: UIButton = {
        let button =  UIButton(type: .roundedRect)
        button.setTitle("Press me!", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])

        button.addTarget(self, action: #selector(displayModalView), for: .touchUpInside)
    }

    @objc func displayModalView() {
        let modalVC = ModalViewController(backingImage: view.makeSnapshot())

        present(modalVC, animated: true, completion: nil)
    }
}

extension UIView {
    func makeSnapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
