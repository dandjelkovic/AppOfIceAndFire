//
//  HouseDetail.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 21.02.22.
//

import SwiftUI

struct HouseDetailView: View {
    @StateObject private var houseDetailViewModel = HouseDetailViewModel()
    var house: House

    var body: some View {
        VStack {
            Text(house.name)
                .bold()
                .font(.title)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            HStack(alignment: .top) {
                Image(systemName: "mappin.and.ellipse")
                Text(house.region)
            }
            if let overlord = houseDetailViewModel.overlord {
                HStack(alignment: .top) {
                    Image(systemName: "crown.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28)
                    Text(overlord.name)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                }
            }
            if let currentLord = houseDetailViewModel.currentLord {
                HStack(alignment: .top) {
                    Image(systemName: "crown")
                    Text(currentLord.name)
                        .multilineTextAlignment(.center)
                }
                .padding(4)
            }
            if !houseDetailViewModel.swornMembers.isEmpty {
                List {
                    Section(header: Text("Sworn Members")) {
                        ForEach(houseDetailViewModel.swornMembers, id: \.urlString) { member in
                            HStack {
                                if let culture = member.culture, !culture.isEmpty  {
                                    Text("\(member.name) of \(culture)")
                                } else {
                                    Text(member.name)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            if house.hasNoFurtherInformation {
                Text("No more known information")
            }
            Spacer()
        }
        .onAppear {
            houseDetailViewModel.getHousesDetails(house: house)
        }
    }
}

struct HouseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let house = House.preview[1]
        HouseDetailView(house: house)
    }
}
