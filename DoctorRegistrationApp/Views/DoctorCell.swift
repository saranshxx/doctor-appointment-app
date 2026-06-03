import UIKit

class DoctorCell: UITableViewCell {
    
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let genderLabel = UILabel()
    private let practicingLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.05
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        contentView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        setupLabel(nameLabel, fontSize: 18, weight: .semibold)
        setupLabel(emailLabel, fontSize: 14, weight: .regular)
        setupLabel(genderLabel, fontSize: 14, weight: .regular)
        setupLabel(practicingLabel, fontSize: 14, weight: .regular)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, genderLabel, practicingLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fill
        containerView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupLabel(_ label: UILabel, fontSize: CGFloat, weight: UIFont.Weight) {
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = .black
        label.numberOfLines = 0
    }
    
    func configure(with doctor: Doctor) {
        nameLabel.text = doctor.name ?? "N/A"
        emailLabel.text = "📧 \(doctor.email ?? "N/A")"
        genderLabel.text = "👤 \(doctor.gender ?? "N/A")"
        practicingLabel.text = "📅 \(doctor.practicingMonth ?? "N/A")/\(doctor.practicingYear ?? "N/A")"
    }
}
