//
//  CustomCollectionViewCell.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 17/12/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    private func setupCell() {
        // Customize the cell's appearance
        backgroundColor = .systemPink
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        addSubview(imageView)
        imageView.frame = self.bounds
    }
}

