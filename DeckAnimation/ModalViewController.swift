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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        view.addSubview(backingImageView)
        view.addSubview(dimmerView)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            backingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backingImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backingImageView.rightAnchor.constraint(equalTo: view.rightAnchor),

            dimmerView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dimmerView.rightAnchor.constraint(equalTo: view.rightAnchor),

            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
            ])

        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

    }

    private func configureBackingImageInPosition(presenting: Bool) {
        let dimmerAlpha: CGFloat = presenting ? 0.3 : 0

        dimmerView.alpha = dimmerAlpha
    }

    private func animateBackingImage(presenting: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.configureBackingImageInPosition(presenting: presenting)
            self.view.layoutIfNeeded() //IMPORTANT!
        }
    }

    //5.
    func animateBackingImageIn() {
        animateBackingImage(presenting: true)
    }

    func animateBackingImageOut() {
        animateBackingImage(presenting: false)
    }

}
