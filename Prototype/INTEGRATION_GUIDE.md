# 集成指南

## 如何在 Xcode 中使用这些文件

### 步骤 1: 创建 Xcode 项目

1. 打开 Xcode
2. File → New → Project
3. 选择 **macOS** → **App**
4. 填写信息：
   - Product Name: `LibreOfficeSwiftUI`
   - Interface: **SwiftUI**
   - Language: **Swift**
5. 保存到 `~/Documents/LibreOfficeSwiftUI/Prototype/`

### 步骤 2: 添加桥接层

1. 将 `BridgeExample.mm` 拖入项目
2. Xcode 会提示创建 Bridging Header，点击 **Create**
3. 在生成的 `LibreOfficeSwiftUI-Bridging-Header.h` 中添加：

```objc
#import <Foundation/Foundation.h>

@interface LibreOfficeBridge : NSObject
- (void)openDocument:(NSString *)path;
- (void)renderPage:(NSInteger)pageNumber;
- (NSString *)getDocumentInfo;
@end
```

### 步骤 3: 替换 ContentView

用提供的 `ContentView.swift` 替换项目中的默认 ContentView

### 步骤 4: 构建配置

确保 Build Settings 中：
- **C++ Language Dialect**: `GNU++17` 或更高
- **Enable Objective-C Exceptions**: `Yes`

### 步骤 5: 运行

⌘ + R 运行项目，你会看到一个简单的界面，点击按钮会在控制台输出 C++ 调用信息。

## 架构说明

```
┌─────────────────────────────────┐
│  ContentView.swift              │  ← SwiftUI 界面
│  (用户交互)                      │
└────────────┬────────────────────┘
             │ Swift 调用
             ↓
┌─────────────────────────────────┐
│  LibreOfficeBridge              │  ← Objective-C 接口
│  (Bridging Header 暴露给 Swift)  │
└────────────┬────────────────────┘
             │ Objective-C++ 调用
             ↓
┌─────────────────────────────────┐
│  BridgeExample.mm               │  ← Objective-C++ 实现
│  (包装 C++ 代码)                 │
└────────────┬────────────────────┘
             │ C++ 调用
             ↓
┌─────────────────────────────────┐
│  LibreOfficeCoreEngine (C++)    │  ← 模拟的 LibreOffice 核心
│  (未来替换为真实的 LO 代码)      │
└─────────────────────────────────┘
```

## 下一步计划

### Phase 1a: 验证桥接可行性
- [x] 创建基础 SwiftUI 界面
- [x] 实现 Swift ↔ C++ 桥接示例
- [ ] 编译并运行原型

### Phase 1b: 集成真实 LibreOffice 代码
- [ ] 编译 LibreOffice C++ 核心为静态库
- [ ] 链接到 Xcode 项目
- [ ] 调用真实的文档打开 API

### Phase 1c: 实现 PDF 渲染
- [ ] 在 SwiftUI 中显示 C++ 渲染的图像
- [ ] 实现页面翻页功能
- [ ] 处理用户输入事件

## 常见问题

**Q: 为什么需要 Bridging Header?**
A: Swift 不能直接调用 C++，必须通过 Objective-C 作为中间层。Bridging Header 告诉 Swift 有哪些 Objective-C 类可用。

**Q: .mm 文件是什么?**
A: .mm 是 Objective-C++ 文件扩展名，可以同时写 Objective-C 和 C++ 代码。

**Q: 真实的 LibreOffice 核心怎么集成?**
A: 需要编译 LibreOffice 为静态库 (.a 文件)，然后在 Xcode 的 Build Settings 中链接。这是 Phase 1b 的任务。

## 资源

- [Swift-C++ Interop (官方文档)](https://www.swift.org/documentation/cxx-interop/)
- [LibreOffice 开发文档](https://api.libreoffice.org/)
- Fork 的仓库: https://github.com/Cass-ette/libreoffice-swiftui
