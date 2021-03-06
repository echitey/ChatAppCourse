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
    
    var totalMessages = [ChatItemProtocol]()
    
    func loadIntoItemsArray(messagesNeeded: Int){
        //self.items = totalMessages
        
        for index in stride(from: totalMessages.count - items.count, to: totalMessages.count - items.count - messagesNeeded, by: -1){
            self.items.insert(totalMessages[index - 1], at: 0)
        }
    }
    
    func insertMessage(message: ChatItemProtocol){
        self.items.append(message)
        self.totalMessages.append(message)
    }
    
    func loadPrevious(){
        self.loadIntoItemsArray(messagesNeeded: min(totalMessages.count - items.count, 50))
    }
    
}
