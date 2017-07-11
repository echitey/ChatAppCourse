//
//  ChatItemsController.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation

import Chatto

import ChattoAdditions

class ChatItemsController{
    
    var items = [ChatItemProtocol]()
    
    func insertMessage(message: ChatItemProtocol){
        self.items.append(message)
    }
    
}
