//
//  HouseOverview.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 21.02.22.
//

import SwiftUI

struct HouseOverview: View {
    var house: House
    var body: some View {
        VStack {
            Text(house.name)
                .bold()
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            if !house.words.isEmpty {
                Text(house.words)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct HouseOverview_Previews: PreviewProvider {
    static var previews: some View {
        let housePreview = House.preview
        HouseOverview(house: housePreview[2])
            .previewLayout(.fixed(width: 320, height: 80))
    }
}
