import SwiftUI

struct RecipeDetailsView: View {
    let viewModel: ViewModel

    var body: some View {
        ScrollView {
            VStack {
                CachedImage(url: viewModel.recipeDetails.thumb)
                #if os(watchOS)
                .frame(minWidth: 0, maxHeight: 70)
                .clipShape(Circle())
                #endif
                VStack(alignment: .leading, spacing: 16) {
                    Text("Instructions")
                        .font(.headline)
                    Text(viewModel.recipeDetails.instructions)
                        .font(.body)
                    Divider()
                    Text("Ingredients")
                        .font(.headline)
                    ForEach(viewModel.recipeDetails.ingredients) { element in
                        HStack {
                            Text(element.ingredient)
                                .font(.body)
                            Divider()
                            Text(element.measure)
                                .font(.body)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(viewModel.recipeDetails.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchRecipeDetails()
        }
    }
}

#Preview {
    NavigationStack {
        RecipeDetailsView(
            viewModel: .init(recipe: .init(
                name: "Apam balik",
                id: "53049",
                thumb: URL(string:  "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")!
            ))
        )
    }
}
