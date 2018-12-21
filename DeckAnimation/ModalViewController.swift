//
//  ModalViewController.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

public class ModalViewController: UIViewController {

    private lazy var backingImageView: UIImageView = {
        let imageView = UIImageView(image: backingImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    public let backingImage: UIImage

    private lazy var dimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var button: UIButton = {
        let button =  UIButton(type: .roundedRect)
        button.setTitle("Dismiss!", for: .normal)
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(backingImage: UIImage) {
        self.backingImage = backingImage
        super.init(nibName: nil, bundle: nil)

        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
        configure(presented: false)
    }

    public func configure(presented: Bool) {
        dimmerView.alpha = 0
        backingImageView.alpha = presented ? 0.3 : 0
    }

    private func configureLayout() {
        view.addSubview(backingImageView)
        view.addSubview(dimmerView)
        view.addSubview(containerView)
        view.backgroundColor = .clear

        containerView.addSubview(button)
        containerView.layer.cornerRadius = 16
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        NSLayoutConstraint.activate([
            backingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backingImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backingImageView.rightAnchor.constraint(equalTo: view.rightAnchor),

            dimmerView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dimmerView.rightAnchor.constraint(equalTo: view.rightAnchor),

            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),

            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),

            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ])
    }

    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
