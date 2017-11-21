//
//  DetailViewController.h
//  FMDBTest
//
//  Created by L on 2017/11/21.
//  Copyright © 2017年 L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDBTest+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

