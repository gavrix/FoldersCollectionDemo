//
//  PRJFoldersLayout.h
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-16.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRJFoldersLayout;

@protocol PRJFoldersLayoutDelegate<NSObject>
- (CGFloat)collectionView:(UICollectionView*) collectionView
                   layout:(PRJFoldersLayout *)collectionViewLayout
  widthForItemAtIndexPath:(NSIndexPath*) indexPath;

@end

@interface PRJFoldersLayout : UICollectionViewLayout

@end
