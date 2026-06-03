import UIKit

class DoctorsListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    // MARK: - Properties
    var registeredDoctorGUID: String?
    private var doctors: [Doctor] = []
    private var refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupRefreshControl()
        fetchDoctors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Doctors List"
        navigationItem.hidesBackButton = false
    }
    
    // MARK: - Setup
    private func setupUI() {
        loadingSpinner.color = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        loadingSpinner.hidesWhenStopped = true
        
        emptyStateLabel.text = "No doctors found"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        emptyStateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emptyStateLabel.isHidden = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DoctorCell.self, forCellReuseIdentifier: "DoctorCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshDoctors), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - Fetch Doctors
    private func fetchDoctors() {
        loadingSpinner.startAnimating()
        emptyStateLabel.isHidden = true
        
        APIManager.shared.getDoctors { [weak self] result in
            self?.loadingSpinner.stopAnimating()
            self?.refreshControl.endRefreshing()
            
            switch result {
            case .success(let doctors):
                self?.doctors = doctors
                self?.tableView.reloadData()
                self?.emptyStateLabel.isHidden = !doctors.isEmpty
            case .failure(let error):
                self?.showAlert(title: "Error", message: error.errorDescription ?? "Failed to fetch doctors")
                self?.emptyStateLabel.isHidden = false
                self?.emptyStateLabel.text = "Failed to load doctors. Please try again."
            }
        }
    }
    
    @objc private func refreshDoctors() {
        fetchDoctors()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDoctorDetails", let doctorDetailsVC = segue.destination as? DoctorDetailsViewController, let indexPath = tableView.indexPathForSelectedRow {
            let selectedDoctor = doctors[indexPath.row]
            doctorDetailsVC.doctorGUID = selectedDoctor.guid ?? ""
        }
    }
    
    // MARK: - Alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDelegate & DataSource
extension DoctorsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorCell
        let doctor = doctors[indexPath.row]
        cell.configure(with: doctor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDoctorDetails", sender: self)
    }
}
