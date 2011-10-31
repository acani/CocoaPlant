// Debug NSLog for performance. http://j.mp/mQ8Nb3
#ifdef DEBUG
#define DLog(xx, ...)  NSLog(xx, ##__VA_ARGS__)
#define DLogVerbose(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(xx, ...)  ((void)0)
#define DLogVerbose(xx, ...)  ((void)0)
#endif
