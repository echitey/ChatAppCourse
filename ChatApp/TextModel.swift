//
//  TextModel.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation

import Chatto
import ChattoAdditions

class TextModel: TextMessageModel<MessageModel>{

    override init(messageModel: MessageModel, text: String) {
        super.init(messageModel: messageModel, text: text)
    }

}
