//
//  CardAnimator.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public class CardPresenter: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = 0.3

    var presenting = true

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to) as? ModalViewController
            else { return }

        toViewController.configure(presented: false)

        containerView.addSubview(toViewController.view)
        toViewController.view.frame.origin.y = containerView.frame.size.height
        UIView.animate(withDuration: duration,
                       animations: {
                        toViewController.view.frame.origin.y = containerView.frame.origin.y
                        fromViewController.view.alpha = 0.3

        },
                       completion: { _ in
                        fromViewController.view.alpha = 1
                        toViewController.configure(presented: true)
                        transitionContext.completeTransition(true)
        })
    }
}
