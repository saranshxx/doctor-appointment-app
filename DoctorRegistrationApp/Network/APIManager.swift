import Foundation

class APIManager {
    static let shared = APIManager()
    
    private let baseURL = "http://199.192.26.248:8000/sap/opu/odata/sap/ZCDS_C_TEST_REGISTER_NEW_CDS/ZCDS_C_TEST_REGISTER_NEW"
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        return URLSession(configuration: config)
    }()
    
    // MARK: - Register Doctor
    func registerDoctor(_ request: RegisterRequest, completion: @escaping (Result<RegisterResponse, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("X", forHTTPHeaderField: "X-Requested-With")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.networkError(error.localizedDescription)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RegisterResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: - Get All Doctors
    func getDoctors(completion: @escaping (Result<[Doctor], NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("X", forHTTPHeaderField: "X-Requested-With")
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.networkError(error.localizedDescription)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(DoctorsListResponse.self, from: data)
                    completion(.success(response.value))
                } catch {
                    print("Decoding error: \(error)")
                    completion(.failure(.decodingError))
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: - Get Doctor by GUID
    func getDoctorById(_ guid: String, completion: @escaping (Result<Doctor, NetworkError>) -> Void) {
        let urlString = "\(baseURL)(guid'\(guid)')" 
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("X", forHTTPHeaderField: "X-Requested-With")
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.networkError(error.localizedDescription)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.serverError(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let doctor = try decoder.decode(Doctor.self, from: data)
                    completion(.success(doctor))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
        
        task.resume()
    }
}
