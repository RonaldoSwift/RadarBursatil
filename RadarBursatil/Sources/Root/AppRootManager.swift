import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .authentication
    
    enum AppRoots {
        case authentication
        case principal
    }
}
