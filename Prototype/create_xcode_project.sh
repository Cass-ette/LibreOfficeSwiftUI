#!/bin/bash

# 创建 Xcode SwiftUI 项目结构
PROJECT_NAME="LibreOfficeSwiftUI"
mkdir -p "$PROJECT_NAME/$PROJECT_NAME"
mkdir -p "$PROJECT_NAME/$PROJECT_NAME/Bridge"
mkdir -p "$PROJECT_NAME/$PROJECT_NAME/Views"
mkdir -p "$PROJECT_NAME/$PROJECT_NAME/Models"
mkdir -p "$PROJECT_NAME/$PROJECT_NAME/Resources"

echo "✅ 项目结构创建完成"
echo ""
echo "下一步："
echo "1. 在 Xcode 中创建新的 macOS App 项目"
echo "2. 项目名称: $PROJECT_NAME"
echo "3. Interface: SwiftUI"
echo "4. Language: Swift"
echo ""
