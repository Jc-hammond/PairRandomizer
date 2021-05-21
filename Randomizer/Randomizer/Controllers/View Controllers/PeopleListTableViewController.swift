//
//  PeopleListTableViewController.swift
//  Randomizer
//
//  Created by Connor Hammond on 5/21/21.
//

import UIKit

class PeopleListTableViewController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Properties
    let headerTitles = ["Group 1", "Group 2", "Group 3", "Group 4"]
    
    //MARK: - Functions
    func updateViews() {
        PersonController.shared.fetchPerson()
        tableView.reloadData()
    }
    
    //MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Person", message: "Enter Name Here:", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
       
        alertController.addTextField { textField in
            textField.placeholder = "First & Last Name"
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            guard let nameText = alertController.textFields?.first?.text, !nameText.isEmpty else {return}
            PersonController.shared.createPerson(name: nameText)
            self.updateViews()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(doneAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func randomButtonTapped(_ sender: Any) {
        PersonController.shared.randomize()
        tableView.reloadData()
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.people.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        //need to populate pair1 arrays to populate each section with a given pair
        let person = PersonController.shared.people[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
  //JCH- section titles
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //deleting works if sectioning is commented out
            let personToDelete = PersonController.shared.people[indexPath.row] //JCH-add sectioning
            PersonController.shared.deletePerson(personToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


} //End of class
