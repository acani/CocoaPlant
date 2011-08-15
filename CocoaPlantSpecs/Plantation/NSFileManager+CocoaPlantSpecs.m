#import <Kiwi/Kiwi.h>

#import "CocoaPlantDefines.h"
#import "NSFileManager+CocoaPlant.h"

SPEC_BEGIN(NSFileManager_CocoaPlantSpecs)

describe(@"NSFileManager+CocoaPlant", ^{
    __block NSFileManager *fileManager;

    beforeEach(^{
        fileManager = [[NSFileManager alloc] init];
    });

    describe(@"-URLForApplicationDirectory", ^{
        it(@"returns nil for invalid directory", ^{
            [[fileManager URLForApplicationDirectory:23] shouldBeNil];
        });
    });

    describe(@"-URLForApplicationLibraryDirectory", ^{
        it(@"returns something", ^{
            [[fileManager URLForApplicationLibraryDirectory] shouldNotBeNil];
        });

        it(@"returns application-library-directory URL", ^{
            NSURL *directoryURL = [[fileManager URLsForDirectory:NSLibraryDirectory
                                                       inDomains:NSUserDomainMask] lastObject];
            DLog(@"appLibDirURL: %@", directoryURL);
            [[[fileManager URLForApplicationLibraryDirectory] should] equal:directoryURL];
        });
    });

    describe(@"-URLForApplicationDocumentDirectory", ^{
        it(@"returns something", ^{
            [[fileManager URLForApplicationDocumentDirectory] shouldNotBeNil];
        });
        
        it(@"returns application-document-directory URL", ^{
            NSURL *directoryURL = [[fileManager URLsForDirectory:NSDocumentDirectory
                                                       inDomains:NSUserDomainMask] lastObject];
            DLog(@"appLibDirURL: %@", directoryURL);
            [[[fileManager URLForApplicationDocumentDirectory] should] equal:directoryURL];
        });
    });
});

SPEC_END
