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
                "E-mail",
                "Telefone"
            ]
        )
    }
}

