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
    
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        return [ChatItemType: [ChatItemPresenterBuilderProtocol]]()
    }

    //CUSTOMIZING THE CHAT INPUT VIEW
    override func createChatInputView() -> UIView {
        let inputBar = ChatInputBar.loadNib()
        var appearence = ChatInputBarAppearance()
        appearence.sendButtonAppearance.title = "Send"
        appearence.textInputAppearance.placeholderText = "Type a message"
        
        self.presenter = BasicChatInputBarPresenter(chatInputBar: inputBar, chatInputItems: [handleSend()], chatInputBarAppearance: appearence)
        
        return inputBar
    }
    
    //FUNCTION USED TO HANDLE SEND ACTION
    func handleSend() -> TextChatInputItem{
    
        let item = TextChatInputItem()
        item.textInputHandler = { text in
            print(text)
        }
        return item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

