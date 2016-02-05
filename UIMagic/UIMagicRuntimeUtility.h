//
//  UIMagicRuntimeUtility.h
//  UIMagic
//
//  Created by 吳德彥 on 2/4/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UINavigationButton.h"

@interface UIMagicRuntimeUtility : NSObject

+ (BOOL) isRuntimeView :(UIView *) view;

+ (UIBarItem *)getOriginalBarItemFromRuntimeView: (UIView *) view;

+ (UIView *)cloneGeneralViewFromRuntimeView: (UIView *)view;

@end
