import UIKit

class ResultsViewController: UIViewController {
  @IBOutlet var totalLabel: UILabel!
  @IBOutlet var settingsLabel: UILabel!
  
  var numberOfPeople: String = ""
  var tipPercentage: String = ""
  var calculatedResult: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      totalLabel.text = calculatedResult
      settingsLabel.text = "Split between \(numberOfPeople), with \(tipPercentage) tip."
    }
    
  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
}
