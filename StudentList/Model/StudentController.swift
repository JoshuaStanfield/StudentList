//
//  StudentController.swift
//  StudentList
//
//  Created by Stanfield on 7/5/21.
//

import Foundation

class StudentController {
    //Provides a list of students. This is VERY simplified for learning's sake. More detials to come. The purpose here is to maintain a list of Students or model objects.
    
    //Singleton
    static var students: [Student] {
        return[
        Student(firstName: "Josh", lastName: "Stanfield", age: 32),
        Student(firstName: "Naomi", lastName: "Stanfield", age: 33),
        Student(firstName: "Hiro", lastName: "Stanfield", age: 1)
        ]
    }
    
}
