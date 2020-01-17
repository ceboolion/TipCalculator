import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  
  var tip = 0.10
  var resultTwoDecimal: String = ""
  var percentage: String = ""
  
  override func viewDidLoad() {
    
  }
  
  @IBAction func tipChanged(_ sender: UIButton) {
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    sender.isSelected = true
    let buttonTitle = sender.currentTitle!
    let buttonTitleMinusPercentageSign = String(buttonTitle.dropLast())
    let buttonTitleAsNumber = Double(buttonTitleMinusPercentageSign)
    tip = buttonTitleAsNumber! / 100
    print(tip)
    billTextField.endEditing(true)
    percentage = sender.currentTitle!
  }
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    sender.autorepeat = true
    sender.wraps = true
    sender.maximumValue = 12
    splitNumberLabel.text = String(Int(sender.value))
  }
  @IBAction func calculatePressed(_ sender: UIButton) {
    print(splitNumberLabel.text!)
    let billAmount = Double(billTextField.text!)
    let split = Double(splitNumberLabel.text!)
    let result = ((billAmount! * tip) + billAmount!) / split!
    resultTwoDecimal = String(format: "%.2f", result)
    print(resultTwoDecimal)
    
    self.performSegue(withIdentifier: "resultSegue", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "resultSegue" {
      let destinationVC = segue.destination as? ResultsViewController
      destinationVC?.numberOfPeople = splitNumberLabel.text ?? ""
      destinationVC?.tipPercentage = String(percentage)
      destinationVC?.calculatedResult = resultTwoDecimal
    }
  }
  
}
