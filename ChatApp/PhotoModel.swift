//
//  PhotoModel.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/12/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions


class PhotoModel: PhotoMessageModel<MessageModel> {
    
    static let chatItemType = "photo"
    override init(messageModel: MessageModel, imageSize: CGSize, image: UIImage) {
        super.init(messageModel: messageModel, imageSize: imageSize, image: image)
    }
}
