//
//  Chat.swift
//  Quick Captioning.
//
//  Created by Anshul Kumaria on 25/11/25.
//

import Foundation

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let sender: String
}

struct ChatData {
    static let fullConversation: [ChatMessage] = [
        
        // 1. THE START & REVEAL (Happens First now)
        ChatMessage(text: "Bucky Barnes, right ? How do you spell your surname ?", isIncoming: false, sender: "Me"),
        
        // vvv POINT OF INTERACTION vvv
        // When this message appears, you Tap "Person 1" and rename him to "Bucky"
        ChatMessage(text: "B-A-R-N-E-S, Sir. From Brooklyn.", isIncoming: true, sender: "Person 1"),
        // ^^^
        
        ChatMessage(text: "Nice to meet you, Bucky. Just give me a moment here. I'm looking for the right building.", isIncoming: false, sender: "Me"),
        
        ChatMessage(text: "Yeah, I think it is that one over there. The one with the red paint peeling off.", isIncoming: false, sender: "Me"),
        
        // 2. The Drop Off
        ChatMessage(text: "You want to dropped here then or near the bus stop? I'm not sure which one is closer.", isIncoming: true, sender: "Person 1"),
        ChatMessage(text: "The gate would be fine, thanks.", isIncoming: false, sender: "Me"),
        
        // 3. The Code
        ChatMessage(text: "What is the code, Sir?", isIncoming: true, sender: "Person 1"),
        ChatMessage(text: "The code is 10042005.", isIncoming: false, sender: "Me"),
        
        // 4. The Fare
        ChatMessage(text: "The fare is 120 bucks, Sir. Cash please.", isIncoming: true, sender: "Person 1"),
        ChatMessage(text: "120! Jesus, the fare has sky-rocketed a lot!", isIncoming: false, sender: "Me"),
        ChatMessage(text: "I know, Sir. But after inflation, this is the best we can do.", isIncoming: true, sender: "Person 1"),
        ChatMessage(text: "Public transport would have been cheaper.", isIncoming: false, sender: "Me")
    ]
}
