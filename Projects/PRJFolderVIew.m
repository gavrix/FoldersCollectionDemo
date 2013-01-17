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

-(void) commonInit{
    _frontFolderSideView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"folder.png"]];
    _frontFolderSideView.layer.anchorPoint = CGPointMake(0, 1);
//    _folderLayer.rasterizationScale = 0.45;
    
    _backFolderSideLayer = [CALayer layer];
    _backFolderSideLayer.backgroundColor = [UIColor whiteColor].CGColor;
    _backFolderSideLayer.shouldRasterize = YES;
    _backFolderSideLayer.anchorPoint = CGPointMake(0, 1);
//    _backFolderSideLayer.contents = (id)[UIImage imageNamed:@"folder.png"].CGImage;


    [self.layer addSublayer:_backFolderSideLayer];
    [self  addSubview:_frontFolderSideView];
    
#if UI_DEBUG
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 1.0;
#endif
//    self.backgroundColor = [UIColor whiteColor];

}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _frontFolderSideView.frame = CGRectInset(self.bounds, 0, 0);
   
    _backFolderSideLayer.frame = CGRectInset(self.bounds, 0, 0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1/-500.0;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    _folderLayer.transform = CATransform3DTranslate(CATransform3DRotate(CATransform3DTranslate(transform, -_folderLayer.bounds.size.width/2.0, _folderLayer.bounds.size.height/2.0, 0),
//                                                                        -M_PI_2*_openState, 0, 1, .1),
//                                                    _folderLayer.bounds.size.width/2.0, -_folderLayer.bounds.size.height/2.0, 0);
    _frontFolderSideView.layer.transform = CATransform3DRotate(
                                                 CATransform3DRotate(transform, -M_PI_2/5, 1, 0, .1*MIN(1.0,_openState))
                                                 ,-M_PI_2*_openState, 0, 1, 0);

    _backFolderSideLayer.transform = CATransform3DRotate(
                                                         CATransform3DRotate(transform, -M_PI_2/5, 1, 0, .1*MIN(1.0,_openState))
                                                         ,M_PI_2*_openState*.4, 0, 1, 0);
    [CATransaction commit];
}


-(void)setOpenState:(CGFloat)openState{
    _openState = openState;
    [self setNeedsLayout];
}
@end
