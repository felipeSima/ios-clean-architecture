//
//  TitleHeaderView.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit

class TitleHeaderView: UIControl {
    
    public lazy var titleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.extraLarge, fontType: .bold)
        label.numberOfLines = 3
        label.isHidden = true
        label.textAlignment = .center
        label.isSkeletonable = true
        return label
    }()
    
    public lazy var subtitleLabel: DefaultLabel = {
        let label = DefaultLabel(fontSize: UIFont.medium)
        label.numberOfLines = 0
        label.isHidden = true
        label.textAlignment = .center
        label.isSkeletonable = true
        return label
    }()
    
    public lazy var contentStackView:UIStackView = {
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labelStack.isSkeletonable = true
        labelStack.spacing = 15
        labelStack.axis = .vertical
        
        let stack = UIStackView(arrangedSubviews: [labelStack, bottomItemView])
        stack.isSkeletonable = true
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .center
        
        labelStack.snp.makeConstraints {$0.width.equalToSuperview().inset(20)}
        bottomItemView.snp.makeConstraints { $0.width.equalToSuperview() }
        
        return stack
    }()
    
    private lazy var bottomItemView:UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    
    var title:String = "" {
        didSet {
            titleLabel.text = title
            titleLabel.isHidden = title.isEmpty
        }
    }
    
    var subtitle:String = "" {
        didSet {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = subtitle.isEmpty
        }
    }
    
    var bottomItem:UIView? {
        didSet {
            for subview in bottomItemView.subviews {
                subview.removeFromSuperview()
            }
            
            bottomItemView.isHidden = (bottomItem == nil)
            
            if let view = bottomItem {
                bottomItemView.addSubview(view)
                view.snp.makeConstraints { (make) in
                    make.centerX.equalToSuperview().priority(.medium)
                    make.bottom.top.equalToSuperview().priority(.medium)
                }
            }
        }
    }
    
    private var _alignment = NSTextAlignment.center
    var alignment:NSTextAlignment {
        get {
            return _alignment
        }
        set(newValue){
            _alignment = newValue
            
            titleLabel.textAlignment = _alignment
            subtitleLabel.textAlignment = _alignment
        }
    }
    
    var allContentIsTouchable:Bool = false {
        didSet {
            contentStackView.isUserInteractionEnabled = !allContentIsTouchable
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints {
            $0.height.equalToSuperview().inset(20).priority(.medium)
            $0.width.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

