//
//  PRJFolderVIew.h
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-14.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRJFolderVIew : UIView
{
    UIView* _frontFolderSideView;
    CALayer* _backFolderSideLayer;
}

//0.0-1.0
@property (nonatomic, assign) CGFloat openState;
@end
