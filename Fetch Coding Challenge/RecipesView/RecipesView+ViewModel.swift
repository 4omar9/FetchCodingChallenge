import Foundation

extension RecipesView {
    final class ViewModel: ObservableObject {
        @Published var recipes: [Recipe] = []
        private let recipeService: RecipeService

        init(recipeService: RecipeService = RecipeService()) {
            self.recipeService = recipeService
        }

        func fetchRecipes() async {
            do {
                let recipesResponse = try await recipeService.getRecipesList()
                let sortedList = recipesResponse.recipes.sorted(by: { $0.name < $1.name })
                await updateMeals(meals: sortedList)
            } catch {
                print("Handle error state")
            }
        }

        @MainActor
        private func updateMeals(meals: [Recipe]) {
            self.recipes = meals
        }
    }
}
