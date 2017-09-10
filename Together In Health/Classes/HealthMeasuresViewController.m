//
//  HealthMeasuresViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 6/13/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "HealthMeasuresViewController.h"
#import "HealthMeasuresCell.h"
#import "Health.h"
#import "TIHDate.h"

@implementation HealthMeasuresViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(void) loadHealthPersistent
//{
//    
//    NSString* path = [self dataFilePathofDocuments:@"HealthPersistent.archive"];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
//    {
//        
//        self.healthPackage = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//        
//    }
//    else
//    {
//        [self createHealthPackage];
//    }
//}
//
//-(void) saveHealthPersistent
//{
//    NSString* path = [self dataFilePathofDocuments:@"HealthPersistent.archive"];
//    BOOL success = [NSKeyedArchiver archiveRootObject:self.healthPackage toFile:path];
//    if (!success) {
//        
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // [self loadHealthPersistent];
    
    self.dayOffset = 0;
    
    self.thisScrollView.contentSize = CGSizeMake(320, 700);
    
    [self resetDay];
    
    self.whmeasuresArray = [NSArray arrayWithObjects:
                            @"Waist (in inches)",
                            @"Hip (in inches)",
                            @"Waist:Hip",
                            nil];
    
    self.bpArray = [NSArray arrayWithObjects:
                            @"Systolic",
                            @"Diastolic",
                            @"Heart rate",
                            nil];
    
    
    self.cholArray = [NSArray arrayWithObjects:
                        @"Total cholesterol",
                        @"LDL",
                        @"HDL",
                        @"Triglycerides",
                        nil];
    
    self.sugarArray = [NSArray arrayWithObjects:
                        @"Hemoglobin A1C",
                        nil];
    
    self.inflamArray = [NSArray arrayWithObjects:
                        @"CRP",
                        @"INR",
                        @"Sedementation Rate",
                        nil];
    
}


//-(void)createHealthPackage {
//    
//    self.healthPackage = [NSMutableArray array];
//
//        Health* health = [[Health alloc] init];
//        health.healthValue = self.healthMeasuresCell.userData.text;
//
//        [self.healthPackage addObject:health];
//
//    
//}


-(void)resetDay {

    if ([self.health.date compare:[TIHDate dateAtMidnightFromDate:[NSDate date]]] == NSOrderedSame) {
        self.dayLabel.text = @"Today";
    }
    
    else {
        
        self.dayLabel.text = [TIHDate dateStringFromDate:self.health.date withFormat:DateFormatMediumDateNoTime];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int h = 40;
    
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    int h = 30;
    
    return h;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.whmeasuresArray.count;
            break;
        case 1:
            return self.bpArray.count;
            break;
        case 2:
            return  self.cholArray.count;
            break;
        case 3:
            return self.sugarArray.count;
            break;
        case 4:
            return self.inflamArray.count;
            break;
            default:
            break;
            
    }
    return 0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.bounds.size.width, 22)];
    [headerView setBackgroundColor:[UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    //    [headerLabel setBackgroundColor:[UIColor lightGrayColor]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    
    if (section == 0)
        [headerLabel setText:@"   Body Measurements"];
    else if (section == 1)
        [headerLabel setText:@"   Blood Pressure"];
    else if (section == 2)
        [headerLabel setText:@"   Cholesterol"];
    else if (section == 3)
        [headerLabel setText:@"   Blood Sugar"];
    else
        [headerLabel setText:@"   Inflammation"];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    HealthMeasuresCell *myCell = (HealthMeasuresCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];


    switch (indexPath.section) {
        case 0:
            myCell.healthLabel.text = [self.whmeasuresArray objectAtIndex:indexPath.row];
            break;
        case 1:
            myCell.healthLabel.text = [self.bpArray objectAtIndex:indexPath.row];
            break;
        case 2:
            myCell.healthLabel.text = [self.cholArray objectAtIndex:indexPath.row];
            break;
        case 3:
            myCell.healthLabel.text = [self.sugarArray objectAtIndex:indexPath.row];
            break;
        case 4:
            myCell.healthLabel.text = [self.inflamArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
   // myCell.userData.delegate = self;
   // myCell.userData.tag = indexPath.row;
    
    [myCell refreshHealthCell];
    return myCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
}

-(IBAction)resignKeyboard:(id)sender {
    [self.healthMeasuresCell.userData resignFirstResponder];

    
}

- (NSString *)dataFilePathofDocuments:(NSString *)nameoffile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:nameoffile];
    return documentsPath ;
}

- (NSString *)dataFilePathofBundle:(NSString *)nameoffile {
    NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nameoffile];
    return bundlePath;
}


//-(void)viewWillDisappear:(BOOL)animated {
//    [self saveHealthPersistent];
//}
//
//-(void)viewDidDisappear:(BOOL)animated {
//    [self saveHealthPersistent];
//}

@end

