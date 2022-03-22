//
//  DataManager.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 20/03/2022.
//

//MARK: - Protocols
import Foundation
typealias result<T> = (Result<T, Error>) -> Void

protocol NetworkingProtocol {
    func execute<T: Decodable>(_ endpoint: String, _ session: URLSession, completion: @escaping result<T>)
}

protocol MarvelAPIDataManagerProtocol {
    var network: NetworkingProtocol { get set }
    func fetch(_ completion: @escaping (Result<MarvelResponse, Error>) -> Void)
}

final class MarvelApiDataManager: MarvelAPIDataManagerProtocol {
    var network: NetworkingProtocol = Networking()
    func fetch(_ completion: @escaping (Result<MarvelResponse, Error>) -> Void) {
        self.network.execute(URL_REQUEST, completion: completion)
    }

    
    final class Networking: NetworkingProtocol { }
}

//MARK: - Errors
enum NetworkError: Error {
    case urlError
    case redirectionError
    case clientError
    case serverError
    case parsingError
    case unknown
}

enum ApplicationError: Error {
    case connectionLost
    case applicationForceQuit
    case other
}

//MARK: - Network implementation
extension NetworkingProtocol {
    func execute<T: Decodable>(_ endpoint: String, _ session: URLSession = .shared, completion: @escaping result<T>) -> Void {
        guard let urlRequest = URL(string: endpoint) else { return }
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                switch (error as NSError).code {
                // Possible aplication errors
                case NSURLErrorNetworkConnectionLost:
                    completion(.failure(ApplicationError.connectionLost))
                    return
                case NSURLErrorCancelledReasonUserForceQuitApplication:
                    completion(.failure(ApplicationError.applicationForceQuit))
                    return
                default:
                    completion(.failure(ApplicationError.other))
                    return
                }
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...299:
                    print("Success contacting API")
                //Possible conection errors
                case 300...399:
                    completion(.failure(NetworkError.redirectionError))
                case 400...499:
                    completion(.failure(NetworkError.clientError))
                case 500...599:
                    completion(.failure(NetworkError.serverError))
                default:
                    completion(.failure(NetworkError.unknown))
                }
            }
            if let data = data {
                do {
                    // Decode data if possible else, return a ParsingError
                    let decoder = JSONDecoder()
                    let decodedObject = try decoder.decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(NetworkError.parsingError))
                }
            }
            
        }.resume()
    }
}
