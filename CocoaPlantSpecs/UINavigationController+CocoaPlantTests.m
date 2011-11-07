#import <SenTestingKit/SenTestingKit.h>

#import "UINavigationController+CocoaPlant.h"

@interface UINavigationController_CocoaPlantTests : SenTestCase {
    UINavigationController *navigationController;
}
@end

@implementation UINavigationController_CocoaPlantTests

- (void)setUp {
    navigationController = [[UINavigationController alloc] init];
}

- (void)tearDown {
    navigationController = nil;
}

- (void)testRootViewController {
    UIViewController *rootViewController = [[UIViewController alloc] init];
    navigationController.rootViewController = rootViewController;
    STAssertEquals(navigationController.rootViewController, rootViewController, nil);
}

@end
