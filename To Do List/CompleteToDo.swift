//
//  CompleteToDo.swift
//  To Do List
//
//  Created by Kate Zhang on 6/11/21.
//

import UIKit

class CompleteToDo: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo: ToDoCD?
    
    var isLight = ToDoTableViewController.isLight
    
    @IBOutlet weak var titleToDo: UILabel!
    
    @IBOutlet weak var noteToDo: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLight{
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
            titleToDo.textColor = .white
            noteToDo.textColor = .white
        }
        
        completeButton.layer.cornerRadius = 7
        
        titleToDo.text = selectedToDo?.name
        noteToDo.text = selectedToDo?.note
        
        noteToDo.sizeToFit()
    }
    
    
    @IBAction func completeTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
    }
    
}
