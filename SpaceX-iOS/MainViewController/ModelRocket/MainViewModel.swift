import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var rocketResponseElement = [RocketResponseElement]()
    @Published var error: String? = nil
    
    func fetchRocketData() {
        
        let urlString = "https://api.spacexdata.com/v4/rockets"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.error = error.localizedDescription
                return
            }
            guard let data = data else {
                self.error = "No data error"
                return
            }
            do {
                self.rocketResponseElement = try JSONDecoder().decode([RocketResponseElement].self, from: data)
            } catch(let error) {
                self.error = error.localizedDescription
            }
        }.resume()
    }
}
