//
//  GQSDetailViewController.m
//  UserActivityDemo
//
//  Created by 郭桥生 on 2018/10/10.
//  Copyright © 2018 guoqiaosheng. All rights reserved.
//

#import "GQSDetailViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GQSDetailViewController ()

@end

@implementation GQSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.detailID) {
        NSArray *cssearchIDArray = [self.detailID componentsSeparatedByString:@","];
        self.detailTitle = cssearchIDArray.firstObject;
        self.detailDesc = cssearchIDArray.lastObject;
    }
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = self.detailTitle;
    label1.font = [UIFont systemFontOfSize:18];
    label1.frame = CGRectMake(30, 100, 414 - 30, 50);
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = self.detailDesc;
    label2.font = [UIFont systemFontOfSize:18];
    label2.frame = CGRectMake(30, 160, 414 - 30, 50);
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = [NSString stringWithFormat:@"CSSearchID:%@", self.detailID];
    label3.font = [UIFont systemFontOfSize:18];
    label3.frame = CGRectMake(30, 220, 414 - 30, 50);
    [self.view addSubview:label3];
    
    CSSearchableItemAttributeSet *set = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeContact];
    set.title = self.detailTitle;
    set.contentDescription = self.detailDesc;
    set.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"11"]);
    set.keywords = @[@"GQS", self.detailTitle, self.detailDesc];
    set.relatedUniqueIdentifier = nil;
    
    __weak typeof(self) weakSelf = self;
    CSSearchableItem *searchItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"%@,%@", self.detailTitle, self.detailDesc] domainIdentifier:@"GQS" attributeSet:set];
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[searchItem] completionHandler:^(NSError * _Nullable error) {
        NSLog(@"inset search index failed , title = %@", weakSelf.detailTitle);
    }];
}


@end
