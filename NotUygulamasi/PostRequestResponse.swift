//
//  PostRequestResponse.swift
//  NotUygulamasi
//
//  Created by Cuneyt on 29.09.2023.
//  Copyright © 2023 info. All rights reserved.
//

import Foundation

class PostRequestResponse:Codable{
    var success:String?
    var message:String?
    
    init(success: String? = nil, message: String? = nil) {
        self.success = success
        self.message = message
    }
  
}
