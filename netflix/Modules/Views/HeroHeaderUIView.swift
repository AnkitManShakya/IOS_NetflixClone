//
//  HeroHeaderUIView.swift
//  netflix
//
//  Created by Ankit Man Shakya on 22/06/2022.
//

import Foundation
import UIKit

class HeroHeaderUIView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "headerView"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var playButton: UIButton = {actionButton(label: "Play")}()
    lazy var downloadButton: UIButton = {actionButton(label: "Download")}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        addGraidentLayer()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(playButton)
        addSubview(downloadButton)
        
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),

            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45),
        ])
    }
    
    private func addGraidentLayer(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func actionButton(label: String) -> UIButton {
        let button = UIButton()
        button.setTitle(label, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.layer.cornerRadius = 5
        return button
    }
}
 
