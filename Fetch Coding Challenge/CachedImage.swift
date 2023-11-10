import SwiftUI

struct CachedImage: View {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }

    @State private var imageData: Data?
    private var imageCacher = ImageCacher.shared
    var body: some View {
        VStack {
            if let imageData {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .task {
            self.imageData = await imageCacher.fetchImage(with: url)
        }
    }
}

#Preview {
    CachedImage(url: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")!)
}
