import Foundation

struct Doctor: Codable {
    let id: String?
    let name: String?
    let email: String?
    let gender: String?
    let phoneNo: String?
    let age: String?
    let practicingMonth: String?
    let practicingYear: String?
    let guid: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case email = "Email"
        case gender = "Gender"
        case phoneNo = "PhoneNo"
        case age = "Age"
        case practicingMonth = "PracticingMonth"
        case practicingYear = "PracticingYear"
        case guid = "GUID"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        email = try? container.decode(String.self, forKey: .email)
        gender = try? container.decode(String.self, forKey: .gender)
        phoneNo = try? container.decode(String.self, forKey: .phoneNo)
        age = try? container.decode(String.self, forKey: .age)
        practicingMonth = try? container.decode(String.self, forKey: .practicingMonth)
        practicingYear = try? container.decode(String.self, forKey: .practicingYear)
        guid = try? container.decode(String.self, forKey: .guid)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(phoneNo, forKey: .phoneNo)
        try container.encodeIfPresent(age, forKey: .age)
        try container.encodeIfPresent(practicingMonth, forKey: .practicingMonth)
        try container.encodeIfPresent(practicingYear, forKey: .practicingYear)
        try container.encodeIfPresent(guid, forKey: .guid)
    }
}

struct DoctorsListResponse: Codable {
    let value: [Doctor]
}
