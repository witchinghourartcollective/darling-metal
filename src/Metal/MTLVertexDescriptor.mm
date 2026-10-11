// SPDX-FileCopyrightText: 2026 Darling Developers
// SPDX-License-Identifier: MPL-2.0

#import <Metal/MTLVertexDescriptor.h>
#import <Foundation/NSMethodSignature.h>
#import <Foundation/NSInvocation.h>

// QtGui references this macOS Metal class directly when loading its Metal
// renderer. Darling's current backend does not implement stage IO reflection,
// but the class must exist for dyld to load QtGui.
@interface MTLStageInputOutputDescriptor : NSObject
@end

@implementation MTLStageInputOutputDescriptor
@end

@implementation MTLVertexDescriptor

#if DARLING_METAL_ENABLED

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes: "v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"Stub called: %@ in %@", NSStringFromSelector([anInvocation selector]), [self class]);
}

#endif

@end
