//
//  MainImage.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

class MainImage: UIView {

    let pattern: UIImageView = UIImageView()
    let character: UIImageView = UIImageView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        setTitle()
        setDescription()
        setbackgroundPattern()
        setImage()
    }
    
    private func setTitle() {
        let labelY = self.frame.height
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        label.textAlignment = NSTextAlignment.left
        label.text = "이벤트"
        label.textColor = .blue
        label.font = label.font.withSize(25)
        self.addSubview(label)
    }

    private func setDescription() {
        let label = UILabel(frame: CGRect(x: 10, y: self.frame.height/2-50, width: self.frame.width/2, height: 100))
        label.textAlignment = NSTextAlignment.left
        label.text = "친구 추가하면\n겨울맞이\n이모티콘 선물!"
        label.numberOfLines = 0
        label.font = label.font.withSize(30)

        label.sizeToFit()

        self.addSubview(label)
    }
    
    private func setbackgroundPattern() {
        if let patternImage = UIImage(named: "pattern") {
            self.backgroundColor = UIColor(patternImage: patternImage)
        }
    }
    private func setImage() {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let characterSize = CGSize(width: self.frame.width * 0.5, height: self.frame.height * 0.8)
        
        if let characterImage = UIImage(named: "basket") {
            character.image = characterImage
            self.addSubview(character)
            character.frame.origin = CGPoint(x: screenWidth-characterSize.width, y: frame.height-characterSize.height)
            character.frame.size.width = characterSize.width
            character.frame.size.height = characterSize.height

            character.contentMode = .scaleAspectFit

        }
        character.autoresizingMask = [.flexibleRightMargin, .flexibleHeight, .flexibleWidth]
    }
}
