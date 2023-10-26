import Foundation

extension RecipeDetailsView {
    final class ViewModel: ObservableObject {

        @Published var recipeDetails: RecipeDetails
        private let recipeService: RecipeService

        init(
            recipe: Recipe,
            recipeService: RecipeService = RecipeService()
        ) {
            self.recipeService = recipeService
            self.recipeDetails = RecipeDetails(id: recipe.id, name: recipe.name, thumb: recipe.thumb)
        }

        func fetchRecipeDetails() async {
            do {
                let result = try await recipeService.getRecipeDetails(with: recipeDetails.id)
                await updateRecipeDetails(recipeDetails: result.recipes[0])
            } catch {
                print("Handle error")
            }
        }

        @MainActor
        private func updateRecipeDetails(recipeDetails: RecipeDetails) {
            self.recipeDetails = recipeDetails
        }
    }
}
