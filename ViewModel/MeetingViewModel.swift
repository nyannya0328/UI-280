//
//  MeetingViewModel.swift
//  MeetingViewModel
//
//  Created by nyannyan0328 on 2021/08/07.
//

import SwiftUI

class MeetingViewModel: ObservableObject {
    
    @Published var addNewMeeting = false
    @Published var meetings : [Meeting] = [
    
    
//    Meeting(title: "A", timing: Date()),
//    Meeting(title: "B", timing: Date()),
    
    ]
}

