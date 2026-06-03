import UIKit

class DoctorDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var practicingLabel: UILabel!
    @IBOutlet weak var guidLabel: UILabel!
    @IBOutlet weak var dashboardButton: UIButton!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    // MARK: - Properties
    var doctorGUID: String = ""
    private var doctor: Doctor?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchDoctorDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Doctor Details"
    }
    
    // MARK: - Setup
    private func setupUI() {
        loadingSpinner.color = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        loadingSpinner.hidesWhenStopped = true
        
        setupLabel(nameLabel)
        setupLabel(emailLabel)
        setupLabel(genderLabel)
        setupLabel(phoneLabel)
        setupLabel(ageLabel)
        setupLabel(practicingLabel)
        setupLabel(guidLabel)
        
        setupDashboardButton()
    }
    
    private func setupLabel(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
    }
    
    private func setupDashboardButton() {
        dashboardButton.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        dashboardButton.setTitleColor(.white, for: .normal)
        dashboardButton.layer.cornerRadius = 8
        dashboardButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    // MARK: - Fetch Doctor Details
    private func fetchDoctorDetails() {
        loadingSpinner.startAnimating()
        
        APIManager.shared.getDoctorById(doctorGUID) { [weak self] result in
            self?.loadingSpinner.stopAnimating()
            
            switch result {
            case .success(let doctor):
                self?.doctor = doctor
                self?.populateUI(with: doctor)
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.errorDescription ?? "Failed to fetch doctor details")
            }
        }
    }
    
    private func populateUI(with doctor: Doctor) {
        nameLabel.text = "Name: \(doctor.name ?? "N/A")"
        emailLabel.text = "Email: \(doctor.email ?? "N/A")"
        genderLabel.text = "Gender: \(doctor.gender ?? "N/A")"
        phoneLabel.text = "Phone: \(doctor.phoneNo ?? "N/A")"
        ageLabel.text = "Age: \(doctor.age ?? "N/A")"
        practicingLabel.text = "Practicing: \(doctor.practicingMonth ?? "N/A")/\(doctor.practicingYear ?? "N/A")"
        guidLabel.text = "GUID: \(doctor.guid ?? "N/A")"
    }
    
    // MARK: - Dashboard Action
    @IBAction func openDashboard(_ sender: UIButton) {
        if let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController {
            if let doctor = doctor {
                dashboardVC.doctorName = doctor.name ?? "Dr."
            }
            navigationController?.pushViewController(dashboardVC, animated: true)
        }
    }
    
    // MARK: - Alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
