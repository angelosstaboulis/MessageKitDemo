//
//  Message.swift
//  MessageKitDemo
//
//  Created by Angelos Staboulis on 31/1/24.
//

import Foundation
import MessageKit
import UIKit
struct Message:MessageType{
    
    var sender: SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
    
    let member: Member
    let text: String
    let messageId: String
}
