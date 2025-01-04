//
//  EditProfileViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {

    @Published var seletedImage: PhotosPickerItem? {
        didSet { Task { await loadImage() }}
    }
    @Published var photoImage: Image?
    private var uploadImage: UIImage?

    @MainActor
    private func loadImage() async {
        guard let seletedImage = seletedImage,
              let data = try? await seletedImage.loadTransferable(type: Data.self),
              let image = UIImage(data: data) else { return }
        uploadImage = image
        self.photoImage = Image(uiImage: image)
    }

    private func updateProfileImage() async throws {
        guard let uploadImage = self.uploadImage, 
        let uploadImageUrl = try? await ImageUploadService.shared.uploadeImage(uploadImage) else { return }
        try await UserService.shared.updateUserProfileImage(withIMageUrl: uploadImageUrl)
    }

    func updateUserData() async throws {
        try await updateProfileImage()
    }


}
