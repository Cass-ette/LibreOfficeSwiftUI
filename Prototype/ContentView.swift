//
//  ContentView.swift
//  SwiftUI 前端示例
//
//  展示如何在 SwiftUI 中调用 C++ 桥接层
//

import SwiftUI

struct ContentView: View {
    @State private var bridge = LibreOfficeBridge()
    @State private var documentInfo = ""
    @State private var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("LibreOffice SwiftUI Prototype")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // 文档信息显示
            if !documentInfo.isEmpty {
                Text(documentInfo)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            // 控制按钮
            HStack(spacing: 15) {
                Button("Open Document") {
                    bridge.openDocument("/path/to/document.pdf")
                    documentInfo = bridge.getDocumentInfo()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Previous Page") {
                    if currentPage > 1 {
                        currentPage -= 1
                        bridge.renderPage(currentPage)
                    }
                }
                .disabled(currentPage <= 1)
                
                Text("Page \(currentPage)")
                    .frame(width: 80)
                
                Button("Next Page") {
                    currentPage += 1
                    bridge.renderPage(currentPage)
                }
            }
            
            // 文档渲染区域 (占位符)
            Rectangle()
                .fill(Color.white)
                .frame(height: 400)
                .overlay(
                    Text("Document Render Area\n(C++ 渲染内容将显示在这里)")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                )
                .border(Color.gray, width: 1)
            
            Spacer()
            
            Text("架构: SwiftUI → Objective-C++ → LibreOffice C++ Core")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(minWidth: 600, minHeight: 600)
    }
}

#Preview {
    ContentView()
}
