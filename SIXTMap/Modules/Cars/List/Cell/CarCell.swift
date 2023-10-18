//
//  CarCell.swift
//  SIXTMap
//
//  Created by Amir on 10/11/23.
//

import UIKit

class CarCell: UICollectionViewCell {
    //MARK: Variable
    var item: CarsListModel.CarsListSectionModel? {
        didSet {
            let nameAttribute = generateAttribute(title: "Name", value: item?.name ?? "")
            nameLabel.attributedText = nameAttribute
            
            let seriesAttribute = generateAttribute(title: "Series", value: item?.series ?? "")
            seriesLabel.attributedText = seriesAttribute

            let colorAttribute = generateAttribute(title: "Color", value: item?.color ?? "")
            colorLabel.attributedText = colorAttribute
        }
    }
    
    private lazy var logoImage: UIImageView = {
       let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seriesLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    private lazy var colorLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    
    //MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        addView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Function
    private func configureCell() {
        
    }
    
    private func addView() {
        contentView.addSubview(logoImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(seriesLabel)
        contentView.addSubview(colorLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            logoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            logoImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            seriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            seriesLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            seriesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            colorLabel.topAnchor.constraint(equalTo: seriesLabel.bottomAnchor, constant: 5),
            colorLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            colorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func generateTitleAttribute() -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold),
        ]
    }
    
    private func generateValueAttribute() -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular),
        ]
    }
        
    private func generateAttribute(title: String, value: String) -> NSAttributedString {
        let mutableSeriesAttributedString = NSMutableAttributedString()
        let titleString = NSAttributedString(string: "\(title): ", attributes: generateTitleAttribute())
        let valueString = NSAttributedString(string: value, attributes: generateValueAttribute())
        mutableSeriesAttributedString.append(titleString)
        mutableSeriesAttributedString.append(valueString)
        return mutableSeriesAttributedString
    }


}
