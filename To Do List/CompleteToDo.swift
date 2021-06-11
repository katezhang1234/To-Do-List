//
//  CompleteToDo.swift
//  To Do List
//
//  Created by Kate Zhang on 6/11/21.
//

import UIKit

class CompleteToDo: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
    
    var isLight = ToDoTableViewController.isLight
    
    @IBOutlet weak var titleToDo: UILabel!
    
    @IBOutlet weak var noteToDo: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completeButton.layer.cornerRadius = 7
        
        titleToDo.text = selectedToDo.name
        noteToDo.text = selectedToDo.note
        
        if isLight{
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
            titleToDo.textColor = .white
            noteToDo.textColor = .white
        }
    }
    
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
