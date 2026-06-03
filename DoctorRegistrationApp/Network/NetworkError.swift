import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidRequest
    case invalidResponse
    case decodingError
    case serverError(Int)
    case networkError(String)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .invalidRequest:
            return "The request could not be created."
        case .invalidResponse:
            return "The server response was invalid."
        case .decodingError:
            return "Failed to decode the response."
        case .serverError(let code):
            return "Server error: \(code)"
        case .networkError(let message):
            return "Network error: \(message)"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
