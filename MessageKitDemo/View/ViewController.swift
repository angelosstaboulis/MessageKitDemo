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
    var member1:Member!
    var member2:Member!
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
        member1 = MessageViewModel.shared.createFirstMember()
        member2 = MessageViewModel.shared.createSecondMember()
    }
}
extension ViewController:MessagesDataSource{
    
    func currentSender() -> MessageKit.SenderType {
        return Sender(id: UUID().uuidString, displayName:member1.name)
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
    func addMessage(message:Message,inputBar:InputBarAccessoryView){
        messages.append(message)
        messagesCollectionView.reloadData()
        inputBar.inputTextView.text = ""
        pressed.toggle()
    }
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        if pressed {
            let messageUser = Message(member: member2, text: text, messageId: UUID().uuidString)
           addMessage(message: messageUser, inputBar: inputBar)
        }else{
            let messageUser = Message(member: member1, text: text, messageId: UUID().uuidString)
            addMessage(message: messageUser, inputBar: inputBar)
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
