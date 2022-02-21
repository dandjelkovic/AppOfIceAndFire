//
//  House.swift
//  AppOfIceAndFire
//
//  Created by Dalibor Andjelkovic on 17.02.22.
//

import Foundation

struct House: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case region
        case currentLordURLString = "currentLord"
        case overlordURLString = "overlord"
        case words
        case urlString = "url"
        case swornMembers
    }
    var name: String
    var region: String
    var currentLordURLString: String
    var overlordURLString: String
    var words: String
    var urlString: String
    var swornMembersURLArray = [String]()
    var hasNoFurtherInformation = false

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        region = try container.decode(String.self, forKey: .region)
        currentLordURLString = try container.decode(String.self, forKey: .currentLordURLString)
        overlordURLString = try container.decode(String.self, forKey: .overlordURLString)
        words = try container.decode(String.self, forKey: .words)
        urlString = try container.decode(String.self, forKey: .urlString)
        swornMembersURLArray = try container.decode([String].self, forKey: .swornMembers)
        
        if currentLordURLString.isEmpty
            && overlordURLString.isEmpty
            && swornMembersURLArray.isEmpty
            && region.isEmpty
        {
            hasNoFurtherInformation = true
        }
    }
}

extension House {
    static var preview: [House] {
        var jsonString: String { """
            [
                {
                    "url": "https://anapioficeandfire.com/api/houses/1",
                    "name": "House Algood",
                    "region": "The Westerlands",
                    "coatOfArms": "A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)",
                    "words": "",
                    "titles": [
                        ""
                    ],
                    "seats": [
                        ""
                    ],
                    "currentLord": "",
                    "heir": "",
                    "overlord": "https://anapioficeandfire.com/api/houses/229",
                    "founded": "",
                    "founder": "",
                    "diedOut": "",
                    "ancestralWeapons": [
                        ""
                    ],
                    "cadetBranches": [],
                    "swornMembers": []
                },
                {
                    "url": "https://anapioficeandfire.com/api/houses/2",
                    "name": "House Allyrion of Godsgrace",
                    "region": "Dorne",
                    "coatOfArms": "Gyronny Gules and Sable, a hand couped Or",
                    "words": "No Foe May Pass",
                    "titles": [
                        ""
                    ],
                    "seats": [
                        "Godsgrace"
                    ],
                    "currentLord": "https://anapioficeandfire.com/api/characters/298",
                    "heir": "https://anapioficeandfire.com/api/characters/1922",
                    "overlord": "https://anapioficeandfire.com/api/houses/285",
                    "founded": "",
                    "founder": "",
                    "diedOut": "",
                    "ancestralWeapons": [
                        ""
                    ],
                    "cadetBranches": [],
                    "swornMembers": [
                        "https://anapioficeandfire.com/api/characters/298",
                        "https://anapioficeandfire.com/api/characters/1129",
                        "https://anapioficeandfire.com/api/characters/1301",
                        "https://anapioficeandfire.com/api/characters/1922"
                    ]
                },
                {
                    "url": "https://anapioficeandfire.com/api/houses/3",
                    "name": "House Amber",
                    "region": "The North",
                    "coatOfArms": "",
                    "words": "",
                    "titles": [
                        ""
                    ],
                    "seats": [
                        ""
                    ],
                    "currentLord": "",
                    "heir": "",
                    "overlord": "",
                    "founded": "",
                    "founder": "",
                    "diedOut": "",
                    "ancestralWeapons": [
                        ""
                    ],
                    "cadetBranches": [],
                    "swornMembers": []
                }
            ]
            """
        }
        let houses = try! JSONDecoder().decode([House].self, from: jsonString.data(using: .utf8)!)
        return houses 
    }
}
