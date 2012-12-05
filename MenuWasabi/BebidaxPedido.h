//
//  BebidaxPedido.h
//  MenuWasabi
//
//  Created by Giovanni Lopez on 12/5/12.
//  Copyright (c) 2012 3dementes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bebida.h"

@interface BebidaxPedido : NSObject
{
    Bebida *beverage;
    int amount;
}

@property (nonatomic, strong) Bebida *beverage;
@property int amount;

@end
