//
//  TopicViewControllerView.m
//  Nutrition Questions
//
//  Created by Cami Mandell on 9/18/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "HealthQuestionsViewController.h"

@interface HealthQuestionsViewController()

@property (nonatomic,strong) NSArray* tablelist;
@property (nonatomic,strong) IBOutlet UIImageView* imageNavigation;
@property(nonatomic,strong) NSArray* listArray;
@property(nonatomic,strong) NSArray* imageArray;

@end;

@implementation HealthQuestionsViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.listArray = [NSArray arrayWithObjects:
                       @"",
                       @"Letter.png",
                       @"Letter.png",
                       @"FAQ image.png",
                       @"star.png",
                       nil];
    self.imageArray = [NSArray arrayWithObjects:
                       @"Weight control.png",
                       @"Star.png",
                       @"Letter.png",
                       @"Potatoes.png",
                       nil];
    
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Property List.plist"];
    
    self.tablelist = [NSArray arrayWithContentsOfFile:bundlePath];
    NSString* path = [self dataFilePathofDocuments:@"Starlist.plist"];
    self.starList = [NSMutableArray arrayWithContentsOfFile:path];
    
    if (!self.starList)
    {
        self.starList = [NSMutableArray array];
    }
    

    
switch (self.barButtonType) {
    case 0:
    {
            UIImage *faceImage = [UIImage imageNamed:@"Star.png"];
            UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
            face.bounds = CGRectMake( 0, 0, 40, 40);//set bound as per you want
            [face addTarget:self action:@selector(someMethod) forControlEvents:UIControlEventTouchUpInside];
            [face setImage:faceImage forState:UIControlStateNormal];
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:face];
            self.navigationItem.rightBarButtonItem = backButton;
    }
        break;
        
    case 1:
    {
        UIImage *faceImage = [UIImage imageNamed:@"Weight control.png"];
        UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
        face.bounds = CGRectMake( 0, 0, 40, 40);//set bound as per you want
        [face addTarget:self action:@selector(someMethod) forControlEvents:UIControlEventTouchUpInside];
        [face setImage:faceImage forState:UIControlStateNormal];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:face];
        self.navigationItem.rightBarButtonItem = backButton;
    }
        break;
        
    case 2:
    {
        UIImage *faceImage = [UIImage imageNamed:@"Letter.png"];
        UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
        face.bounds = CGRectMake( 0, 0, 40, 40);//set bound as per you want
        [face addTarget:self action:@selector(someMethod) forControlEvents:UIControlEventTouchUpInside];
        [face setImage:faceImage forState:UIControlStateNormal];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:face];
        self.navigationItem.rightBarButtonItem = backButton;
    }
        break;
        
    case 3:
    {
        UIImage *faceImage = [UIImage imageNamed:@"FAQ image.png"];
        UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
        face.bounds = CGRectMake( 0, 0, 40, 40);//set bound as per you want
        [face addTarget:self action:@selector(someMethod) forControlEvents:UIControlEventTouchUpInside];
        [face setImage:faceImage forState:UIControlStateNormal];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:face];
        self.navigationItem.rightBarButtonItem = backButton;
    }
        break;
    default:
        break;
        

}
}


//    NSString* tempstring = [self.topic objectForKey:@"BackGroundImageName"];
//    
//    self.BackgroundImageView.image = [UIImage imageNamed:tempstring];
//    
//    UIImage *image = [UIImage imageNamed:@"BackGroundImageName"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    NSArray* questions = [self.topic objectForKey:@"Questions"];
    return questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"BasicCell";
    TopicViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray* temp = [self.topic objectForKey:@"Questions"];
    NSDictionary* temp2 = [temp objectAtIndex:indexPath.row];
    NSString* question = [temp2 objectForKey:@"Question"];
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.label1 = self.filteredQuestionArray;
    } else {
        cell.label1.text = question;
    }
    
//    cell.label1.text = question;

    if ([self.starList containsObject:question])
    {
        cell.imageView1.hidden = NO;
        //self.imageView1.image = [UIImage imageNamed:@"star.png"];
    }
    else
    {
        cell.imageView1.hidden = YES;
        //self.imageView1.image = nil;
    }
    


    return cell;



//    static NSString *CellIdentifier = @"BasicCell";
//    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    NSDictionary* temp = [self.tablelist objectAtIndex:indexPath.row];
//    
//    cell.label1.text = [temp objectForKey:@"Topic"];
//    //    cell.imageView1.image = [temp objectForKey:@"TopicImage.png"];
//    //
//    //    NSDictionary* temp2 = [self.tablelist objectAtIndex:indexPath.row];
//    //    cell.imageView1.image = [temp2 objectForKey:@"TopicImage.png"];
//    
//    NSString* filename = [self.listArray objectAtIndex:indexPath.row];
//    
//    cell.imageView1.image = [UIImage imageNamed:filename];
//    
//    return cell;
    
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
    
    AnswerViewController* answerViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"AnswerViewController"];
    
    NSArray* temp = [self.topic objectForKey:@"Questions"];
    answerViewController.questionAnswer = [temp objectAtIndex:indexPath.row];
    answerViewController.barButtonType = indexPath.row;
    answerViewController.topicViewControllerView = self;
//    answerViewController.row = self.row;
    
    [self.navigationController pushViewController:answerViewController animated:YES];

    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    [self.filteredQuestionArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Question contains [cd] %@",searchText];
    self.filteredQuestionArray = [self.questions filteredArrayUsingPredicate:predicate];
    
    self.filteredQuestionArray = [NSMutableArray arrayWithObject:self.questions];
    
//    NSString* question = [self.starList objectAtIndex:indexPath.row];
//    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"Question = %@",question];
//    NSArray *qaArray = [self.qaList filteredArrayUsingPredicate:bPredicate];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
        return YES;
    }
                              
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
    }

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



@end
