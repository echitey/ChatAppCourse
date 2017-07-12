//
//  PhotoBuilder.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/12/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class PhotoViewModel: PhotoMessageViewModel<PhotoModel> {
    
    override init(photoMessage: PhotoModel, messageViewModel: MessageViewModelProtocol) {
        super.init(photoMessage: photoMessage, messageViewModel: messageViewModel)
    }
}

class PhotoBuilder: ViewModelBuilderProtocol {
    
    let defautViewModelBuilder = MessageViewModelDefaultBuilder()

    func canCreateViewModel(fromModel decoratedPhotoMessage: Any) -> Bool {
        return decoratedPhotoMessage is PhotoModel
    }
    
    func createViewModel(_ decoratedPhotoMessage: PhotoModel) -> PhotoViewModel {
        let photoMesageViewModel = PhotoViewModel(photoMessage: decoratedPhotoMessage, messageViewModel: defautViewModelBuilder.createMessageViewModel(decoratedPhotoMessage))
        
        return photoMesageViewModel
    }
    
}
