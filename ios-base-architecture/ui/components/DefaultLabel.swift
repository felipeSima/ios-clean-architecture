//
//  DefaultLabel.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/24/20.
//

import UIKit

class DefaultLabel: UILabel {
    
    private var _lineHeight:CGFloat = 1.0
    public var lineHeight:CGFloat {
        set(newValue) {
            _lineHeight = newValue
        }
        get {
            return _lineHeight
        }
    }
    
    public override var text: String? {
        didSet {
            super.text = text
            updateAttributes()
        }
    }
    
    init(fontSize:CGFloat = 16, fontType: UIFont.FontType = .regular) {
        super.init(frame: CGRect.zero)
        initView(fontSize: fontSize, fontType: fontType)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView(fontSize: CGFloat = 16, fontType: UIFont.FontType = .regular){
        textColor = .white
        
        switch fontType {
        case .regular:
            font = UIFont.defaultRegularFont(ofSize: fontSize)
        case .bold:
            font = UIFont.defaultBoldFont(ofSize: fontSize)
        case .light:
            font = UIFont.defaultLightFont(ofSize: fontSize)
        }
        
    }
    
    private func updateAttributes(){
        if let text = self.text {
            let attributedString = NSMutableAttributedString(string: text)
            let range = NSMakeRange(0, attributedString.length)
            if lineHeight != 1.0 {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = lineHeight
                attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: range)
            }
            
            attributedText = attributedString
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
