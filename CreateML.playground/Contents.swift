// Copyright Chris Leonard

// To Automate
//#!/usr/bin/swift

import Foundation
import CreateML

// Directory setup for Train & Test data

let trainDirectory = URL(fileURLWithPath: "~/Desktop/TrainingData")
let testDirectory = URL(fileURLWithPath: "~/Desktop/TestData")

let model = try MLImageClassifier(trainingData: .labeledDirectories(at: trainDirectory))

let evaluation = model.evaluation(on: .labeledDirectories(at: testDirectory))

try model.write(to: URL(fileURLWithPath: "~/Desktop/AnimalClassifier.mlmodel))
