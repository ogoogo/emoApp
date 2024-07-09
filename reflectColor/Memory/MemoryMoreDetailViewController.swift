//
//  MemoryMoreDetailViewController.swift
//  reflectColor
//
//  Created by 森杏菜 on 2024/06/23.
//

import UIKit

protocol MemoryMoreDetailViewControllerDelegate: AnyObject {
    func didUpdateMemoryDetails()
}

class MemoryMoreDetailViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    weak var delegate: MemoryMoreDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        // Do any additional setup after loading the view.
    }
    
    func setupLabel() {
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor(red: 25/255, green: 44/255, blue: 112/255, alpha: 1.0).cgColor
        label.layer.borderWidth = 2.0
        label.clipsToBounds = true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
