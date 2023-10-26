import Foundation

extension RecipesView {
    final class ViewModel: ObservableObject {
        @Published var recipes: [Recipe] = []
        private let recipeService: RecipeService

        init(recipeService: RecipeService = RecipeService()) {
            self.recipeService = recipeService
        }

        func fetchMeals() async {
            do {
                let recipesResponse = try await recipeService.getRecipesList()
                await updateMeals(meals: recipesResponse.recipes)

            } catch {
                print("Show error state")
            }

        }

        @MainActor
        private func updateMeals(meals: [Recipe]) {
            self.recipes = meals
        }
    }
}
