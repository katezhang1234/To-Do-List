//
//  AddToDo.swift
//  To Do List
//
//  Created by Kate Zhang on 6/11/21.
//

import UIKit

class AddToDo: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    var isLight = ToDoTableViewController.isLight
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var addButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLight{
            overrideUserInterfaceStyle = .light
        }else{
            overrideUserInterfaceStyle = .dark
        }
        
        addButton.layer.cornerRadius = 7
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let toDo = ToDo()

        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        
        if let noteText = noteTextField.text{
            toDo.note = noteText
        }
        
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }*/

}
