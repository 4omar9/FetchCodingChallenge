import Foundation

struct Recipe: Decodable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case thumb = "strMealThumb"
    }
    let name: String
    let id: String
    let thumb: URL
}

struct RecipesResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
    let recipes: [Recipe]
}

