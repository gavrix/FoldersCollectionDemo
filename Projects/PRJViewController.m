//
//  PRJViewController.m
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-15.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import "PRJViewController.h"
#import "PRJFolderVIew.h"
#import "PRJFolderViewCell.h"
#import "PRJFoldersLayout.h"


static NSString* kFolderCellIdentifier = @"kFolderCellIdentifier";

@interface PRJViewController ()<UICollectionViewDataSource, PRJFoldersLayoutDelegate>
{
    NSArray* _folders;
    __weak IBOutlet UICollectionView *_collectionView;
    
}
@end

@implementation PRJViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSMutableArray* arr = [@[] mutableCopy];
        for(int i=0;i<20;i++){
            [arr addObject:@(i)];
        }
        _folders = arr.copy;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_collectionView registerClass:[PRJFolderViewCell class]
        forCellWithReuseIdentifier:kFolderCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)_openStateValueChanged:(id)sender {
    _folderView.openState = _openStateSlider.value;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Collection view
////////////////////////////////////////////////////////////////////////////////////////////////////

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _folders.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PRJFolderViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFolderCellIdentifier
                                                                        forIndexPath:indexPath];
//    cell.frame = CGRectMake(0, 0, 50, 50);
    return cell;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(PRJFoldersLayout *)collectionViewLayout
 widthForItemAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
