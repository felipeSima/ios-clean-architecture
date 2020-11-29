//
//  PokemonListCell.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit
import Kingfisher

class PokemonListCell: UITableViewCell {
    
    //MARK: - UIElements
    public lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var iconImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.kf.indicatorType = .activity
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
        let label = DefaultLabel(fontSize: UIFont.smallmd, fontType: .regular)
        label.textColor = .gray
        label.isSkeletonable = true
        return label
    }()
    
    private lazy var subtitleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.medium, fontType: .bold)
        label.textColor = .gray
        label.isSkeletonable = true
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.isSkeletonable = true
        return stackView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type : .system)
        button.setImage(UIImage(named: "baseline_favorite_border_black_24pt_1x"), for: .normal)
        button.setImageTintColor(.gray)
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
        self.contentView.addSubview(background)
        self.background.addSubview(iconImageView)
        self.background.addSubview(titleStackView)
        self.background.addSubview(editButton)
        makeConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.roundCorners(corners: [.topLeft,.bottomLeft], radius: background.frame.height/2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func makeConstraints() {
        background.snp.makeConstraints { make in
            make.left.equalTo(20).offset(20)
            make.right.equalToSuperview()
            make.top.equalTo(10)
            make.bottom.equalToSuperview().inset(10)
        }
        iconImageView.snp.makeConstraints { (make) in
            make.size.equalTo(60)
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
    
    func setFavouriteSelected(){
        editButton.setImage(UIImage(named: "baseline_favorite_black_24pt_1x"), for: .normal)
        editButton.setImageTintColor(.red)
    }
    
    func setFavouriteUnselected(){
        editButton.setImage(UIImage(named: "baseline_favorite_border_black_24pt_1x"), for: .normal)
        editButton.setImageTintColor(.gray)
    }
    
    //MARK: - Methods
    @objc private func onEditButtonAction(){
        didPressedEditButton?()
    }
    
    public func set(serie: String?, pokemon: PokemonListEntity){
        titleLabel.text = serie?.capitalizingFirstLetter()
        subtitleLabel.text = pokemon.name.capitalizingFirstLetter()
        self.iconImageView.kf.cancelDownloadTask()
        self.iconImageView.image = nil
        if !pokemon.imageUrl.isEmpty {
            DispatchQueue.main.async {
                self.iconImageView.kf.setImage(with: URL(string: pokemon.imageUrl), options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1))
                ])
            }
        }
    }
    
    override func prepareForReuse() {
        subtitleLabel.text = ""
    }
    
}
