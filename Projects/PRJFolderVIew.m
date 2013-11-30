//
//  PRJFolderVIew.m
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-14.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import "PRJFolderVIew.h"
#import <QuartzCore/QuartzCore.h>

#define UI_DEBUG 0

@implementation PRJFolderVIew
@synthesize openState = _openState;

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Construction
////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)commonInit {
    _frontFolderSideView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"folder_front.png"]];
    _frontFolderSideView.layer.anchorPoint = CGPointMake(0, 1);

//    _frontFolderSideView.layer.shadowOffset = CGSizeZero;
//    _frontFolderSideView.layer.shadowColor = [UIColor blackColor].CGColor;
//    _frontFolderSideView.layer.shadowRadius = 5.0;
//    _frontFolderSideView.layer.shadowOpacity = 0;

    _frontFolderSideShadow = [CAGradientLayer layer];
    _frontFolderSideShadow.colors = @[(id)[UIColor blackColor].CGColor,
                                      (id)[UIColor clearColor].CGColor];
    _frontFolderSideShadow.startPoint = CGPointMake(.5, 1);
    _frontFolderSideShadow.endPoint = CGPointMake(1, .5);
    
    
    _frontFolderSideShadowMask = [CALayer layer];
    _frontFolderSideShadowMask.contents = (id)[UIImage imageNamed:@"folder_front.png"].CGImage;
    _frontFolderSideShadow.mask = _frontFolderSideShadowMask;
    
    
    _backFolderSideView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"folder_back.png"]];
    _backFolderSideView.layer.anchorPoint = CGPointMake(0, 1);
    _backFolderSideView.clipsToBounds = YES;
    

    _backFolderSideShadow = [CALayer layer];
    _backFolderSideShadow.shadowOffset = CGSizeZero;
    _backFolderSideShadow.shadowColor = [UIColor blackColor].CGColor;
    _backFolderSideShadow.shadowRadius = 5.0;
    _backFolderSideShadow.shadowOpacity = 0;
    
    _backFolderSideShadowMask = [CALayer layer];
    _backFolderSideShadowMask.contents = (id)[UIImage imageNamed:@"folder_back.png"].CGImage;
    _backFolderSideShadow.mask = _backFolderSideShadowMask;
    
//    _backFolderSideLayer.contents = (id)[UIImage imageNamed:@"folder.png"].CGImage;


    [self.layer addSublayer:_backFolderSideView.layer];
    [_backFolderSideView.layer addSublayer:_backFolderSideShadow];
    [self  addSubview:_frontFolderSideView];
    [_frontFolderSideView.layer addSublayer:_frontFolderSideShadow];
    
    
#if UI_DEBUG
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 1.0;
#endif
//    self.backgroundColor = [UIColor whiteColor];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];

    
    _frontFolderSideView.frame = CGRectInset(self.bounds, 0, 0);
   
    _backFolderSideView.frame = CGRectInset(self.bounds, 0, 0);
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / (CGRectGetWidth(self.bounds) * 4);

    _frontFolderSideShadowMask.frame = _frontFolderSideView.layer.bounds;
    _frontFolderSideShadow.frame = self.bounds;
    
    _backFolderSideShadowMask.frame = _backFolderSideView.layer.bounds;
    
    
    CATransform3D translation = CATransform3DTranslate(transform, 20 * _openState, -10 * _openState , -10 * _openState);
    
    _frontFolderSideView.layer.transform = CATransform3DRotate(
                                                               CATransform3DRotate(translation, -M_PI_2/5, 1, 0, .1 * MIN(1.0,_openState))
                                                               ,-M_PI_2 * _openState, 0, 1, 0);

    _backFolderSideShadow.shadowPath = [UIBezierPath bezierPathWithRect:_frontFolderSideView.frame].CGPath;
    _backFolderSideShadow.shadowOpacity = (ABS(-M_PI_2 * _openState) < M_PI_2)?(1 - _openState) * (_openState) * 3:0;
    _backFolderSideShadow.shadowRadius = 5 + 5 * _openState;
    
    _frontFolderSideShadow.opacity = (ABS(-M_PI_2 * _openState) < M_PI_2) ? _openState : 0;
    
    _backFolderSideView.layer.transform = CATransform3DRotate(
                                                         CATransform3DRotate(translation, -M_PI_2/5, 1, 0, .1 * MIN(1.0, _openState))
                                                         ,-M_PI_2 * _openState * .4, 0, 1, 0);
    [CATransaction commit];
    
}


- (void)setOpenState:(CGFloat)openState {
    if (ABS(openState) > 0.1) {
        [self setNeedsLayout];
    }
    _openState = openState;
}
@end
