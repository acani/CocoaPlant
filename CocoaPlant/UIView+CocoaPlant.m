#import "UIView+CocoaPlant.h"

@implementation UIView (CocoaPlant)

- (void)setFrameOrigin:(CGPoint)origin {
    CGRect newFrame = self.frame;
    newFrame.origin = origin;
    self.frame = newFrame;
}

- (void)setFrameSize:(CGSize)size {
    CGRect newFrame = self.frame;
    newFrame.size = size;
    self.frame = newFrame;
}

- (void)setFrameOriginX:(CGFloat)originX {
    CGRect newFrame = self.frame;
    newFrame.origin.x = originX;
    self.frame = newFrame;
}

- (void)setFrameOriginY:(CGFloat)originY {
    CGRect newFrame = self.frame;
    newFrame.origin.y = originY;
    self.frame = newFrame;
}

- (void)setFrameSizeWidth:(CGFloat)width {
    CGRect newFrame = self.frame;
    newFrame.size.width = width;
    self.frame = newFrame;
}

- (void)setFrameSizeHeight:(CGFloat)height {
    CGRect newFrame = self.frame;
    newFrame.size.height = height;
    self.frame = newFrame;
}

@end
