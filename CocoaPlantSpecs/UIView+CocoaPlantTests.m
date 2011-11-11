#import <SenTestingKit/SenTestingKit.h>

#import "UIView+CocoaPlant.h"

@interface UIView_CocoaPlantTests : SenTestCase {
    UIView *view;
}
@end

@implementation UIView_CocoaPlantTests

- (void)setUp {
    view = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)tearDown {
    view = nil;
}

#pragma mark - origin: x, y

- (void)testOrigin {
    CGPoint origin = CGPointMake(1.0f, 1.0f);
    view.origin = origin;
    STAssertEquals(view.origin, origin, nil);
    STAssertEquals(view.origin, view.frame.origin, nil);
}

- (void)testX {
    CGFloat x = 1.0f;
    view.x = x;
    STAssertEquals(view.x, x, nil);
    STAssertEquals(view.x, view.frame.origin.x, nil);
}

#pragma mark - size: width, height

- (void)testSize {
    CGSize size = CGSizeMake(1.0f, 1.0f);
    view.size = size;
    STAssertEquals(view.size, size, nil);
    STAssertEquals(view.size, view.frame.size, nil);
}

- (void)testWidth {
    CGFloat width = 1.0f;
    view.width = width;
    STAssertEquals(view.width, width, nil);
    STAssertEquals(view.width, view.frame.size.width, nil);
}

- (void)testHeight {
    CGFloat height = 1.0f;
    view.height = height;
    STAssertEquals(view.height, height, nil);
    STAssertEquals(view.height, view.frame.size.height, nil);
}

#pragma mark - UIViewAnimationOptions <=> UIViewAnimationCurve

- (void)testAnimationOptionsWithCurve {
    UIViewAnimationCurve curve = [UIView animationOptionsWithCurve:UIViewAnimationCurveEaseInOut];
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseInOut, nil);

    curve = [UIView animationOptionsWithCurve:UIViewAnimationCurveEaseIn];
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseIn, nil);

    curve = [UIView animationOptionsWithCurve:UIViewAnimationCurveEaseOut];
    STAssertEquals(curve, UIViewAnimationOptionCurveEaseOut, nil);

    curve = [UIView animationOptionsWithCurve:UIViewAnimationCurveLinear];
    STAssertEquals(curve, UIViewAnimationOptionCurveLinear, nil);

    curve = [UIView animationOptionsWithCurve:4]; // invalid UIViewAnimationCurve
    STAssertEquals(curve, 4, nil);
}

@end
