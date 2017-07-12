//
//  ViewController.swift
//  ChatApp
//
//  Created by Yawo Echitey on 7/11/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class ChatLogViewController: BaseChatViewController {
    
    var presenter: BasicChatInputBarPresenter!
    var dataSource: DataSource!
    var decorator = Decorator()
    
    var totalMessages = [ChatItemProtocol]()
    
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        
        let textMessageBuilder = TextMessagePresenterBuilder(viewModelBuilder: TextBuilder(), interactionHandler: TextHandler())
        let photoMessageBuilder = PhotoMessagePresenterBuilder(viewModelBuilder: PhotoBuilder(), interactionHandler: PhotoHandler())
        
        
        return [TextModel.chatItemType : [textMessageBuilder],
                PhotoModel.chatItemType : [photoMessageBuilder]
                ]
    }

    //CUSTOMIZING THE CHAT INPUT VIEW
    override func createChatInputView() -> UIView {
        let inputBar = ChatInputBar.loadNib()
        var appearence = ChatInputBarAppearance()
        appearence.sendButtonAppearance.title = "Send"
        appearence.textInputAppearance.placeholderText = "Type a message"
        
        self.presenter = BasicChatInputBarPresenter(chatInputBar: inputBar, chatInputItems: [handleSend(), handlePhoto()], chatInputBarAppearance: appearence)
        
        return inputBar
    }
    
    //FUNCTION USED TO HANDLE SEND ACTION
    func handleSend() -> TextChatInputItem{
    
        let item = TextChatInputItem()
        item.textInputHandler = { text in
            
            let date = Date()
            let timestamp = date.timeIntervalSinceReferenceDate
            let senderID = "me"
            let message = MessageModel(uid: "\(senderID, timestamp)", senderId: senderID, type: TextModel.chatItemType, isIncoming: false, date: date, status: .success)
            let textMessage = TextModel(messageModel: message, text: text.trimmingCharacters(in: .whitespacesAndNewlines))
            self.dataSource.addMessage(message: textMessage)
        }
        return item
    }
    
    //FUNC TO HANDLE PHOTO
    func handlePhoto() -> PhotosChatInputItem{
        let item = PhotosChatInputItem(presentingController: self)
        
        item.photoInputHandler = { photo in
            
            let date = Date()
            let timestamp = date.timeIntervalSinceReferenceDate
            let senderID = "me"
            let message = MessageModel(uid: "\(senderID, timestamp)", senderId: senderID, type: PhotoModel.chatItemType, isIncoming: false, date: date, status: .success)
            let photoMessage = PhotoModel(messageModel: message, imageSize: photo.size, image: photo)
            self.dataSource.addMessage(message: photoMessage)
            
            
        }
        return item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...295{
            let message = MessageModel(uid: "\(i)", senderId: "", type: TextModel.chatItemType, isIncoming: false, date: Date(), status: .success)
            self.totalMessages.append(TextModel(messageModel: message, text: "\(i)"))
        }
        
        self.dataSource = DataSource(totalMessages: self.totalMessages)
        self.chatDataSource = self.dataSource
        self.chatItemsDecorator = self.decorator
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

