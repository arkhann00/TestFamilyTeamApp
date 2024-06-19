import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name, status, species: String
    let type:String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}
