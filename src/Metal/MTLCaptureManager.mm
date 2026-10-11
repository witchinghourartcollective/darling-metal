// SPDX-FileCopyrightText: 2026 Darling Developers
// SPDX-License-Identifier: MPL-2.0

#import <Metal/MTLCaptureManager.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSInvocation.h>

// QtGui links against the macOS 12 capture API even when Metal capture is
// disabled. A descriptor class is needed for dyld's class binding; Darling's
// current Metal backend cannot produce Xcode capture files.
@interface MTLCaptureDescriptor : NSObject
@end

@implementation MTLCaptureDescriptor
@end

@implementation MTLCaptureManager

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes: "v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"Stub called: %@ in %@", NSStringFromSelector([anInvocation selector]), [self class]);
}

@end
