//
//  NotEkleViewController.swift
//  NotUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit
import Alamofire

class NotEkleViewController: UIViewController {
    @IBOutlet weak var textfieldDersAdi: UITextField!
    
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func notEkle(_ sender: Any) {
        
        if let ders_adi = textfieldDersAdi.text, let not1 = textfieldNot1.text, let not2 = textfieldNot2.text{
            
            if let n1 = Int(not1) , let n2 =  Int(not2){
                addNote(ders_adi: ders_adi, not1: n1, not2: n2)
            }
          
        }
     
    }
    
    func addNote(ders_adi:String,not1:Int,not2:Int){
        let params : Parameters = ["ders_adi":ders_adi,"not1":not1,"not2":not2]
        AF.request("http://kasimadalan.pe.hu/notlar/insert_not.php",method: .post,parameters: params).response{
            response in
            
            if let data = response.data{
                
                do{
                  if  let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                        print(json)
                    }
                   /**
                    let _response = try JSONDecoder().decode(PostRequestResponse.self, from:data)
                    
                    print("\(_response.message!)")
                    */
                    
                   
                }catch{
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
}
