//
//  UIMagicPlaceHolderManager.h
//  UIMagic
//
//  Created by 吳德彥 on 1/31/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMagicPlaceHolder.h"

@interface UIMagicPlaceHolderManager : UIView<UIMagicProtocol>

@property NSMutableArray<UIMagicPlaceHolder *> * placeholders;

- (void) producePlaceHoldersWithView: (UIView *) view;

@end
