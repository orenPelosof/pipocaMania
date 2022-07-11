import UIKit

struct ProfileModel {
    let name: String
    let imageName: String
    let infos: [String]
}

extension ProfileModel {
    static func makeProfileModel() -> ProfileModel {
        .init(
            name: "Beto",
            imageName: "perfil",
            infos: [
                "José Roberto",
                "(11) 00000-0000",
                "teste@gmail.com",
                "São Paulo"
            ]
        )
    }
}

