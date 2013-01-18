//
//  PRJFolderVIew.h
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-14.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PRJFolderVIew : UIView
{
    UIView* _frontFolderSideView;

    CAGradientLayer* _frontFolderSideShadow;
    CALayer* _frontFolderSideShadowMask;
    CALayer* _backFolderSideShadow;
    CALayer* _backFolderSideShadowMask;
    
    UIView* _backFolderSideView;
}

//0.0-1.0
@property (nonatomic, assign) CGFloat openState;
@end
