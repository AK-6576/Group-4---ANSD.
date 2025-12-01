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
        
        // 1. Peter shares the leak
        ChatMessage(
            text: "Here are leaked photos of Spider-Man, from the set of Doomsday. Looks fantastic.",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 2. You debunk it
        ChatMessage(
            text: "I saw these......and they are definitely a photo-shop.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 3. Bruce agrees
        ChatMessage(
            text: "Of course they are.",
            isIncoming: true,
            sender: "Bruce Banner"
        ),
        
        // 4. Mentioning the source
        ChatMessage(
            text: "RPK is not always right, Peter.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 5. Peter defends the source
        ChatMessage(
            text: "But, DanielRPK has a clean track record. He is never wrong.",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 6. GPT accusation
        ChatMessage(
            text: "Sounds like fan-fiction to me. GPT stuff.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 7. Bruce on internet trust
        ChatMessage(
            text: "Exactly. We cannot trust anything on the Internet anymore.",
            isIncoming: true,
            sender: "Bruce Banner"
        ),
        
        // 8. Skepticism
        ChatMessage(
            text: "Don’t believe everything you see.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 9. Peter gives in
        ChatMessage(
            text: "I guess. Still, let a man dream and live.",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 10. Ending the chat
        ChatMessage(
            text: "Yeah yeah, I know. Let’s go now. We have to meet Tom.",
            isIncoming: false,
            sender: "Me"
        )
    ]
}
