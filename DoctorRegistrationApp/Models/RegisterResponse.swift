import Foundation

struct RegisterResponse: Codable {
    let id: String?
    let name: String?
    let email: String?
    let gender: String?
    let guid: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case email = "Email"
        case gender = "Gender"
        case guid = "GUID"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        email = try? container.decode(String.self, forKey: .email)
        gender = try? container.decode(String.self, forKey: .gender)
        guid = try? container.decode(String.self, forKey: .guid)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(guid, forKey: .guid)
    }
}
