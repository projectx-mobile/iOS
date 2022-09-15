//
//  SecondaryLabelWithIcon.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class SecondaryLabelWithIcon: UILabel {

    convenience init(text: String) {
        self.init()
        self.text = text
        self.textColor = .duskGrey
        self.font = .robotoRegular14()
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"right")
        let imageOffsetY: CGFloat = -2.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        let textBeforeIcon = NSAttributedString(string: text)
        let spacer = NSAttributedString(string: "   ")
        completeText.append(textBeforeIcon)
        completeText.append(spacer)
        completeText.append(attachmentString)

        self.attributedText = completeText
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}