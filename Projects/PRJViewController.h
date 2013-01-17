//
//  PRJViewController.h
//  Projects
//
//  Created by Sergey Gavrilyuk on 13-01-15.
//  Copyright (c) 2013 Sergey Gavrilyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PRJFolderVIew;

@interface PRJViewController : UIViewController
{
    
    __weak IBOutlet PRJFolderVIew *_folderView;
    __weak IBOutlet UISlider *_openStateSlider;
}
@end
