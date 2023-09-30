//
//  ResponseNote.swift
//  NotUygulamasi
//
//  Created by Cuneyt on 25.09.2023.
//  Copyright © 2023 info. All rights reserved.
//

import Foundation

class ResponseNote:Codable{
    
    var notlar:[Notlar]?
    
    init(notlar: [Notlar]? = nil) {
        self.notlar = notlar
    }
}
