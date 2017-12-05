//: Playground - noun: a place where people can play

import UIKit

//Compare the Triplets
let alice = [5, 6, 7]
let bob = [3, 6, 10]

var aliceScore = 0
var bobScore = 0

for idx in alice {
    if alice[idx] > bob[idx] {
        aliceScore += 1
    }
    if alice[idx] < bob[idx]{
        bobScore += 1
    }
}


