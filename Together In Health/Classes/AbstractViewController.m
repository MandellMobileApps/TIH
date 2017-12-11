//
//  AbstractViewController.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "AbstractViewController.h"

#import "ProgressViewController.h"
#import "SQLiteAccess.h"
#import "AppDelegate.h"
#import "Day.h"
#import "TIHDate.h"
#import "Food.h"
#import "UpGradeViewController.h"

@interface AbstractViewController () {
    
    UIView *basecContentView;
    
}

@property (nonatomic, strong) ADBannerView*  adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;
@property (nonatomic, strong) UITableView*  thisTableView;

@end

@implementation AbstractViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewDidLoad
{
//  ********************************************************************************************************
//  Standard backbutton for all Navigation bars
//  ********************************************************************************************************
	[super viewDidLoad];
    
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
	self.navigationItem.backBarButtonItem = backBarItem;
    
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData) name:@"updateData" object:nil];
    
    self.loadAd = YES;

}

-(void)updateData{}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    if (self.loadAd)
    {
        self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 50)];
        self.adBannerView.delegate = self;
        [self.view addSubview:self.adBannerView];
    }
    
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
    if (self.loadAd)
    {
        [self unloadBanner];
        [self.adBannerView removeFromSuperview];
        self.adBannerView = nil;
    }
    

}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{

    
    if (!self.adBannerViewIsVisible)
    {
        self.adBannerViewIsVisible = YES;
        [UIView animateWithDuration:0.3
                         animations:^{
                             CGRect bannerFrame = banner.frame;
                             bannerFrame.origin.y = self.view.bounds.size.height-bannerFrame.size.height;
                             banner.frame = bannerFrame;
         
                             CGRect contentViewFrame = self.baseContentView.frame;
                             contentViewFrame.size.height = self.view.bounds.size.height-bannerFrame.size.height;
                             self.baseContentView.frame = contentViewFrame;
                            if ([self.keyboardView superview])
                            {
                                self.keyboardView.frame = CGRectMake(0, self.view.bounds.size.height-(300 + self.adBannerView.bounds.size.height), self.view.bounds.size.width, 300);
                            }
                         }
                         completion:^(BOOL finished){

                         }];
        
        
    }
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self unloadBanner];
}

-(void) unloadBanner
{
 
    if (self.adBannerViewIsVisible)
    {
        self.adBannerViewIsVisible = NO;
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             CGRect contentViewFrame = self.baseContentView.frame;
                             contentViewFrame.size.height = self.view.bounds.size.height;
                             self.baseContentView.frame = contentViewFrame;
                             
                             CGRect bannerFrame = self.adBannerView.frame;
                             bannerFrame.origin.y = self.view.bounds.size.height;
                             self.adBannerView.frame = bannerFrame;
                             if ([self.keyboardView superview])
                             {
                                 self.keyboardView.frame = CGRectMake(0, (self.view.bounds.size.height-300), self.view.bounds.size.width, 300);
                             }
                         }
                         completion:^(BOOL finished){
                         }];
        
        
    }
    

}




-(void)createGoalPakcage

{
    //self.goalPackage = [NSMutableArray array];
    
    
//    Goal* goal1 = [[Goal alloc] init];
//    
//    goal1.goalName = self.textFieldGoal.text;
//    goal1.by1 = self.textFieldBy1.text;
//    goal1.by2 = self.textFieldBy2.text;
//    goal1.when = self.textFieldWhen.text;
//    goal1.where = self.textFieldWhere.text;
//    goal1.often = self.textFieldOften.text;
//    goal1.when2 = self.textFieldWhen2.text;
//    goal1.where2 = self.textFieldWhere2.text;
//    goal1.often2 = self.textFieldOften2.text;
//    
//    
//    [self.goalPackage addObject:goal1];
//    
//    
//    Goal* goal2 = [[Goal alloc] init];
//    
//    goal2.goalName = self.textFieldGoal.text;
//    goal2.by1 = self.textFieldBy1.text;
//    goal2.by2 = self.textFieldBy2.text;
//    goal2.when = self.textFieldWhen.text;
//    goal2.where = self.textFieldWhere.text;
//    goal2.often = self.textFieldOften.text;
//    goal2.when2 = self.textFieldWhen2.text;
//    goal2.where2 = self.textFieldWhere2.text;
//    goal2.often2 = self.textFieldOften2.text;
//    
//    
//    [self.goalPackage addObject:goal2];
//    
//    Goal* goal3 = [[Goal alloc] init];
//    goal3.goalName = self.textFieldGoal.text;
//    goal3.by1 = self.textFieldBy1.text;
//    goal3.by2 = self.textFieldBy2.text;
//    goal3.when = self.textFieldWhen.text;
//    goal3.where = self.textFieldWhere.text;
//    goal3.often = self.textFieldOften.text;
//    goal3.when2 = self.textFieldWhen2.text;
//    goal3.where2 = self.textFieldWhere2.text;
//    goal3.often2 = self.textFieldOften2.text;
//    
//    
//    [self.goalPackage addObject:goal3];
    
}

