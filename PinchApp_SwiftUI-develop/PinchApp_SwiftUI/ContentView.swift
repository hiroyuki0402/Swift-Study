//
//  ContentView.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import SwiftUI
import CoreData

struct ContentView: View {

    /// アニメーション
    @State private var isAnimating: Bool = false

    /// イメージ
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var lastDragOffset: CGSize = .zero

    /// メニュー
    @State private var isDrawerOpen: Bool = false


    /// NavigationBar
    private let navigationTitle: String = NSLocalizedString("HomeNavigationTitle", comment: "")

    /// ページ
    @State private var index: Int = 0

    /// データ
    private let pages: [PagesData] = PageDataManager.pagesData()

    var body: some View {

        NavigationView {
            ZStack {
                Color.clear
                CustomImage(imageName: pagesImage(), cornerRadius: 10, imageScale: imageScale, imageOffset: imageOffset, isAnimating: isAnimating)
                    .padding(.all)

                    .onTapGesture(count: 2, perform: {
                        zoom()
                    })


                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                drag(drag: .onChanged, gesture: gesture)
                            })
                            .onEnded({ gesture in
                                drag(drag: .end, gesture: gesture)
                            })
                    )

                    .gesture(
                        MagnificationGesture()
                            .onChanged { gesture in
                                magnificationGesture(drag: .onChanged, gesture: gesture)
                            }

                            .onEnded { gesture in
                                magnificationGesture(drag: .end, gesture: gesture)
                            }
                    )


            }//: ナビゲーションバープロパティー
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            .overlay (
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )

            .overlay (
                Group {
                    HStack  {
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1

                                    if imageScale <= 1 {
                                        resetImage()
                                    }
                                }
                            }

                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }

                        Button {
                            resetImage()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }

                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1

                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }

                    }
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom)
                , alignment: .bottom

            )

            .overlay (
                HStack(spacing: 12) {
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                      .resizable()
                      .scaledToFit()
                      .frame(height: 40)
                      .padding(8)
                      .foregroundStyle(.secondary)
                      .onTapGesture(perform: {
                        withAnimation(.easeOut) {
                            isDrawerOpen.toggle()
                        }
                      })

                    ForEach(pages) { page in
                        let image = page.imageName
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1: 0)
                            .animation(.easeInOut(duration: 1), value: isDrawerOpen)
                            .onTapGesture {
                                isAnimating = true
                                index = page.id
                            }
                    }

                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                  , alignment: .topTrailing
            )


        }//: - NavigationView
        .navigationViewStyle(.stack)
        Spacer(minLength: 50)
    }

    // MARK: - メソッド


    func resetImage() {
        return withAnimation(.spring) {
            imageOffset = .zero
            imageScale = 1
            lastDragOffset = .zero
        }
    }

    func zoom() {
        if imageScale == 1 {
            withAnimation(.spring) {
                imageScale = 5
            }
        } else {
            withAnimation(.spring) {
                resetImage()
            }
        }
    }

    enum Drag {
        case onChanged
        case end
    }

    func drag(drag: Drag, gesture: DragGesture.Value) {
        switch drag {
        case .onChanged:
            withAnimation(.linear(duration: 1)) {
                imageOffset = CGSize(
                    width: lastDragOffset.width + gesture.translation.width,
                    height: lastDragOffset.height + gesture.translation.height
                )
            }
        case .end:
            lastDragOffset = imageOffset
            if imageScale <= 1 {
                resetImage()
            }
        }
    }

    func magnificationGesture(drag: Drag, gesture:  MagnificationGesture.Value) {

        switch drag {
        case .onChanged:
            withAnimation(.linear(duration: 1)) {
                if imageScale >= 1 && imageScale <= 5 {
                    imageScale = gesture
                } else if imageScale > 5 {
                    imageScale = 5
                }
            }
            case .end:
                if imageScale > 5 {
                    imageScale = 5
                } else if imageScale <= 1 {
                    resetImage()
                }
            }
        }

    func pagesImage() -> String {
        return pages[index].imageName
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
