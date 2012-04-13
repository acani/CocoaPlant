// Debug NSLog for performance. http://j.mp/mQ8Nb3
#ifdef DEBUG
#define DLog(xx, ...)  NSLog(xx, ##__VA_ARGS__)
#define DLogVerbose(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(xx, ...)  ((void)0)
#define DLogVerbose(xx, ...)  ((void)0)
#endif

#define NSSortDescriptors1(key1, ascending1) \
[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key1 ascending:ascending1]]

#define NSSortDescriptors2(key1, ascending1, key2, ascending2) \
[NSArray arrayWithObjects: \
[NSSortDescriptor sortDescriptorWithKey:key1 ascending:ascending1], \
[NSSortDescriptor sortDescriptorWithKey:key2 ascending:ascending2], nil]

#define NSSortDescriptors3(key1, ascending1, key2, ascending2, key3, ascending3) \
[NSArray arrayWithObjects: \
[NSSortDescriptor sortDescriptorWithKey:key1 ascending:ascending1], \
[NSSortDescriptor sortDescriptorWithKey:key2 ascending:ascending2], \
[NSSortDescriptor sortDescriptorWithKey:key3 ascending:ascending3], nil]
