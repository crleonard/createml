# Getting Started with CreateML

This project contains a number of Swift Playground files to help you learn the basics of Swift. The Playgrounds have been developed to be as simple and as understanding as possible. For the best learning experince, follow the lessons in order.

## Prerequisites

What you will require to run these lessons.

* Apple Mac
* Xcode

## Guide
### Import Create ML

The first step to create the machine learning model is to import the Core ML library in the Swift Playground. We might also need some other Apple frameworks like Foundation if we are using URL. It can be simply done by using.

```
import CreateML
import Foundation
```

Now, we will get access to all the methods in the Create ML framework to train, evaluate and write the machine learning model.

### Specify Data

The next thing is to specify the data to train our model. It can be images, texts, CSV files or Tables or even Swift code. The easiest thing to do is put all the training data inside of the one directory and test data in another directory so that we can evaluate the model for accuracy. Let’s define those directories

```
let trainDirectory = URL(fileURLWithPath: "~/Desktop/TrainingData")
let testDirectory = URL(fileURLWithPath: "~/Desktop/TestData")
```


### Create the Model

Once, we got the data in the respective directories, we can create a machine learning model. This model can be then trained for accuracy. Depending on what type of data we need to train, we can access different methods e.g for image data we can use MLImageClassifier

```
let model = try MLImageClassifier(trainingData: .labeledDirectories(at: trainingDirectoty))
```

### Note:
* Text Data: We have to use MLTextClassifier
* Tabular Data: We have to use multiple inbuilt algorithms but if we want Create ML to choose the best we can use MLRegressor


### Evaluate Model
Now that, we have created our machine learning model. The next step is to evaluate the model against test data. We already created test directory where we have data that is not known to the model. We can evaluate the model using Create ML as below

```
let evaluation = model.evaluation(on: .labeledDirectories(at: testDirectory))
```

This will evaluate the model against the test data and gives the results. We can always improve accuracy by re-evaluating the model and feeding the right data.


### Save Model
Once the desired level of accuracy has been achieved then we are good to save the model. The model can be saved anywhere on the disk. We can save the created model using Swift.

```
try model.write(to: URL(fileURLWithPath: "~/Desktop/AnimalClassifier.mlmodel))
```

This will save the model on the desktop and we can use this model in the apps by dragging into the Xcode.

### Further Reading

If you want any further reading or information regarding CreateML, check out the Apple Developer Website.

* [CreateML](https://developer.apple.com/documentation/createml/)

Thanks, Chris!
