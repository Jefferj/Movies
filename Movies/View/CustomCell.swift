//
//  CustomCell.swift
//  Movies
//
//  Created by Jefferson Naranjo rodríguez on 17/08/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    private var profilePic : UIImageView = {
        let imageView = UIImageView()
        imageView.countableMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var userNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var stackView : UIStackView = {
        let stackView : UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()

    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setupView(){
        addSubview(profilePic)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
        //Profile constraints
            profilePic.widthAnchor.constraint(equalToConstant: 60),
            profilePic.heightAnchor.constraint(equalToConstant: 60),
            profilePic.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profilePic.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profilePic.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
        //Stack constraints
            stackView.leadingAnchor.constraint(equalTo: profilePic.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            
        ])
    }
    
    func setData(_ user : MoviesModel) {
        profilePic.image = UIImage(named: user.profilePic)
        descriptionLabel.text = user.description
        userNameLabel.text = user.userName
    }

}