-(void) checkForDatabaseInDocuments
{
    NSString *path1 = [self dataFilePathofBundle:@"TIHDatabase.sqlite"];
    NSString *path2 = [self dataFilePathofDocuments:@"TIHDatabase.sqlite"];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path2])
    {
        NSError* error;
        [fileManager copyItemAtPath:path1 toPath: path2 error:&error];
        
        if (error != nil)
        {
            NSLog(@"Error message is %@", [error localizedDescription]);
        }
        
    }
    
    
}

-(void) openEmailClientWithTo:(NSString*)to andSubject:(NSString*)subject andBody:(NSString*)body {
    
    
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if ((mailClass != nil) && ([mailClass canSendMail])){
        MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc] init];
        mailcontroller.mailComposeDelegate = self;
        [mailcontroller setToRecipients:[NSArray arrayWithObject:to]];
        [mailcontroller setSubject:subject];
        [mailcontroller setMessageBody:body isHTML:YES];
        [self presentViewController:mailcontroller animated:YES completion:nil];
        
    }
    
    else{
        //Alert that cannot send mail on this device OS version;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Cannot send mail on this OS version" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            //message.text = @"Result: canceled";
            break;
        case MFMailComposeResultSaved:
            //message.text = @"Result: saved";
            break;
        case MFMailComposeResultSent:
            //message.text = @"Result: sent";
            break;
        case MFMailComposeResultFailed:
            //message.text = @"Result: failed";
            break;
        default:
            //message.text = @"Result: not sent";
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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

-(NSString*)pathForFilename:(NSString*)filename
{
    NSString* path1 = [self dataFilePathofDocuments:[NSString stringWithFormat:@"UpdatedFiles/%@",filename]];
    NSString* path2 = [self dataFilePathofBundle:filename];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path1])
    {
        return path1;
    }
    else if ([fileManager fileExistsAtPath:path2])
    {
        return path2;
    }
    
    return @"";
    
}

#pragma mark - Number pad methods

//-(void)addPickerType:(NSInteger)pickerType withTitle:(NSString*)title tag:(NSInteger)tag delegate:(id)delegate
//{
//    switch (pickerType) {
//  case <#constant#>:
//    <#statements#>
//    break;
//
//  default:
//    break;
//}
//}

