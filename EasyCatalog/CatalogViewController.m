//
//  CatalogsViewControler.m
//  EasyCatalog
//
//  Created by OZZE on 04/07/13.
//  Copyright (c) 2013 The Mob Project. All rights reserved.
//

#import "AppDelegate.h"
#import "CatalogViewController.h"
#import "EditCatalogViewController.h"

@interface CatalogViewController () <EditCatalogViewControllerDelegate>

@property (readonly) NSManagedObjectContext *moc;

@end

@implementation CatalogViewController{
    
    NSMutableArray *_catalogs;
}


- (NSManagedObjectContext *) moc {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.managedObjectContext;
    
}

- (void) loadCatalogs {
    
    NSLog(@"CatalogViewController > loadCatalogs");
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Catalogs"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    
    NSError *error;
    NSArray *res = [self.moc executeFetchRequest:request error:&error];
    int resSize = [res count];
    
    if (error) {
        NSLog(@"Erro carregando dados: %@", error);
    } else {
        NSLog(@"Número de ítens no catálogo: %d", resSize);
        _catalogs = [NSMutableArray arrayWithArray:res];
        [self.tableView reloadData];
    }
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[EditCatalogViewController class]]) {
        
        NSLog(@"CatalogViewController > prepareForSegue");
        
        EditCatalogViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
        
        Catalog *catalog = [NSEntityDescription insertNewObjectForEntityForName:@"Catalogs" inManagedObjectContext:self.moc];
        viewController.catalog = catalog;
        
        // catalog.title = @"Novo título";
        // catalog.subtitle = @"Novo subtitulo";
        // catalog.keyword = @"Nova palavra chave";
        
    }
        
}

-(void) editCatalogViewController:(EditCatalogViewController *) viewController saveCatalog:(Catalog *)catalog{
    
    catalog.title = [catalog.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    catalog.subtitle = [catalog.subtitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    catalog.keyword = [catalog.keyword stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (catalog.title.length == 0 || catalog.subtitle.length == 0 || catalog.keyword.length == 0) {
        NSLog(@"CatalogViewController > saveCatalog > Não foi possível salvar");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERRO" message:@"Preencha todos os campos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    
    NSError *error;
    if (![self.moc save:&error]) {
        NSLog(@"Erro salvando: %@", error);
    }
    
    NSLog(@"CatalogViewController > editCatalogViewController > Novo catálogo salvo com sucesso");
    [self.navigationController popToViewController:self animated:YES];
    [self loadCatalogs];
    
}


-(void) editCatalogViewControllerCancel:(EditCatalogViewController *) viewController{
    
    [self.moc rollback];
    [self.navigationController popToViewController:self animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSLog(@"CatalogViewController > viewDidLoad");
    [super viewDidLoad];
    [self loadCatalogs];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _catalogs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellCatalog";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Catalog *catalog = [_catalogs objectAtIndex:indexPath.row];
    cell.textLabel.text = catalog.title;
    cell.detailTextLabel.text = catalog.subtitle;
    
    NSLog(@"CatalogViewController > cellForRowAtIndexPath");
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"Nib name" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
