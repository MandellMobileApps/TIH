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
    
    self.loadAd = NO;

//  ********************************************************************************************************
//  DeviceFramingView to adjust for 30pt iPhoneX statusbar
//  ********************************************************************************************************
    NSLog(@"0 self.appDelegate %@",self.appDelegate );

    if (self.appDelegate.iPhoneX)
    {
        self.deviceFramingView.frame = CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height-44);
    }
    else
    {
        self.deviceFramingView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    }
    NSLog(@"0 deviceFramingView %@",NSStringFromCGRect(self.deviceFramingView.frame) );


}

-(void)updateData{}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.appDelegate.subscriptionLevel == 0)
    {
        self.upgradeNowButton.hidden = NO;
    }
    else
    {
        self.upgradeNowButton.hidden = YES;
    }

}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    if (self.loadAd)
    {
        self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.deviceFramingView.bounds.size.height, 320, 50)];
        self.adBannerView.delegate = self;
        [self.deviceFramingView addSubview:self.adBannerView];
    }
    
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]  removeObserver:self];

    

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


 #pragma mark -  Picker methods
                                                       // array of rows in order of components
-(void)addPickerViewForArrays:(NSArray*)arrays
    defaultValues:(NSArray*)defaults animated:(BOOL)animated
    withTitle:(NSString*)title tag:(NSInteger)tag
{
    if (!self.keypadShowing)
    {
        self.keypadShowing = YES;
        
        self.pickerHeight = 200;
        self.pickerWidth = 320;
        self.pickerTag = tag;
        self.pickerViewContainer = [[UIView alloc]init];
        self.pickerHideRect = CGRectMake((self.deviceFramingView.bounds.size.width - self.pickerWidth)/2, self.deviceFramingView.bounds.size.height, self.pickerWidth, 0);
        self.pickerShowRect = CGRectMake((self.deviceFramingView.bounds.size.width - self.pickerWidth)/2, self.deviceFramingView.bounds.size.height-self.pickerHeight, self.pickerWidth, self.pickerHeight);
        self.pickerViewContainer.clipsToBounds = YES;
        self.pickerViewContainer.frame = self.pickerHideRect;
        self.pickerViewContainer.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
        [self addBorderAround:self.pickerViewContainer cornerType:CornerTypeRounded withColor:[UIColor darkGrayColor]];

        CGRect cancelButtonRect = CGRectMake(0,0, 80, 40);
        UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        cancelButton.frame = cancelButtonRect;
        cancelButton.tag = ButtonIndexCancel;
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(pickerViewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

        CGRect doneButtonRect = CGRectMake(self.pickerShowRect.size.width-80,0, 80, 40);
        UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        doneButton.frame = doneButtonRect;
        doneButton.tag = ButtonIndexDone;
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(pickerViewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

        self.pickerView = [[UIPickerView alloc]init];
        CGRect pickerFrame = CGRectMake(10, 50, self.pickerWidth-20, self.pickerHeight-60);
        self.pickerView.frame = pickerFrame;
        [self.pickerView setDataSource: self];
        [self.pickerView setDelegate: self];
        self.pickerView.showsSelectionIndicator = YES;
        
        self.pickerTitleLabel = [[UILabel alloc] init];
        self.pickerTitleLabel.text = title;
        self.pickerTitleLabel.frame = CGRectMake(10,30, self.pickerShowRect.size.width-20, 40);
        [self.pickerTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.pickerTitleLabel setFont:[UIFont systemFontOfSize:24.0]];
        [self.pickerTitleLabel setTextColor:[UIColor darkGrayColor]];

        [self.pickerViewContainer addSubview:self.pickerView];
        [self.pickerViewContainer addSubview:self.pickerTitleLabel];
        [self.pickerViewContainer addSubview:cancelButton];
        [self.pickerViewContainer addSubview:doneButton];
        self.pickerComponentsArrays = arrays;
      
        if (defaults)
        {
            NSInteger component = 0;
            for (NSNumber* number in defaults)
            {
                NSInteger row = [number integerValue];
                [self.pickerView selectRow:row inComponent:component animated:animated];
                component++;
            }
        }
        

        [self addBorderAround:self.pickerViewContainer cornerType:CornerTypeSquare withColor:[UIColor darkGrayColor]];
        [self.deviceFramingView addSubview:self.pickerViewContainer];
            [self shrinkTable:self.pickerHeight];
            [UIView animateWithDuration:0.3
                animations:^
                {
                    self.pickerViewContainer.frame = self.pickerShowRect;

                }
                completion:^(BOOL finished)
                {

                 }];
    }
}
- (void)pickerViewButtonClicked:(UIButton*)button
{
    if (button.tag == ButtonIndexCancel)
    {
        [self pickerViewDidSelect:nil tag:self.pickerTag];
        [self removePickerView];
    }
    else if (button.tag == ButtonIndexDone)
    {
        [self pickerViewDidSelect:self.pickerView tag:self.pickerTag];
        [self removePickerView];
    }
    
}










- (void)pickerViewDidSelect:(UIPickerView *)pickerView tag:(NSInteger)tag{}

-(void)removePickerView
{

    [self enlargeTable:self.pickerHeight];

        [UIView animateWithDuration:0.3
            animations:^
            {
                self.pickerViewContainer.frame = self.pickerHideRect;
            }
            completion:^(BOOL finished)
            {
                [self.pickerViewContainer removeFromSuperview];
                self.pickerViewContainer = nil;
                self.keypadShowing = NO;
             }];

}

#pragma mark - Number pad methods

-(void)addNumberPadForString:(NSString*)currentValue withTitle:(NSString*)title andUnits:(NSString*)units tag:(NSInteger)tag;
{
    if (!self.keypadShowing)
    {
        self.keypadShowing = YES;
        self.numberPadWidth = 230;
        self.numberPadHeight = 340;
        self.numberPadCurrentValue = [NSMutableString stringWithString:currentValue];
        self.numberPadTag = tag;

        CGRect cancelButtonRect = CGRectMake(0,0, 80, 40);
        UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        cancelButton.frame = cancelButtonRect;
        cancelButton.tag = ButtonIndexCancel;
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(numberPadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.numberPadTitleLabel = [[UILabel alloc] init];
        self.numberPadUnitsLabel = [[UILabel alloc] init];
        self.numberPadEntryLabel = [[UILabel alloc] init];
        UIView* entryBackground = [[UIView alloc] init];

        self.numberPadTitleLabel.text = title;
        self.numberPadUnitsLabel.text = units;
        self.numberPadEntryLabel.text = self.numberPadCurrentValue;
     
        self.numberPadTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.numberPadUnitsLabel.textAlignment = NSTextAlignmentCenter;
        self.numberPadEntryLabel.textAlignment = NSTextAlignmentRight;
        
        float startY = 130;
        float startX = 10;
        self.numberPadTitleLabel.frame = CGRectMake(startX, 30, self.numberPadWidth-(startX*2), 40);
        self.numberPadUnitsLabel.frame = CGRectMake(startX, 70, self.numberPadWidth-(startX*2), 20);
        entryBackground.frame = CGRectMake(startX+10, 95, self.numberPadWidth-((startX+10)*2), 30);
        self.numberPadEntryLabel.frame = CGRectMake(startX+20, 97, self.numberPadWidth-((startX+20)*2), 26);
        [self addBorderAround:entryBackground cornerType:CornerTypeSquare withColor:[UIColor darkGrayColor]];

        self.numberPadTitleLabel.font = [UIFont systemFontOfSize:24];
        self.numberPadUnitsLabel.font = [UIFont systemFontOfSize:18];
        self.numberPadEntryLabel.font = [UIFont systemFontOfSize:30];

        self.numberPadView = [[UIView alloc] init];
        self.numberPadView.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
        self.numberPadView.clipsToBounds = YES;
        [self addBorderAround:self.numberPadView cornerType:CornerTypeRounded withColor:[UIColor darkGrayColor]];

        self.numberPadTitleLabel.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
        self.numberPadUnitsLabel.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
        entryBackground.backgroundColor = [UIColor whiteColor];
        self.numberPadEntryLabel.backgroundColor = [UIColor whiteColor];
        
        self.numberPadTitleLabel.textColor = [UIColor darkGrayColor];
        self.numberPadUnitsLabel.textColor = [UIColor darkGrayColor];
        self.numberPadEntryLabel.textColor = [UIColor darkGrayColor];
        
        [self.numberPadView addSubview:self.numberPadTitleLabel];
        [self.numberPadView addSubview:self.numberPadUnitsLabel];
        [self.numberPadView addSubview:entryBackground];
        [self.numberPadView addSubview:self.numberPadEntryLabel];
        [self.numberPadView addSubview:cancelButton];
        
        NSLog(@"deviceFramingView %@",NSStringFromCGRect(self.deviceFramingView.frame) );
   
        
        int i=1;
        for(int r = 0; r < 4; r++) {
            for(int c = 0; c < 3; c++) {
                    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [button setBackgroundColor: [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1]];
                    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                    [button.layer setBorderColor:[[UIColor darkGrayColor] CGColor]];
                    [button.layer setBorderWidth:1.0];
                    [button.layer setCornerRadius:8.0f];
                    [button.layer setMasksToBounds:YES];
                    [button addTarget:self action:@selector(numberPadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    button.tag = i;
                    CGRect buttonRect = CGRectMake(startX+((c * 70)+2), startY + (r * 50)+2, 65, 46);
                    button.frame = buttonRect;
                    if (i==10)
                    {
                        [button setTitle:@"<" forState:UIControlStateNormal];
                        button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
                        button.tag = ButtonIndexBackspace;
                    
                    }
                    else if (i==11)
                    {
                        [button setTitle:@"0" forState:UIControlStateNormal];
                         button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
                        button.tag = 0;
                    
                    }
                    else if (i==12)
                    {
                        [button setTitle:@"Enter" forState:UIControlStateNormal];
                         button.titleLabel.font = [UIFont boldSystemFontOfSize:24];
                        button.tag = ButtonIndexDone;
                    
                    }
                    else
                    {
                        [button setTitle:[NSString stringWithFormat:@"%i",i] forState:UIControlStateNormal];
                         button.titleLabel.font = [UIFont boldSystemFontOfSize:28];
                    }
                
                    [self.numberPadView addSubview:button];
                    i++;
            }
            
        }

        [self addBorderAround:self.numberPadView cornerType:CornerTypeSquare withColor:[UIColor darkGrayColor]];
      
        CGRect hideRect = CGRectMake((self.deviceFramingView.bounds.size.width-self.numberPadWidth)/2, self.deviceFramingView.bounds.size.height, self.numberPadWidth, 0);
        CGRect showRect = CGRectMake((self.deviceFramingView.bounds.size.width-self.numberPadWidth)/2, self.deviceFramingView.bounds.size.height-self.numberPadHeight, self.numberPadWidth, self.numberPadHeight);
        
        self.numberPadView.frame = hideRect;
        [self.deviceFramingView addSubview:self.numberPadView];
            [self shrinkTable:self.numberPadHeight];
            [UIView animateWithDuration:0.3
                animations:^
                {
                    self.numberPadView.frame = showRect;
                     NSLog(@"2 numberPadView %@",NSStringFromCGRect(self.numberPadView.frame) );
                
                }
                completion:^(BOOL finished)
                {

                 }];
    }
}

- (void)numberPadButtonClicked:(UIButton*)button
{
    if (button.tag==ButtonIndexCancel)
    {
        [self numberPadEntryUpdated:@"" forTag:-1];
        [self removeNumberPad];
    }
    else if (button.tag==ButtonIndexBackspace)
    {
        if (self.numberPadCurrentValue.length>1)
        {
            self.numberPadCurrentValue = [NSMutableString stringWithString:[self.numberPadCurrentValue substringToIndex:self.numberPadCurrentValue.length-1]];
            self.numberPadEntryLabel.text = self.numberPadCurrentValue;
        }
        else if (self.numberPadCurrentValue.length==1)
        {
            self.numberPadCurrentValue = [NSMutableString stringWithString:@"0"];
            self.numberPadEntryLabel.text = self.numberPadCurrentValue;
        }
    }
    else if (button.tag==ButtonIndexDone)
    {
        [self numberPadEntryUpdated:self.numberPadCurrentValue forTag:self.numberPadTag];
        [self removeNumberPad];
    }
    else
    {
        if ([self.numberPadCurrentValue isEqualToString:@"0"])
        {
            self.numberPadCurrentValue = [NSMutableString stringWithFormat:@"%li",(long)button.tag];
            self.numberPadEntryLabel.text = self.numberPadCurrentValue;
        }
        else
        {
            [self.numberPadCurrentValue appendString:[NSString stringWithFormat:@"%li",(long)button.tag]];
            self.numberPadEntryLabel.text = self.numberPadCurrentValue;
        }
        
    }

}

- (void)numberPadEntryUpdated:(NSString*)entry forTag:(NSInteger)tag {}
// this is to let viewcontroller to get entered value and tag of number pad

-(void)removeNumberPad
{

    [self enlargeTable:self.numberPadHeight];

        CGRect hideRect = CGRectMake((self.deviceFramingView.bounds.size.width-self.numberPadWidth)/2, self.deviceFramingView.bounds.size.height, self.numberPadWidth, 0);

        [UIView animateWithDuration:0.3
            animations:^
            {
                self.numberPadView.frame = hideRect;
            
            }
            completion:^(BOOL finished)
            {
                [self.numberPadView removeFromSuperview];
                self.keypadShowing = NO;
             }];

}

#pragma mark - Table frame change methods


-(void) shrinkTable:(float)height
{
    if (self.thisTableView)
    {

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

-(void) enlargeTable:(float)height
{
    if (self.thisTableView)
    {

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
        [thisObject.layer setBorderWidth:1.0];
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
	thisViewController.view.frame = CGRectMake(0, self.deviceFramingView.bounds.size.height, self.deviceFramingView.bounds.size.width, self.deviceFramingView.bounds.size.height);
    [self.deviceFramingView addSubview:thisViewController.view];
    
        [UIView animateWithDuration:0.3
			animations:^{
    			thisViewController.view.frame = CGRectMake(0, 0, self.deviceFramingView.bounds.size.width, self.deviceFramingView.bounds.size.height);
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
				thisViewController.view.frame = CGRectMake(0, self.deviceFramingView.bounds.size.height, self.deviceFramingView.bounds.size.width, self.deviceFramingView.bounds.size.height);
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

-(void)displayMessage:(NSString*)message withTitle:(NSString*)title {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.tag = 2000;
    [alert show];
    
}

-(void)loadUpgradeViewController {
    self.upGradeViewController = (UpGradeViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"UpGradeViewController"];
    [self presentViewController:self.upGradeViewController animated:YES completion:^{

        }];
}


-(NSArray*)objectsForFilename:(NSString*)filename
{
    NSString* path1 = [self dataFilePathofDocuments:[NSString stringWithFormat:@"%@.plist",filename]];
    NSString* path2 = [self dataFilePathofBundle:[NSString stringWithFormat:@"%@.plist",filename]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray* temp;
    if ([fileManager fileExistsAtPath:path1])
    {
        temp = [NSArray arrayWithContentsOfFile:path1];
    }
    else if ([fileManager fileExistsAtPath:path2])
    {
        temp = [NSArray arrayWithContentsOfFile:path2];
    }
    if (temp)
    {
        return temp;
    }
    return nil;
    
}



@end
