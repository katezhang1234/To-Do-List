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
    
    
    var toDos : [ToDoCD] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame:.zero)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name{
            cell.textLabel?.text = "💥 " + name
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
            if let toDo = sender as? ToDoCD {
              completeVC.selectedToDo = toDo
              completeVC.previousVC = self
            }
          }
    }


    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
            }
          }
    }

}
