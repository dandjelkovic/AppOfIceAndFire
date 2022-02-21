//
//  NetworkService.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 17.02.22.
//

import Foundation

enum NetworkService {

    private static let housesEndpoint = "https://anapioficeandfire.com/api/houses/"

    static func loadHouses(page: Int = 1, pageSize: Int, completion: @escaping ([House]) -> Void) {
        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "pageSize", value: "50")
        ]
        var urlComponents = URLComponents(string: housesEndpoint)!
        urlComponents.queryItems = queryItems
        let url = urlComponents.url!
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                dump(error)
                return
            }

            if let data = data {
                do {
                    let houses = try JSONDecoder().decode([House].self, from: data)
                    DispatchQueue.main.async {
                        completion(houses)
                    }
                }
                catch let error {
                    dump(error)
                }
            }
        }.resume()
    }

    static func loadCharacter(urlString: String, completion: @escaping ((Character?) -> Void)) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                dump(error)
                return
            }

            if let data = data {
                do {
                    let character = try JSONDecoder().decode(Character.self, from: data)
                    DispatchQueue.main.async {
                        completion(character)
                    }
                }
                catch let error {
                    dump(error)
                }
            }
        }.resume()
    }
}
