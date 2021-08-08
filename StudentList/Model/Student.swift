//
//  Student.swift
//  StudentList
//
//  Created by Stanfield on 7/5/21.
//

import Foundation

//Very simple model class, very focused. Stores information about a student. That's all we need.
class Student {
    
    init(firstName: String, lastName: String, age: Int) {
        //Set the properties
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    let firstName: String
    let lastName: String
    let age: Int
}

extension Student: Equatable {}

func ==(lhs: Student, rhs: Student) -> Bool {
    if lhs.firstName != rhs.firstName { return false }
    if lhs.lastName != rhs.lastName { return false }
    if lhs.age != rhs.age { return false }
    
    return true
}
