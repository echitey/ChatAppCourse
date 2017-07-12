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

class ViewModel: TextMessageViewModel<TextModel>{
    
    override init(textMessage: TextModel, messageViewModel: MessageViewModelProtocol) {
        super.init(textMessage: textMessage, messageViewModel: messageViewModel)
    }
    
}

class TextBuilder: ViewModelBuilderProtocol {
    
    func canCreateViewModel(fromModel decoratedTextMessage: Any) -> Bool {
        return decoratedTextMessage is TextModel
    }
    
    func createViewModel(_ decoratedTextMessage: TextModel) -> ViewModel {
        
        let textMessageViewModel = ViewModel(textMessage: decoratedTextMessage, messageViewModel: MessageViewModelDefaultBuilder().createMessageViewModel(decoratedTextMessage))
        
        return textMessageViewModel
        
    }
    
}

