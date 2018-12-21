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

    public let backingImage: UIImage

    private lazy var backingImageView: UIImageView = {
        let imageView = UIImageView(image: backingImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    private lazy var dimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(backingImage: UIImage, rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.backingImage = backingImage
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

    public func configure(presented: Bool) {
        dimmerView.alpha = 0
        backingImageView.alpha = presented ? 0.3 : 0
    }

    private func configureRootViewController() {
        addChild(rootViewController)
        rootViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureLayout() {
        let rootView = rootViewController.view!
        view.addSubview(backingImageView)
        view.addSubview(dimmerView)
        view.addSubview(rootView)
        view.backgroundColor = .clear

        rootView.layer.cornerRadius = 16
        rootView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        NSLayoutConstraint.activate([
            backingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backingImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backingImageView.rightAnchor.constraint(equalTo: view.rightAnchor),

            dimmerView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dimmerView.rightAnchor.constraint(equalTo: view.rightAnchor),

            rootView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rootView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }

    @objc public func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
