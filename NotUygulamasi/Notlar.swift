//
//  Notlar.swift
//  NotUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import Foundation

class Notlar:Codable {
    var not_id:String?
    var ders_adi:String?
    var not1:String?
    var not2:String?
   

    init(not_id: String? = nil, ders_adi: String? = nil, not1: String? = nil, not2: String? = nil) {
        self.not_id = not_id
        self.ders_adi = ders_adi
        self.not1 = not1
        self.not2 = not2
    }
    
  
}
