//
//  Decorator.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation

import Chatto
import ChattoAdditions

class Decorator: ChatItemsDecoratorProtocol {
    
    func decorateItems(_ chatItems: [ChatItemProtocol]) -> [DecoratedChatItem] {
        
        var decoratedItems = [DecoratedChatItem]()
        
        for item in chatItems{
            let decoratedItem = DecoratedChatItem(chatItem: item, decorationAttributes: ChatItemDecorationAttributes(bottomMargin: 3, showsTail: false, canShowAvatar: false))
            
            decoratedItems.append(decoratedItem)
        }
        
        return decoratedItems
        
    }
    
}
