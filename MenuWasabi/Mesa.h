//
//  Mesa.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 30/10/12.
//
//

#import <Foundation/Foundation.h>

@interface Mesa : NSObject
{
    NSString *id_mesa, *estado;
    int numero;
}
    @property (nonatomic, strong) NSString *id_mesa, *estado;
    @property int numero;
@end
