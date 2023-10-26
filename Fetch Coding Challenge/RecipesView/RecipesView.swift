import SwiftUI

struct RecipesView: View {
    @StateObject var viewModel: ViewModel = .init()

    var body: some View {
        NavigationStack {
            List(viewModel.recipes) { element in
                NavigationLink(value: element) {
                    HStack {
                        AsyncImage(url: element.thumb) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .clipShape(Circle())

                        Text(element.name)
                            .font(.title3)
                    }
                }
            }
            .listStyle(.inset)
            .navigationDestination(for: Recipe.self) { element in
                RecipeDetailsView(viewModel: .init(recipe: element))
            }
            .navigationTitle("Recipes")
        }
        .task {
            await viewModel.fetchMeals()
        }
        .refreshable {
            await viewModel.fetchMeals()
        }
    }
}


#Preview {
    RecipesView()
}
