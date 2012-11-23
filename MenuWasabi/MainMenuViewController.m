//
//  MainMenuViewController.m
//  MenuWasabi
//
//  Created by GIOVANNI LOPEZ on 21/09/12.
//
//

#import "MainMenuViewController.h"
#import "DAOMesaJSON.h"

#define OCUPADA 1
#define DISPONIBLE 2

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize menuViewController = _menuViewController;
@synthesize textTableNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{

   
    [textTableNumber release];
    textTableNumber = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Replace this method
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

// Add new method
- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

// Add new methods
- (void)viewApp:(id)arg
{
    /*
    if (_rootViewController == nil) {
        self.rootViewController = [[[RootViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    [self.navigationController pushViewController:_rootViewController animated:YES];
     */
    if (_menuViewController == nil) {
        self.menuViewController = [[[MenuViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    [self.navigationController pushViewController:_menuViewController animated:YES];
}

- (IBAction)viewTapped:(id)sender
{
    [self viewApp:nil];
}

- (void)dealloc
{
    //[_rootViewController release];
    //_rootViewController = nil;
    [_menuViewController release];
    _menuViewController = nil;
    [textTableNumber release];
    [super dealloc];
}

- (IBAction)addTableNumber:(id)sender
{
    
    NSString *num = @"";
    num = [textTableNumber text];
    
    Mesa *tempTable = [[Mesa alloc]init];
    tempTable = [[DAOMesaJSON sharedInstance] getTableByNumber:[num intValue]];
    if(tempTable.estado == DISPONIBLE){
        textTableNumber.enabled = false;
        NSLog(@"MESA DISPONOBLE ----- %@", num);
        tempTable.estado = OCUPADA;
        [[DAOMesaJSON sharedInstance] updateTableState:tempTable.numero withState:OCUPADA];
        [[DAOMesaJSON sharedInstance] setActualTable:tempTable];
    }
    else
        NSLog(@"MESA OCUPADA ---- %@", num);
    
    
}
@end
