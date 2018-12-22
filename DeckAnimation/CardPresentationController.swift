//
//  CardPresentationController.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public protocol CardPresenter: class {
    func presentCard(presentedViewController: UIViewController, animated: Bool, completion: (() -> Void)?)
}

public class CardPresentationController: UIPresentationController {

    // MARK: - Properties

    private var heightRatio: CGFloat = 0

    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        view.alpha = 0.0
        return view
    }()

    override public var frameOfPresentedViewInContainerView: CGRect {
        let yOffset = presentingViewController.view.frame.height * (1 - heightRatio)
        let frame: CGRect = CGRect(origin: CGPoint(x: 0,
                                                   y: yOffset),
                                   size: size(forChildContentContainer: presentedViewController,
                                              withParentContainerSize: containerView!.bounds.size))

        return frame
    }

    // MARK: - Init

    override init(presentedViewController: UIViewController,
                  presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)

        setupGestureRecognizer()
    }

    convenience init(presentedViewController: UIViewController,
                  presenting presentingViewController: UIViewController?,
                  heightRatio: CGFloat) {
        self.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.heightRatio = heightRatio
    }

    // MARK: - Override

    override public func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        containerView.addSubview(dimmingView)

        NSLayoutConstraint.activate([
            dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            dimmingView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            dimmingView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
            ])

        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }

    override public func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }

    override public func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 16
        presentedView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override public func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height * heightRatio)
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

