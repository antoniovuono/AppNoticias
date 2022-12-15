//
//  NetworkManager.swift
//  AppNoticias
//
//  Created by Antonio Vuono on 14/12/22.
//

import Foundation

//Enum de mapeamento de erros:
enum ResultNewsError: Error {
    case badURL, noData, invalidJSON
}

// Criamos a classe que vai fazer a gestão da batida na api
class NetworkManager {
    // instanciamos a classe
    static let shared = NetworkManager()
    
    // Criamos uma strutct que vai configurar a url que vamos bater
    struct Constans {
        static let newsAPI = URL(string: "http://localhost:8080/home")
    }
    
    // vamos inicializar
    private init() {}
    
    // Criamos a função de configuração e nela passamos o completion que é sucesso ou erro com o erro mapeado no enum
    func getNews(completion: @escaping (Result<[ResultNews], ResultNewsError>) -> Void) {
        
        //Setup the url
        guard let url = Constans.newsAPI else {
            completion(.failure(.badURL))
            return
        }
        //Create a configuration form this endpoint
        let configuration = URLSessionConfiguration.default
        
        //Create a session
        let session = URLSession(configuration: configuration)
        
        // Create the task
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let data else {
                completion(.failure(.invalidJSON))
               return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseElement.self, from: data)
                completion(.success(result.home.results))
            } catch {
                print("Error info: ==> \(error.localizedDescription)")
                completion(.failure(.noData))
            }
        }
        
        task.resume()
    }
}
