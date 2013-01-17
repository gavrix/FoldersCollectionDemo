//
//  PRJFolderViewCell.m
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-16.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import "PRJFolderViewCell.h"
#import "PRJFolderVIew.h"
#import "PRJFoldersLayoutAttributes.h"
#import <QuartzCore/QuartzCore.h>

@implementation PRJFolderViewCell
{
    PRJFolderVIew* _folderView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _folderView = [[PRJFolderVIew alloc] initWithFrame:self.bounds];
        [self addSubview:_folderView];
    }
    return self;
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    
    if([layoutAttributes isKindOfClass:[PRJFoldersLayoutAttributes class]]){
        CGFloat openState = [(PRJFoldersLayoutAttributes*)layoutAttributes openState];
        [_folderView setOpenState: openState];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    _folderView.frame = CGRectMake(CGRectGetMidX(self.bounds) - 50,
//               CGRectGetMidY(self.bounds)-50, 100, 100);
    _folderView.frame = self.bounds;
}

@end
