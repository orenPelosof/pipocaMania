import UIKit

struct ProfileModel {
    let name: String
    let imageName: String
    let infos: [String]
}

extension ProfileModel {
    static func makeProfileModel() -> ProfileModel {
        .init(
            name: "José Roberto",
            imageName: "perfil",
            infos: [
                "Renomear",
                "Trocar Senha",
                "teste@gmail.com",
                "(11) 00000-0000"
            ]
        )
    }
}

