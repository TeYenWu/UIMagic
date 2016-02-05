//
//  UIMagicPlaceHolder.h
//  UIMagic
//
//  Created by 吳德彥 on 1/29/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationButton.h"
#import "UIMagicTopView.h"
#import "UIMagicProtocol.h"
#import "UIView_UIMagic.h"

@interface UIMagicPlaceHolder : UIView

@property(nonatomic) UIView * content;

@property(nonatomic) UIBarItem *barItem;

@property(nonatomic) IBInspectable id<UIMagicProtocol> placeholderManager;

@property(nonatomic, nullable) UIMagicPlaceHolder* targetPlaceHolder;

@property(nonatomic, nullable) UIMagicPlaceHolder* soucePlaceHolder;

+ (UIMagicPlaceHolder *)initWithContent: (UIView *)content;

- (void)initialize;

- (void)moveContentClonetoTargetPlaceHolder: (UIMagicPlaceHolder *)targetPlaceHolder animated:(BOOL) animated;

- (void)retreiveContentCloneWithAnimated:(BOOL) animated;

- (BOOL)isBarItemEqualTo: (UIBarItem *)barItem;

- (BOOL)pointInside:(CGPoint)point;

- (CGPoint)centerOfContentClone;


@end
