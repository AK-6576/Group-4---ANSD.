//
//  RoutineData.swift
//  ANSD_APP
//
//  Created by Dhiraj  on 27/11/25.
//

import Foundation

class RoutineRepository {
    static func getMockData() -> [RoutineItem] {
        return[
            RoutineItem(title: "Daily Check-In",time: "09:30 - 10:30 AM"),
            RoutineItem(title: "Team Review",time: "12:00 - 01:30 PM"),
            RoutineItem(title: "Board Review",time: "03:00 - 05:00 PM"),
            RoutineItem(title: "Daily Check-Out",time: "05:15 - 06:00 PM")
            ]
    }
}
