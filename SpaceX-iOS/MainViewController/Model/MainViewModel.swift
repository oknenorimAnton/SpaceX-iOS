import Foundation
import Combine
// здесь работаем с данными
class MainViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var rocketResponseElement = [RocketResponseElement]()
    @Published var error: String? = nil // еррор для каждой функции отедльный должен быть?
    
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
    
//    func fetchStartingData() {
//
//        let urlString = "https://api.spacexdata.com/v4/launches"
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                self.error = error.localizedDescription
//                return
//            }
//            guard let data = data else {
//                self.error = "No data error"
//                return
//            }
//
//            do {
//                self.startingResponseElement = try JSONDecoder().decode(StartingResponse.self, from: data)
//            } catch(let error) {
//                self.error = error.localizedDescription
//            }
//        }.resume()
//    }
}
