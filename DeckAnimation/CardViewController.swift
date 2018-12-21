//
//  CardViewController.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public class CardViewController: UIViewController {

    private let rootViewController: UIViewController

    private lazy var backingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        configureRootViewController()

        configureLayout()
        configure(presented: false)
    }

    public func setBackingImage(_ image: UIImage) {
        backingImageView.image = image
    }

    public func configure(presented: Bool) {
        backingImageView.alpha = presented ? 0.3 : 0
    }

    private func configureRootViewController() {
        addChild(rootViewController)
        rootViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureLayout() {
        let rootView = rootViewController.view!
        view.addSubview(backingImageView)
        view.addSubview(rootView)
        view.backgroundColor = .clear

        rootView.layer.cornerRadius = 16
        rootView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        NSLayoutConstraint.activate([
            backingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backingImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backingImageView.rightAnchor.constraint(equalTo: view.rightAnchor),

            rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rootView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
}
