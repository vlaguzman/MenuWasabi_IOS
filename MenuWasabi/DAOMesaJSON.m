//
//  DAOMesaJSON.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 20/11/12.
//
//

#import "DAOMesaJSON.h"

NSString *URL_GET_TABLE = @"http://www.brainztore.com/wasabi/consultamesa.php?numero=@%";

@implementation DAOMesaJSON

@synthesize actualTable;

static DAOMesaJSON *sharedDAOMesaJSON = nil;

+(DAOMesaJSON*) sharedInstance
{
    
    if (!sharedDAOMesaJSON) {
        sharedDAOMesaJSON = [[super allocWithZone:NULL]init];
    }
    return sharedDAOMesaJSON;
}

- (Mesa*)getTableByNumber:(int)_number{
    Mesa *table = [[Mesa alloc]init];
    table.id_mesa = [[NSString alloc] initWithFormat:@"%i",_number];
    table.numero = _number;
    
    NSURL *jsonURL = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/consultamesa.php?numero=%i", _number]];
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:jsonURL];
    
    NSDictionary *jsondict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *_mesa = [jsondict objectForKey:@"mesa"];
    NSLog(@"getTableByNumber -Mesa - %@ --- ", _mesa);

    NSDictionary *mesa= [_mesa objectAtIndex:0];
     
    NSString *_estado = [mesa objectForKey:@"estado"];
    NSLog(@"Estado -----> %@", _estado);
    
    table.estado = _estado;
    
    return table;
}



@end
