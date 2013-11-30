//
//  PRJFoldersLayoutAttributes.m
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-17.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import "PRJFoldersLayoutAttributes.h"

@implementation PRJFoldersLayoutAttributes
@synthesize openState;

- (instancetype)copyWithZone:(NSZone *)zone {
    PRJFoldersLayoutAttributes *_self = [super copyWithZone:zone];
    _self.openState = self.openState;
    return _self;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[self class]]) {
        return [super isEqual:object] && self.openState == [(PRJFoldersLayoutAttributes *)object openState];
    }
    return NO;
}
@end
