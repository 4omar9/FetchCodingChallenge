import Foundation

final class RecipeService {
    func getRecipesList() async throws -> RecipesResponse {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipesResponse.self, from: data)
        return response
    }

    func getRecipeDetails(with id: String) async throws -> RecipeDetailsResponse {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipeDetailsResponse.self, from: data)
        return response
    }
}
