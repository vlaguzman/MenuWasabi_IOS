//
//  TipoPlato.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 29/10/12.
//
//

#import <Foundation/Foundation.h>

@interface TipoPlato : NSObject
{
    int id_tipoPlato;
    NSString *nombre;

}

@property int id_tipoPlato;
@property (nonatomic, strong) NSString *nombre;

@end
