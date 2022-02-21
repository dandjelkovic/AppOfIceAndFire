//
//  HouseDetailViewModel.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 21.02.22.
//

import Foundation

class HouseDetailViewModel: ObservableObject {
    @Published var currentLord: Character?
    @Published var overlord: Character?
    @Published var swornMembers = [Character]()
    
    func getHousesDetails(house: House) {
        NetworkService.loadCharacter(urlString: house.currentLordURLString) { currentLord in
            self.currentLord = currentLord
        }
        NetworkService.loadCharacter(urlString: house.overlordURLString) { overlord in
            self.overlord = overlord
        }
        house.swornMembersURLArray.forEach {
            NetworkService.loadCharacter(urlString: $0) { member in
                if let character = member {
                    self.swornMembers.append(character)
                }
            }
        }
    }
}
