//
//  ContentView.swift
//  FoundationModels
//
//  Created by SHIRAISHI HIROYUKI on 2025/06/15.
//

import SwiftUI
import Observation
import FoundationModels

struct ContentView: View {
    @State var viewModel = PromptViewmodel()

    var body: some View {
        ScrollView {
            Text(viewModel.errorString ?? viewModel.answer)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(15)
        }
        .safeAreaBar(edge: .bottom) {
            HStack(spacing: 10) {
                confirmedButton()
                promptInputTextField()
            }
            .padding(15)
        }
    }

    func checking() {
        Task {
            viewModel.errorString = nil
            if viewModel.input.isEmpty {
                viewModel.errorString = "入力してください"
                return
            }

            do {
                let session = LanguageModelSession()
                viewModel.disabledControl = true
                let answer = try await session.respond(to: viewModel.input)
                viewModel.answer = answer.content
                viewModel.disabledControl = false



            } catch {
                viewModel.disabledControl = false
                viewModel.errorString = error.localizedDescription
                print(error.localizedDescription)
            }
        }

    }

    func confirmedButton() -> some View {
        Button {
            checking()
        } label: {
            Image(systemName: "paperplane.fill")
                .frame(width: 30, height: 30)
        }
        .buttonStyle(.glass)
        .disabled(viewModel.disabledControl)
    }

    func promptInputTextField() -> some View {
        TextField("命令を入力", text: $viewModel.input)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .glassEffect(.regular, in: .capsule)

    }


}

#Preview {
    ContentView()
}

@Observable
class PromptViewmodel {
    var prompt: String = ""
    var answer: String = ""
    var input: String = ""
    var disabledControl: Bool = false
    var errorString: String?




}
