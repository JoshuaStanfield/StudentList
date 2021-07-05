//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Stanfield on 7/5/21.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    //Lifecycle of a VC. Set the student before the view is loaded and then the guard fails and the labels are never set. This viewDidLoad sets the labels as soon as the view is loaded.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        //guard let statement is unwrapping an optional (?).
        //isViewLoaded - this will make sure that the view is loaded and won't leave any labels empty once the view is loaded.
        // return nothing if there is an error.
        guard let student = student, isViewLoaded else {return}
        
        firstNameLabel.text = student.firstName
        lastNameLabel.text = student.lastName
        ageLabel.text = "\(student.age)" //Changes the Int to a String.
    }
    
    //This will be called any time the Student variable/property is changed.
    var student: Student? {
        didSet {
            //Every time the student property is changed, we want to update our views.
                updateViews()
        }
    }
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
}
