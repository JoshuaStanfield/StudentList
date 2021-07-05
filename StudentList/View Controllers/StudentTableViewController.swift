//
//  StudentTableViewController.swift
//  StudentList
//
//  Created by Stanfield on 7/5/21.
//

import UIKit

class StudentTableViewController: UITableViewController {

    // MARK: - Table view data source

    /*
     DELETE because the default will just return 1 anyway by default.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This func is a good example of MVC. The view asks this viewController to get data from the model.
        // #warning Incomplete implementation, return the number of rows. Each row will be a student.
        //How many students are there? Well, it's the modelController that is maintaining how many students there are, so we need to ask the modelController for that information.
        return StudentController.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Asks the modelController (aka data source) for the data to configure the cell. In our case, it asks the modelController for the Student information.
        //This is another example of the View asking the viewController (here) to get information from the model/modelController.
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) //identifier MUST match.
        // Configure the cell here...
        //First get the student.
        let student = StudentController.students[indexPath.row]
        
        //Then assign the student information to the cell.
        cell.textLabel?.text = student.firstName + " " + student.lastName
        
        return cell
    }

    
    // MARK: - Navigation

     //To create the segue, you technically don't need any code to do that. BUT to pass information to the next screen you WILL need the following code to pass that data  from one viewController to the next.
    //ALWAYS CALLED ON THE SOURCE VIEWCONTROLLER, RIGHT BEFORE THE SEGUE.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //We need to know which row was tapped. A guard is placed because this is optional.
        guard let tappedIndexPath = tableView.indexPathForSelectedRow else {return}
        
        //Now get the specific student from the modelController for related tapped cell.
        let student = StudentController.students[tappedIndexPath.row]
        
        //We need to be able to access the next ViewController so we can pass the information there. The "segue" property in the above "prepare(for segue:" function has a property to get data from the next VC.
        //segue.destination grabs the next VC as a generic VC, and then we 'cast' it as the specific VC we need it to be.
        //We'll use a conditional cast just in case the destination VC isn't a StudentDetailVC.
        if let detailVC = segue.destination as? StudentDetailViewController {
            // This is a hand off. The TableViewVC (this VC) knows what was tapped and gets the information that will populate the next VC from the modelVC. Then that information is passed to the next VC which is already setup.
            // That next VC accesses the properties of the modelController via this VC. The modelController is what tells the next VC what to populate its fields with.
            // BUT DO NOT SET THE PROPERTIES HERE, this VC should not modify the properties of another view/viewController.
            detailVC.student = student
        }
    }
}
