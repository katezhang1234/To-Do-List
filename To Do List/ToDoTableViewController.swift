//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by Kate Zhang on 6/11/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    static var isLight = true
    
    @IBAction func lightTapped(_ sender: Any) {
        if ToDoTableViewController.isLight{
            ToDoTableViewController.isLight = false
            overrideUserInterfaceStyle = .dark
        }else{
            ToDoTableViewController.isLight = true
            overrideUserInterfaceStyle = .light
        }
    }
    
    
    var toDos : [ToDo] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame:.zero)

        toDos = createToDos()
    }
    
    
    func createToDos() -> [ToDo] {
        let swift = ToDo()
            swift.name = "Learn Swift"
            swift.note = "I will learn the basics of Swift by next Tuesday"
            swift.important = true
        let dog = ToDo()
            dog.name = "Walk the Dog"
            dog.note = "Walk the dog twice today, once in the morning, once in the evening"
        return [swift, dog]
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "💥 " + toDo.name
          } else {
            cell.textLabel?.text = toDo.name
          }

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let toDo = toDos[indexPath.row]
      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDo{
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDo{
            if let toDo = sender as? ToDo {
              completeVC.selectedToDo = toDo
              completeVC.previousVC = self
            }
          }
    }

}
