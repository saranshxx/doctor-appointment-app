import Foundation

struct RegisterRequest: Codable {
    let name: String
    let nameUpper: String
    let phoneNo: String
    let whatsappNo: String
    let countryCode: String
    let email: String
    let gender: String
    let age: String
    let ageUnit: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case nameUpper = "NameUpper"
        case phoneNo = "PhoneNo"
        case whatsappNo = "WhatsappNo"
        case countryCode = "CountryCode"
        case email = "Email"
        case gender = "Gender"
        case age = "Age"
        case ageUnit = "AgeUnit"
    }
    
    init(name: String, email: String, gender: String, phoneNo: String = "9876543210", whatsappNo: String = "9876543210", countryCode: String = "IN", age: String = "0", ageUnit: String = "Y") {
        self.name = name
        self.nameUpper = name.uppercased()
        self.phoneNo = phoneNo
        self.whatsappNo = whatsappNo
        self.countryCode = countryCode
        self.email = email
        self.gender = gender
        self.age = age
        self.ageUnit = ageUnit
    }
}
