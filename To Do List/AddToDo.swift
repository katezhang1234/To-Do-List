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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            if let noteText = noteTextField.text{
                toDo.note = noteText
            }

            try? context.save()
            navigationController?.popViewController(animated: true)
          }
    }

}
