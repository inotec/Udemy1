//: Playground - noun: a place where people can play

import UIKit

let number = 643

var numIsPrime: Bool = true


var i = number - 1

while i > 1 {
  
  if number % i == 0 {
    numIsPrime = false
  }
  
  i -= 1
  
}

if numIsPrime {
  print ("Prime!")
} else {
  print ("Not prime!")
}