//
//  CardPresentingViewController.swift
//  CustomPresentations
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

open class CardPresentingViewController: UIViewController, UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    open func presentCard(presentedViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        presentedViewController.transitioningDelegate = self
        presentedViewController.modalPresentationStyle = presentationStyleForCurrentTraitCollection

        present(presentedViewController, animated: animated, completion: completion)
    }

    open func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = CardPresentationController(presentedViewController: presented,
                                                                presenting: presenting,
                                                                heightRatio: 0.5)

        return presentationController
    }

    private var presentationStyleForCurrentTraitCollection: UIModalPresentationStyle {
        switch (self.traitCollection.horizontalSizeClass, self.traitCollection.verticalSizeClass) {
        case (.compact, _): return .custom
        case (.regular, .compact): return .custom
        case (.regular, .regular): return .formSheet
        case (.unspecified, _): return .custom
        case (_, .unspecified): return .custom
        }
    }

    open func adaptivePresentationStyle(for controller: UIPresentationController,
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
