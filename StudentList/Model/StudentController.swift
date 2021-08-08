//
//  StudentController.swift
//  StudentList
//
//  Created by Stanfield on 7/5/21.
//

import Foundation

class StudentController {
    //Provides a list of students. This is VERY simplified for learning's sake. More detials to come. The purpose here is to maintain a list of Students or model objects.
    
    init() {
        self.students = [
        Student(firstName: "Josh", lastName: "Stanfield", age: 32),
        Student(firstName: "Naomi", lastName: "Stanfield", age: 33),
        Student(firstName: "Hiro", lastName: "Stanfield", age: 1)
        ]
    }
    
    //CRUD
    func create(studentWithFirstName firstName: String, lastName: String, age: Int) -> Student {
        let student = Student(firstName: firstName, lastName: lastName, age: age)
        
        self.students.append(student)
        return student
    }
    
    func delete(student: Student) {
        if let index = self.students.index(where: { $0 == student }) {
            self.students.remove(at: index)
        }
    }
    
    var students: [Student]
}
