//
//  TipoBebida.h
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 17/10/12.
//
//

#import <Foundation/Foundation.h>

@interface TipoBebida : NSObject
{
    NSString *nombre, *fuente_img, *fuente_img_grande, *fuente_img_peq;
    NSString *id_tipoBebida, *id_tipo;
}
@property (nonatomic, strong) NSString *id_tipoBebida, *nombre, *fuente_img, *fuente_img_grande, *fuente_img_peq, *id_tipo;

@end
