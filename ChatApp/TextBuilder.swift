//
//  TextBuilder.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class TextViewModel: TextMessageViewModel<TextModel>{
    
    override init(textMessage: TextModel, messageViewModel: MessageViewModelProtocol) {
        super.init(textMessage: textMessage, messageViewModel: messageViewModel)
    }
    
}

class TextBuilder: ViewModelBuilderProtocol {
    
    let defaultMessageBuilder = MessageViewModelDefaultBuilder()
    
    func canCreateViewModel(fromModel decoratedTextMessage: Any) -> Bool {
        return decoratedTextMessage is TextModel
    }
    
    func createViewModel(_ decoratedTextMessage: TextModel) -> TextViewModel {
        
        let textMessageViewModel = TextViewModel(textMessage: decoratedTextMessage, messageViewModel: defaultMessageBuilder.createMessageViewModel(decoratedTextMessage))
        
        return textMessageViewModel
        
    }
    
}

