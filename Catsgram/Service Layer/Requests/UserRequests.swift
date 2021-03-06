import Foundation

extension Notification.Name {
    static let signInNotification = Notification.Name("SignInNotification")
    static let signOutNofication = Notification.Name("SignOutNotification")
}

struct SignInUserRequest: APIRequest {
    let user: UserAuthentication

    init(username: String, password: String) {
        self.user = UserAuthentication(id: username, password: password)
    }

    typealias Response = Void

    var contentType: String { "application/json" }
    var method: HTTPMethod { .GET }
    var path: String { "/user" }
    var body: Data? { nil }
    var params: UserParams? {
        UserParams(id: user.id, password: user.password ?? "")
    }
    var additionalHeaders: [String: String] { [:] }

    func handle(rowResponse: Data) throws {
        currentUser = user
        NotificationCenter.default.post(name: .signInNotification, object: nil)
    }
}

struct SignUpUserRequest: APIRequest {
    let user: UserAuthentication

    init(username: String, email: String, password: String) {
        self.user = UserAuthentication(id: username, email: email, password: password)
    }

    typealias Response = Void

    var contentType: String { "application/json" }
    var method: HTTPMethod { .POST }
    var path: String { "/user" }
    var params: EmptyParams? { nil }
    var body: Data? {
        try? JSONEncoder().encode(user)
    }
    var additionalHeaders: [String: String] { [:] }

    func handle(rowResponse: Data) throws {
        currentUser = user
        NotificationCenter.default.post(name: .signInNotification, object: nil)
    }
}
