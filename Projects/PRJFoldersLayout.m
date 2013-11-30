//
//  PRJFoldersLayout.m
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-16.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import "PRJFoldersLayout.h"
#import "PRJFoldersLayoutAttributes.h"

@implementation PRJFoldersLayout
{
    NSDictionary* _itemsDict;
    NSArray* _itemsArr;
    
    
    CGSize _contentSize;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    NSMutableArray *itemsArr = [NSMutableArray array];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    CGFloat widthOffset = 0;
    
    id<PRJFoldersLayoutDelegate> delegate = (id<PRJFoldersLayoutDelegate>)self.collectionView.delegate;
    
        
        for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:0]; item++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            CGFloat width = [delegate collectionView:self.collectionView
                                              layout:self
                             widthForItemAtIndexPath:indexPath];
            
            [dict setObject:@{@"width":@(width), @"position":@(widthOffset)} forKey:indexPath];
            
            [itemsArr addObject:@{@"width":@(width), @"position":@(widthOffset)}];
            
            widthOffset += width + 200;
        }
        
    
    _contentSize = CGSizeMake(widthOffset, self.collectionView.bounds.size.height);
    _itemsArr = [itemsArr copy];
    _itemsDict = [dict copy];
    
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(_contentSize.width,
                      MAX(self.collectionView.bounds.size.height, _contentSize.height));
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSInteger item = 0; item < _itemsArr.count; item++) {
        CGRect frameRect = CGRectMake([_itemsArr[item][@"position"] floatValue],0,
                                      [_itemsArr[item][@"width"] floatValue],
                                      [_itemsArr[item][@"width"] floatValue]/*self.collectionView.bounds.size.height*/);
        
        if (CGRectIntersectsRect(rect, frameRect)) {
            PRJFoldersLayoutAttributes *layoutAttrs = [PRJFoldersLayoutAttributes
                                                       layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
//            layoutAttrs.frame = frameRect;
            layoutAttrs.size = CGSizeMake(frameRect.size.width * 2, frameRect.size.height * 2);
            
            layoutAttrs.center = CGPointMake(CGRectGetMidX(frameRect), CGRectGetHeight(self.collectionView.bounds) / 2.0);

            CGFloat c = ABS(CGRectGetMidX(self.collectionView.bounds)
                            - CGRectGetMidX(layoutAttrs.frame)) / (CGRectGetWidth(self.collectionView.bounds) / 3.0);

            CGFloat scale = MAX(1,(1.0 - c * 0.5) * 2) / 2.0;
            layoutAttrs.transform3D = CATransform3DMakeScale(scale, scale, scale);

            layoutAttrs.openState =  MAX(0,(1.0 - c) * .85);
            [arr addObject:layoutAttrs];
        }
    }
    
    
    return [arr copy];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    PRJFoldersLayoutAttributes* layoutAttrs = [PRJFoldersLayoutAttributes
//                                                       layoutAttributesForCellWithIndexPath:indexPath];
//    CGRect frame = CGRectMake([_itemsDict[indexPath][@"width"] floatValue],0,
//                              [_itemsDict[indexPath][@"height"] floatValue],
//                              _contentSize.height);
////    layoutAttrs.frame = frame;
//    CGFloat c = ABS(CGRectGetMidX(self.collectionView.bounds)
//                    - CGRectGetMidX(layoutAttrs.frame))/(CGRectGetWidth(self.collectionView.bounds)/2.0);
//
//    layoutAttrs.size = frame.size;
//    layoutAttrs.center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
//    layoutAttrs.transform3D = CATransform3DMakeScale(MAX(1,(1-c)*2), MAX(1,(1-c)*2), 1);
//    
//    layoutAttrs.openState =  MAX(0,(1.0-c)*.50);
//    
//    
//    
//    return layoutAttrs;
    return NULL;
}


@end
