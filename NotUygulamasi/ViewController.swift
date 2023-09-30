//
//  ViewController.swift
//  NotUygulamasi
//
//  Created by Kasım Adalan on 30.07.2019.
//  Copyright © 2019 info. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var notTableView: UITableView!
    
    var noteList = [Notlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        print("DİDLOAD ÇALIŞTI")
        notTableView.delegate = self
        notTableView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("APPEAR ÇALIŞTI")
        fetchNote()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNotDetay" {
            let index = sender as? Int
            
            let arriveCV = segue.destination as! NotDetayViewController
            
            arriveCV.note = noteList[index!]
        }
        
    }
    func fetchNote(){
        
        AF.request("http://kasimadalan.pe.hu/notlar/tum_notlar.php",method: .get).response{
            response in
            
            if let data = response.data{
                
                do{
                    let _response = try JSONDecoder().decode(ResponseNote.self, from:data)
                    
                    if  let _notes = _response.notlar {
                        self.noteList = _notes
                    }
                    DispatchQueue.main.async {
                        self.notTableView.reloadData()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let not = noteList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre", for: indexPath) as! NotHucreTableViewCell
        
        cell.labelDersAdi.text = not.ders_adi
        cell.labelNot1.text = String(not.not1!)
        cell.labelNot2.text = String(not.not2!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNotDetay", sender: indexPath.row)
    }
}
