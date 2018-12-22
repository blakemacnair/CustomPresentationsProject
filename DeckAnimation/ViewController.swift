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
        presentCard(presentedViewController: ModalViewController(),
                    animated: true,
                    completion: nil)
    }
}

extension ViewController: CardPresenter {
    func presentCard(presentedViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        presentedViewController.transitioningDelegate = self
        presentedViewController.modalPresentationStyle = presentationStyleForCurrentTraitCollection

        present(presentedViewController, animated: animated, completion: completion)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = CardPresentationController(presentedViewController: presented,
                                                                presenting: presenting,
                                                                heightRatio: 0.5)
        return presentationController
    }
}

extension UIViewController: UIAdaptivePresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController,
                                          traitCollection: UITraitCollection)
        -> UIModalPresentationStyle {
            switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
            case (.compact, _): return .custom
            case (.regular, .compact): return .custom
            case (.regular, .regular): return .formSheet
            case (.unspecified, _): return .custom
            case (_, .unspecified): return .custom
            }
    }
}

extension UIViewController {
    public var presentationStyleForCurrentTraitCollection: UIModalPresentationStyle {
        switch (self.traitCollection.horizontalSizeClass, self.traitCollection.verticalSizeClass) {
        case (.compact, _): return .custom
        case (.regular, .compact): return .custom
        case (.regular, .regular): return .formSheet
        case (.unspecified, _): return .custom
        case (_, .unspecified): return .custom
        }
    }
}
