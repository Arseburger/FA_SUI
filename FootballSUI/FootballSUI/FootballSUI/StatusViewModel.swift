import Foundation

final class StatusViewModel {
    @Published private var status: StatusResult?
    private var service = BaseService()
    
//    @Published
    var account: Account {
        guard let status = status else {
            return .init(firstName: "Jopa", lastName: "Ruchka", email: "email@zaloopa.com")
        }
        return status.account
    }
    
//    @Published
    var subscription: Subscription {
        guard let status = status else {
            return .init(plan: "Base", endDate: .now, isActive: false)
        }
        return status.subscription
    }
    
//   @Published
    var requests: Requests {
        guard let status = status else {
            return .init(current: 10, dailyLimit: 10)
        }
        return status.requests
    }
    
    func loadStatus() {
        service.loadStatus { [weak self] res in
            self?.status = res.response
        }
    }
    
    
}
