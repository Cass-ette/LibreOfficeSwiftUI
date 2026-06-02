# LibreOffice SwiftUI

LibreOffice 的 SwiftUI 前端重写项目

## 项目目标

- 保留 LibreOffice C++ 核心（渲染引擎、文档解析）
- 用 SwiftUI 重写 macOS 前端界面
- 提供原生 macOS 体验

## 架构

```
SwiftUI Frontend (Swift)
        ↓
Objective-C++ Bridge Layer
        ↓
LibreOffice Core (C++)
```

## 开发路线

### Phase 1: MVP (当前阶段)
- [ ] 创建基础 SwiftUI 项目
- [ ] 设计 Swift-C++ 桥接层
- [ ] 实现 PDF 文档打开和显示

### Phase 2: Core Features
- [ ] 文本编辑功能
- [ ] 批注和标记
- [ ] 文档保存/导出

### Phase 3: Full Application
- [ ] 完整工具栏和菜单
- [ ] 多窗口支持
- [ ] 偏好设置

## 上游仓库

- Fork from: [LibreOffice/core](https://github.com/LibreOffice/core)
- License: MPL 2.0

## 开发环境

- macOS 13.0+
- Xcode 15.0+
- Swift 5.9+

