#ifdef CP_SET_SPEC_AS_TEST_METHOD_PREFIX

#import <SenTestingKit/SenTestingKit.h>

@implementation NSInvocation (SetSpecAsTestMethodPrefix)

+ (void)load {
//    [self performSelector:@selector(setTestMethodPrefix:) withObject:@"spec"];
    [self setTestMethodPrefix:@"spec"];
}

@end

#endif
