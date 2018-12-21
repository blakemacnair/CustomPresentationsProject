//
//  CardDismisser.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public class CardDismisser: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration = 0.3

    var presenting = true

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let modal = transitionContext.viewController(forKey: .from) as? CardViewController,
            let base = transitionContext.viewController(forKey: .to)
            else { return }

        transitionContext.containerView.insertSubview(base.view, at: 0)

        modal.configure(presented: false)
        modal.view.frame.origin.y = containerView.frame.origin.y

        base.view.alpha = 0.3

        UIView.animate(withDuration: duration,
                       animations: {
                        modal.view.frame.origin.y = containerView.frame.size.height

                        base.view.alpha = 1
        },
                       completion: { _ in
                        modal.configure(presented: false)
                        transitionContext.completeTransition(true)
        })
    }
}
