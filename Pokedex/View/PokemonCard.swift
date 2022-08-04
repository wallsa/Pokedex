//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Wallace Santos on 31/07/22.
//

import UIKit

class PokemonCard: UICollectionViewCell {
    
    static let identifier = "CustomCard"
    
    let imageView:UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = .systemGroupedBackground
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()

    lazy var nameView:UIView = {
       let nameView = UIView()
        nameView.backgroundColor = K.mainColor()
        nameView.addSubview(nameLabel)
        nameLabel.center(inView: nameView)
        return nameView

    }()

    let nameLabel:UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 16)
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 80)
        addSubview(nameView)
        nameView.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
        
}
}
