//
//  BridgeExample.mm
//  LibreOffice Swift Bridge 示例
//
//  这是一个 Objective-C++ 桥接层的示例代码
//  展示如何让 Swift 调用 C++ 代码
//

#import <Foundation/Foundation.h>

// C++ 代码 (模拟 LibreOffice 核心)
#ifdef __cplusplus
class LibreOfficeCoreEngine {
public:
    void openDocument(const char* path) {
        printf("C++: Opening document at %s\n", path);
    }
    
    void renderPage(int pageNumber) {
        printf("C++: Rendering page %d\n", pageNumber);
    }
    
    const char* getDocumentInfo() {
        return "Document: 10 pages, PDF format";
    }
};
#endif

// Objective-C 包装器 (暴露给 Swift)
@interface LibreOfficeBridge : NSObject

- (void)openDocument:(NSString *)path;
- (void)renderPage:(NSInteger)pageNumber;
- (NSString *)getDocumentInfo;

@end

@implementation LibreOfficeBridge {
    LibreOfficeCoreEngine* cppEngine;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        cppEngine = new LibreOfficeCoreEngine();
    }
    return self;
}

- (void)dealloc {
    delete cppEngine;
}

- (void)openDocument:(NSString *)path {
    const char* cPath = [path UTF8String];
    cppEngine->openDocument(cPath);
}

- (void)renderPage:(NSInteger)pageNumber {
    cppEngine->renderPage((int)pageNumber);
}

- (NSString *)getDocumentInfo {
    const char* info = cppEngine->getDocumentInfo();
    return [NSString stringWithUTF8String:info];
}

@end
