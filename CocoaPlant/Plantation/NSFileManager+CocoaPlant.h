#import <Foundation/Foundation.h>

@interface NSFileManager (CocoaPlant)

- (NSURL *)URLForApplicationDirectory:(NSSearchPathDirectory)directory;
- (NSURL *)URLForApplicationLibraryDirectory;
- (NSURL *)URLForApplicationDocumentDirectory;

@end
