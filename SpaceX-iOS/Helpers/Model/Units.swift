enum Units {
    case m, ft
    
    var index: Int {
        switch self {
        case .m: return 0
        case .ft: return 1
        }
    }
    
    init(index: Int) {
        switch index {
        case 0: self = .m
        case 1: self = .ft
        default: self = .m
        }
    }
}
