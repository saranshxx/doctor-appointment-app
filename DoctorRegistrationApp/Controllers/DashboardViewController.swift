import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var healthBannerView: UIView!
    @IBOutlet weak var healthBannerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var doctorName: String = "Doctor"
    
    private let actions = [
        ("Scan", "qrcode.viewfinder"),
        ("Vaccine", "syringe"),
        ("My Bookings", "calendar"),
        ("Clinic", "building.2"),
        ("Ambulance", "car"),
        ("Nurse", "person")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Dashboard"
    }
    
    // MARK: - Setup
    private func setupUI() {
        greetingLabel.text = "Hello,\nDr. \(doctorName)"
        greetingLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        greetingLabel.textColor = .black
        greetingLabel.numberOfLines = 0
        
        setupSearchBar()
        setupHealthBanner()
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Search health services"
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .white
        searchBar.delegate = self
    }
    
    private func setupHealthBanner() {
        healthBannerView.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 0.96, alpha: 1.0)
        healthBannerView.layer.cornerRadius = 12
        healthBannerView.clipsToBounds = true
        
        healthBannerLabel.text = "📋 Complete your health checkup for a healthier you"
        healthBannerLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        healthBannerLabel.textColor = .white
        healthBannerLabel.numberOfLines = 0
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DashboardActionCell.self, forCellWithReuseIdentifier: "DashboardActionCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width - 32) / 2, height: 150)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardActionCell", for: indexPath) as! DashboardActionCell
        let action = actions[indexPath.item]
        cell.configure(title: action.0, iconName: action.1)
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension DashboardViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
