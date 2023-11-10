import Foundation

final class ImageCacher {
    static let shared = ImageCacher()

    private let session: URLSession
    private var cachedData: [URL: Data] = [:]
    private var dispatchQueue: DispatchQueue = .init(
        label: "com.ImageCacher",
        qos: .userInteractive,
        attributes: .concurrent
    )

    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchImage(with url: URL) async -> Data? {
        if let cacheData = getCachedData(with: url) {
            return cacheData
        }

        async let image = downloadImage(with: url)
        do {
            let image = try await image
            cacheData(image, for: url)
            return image
        } catch {
            return nil
        }
    }

    private func downloadImage(with url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }

    private func cacheData(_ data: Data, for url: URL) {
        dispatchQueue.async(flags: .barrier) {
            self.cachedData[url] = data
        }
    }

    private func getCachedData(with url: URL) -> Data? {
        var data: Data? = nil
        dispatchQueue.sync {
            data = self.cachedData[url]
        }
        return data
    }
}

