//
//  DataSource.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class DataSource: ChatDataSourceProtocol {
    
    var delegate: ChatDataSourceDelegateProtocol?
    
    var controller = ChatItemsController()
    
    init(totalMessages: [ChatItemProtocol]) {
        self.controller.totalMessages = totalMessages
        self.controller.loadIntoItemsArray(messagesNeeded: min(totalMessages.count, 50))
    }
    
    var chatItems: [ChatItemProtocol]{
        return controller.items
    }
    
    var hasMoreNext: Bool{
        return false
    }
    
    var hasMorePrevious: Bool{
        return controller.totalMessages.count - controller.items.count > 0
    }
    
    func loadNext() {
        
    }
    
    func loadPrevious() {
        controller.loadPrevious()
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .pagination)
    }
    
    func addMessage(message: ChatItemProtocol){
        self.controller.insertMessage(message: message)
        self.delegate?.chatDataSourceDidUpdate(self)
    }
    
    func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: (Bool) -> Void) {
        completion(false)
    }
}
