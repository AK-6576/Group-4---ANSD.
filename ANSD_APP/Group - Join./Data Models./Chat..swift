//
//  Chat.swift
//  Quick Captioning
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
            text: "Did everyone finish the assignment? It is due tomorrow and ma’am is strict.",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 2. You debunk it
        ChatMessage(
            text: "Almost done! Just need to proofread.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 3. Bruce agrees
        ChatMessage(
            text: "I haven’t started... Help?",
            isIncoming: true,
            sender: "Bruce Banner"
        ),
        
        // 4. Mentioning the source
        ChatMessage(
            text: "Sure, I’m free after 4 PM.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 5. Peter defends the source
        ChatMessage(
            text: "I have a family outing at 4 PM. How about tomorrow ?",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 6. GPT accusation
        ChatMessage(
            text: "Jesus ! So late ? Oh, hell naw. I am out.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 7. Bruce on internet trust
        ChatMessage(
            text: "Steve. don’t do that. The man is already panicking.",
            isIncoming: true,
            sender: "Bruce Banner"
        ),
        
        // 8. Skepticism
        ChatMessage(
            text: "And rightfully so. We had 3 weeks to do it.",
            isIncoming: false,
            sender: "Me"
        ),
        
        // 9. Peter gives in
        ChatMessage(
            text: "Don’t do that. Don’t push your luck, Steve.",
            isIncoming: true,
            sender: "Peter Parker"
        ),
        
        // 10. Ending the chat
        ChatMessage(
            text: "Yeah yeah, I know. Gotta go ! Good luck !",
            isIncoming: false,
            sender: "Me"
        )
    ]
}
