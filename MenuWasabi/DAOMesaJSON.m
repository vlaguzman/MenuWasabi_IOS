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
     
    int _estado = [[mesa objectForKey:@"estado"] intValue];
    NSLog(@"Estado -----> %i", _estado);
    
    table.estado = _estado;
    
    return table;
}

-(void)updateTableState:(int)_table withState:(int)_state{
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://www.brainztore.com/wasabi/updateestadomesa.php?mesa=%i&estado=%i", _table, _state]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSLog(@"request %@", request);
    conx = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conx){
        webData=[NSMutableData data];
        NSLog(@"conexión exitosa updateTableState");
    }
}



@end
