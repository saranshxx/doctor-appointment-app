import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var othersButton: UIButton!
    
    @IBOutlet weak var monthPicker: UIPickerView!
    @IBOutlet weak var yearPicker: UIPickerView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    // MARK: - Properties
    private var selectedGender: String = "M"
    private var selectedMonth: String = "01"
    private var selectedYear: String = String(Calendar.current.component(.year, from: Date()))
    
    private let months = Array(1...12).map { String(format: "%02d", $0) }
    private let years = Array((2000...2026)).map { String($0) }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPickerViews()
        setupTextFieldDelegates()
    }
    
    // MARK: - Setup
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        progressLabel.text = "Step 2/4"
        progressLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        progressLabel.textColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        
        titleLabel.text = "Basic Details"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .black
        
        subtitleLabel.text = "Feel free to fill your details"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        
        setupTextField(fullNameTextField, placeholder: "Full Name")
        setupTextField(emailTextField, placeholder: "Email ID")
        
        setupGenderButton(maleButton)
        setupGenderButton(femaleButton)
        setupGenderButton(othersButton)
        
        setupNextButton()
        setupLoadingSpinner()
    }
    
    private func setupTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(white: 0.9, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
    }
    
    private func setupGenderButton(_ button: UIButton) {
        button.layer.borderColor = UIColor(white: 0.9, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = .white
    }
    
    private func setupNextButton() {
        nextButton.layer.cornerRadius = nextButton.frame.size.width / 2
        nextButton.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.tintColor = .white
        nextButton.clipsToBounds = true
    }
    
    private func setupLoadingSpinner() {
        loadingSpinner.color = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        loadingSpinner.hidesWhenStopped = true
    }
    
    private func setupPickerViews() {
        monthPicker.delegate = self
        monthPicker.dataSource = self
        yearPicker.delegate = self
        yearPicker.dataSource = self
        
        if let defaultYearIndex = years.firstIndex(of: selectedYear) {
            yearPicker.selectRow(defaultYearIndex, inComponent: 0, animated: false)
        }
    }
    
    private func setupTextFieldDelegates() {
        fullNameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    // MARK: - Gender Selection
    @IBAction func selectMale(_ sender: UIButton) {
        selectedGender = "M"
        updateGenderButtonAppearance()
    }
    
    @IBAction func selectFemale(_ sender: UIButton) {
        selectedGender = "F"
        updateGenderButtonAppearance()
    }
    
    @IBAction func selectOthers(_ sender: UIButton) {
        selectedGender = "O"
        updateGenderButtonAppearance()
    }
    
    private func updateGenderButtonAppearance() {
        [maleButton, femaleButton, othersButton].forEach { $0?.backgroundColor = .white }
        [maleButton, femaleButton, othersButton].forEach { $0?.setTitleColor(.black, for: .normal) }
        
        switch selectedGender {
        case "M":
            maleButton.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
            maleButton.setTitleColor(.white, for: .normal)
        case "F":
            femaleButton.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
            femaleButton.setTitleColor(.white, for: .normal)
        case "O":
            othersButton.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
            othersButton.setTitleColor(.white, for: .normal)
        default:
            break
        }
    }
    
    // MARK: - Validation
    private func validateForm() -> Bool {
        guard let name = fullNameTextField.text, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert(title: "Validation Error", message: "Please enter your full name")
            return false
        }
        
        guard let email = emailTextField.text, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert(title: "Validation Error", message: "Please enter your email ID")
            return false
        }
        
        if !isValidEmail(email) {
            showAlert(title: "Validation Error", message: "Please enter a valid email address")
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Next Button Action
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard validateForm() else { return }
        
        loadingSpinner.startAnimating()
        nextButton.isEnabled = false
        
        let request = RegisterRequest(
            name: fullNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            gender: selectedGender
        )
        
        APIManager.shared.registerDoctor(request) { [weak self] result in
            self?.loadingSpinner.stopAnimating()
            self?.nextButton.isEnabled = true
            
            switch result {
            case .success(let response):
                if let guid = response.guid {
                    self?.navigateToDoctorsList(guid: guid)
                } else {
                    self?.showAlert(title: "Success", message: "Registration completed successfully!")
                    self?.navigateToDoctorsList(guid: response.id ?? "")
                }
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.errorDescription ?? "Registration failed")
            }
        }
    }
    
    private func navigateToDoctorsList(guid: String) {
        if let doctorsListVC = storyboard?.instantiateViewController(withIdentifier: "DoctorsListViewController") as? DoctorsListViewController {
            doctorsListVC.registeredDoctorGUID = guid
            navigationController?.pushViewController(doctorsListVC, animated: true)
        }
    }
}

// MARK: - UIPickerViewDelegate & DataSource
extension RegistrationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == monthPicker {
            return months.count
        } else {
            return years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == monthPicker {
            return "Month \(months[row])"
        } else {
            return years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == monthPicker {
            selectedMonth = months[row]
        } else {
            selectedYear = years[row]
        }
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
