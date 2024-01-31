//
//  ViewController.swift
//  MessageKitDemo
//
//  Created by Angelos Staboulis on 31/1/24.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import MapKit

class ViewController: MessagesViewController {
    var messages:[Message] = []
    var pressed:Bool!=false
    var user1:Member! = .init(name: "Angelos Staboulis", color: .red)
    var user2:Member! = .init(name: "Theodoros Staboulis", color: .green)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
    }
   
    
}
extension ViewController{
    func setupView(){
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}
extension ViewController:MessagesDataSource{
    
    func currentSender() -> MessageKit.SenderType {
        return Sender(id: UUID().uuidString, displayName:user1.name)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
   
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
            return .bubble
    }
}

extension ViewController:InputBarAccessoryViewDelegate{

    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        if pressed {
            let messageUser = Message(member: user2, text: text, messageId: UUID().uuidString)
            messages.append(messageUser)
            messagesCollectionView.reloadData()
            inputBar.inputTextView.text = ""
            pressed.toggle()
        }else{
            let messageUser = Message(member: user1, text: text, messageId: UUID().uuidString)
            messages.append(messageUser)
            messagesCollectionView.reloadData()
            inputBar.inputTextView.text = ""
            pressed.toggle()
        }
    }

    
    
  
}

extension ViewController:MessagesLayoutDelegate{
    
}
extension ViewController:MessagesDisplayDelegate{
    func configureAvatarView(
      _ avatarView: AvatarView,
      for message: MessageType,
      at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) {
      let color = messages[indexPath.section].member.color
      avatarView.backgroundColor = color
    }
}
