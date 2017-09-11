//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Rob"

for character in newString.characters {
  
  print(character)
  
}

let newTypeString = NSString(string: newString)   // NS (Next Step) strings have various fx's that regular strings do not have

newTypeString.substring(to: 5)  // First 5 characters

newTypeString.substring(from: 4)  // After 4th character

NSString(string: newTypeString.substring(from: 6)).substring(to: 3)

newTypeString.substring(with: NSRange(location: 6, length: 3))

if newTypeString.contains("Rob") {
  
  print("newTypeString contains Rob")
  
}

newTypeString.components(separatedBy: " ")  // gives array with separate strings between spaces

newTypeString.uppercased

newTypeString.lowercased



