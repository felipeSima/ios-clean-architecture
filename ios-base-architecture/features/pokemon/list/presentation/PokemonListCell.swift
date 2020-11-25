//
//  PokemonListCell.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit

class PokemonListCell: UITableViewCell {
    
    //MARK: - UIElements
    public lazy var iconImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_cronograma"))
        imageView.contentMode = .scaleAspectFit
        imageView.isSkeletonable = true
        return imageView
    }()
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isSkeletonable = true
        return stackView
    }()
    
    private lazy var titleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.medium, fontType: .bold)
        label.numberOfLines = 4
        label.isSkeletonable = true
        return label
    }()
    
    private lazy var subtitleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.smallmd, fontType: .regular)
        label.textColor = .gray
        label.isSkeletonable = true
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.isSkeletonable = true
        return stackView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type : .system)
        button.setImage(UIImage(named: "baseline_more_vert_white_24pt")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(onEditButtonAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Callbacks
    public var didPressedEditButton:(() -> Void)?
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.isSkeletonable = true
        self.backgroundColor = .clear
        selectionStyle = .none
        
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(titleStackView)
        self.contentView.addSubview(editButton)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(30)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(20)
            make.right.equalTo(editButton.snp.left).inset(10)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(60)
        }
        
        editButton.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Methods
    @objc private func onEditButtonAction(){
        didPressedEditButton?()
    }
    
    public func set(title: String?, subTitle: String?){
        titleLabel.text = title
        subtitleLabel.text = subTitle
    }
    
    override func prepareForReuse() {
        subtitleLabel.text = ""
    }
    
}
