//
//  UIMagicNavigationItem.h
//  UIMagic
//
//  Created by 吳德彥 on 2/2/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMagicPlaceHolder.h"
#import "NSMutableArray_IndexHelper.h"
#import "NSArray+IndexHelper.h"
@interface UIMagicNavigationItem : UINavigationItem<UIMagicProtocol>

@property (nonatomic) IBInspectable NSInteger maxofLeftItemPlaceHolders;

@property (nonatomic) IBInspectable NSInteger maxofRightItemPlaceHolders;

@property (nonatomic) NSMutableArray<UIMagicPlaceHolder *> *leftPlaceHolders;

@property (nonatomic) NSMutableArray<UIMagicPlaceHolder *> *rightPlaceHolders;

@property (nonatomic) UINavigationBar *navigationBar;

@property (nonatomic) UIMagicPlaceHolder *fbsPlaceHolder;

-(void) connectBarItemsToRuntimeViews: (NSArray *)subviews inNavigationBar:(UINavigationBar *)navigationBar;

@end
