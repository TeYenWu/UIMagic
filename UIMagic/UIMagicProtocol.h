//
//  UIMagicProtocol.h
//  UIMagic
//
//  Created by 吳德彥 on 1/30/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#ifndef UIMagicProtocol_h
#define UIMagicProtocol_h
#import <UIKit/UIKit.h>

@class UIMagicPlaceHolder;
@protocol UIMagicProtocol<NSObject>

- (UIMagicPlaceHolder *)placeholderAtPoint: (CGPoint) point;

- (void)moveContent:(UIView *) content fromSourcePlaceHolder: (UIMagicPlaceHolder *) sourcePlaceHolder toProposedPlaceHolder: (UIMagicPlaceHolder *) proposedDestinationPlaceHolder;

- (void)exchangeContenstInSourcePlaceHolder:(UIMagicPlaceHolder *)sourcePlaceHolder toTargetPlaceHolder:(UIMagicPlaceHolder *)proposedDestinationPlaceHolder;

- (BOOL)removePlaceHolder: (UIMagicPlaceHolder *)placeholder;

- (void)resetPositionOfAllPlaceHolders;
@end


#endif /* UIMagicProtocol_h */
