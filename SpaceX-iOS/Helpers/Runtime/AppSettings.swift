import Foundation

class AppSettings  {
    
    static let shared = AppSettings()
    
    private init(){}
    
    var height: Units = .m {
        didSet{
            update()
        }
    }
    
    var diameter: Units = .m {
        didSet{
            update()
        }
    }
    
    var mass: Weight = .kg {
        didSet{
            update()
        }
    }
    
    var payload: Weight = .kg {
        didSet{
            update()
        }
    }
    
    private func update() {
        NotificationCenter.default.post(name: Notification.Name("update"), object: nil)
    }
}
