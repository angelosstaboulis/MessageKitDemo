//
//  MessageViewModel.swift
//  MessageKitDemo
//
//  Created by Angelos Staboulis on 5/2/24.
//

import Foundation
class MessageViewModel{
    static let shared = MessageViewModel()
    private init(){}
    func createFirstMember()->Member{
        return Member(name: "Angelos Staboulis", color: .red)
    }
    func createSecondMember()->Member{
        return Member(name: "Theodoros Staboulis", color: .green)
    }
}
