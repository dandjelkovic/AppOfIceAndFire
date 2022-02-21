//
//  ContentView.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 21.02.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var housesViewModel = HousesViewModel()
    @State var currentPage = 1
    
    var body: some View {
        NavigationView {
            List {
                if housesViewModel.houses.isEmpty {
                    Text("Loading...")
                        .onAppear {
                            housesViewModel.getHouses()
                        }
                } else {
                    ForEach(
                        Array(
                            zip(
                                housesViewModel.houses.indices,
                                housesViewModel.houses
                            )
                        ),
                        id: \.0) { index, house in
                            Section {
                                NavigationLink {
                                    HouseDetailView(house: house)
                                }
                                label : {
                                    HouseOverview(house: house)
                                }
                            }
                            .onAppear {
                                if housesViewModel.houses.count == index + 1 {
                                    currentPage += 1
                                    housesViewModel.getHouses(page: currentPage)
                                }
                            }
                        }
                }
            }
            .navigationBarHidden(true)
            .listStyle(.insetGrouped)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
