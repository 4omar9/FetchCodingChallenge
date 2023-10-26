import Foundation

struct RecipeDetailsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
    let recipes: [RecipeDetails]
}

struct RecipeDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumb = "strMealThumb"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
    let id: String
    let name: String
    let thumb: URL
    let instructions: String
    var ingredients: [Ingredient] {
        let list: [Ingredient] = [
            .init(ingredient1 ?? "", measure1 ?? ""),
            .init(ingredient2 ?? "", measure2 ?? ""),
            .init(ingredient3 ?? "", measure3 ?? ""),
            .init(ingredient4 ?? "", measure4 ?? ""),
            .init(ingredient5 ?? "", measure5 ?? ""),
            .init(ingredient6 ?? "", measure6 ?? ""),
            .init(ingredient7 ?? "", measure7 ?? ""),
            .init(ingredient8 ?? "", measure8 ?? ""),
            .init(ingredient9 ?? "", measure9 ?? ""),
            .init(ingredient10 ?? "", measure10 ?? ""),
            .init(ingredient11 ?? "", measure11 ?? ""),
            .init(ingredient12 ?? "", measure12 ?? ""),
            .init(ingredient13 ?? "", measure13 ?? ""),
            .init(ingredient14 ?? "", measure14 ?? ""),
            .init(ingredient15 ?? "", measure15 ?? ""),
            .init(ingredient16 ?? "", measure16 ?? ""),
            .init(ingredient17 ?? "", measure17 ?? ""),
            .init(ingredient18 ?? "", measure18 ?? ""),
            .init(ingredient19 ?? "", measure19 ?? ""),
            .init(ingredient20 ?? "", measure20 ?? "")
        ]
        return list.filter { !$0.ingredient.isEmpty && !$0.measure.isEmpty }
    }

    private let ingredient1: String?
    private let ingredient2: String?
    private let ingredient3: String?
    private let ingredient4: String?
    private let ingredient5: String?
    private let ingredient6: String?
    private let ingredient7: String?
    private let ingredient8: String?
    private let ingredient9: String?
    private let ingredient10: String?
    private let ingredient11: String?
    private let ingredient12: String?
    private let ingredient13: String?
    private let ingredient14: String?
    private let ingredient15: String?
    private let ingredient16: String?
    private let ingredient17: String?
    private let ingredient18: String?
    private let ingredient19: String?
    private let ingredient20: String?
    private let measure1: String?
    private let measure2: String?
    private let measure3: String?
    private let measure4: String?
    private let measure5: String?
    private let measure6: String?
    private let measure7: String?
    private let measure8: String?
    private let measure9: String?
    private let measure10: String?
    private let measure11: String?
    private let measure12: String?
    private let measure13: String?
    private let measure14: String?
    private let measure15: String?
    private let measure16: String?
    private let measure17: String?
    private let measure18: String?
    private let measure19: String?
    private let measure20: String?


    init(id: String, name: String, thumb: URL) {
        self.id = id
        self.name = name
        self.thumb = thumb
        self.instructions = ""
        self.ingredient1 = nil
        self.ingredient2 = nil
        self.ingredient3 = nil
        self.ingredient4 = nil
        self.ingredient5 = nil
        self.ingredient6 = nil
        self.ingredient7 = nil
        self.ingredient8 = nil
        self.ingredient9 = nil
        self.ingredient10 = nil
        self.ingredient11 = nil
        self.ingredient12 = nil
        self.ingredient13 = nil
        self.ingredient14 = nil
        self.ingredient15 = nil
        self.ingredient16 = nil
        self.ingredient17 = nil
        self.ingredient18 = nil
        self.ingredient19 = nil
        self.ingredient20 = nil
        self.measure1 = nil
        self.measure2 = nil
        self.measure3 = nil
        self.measure4 = nil
        self.measure5 = nil
        self.measure6 = nil
        self.measure7 = nil
        self.measure8 = nil
        self.measure9 = nil
        self.measure10 = nil
        self.measure11 = nil
        self.measure12 = nil
        self.measure13 = nil
        self.measure14 = nil
        self.measure15 = nil
        self.measure16 = nil
        self.measure17 = nil
        self.measure18 = nil
        self.measure19 = nil
        self.measure20 = nil
    }
}

struct Ingredient: Identifiable {
    let id: String = UUID().uuidString
    let ingredient: String
    let measure: String

    init(_ ingredient: String, _ measure: String) {
        self.ingredient = ingredient
        self.measure = measure
    }
}
