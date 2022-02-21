//
//  HousesViewModel.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 17.02.22.
//

import Foundation

class HousesViewModel: ObservableObject {
    @Published var houses = [House]()
    public let pageSize = 50

    func getHouses(page: Int = 1) {
        NetworkService.loadHouses(page: page, pageSize: pageSize) { houses in
            self.houses += houses
        }
    }
}
