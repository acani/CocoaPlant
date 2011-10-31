//#import <SenTestingKit/SenTestingKit.h>
//
//#undef STFail
//
//#undef STAssertNil
//#undef STAssertNotNil
//
//#undef STAssertTrue
//#undef STAssertFalse
//
//#undef STAssertEquals
//#undef STAssertEqualObjects
//#undef STAssertEqualsWithAccuracy
//
//#undef STAssertThrows
//#undef STAssertThrowsSpecific
//#undef STAssertThrowsSpecificNamed
//
//#undef STAssertNoThrow
//#undef STAssertNoThrowSpecific
//#undef STAssertNoThrowSpecificNamed
//
//#undef STAssertTrueNoThrow
//#undef STAssertFalseNoThrow

#define CPFail STFail(@"fail");

#define CPAssertNil(a1) STAssertNil(a1, nil);
#define CPAssertNotNil(a1) STAssertNotNil(a1, nil);

#define CPAssertTrue(expr) STAssertTrue(expr, nil);
#define CPAssertFalse(expr) STAssertFalse(expr, nil);

#define CPAssertEquals(a1, a2) STAssertEquals(a1, a2, nil)
#define CPAssertEqualObjects(a1, a2) STAssertEqualObjects(a1, a2, nil)

#define CPAssertThrows(a1) STAssertThrows(a1, nil)
