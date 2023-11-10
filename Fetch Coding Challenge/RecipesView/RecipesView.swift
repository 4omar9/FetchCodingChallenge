import SwiftUI

struct RecipesView: View {
    let viewModel: ViewModel = .init()

    var body: some View {
        NavigationStack {
            List(viewModel.recipes) { element in
                NavigationLink(value: element) {
                    HStack {
                        CachedImage(url: element.thumb)
#if os(iOS)

                        .frame(width: 100, height: 100)
#endif
                        #if os(watchOS)
                        .frame(width: 40, height: 40)
                        #endif

                        .background(Color.gray)
                        .clipShape(Circle())

                        Text(element.name)
                            .font(.title3)
                    }
                }
            }
#if os(iOS)
            .listStyle(.inset)
#endif

            .navigationDestination(for: Recipe.self) { element in
                RecipeDetailsView(viewModel: .init(recipe: element))
            }
            .navigationTitle("Recipes")
        }
        .task {
            await viewModel.fetchRecipes()
        }
    }
}


#Preview {
    RecipesView()
}
