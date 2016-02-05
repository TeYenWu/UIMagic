//
//  UIMagicTopView.h
//  UIMagic
//
//  Created by 吳德彥 on 1/29/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMagicProtocol.h"
#import "UIMagicRuntimeUtility.h"
#import "UIMagicPlaceHolder.h"

@interface UIMagicTopView : UIView

+ (UIMagicTopView *)sharedUIMagicTopView;

- (UIMagicPlaceHolder *)addFBSPlaceHolderFromSourcePlaceHolder: (UIMagicPlaceHolder *)sourcePlaceHolder inPlaceHolderManager:(id<UIMagicProtocol>)manager;

@end
