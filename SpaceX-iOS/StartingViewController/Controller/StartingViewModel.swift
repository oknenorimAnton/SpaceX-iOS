import Foundation
import Combine

class StartingViewModel: ObservableObject {

    var cansellables: Set<AnyCancellable> = []
    
    @Published var launchData = [LaunchData]()
    @Published var error: String? = nil
    
    func fetchStartingData() {
        
        let urlString = "https://api.spacexdata.com/v4/launches"
        
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
                self.launchData = try JSONDecoder().decode([LaunchData].self, from: data)
            } catch(let error) {
                self.error = error.localizedDescription
            }
        }.resume()
    }
}