-(void)addNumberPadForString:(NSString*)currentValue withTitle:(NSString*)title andUnits:(NSString*)units tag:(NSInteger)tag
{


    self.keyboardEntry = [NSMutableString stringWithString:currentValue];
    self.keyboardTag = tag;
    float startY = 100;
    float startX = (self.view.bounds.size.width-210)/2;
    
    self.keyboardTitleLabel = [[UILabel alloc] init];
    self.keyboardUnitsLabel = [[UILabel alloc] init];
    self.keyboardEntryLabel = [[UILabel alloc] init];
    
    self.keyboardTitleLabel.text = title;
    self.keyboardUnitsLabel.text = units;
    self.keyboardEntryLabel.text = self.keyboardEntry;
 
    self.keyboardTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.keyboardUnitsLabel.textAlignment = NSTextAlignmentCenter;
    self.keyboardEntryLabel.textAlignment = NSTextAlignmentRight;
    
    self.keyboardTitleLabel.frame = CGRectMake(startX, 0, 210, 40);
    self.keyboardUnitsLabel.frame = CGRectMake(startX, 40, 210, 20);
    self.keyboardEntryLabel.frame = CGRectMake(startX, 60, 210, 40);

    self.keyboardTitleLabel.font = [UIFont systemFontOfSize:24];
    self.keyboardUnitsLabel.font = [UIFont systemFontOfSize:18];
    self.keyboardEntryLabel.font = [UIFont systemFontOfSize:40];

    self.keyboardView = [[UIView alloc] init];
    self.keyboardView.backgroundColor = [UIColor lightGrayColor];
    self.keyboardView.clipsToBounds = YES;

    self.keyboardTitleLabel.backgroundColor = [UIColor lightGrayColor];
    self.keyboardUnitsLabel.backgroundColor = [UIColor lightGrayColor];
    self.keyboardEntryLabel.backgroundColor = [UIColor whiteColor];

    self.keyboardTitleLabel.textColor = [UIColor blackColor];
    self.keyboardUnitsLabel.textColor = [UIColor blackColor];
    self.keyboardEntryLabel.textColor = [UIColor blackColor];
    
    [self.keyboardView addSubview:self.keyboardTitleLabel];
    [self.keyboardView addSubview:self.keyboardUnitsLabel];
    [self.keyboardView addSubview:self.keyboardEntryLabel];

    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cancelButton setBackgroundColor:[UIColor darkGrayColor]];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [cancelButton.layer setBorderWidth:1.0];
    [cancelButton.layer setCornerRadius:8.0f];
    [cancelButton.layer setMasksToBounds:YES];
    [cancelButton addTarget:self action:@selector(keyboardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    cancelButton.tag = 13;
    cancelButton.frame = CGRectMake(10,10,80,40);
    [self.keyboardView addSubview:cancelButton];
    
    int i=1;
    for(int r = 0; r < 4; r++) {
        for(int c = 0; c < 3; c++) {
                UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [button setBackgroundColor:[UIColor darkGrayColor]];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [button.layer setBorderColor:[[UIColor whiteColor] CGColor]];
                [button.layer setBorderWidth:1.0];
                [button.layer setCornerRadius:8.0f];
                [button.layer setMasksToBounds:YES];
                [button addTarget:self action:@selector(keyboardButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                button.tag = i;
                CGRect buttonRect = CGRectMake(startX+((c * 70)+2), startY + (r * 50)+2, 65, 46);
                button.frame = buttonRect;
                if (i==10)
                {
                    [button setTitle:@"Done" forState:UIControlStateNormal];
                    button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
                    button.tag = 10;
                
                }
                else if (i==11)
                {
                    [button setTitle:@"0" forState:UIControlStateNormal];
                     button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
                    button.tag = 0;
                
                }
                else if (i==12)
                {
                    [button setTitle:@"<" forState:UIControlStateNormal];
                     button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
                    button.tag = 11;
                
                }
                else
                {
                    [button setTitle:[NSString stringWithFormat:@"%i",i] forState:UIControlStateNormal];
                     button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
                }
            
                [self.keyboardView addSubview:button];
                i++;
        }
        
    }

    [self addBorderAround:self.keyboardView cornerType:CornerTypeSquare withColor:[UIColor blackColor]];

    CGRect hideRect = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 0);
    CGRect showRect;
    if (self.adBannerViewIsVisible)
    {
        showRect = CGRectMake(0, self.view.bounds.size.height-(320 + self.adBannerView.bounds.size.height), self.view.bounds.size.width, 310);
    }
    else
    {
        showRect = CGRectMake(0, self.view.bounds.size.height-320, self.view.bounds.size.width, 310);

    }
    self.keyboardView.frame = hideRect;
    [self.view addSubview:self.keyboardView];
        [self shrinkTable:200];
        [UIView animateWithDuration:0.3
            animations:^
            {
                self.keyboardView.frame = showRect;
            
            }
            completion:^(BOOL finished)
            {

             }];

}


- (void) keyboardButtonClicked:(UIButton*)button
{
                if (button.tag==10)
                {
                    [self keyboardEntryUpdated:self.keyboardEntry tag:self.keyboardTag];
                    [self removeNumberPad];
                
                }
                else if (button.tag==11)
                {
                    if (self.keyboardEntry.length>0)
                    {
                        self.keyboardEntry = [NSMutableString stringWithString:[self.keyboardEntry substringToIndex:self.keyboardEntry.length-1]];
                        self.keyboardEntryLabel.text = self.keyboardEntry;
                    }
                }
                else if (button.tag==13)
                {
                    [self keyboardEntryUpdated:self.keyboardEntry tag:13];
                    [self removeNumberPad];
                }
                else
                {
                    if ([self.keyboardEntry isEqualToString:@"0"])
                    {
                        self.keyboardEntry = [NSMutableString stringWithFormat:@"%li",(long)button.tag];
                        self.keyboardEntryLabel.text = self.keyboardEntry;
                    }
                    else
                    {
                        [self.keyboardEntry appendString:[NSString stringWithFormat:@"%li",(long)button.tag]];
                        self.keyboardEntryLabel.text = self.keyboardEntry;
                    }
                    
                }


}

- (void)keyboardEntryUpdated:(NSString*)entry forTag:(NSInteger)tag {}



-(void)removeNumberPad
{
    [self enlargeTable:200];

    CGRect hideRect = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 200);

        [UIView animateWithDuration:0.3
            animations:^
            {
                self.keyboardView.frame = hideRect;
            
            }
            completion:^(BOOL finished)
            {
                [self.keyboardView removeFromSuperview];
             }];

}

#pragma mark - Table frame change methods


-(void) shrinkTable:(float)height
{
    if (self.thisTableView)
    {
        if (!self.stepsKeypadShowing)
        {
            self.stepsKeypadShowing = YES;
            [UIView animateWithDuration:0.3
                             animations:^{
                                 CGRect new1 = self.thisTableView.frame;
                                 new1.size.height = self.thisTableView.frame.size.height-height;
                                 self.thisTableView.frame = new1;
                             }
                             completion:^(BOOL finished){

                            }];
        }
    }
}

-(void) enlargeTable:(float)height
{
    if (self.thisTableView)
    {
        if (self.stepsKeypadShowing)
        {
            self.stepsKeypadShowing = NO;
            [UIView animateWithDuration:0.3
                             animations:^{
                                 CGRect new1 = self.thisTableView.frame;
                                 new1.size.height = self.thisTableView.frame.size.height+height;
                                 self.thisTableView.frame = new1;

                             }
                             completion:^(BOOL finished){
                             
                             }];
        }
    }
}

#pragma mark - Borders

-(void)addBorderAround:(id)object cornerType:(NSInteger)corner withColor:(UIColor*)color
{

    if ([object isKindOfClass:[UIButton class]])
    {
        UIButton* thisObject = (UIButton*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
    else if ([object isKindOfClass:[UITextField class]])
    {
        UITextField* thisObject = (UITextField*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UITextView class]])
    {
        UITextView* thisObject = (UITextView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UILabel class]])
    {
        UILabel* thisObject = (UILabel*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:1.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
     else if ([object isKindOfClass:[UIView class]])
    {
        UIView* thisObject = (UIView*)object;
        [thisObject.layer setBorderColor:[color CGColor]];
        [thisObject.layer setBorderWidth:5.0];
        if (corner == CornerTypeRounded)
        {
            [thisObject.layer setCornerRadius:8.0f];
            [thisObject.layer setMasksToBounds:YES];
        }
    
    }
}

-(void)removeBorderFrom:(id)object
{

    if ([object isKindOfClass:[UIButton class]])
    {
        UIButton* thisObject = (UIButton*)object;
        [thisObject.layer setBorderWidth:0.0];
        [thisObject.layer setCornerRadius:0.0f];
        [thisObject.layer setMasksToBounds:NO];
    
    }
    else if ([object isKindOfClass:[UITextField class]])
    {
        UITextField* thisObject = (UITextField*)object;
        [thisObject.layer setBorderWidth:0.0];
        [thisObject.layer setCornerRadius:0.0f];
        [thisObject.layer setMasksToBounds:NO];
    
    }
     else if ([object isKindOfClass:[UITextView class]])
    {
        UITextView* thisObject = (UITextView*)object;
        [thisObject.layer setBorderWidth:0.0];
        [thisObject.layer setCornerRadius:0.0f];
        [thisObject.layer setMasksToBounds:NO];
    
    }
     else if ([object isKindOfClass:[UILabel class]])
    {
        UILabel* thisObject = (UILabel*)object;
        [thisObject.layer setBorderWidth:0.0];
        [thisObject.layer setCornerRadius:0.0f];
        [thisObject.layer setMasksToBounds:NO];
    
    }
     else if ([object isKindOfClass:[UIView class]])
    {
        UIView* thisObject = (UIView*)object;
        [thisObject.layer setBorderWidth:0.0];
        [thisObject.layer setCornerRadius:0.0f];
        [thisObject.layer setMasksToBounds:NO];
    
    }
}



-(void)resetDay{}

#pragma mark - Custom Modal Presentation

-(void)presentAsFullModel:(UIViewController *)thisViewController
{
	thisViewController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:thisViewController.view];
    
        [UIView animateWithDuration:0.3
			animations:^{
    			thisViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
			}
			completion:^(BOOL finished){
                [self addChildViewController:thisViewController];
                [thisViewController didMoveToParentViewController:self];
			}];
}

-(void) dismissAsFullModal:(UIViewController *)thisViewController
{

        [UIView animateWithDuration:0.3
			animations:^{
				thisViewController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
			}
			completion:^(BOOL finished){
                [thisViewController.view removeFromSuperview];
                [thisViewController removeFromParentViewController];
			}];

}

-(void)displayAlert:(NSString*)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.tag = 1000;
    [alert show];
    
}

-(void)loadUpgradeViewController {
    UpGradeViewController* upGradeViewController = (UpGradeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"UpGradeViewController"];

    [self.navigationController pushViewController:upGradeViewController animated:YES];
}

@end
