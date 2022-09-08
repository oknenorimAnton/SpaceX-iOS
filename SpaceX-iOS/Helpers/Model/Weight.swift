enum Weight {
    case kg, lb
    
    var index: Int {
        switch self {
        case .kg: return 0
        case .lb: return 1
        }
    }
    
    init(index: Int) {
        switch index {
        case 0: self = .kg
        case 1: self = .lb
        default: self = .kg
        }
    }
}
