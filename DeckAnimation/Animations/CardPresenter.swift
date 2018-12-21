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

        guard let base = transitionContext.viewController(forKey: .from),
            let modal = transitionContext.viewController(forKey: .to) as? ModalViewController
            else { return }

        containerView.addSubview(modal.view)

        modal.configure(presented: false)
        modal.view.frame.origin.y = containerView.frame.size.height

        UIView.animate(withDuration: duration,
                       animations: {
                        modal.view.frame.origin.y = containerView.frame.origin.y
                        base.view.alpha = 0.3
        },
                       completion: { _ in
                        base.view.alpha = 1
                        modal.configure(presented: true)
                        transitionContext.completeTransition(true)
        })
    }
}
