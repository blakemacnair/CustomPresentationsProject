//
//  CardPresentationController.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

class CardPresentationController: UIPresentationController {

    // MARK: - Properties

    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        view.alpha = 0.0
        return view
    }()

    override var presentationStyle: UIModalPresentationStyle { return UIModalPresentationStyle.formSheet }

    override var adaptivePresentationStyle: UIModalPresentationStyle { return UIModalPresentationStyle.custom }

    // MARK: - Init

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)

        setupGestureRecognizer()
    }

    // MARK: - Override
    override func presentationTransitionWillBegin() {

    }

    override func dismissalTransitionWillBegin() {

    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in

        }, completion: { context in

        })
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {

    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {

    }

    // MARK: - Private

    private func setupGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
    }

    @objc dynamic func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
}

