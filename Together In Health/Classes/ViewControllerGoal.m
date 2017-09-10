//
//  ViewControllerGoal1.m
//  SimpleTable
//
//  Created by Cami Mandell on 8/12/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "ViewControllerGoal.h"
#import "ProgressViewController.h"
#import "GoalCheckViewController.h"
#import "ViewControllerGamePlan.h"
#import "GoalsMenuViewController.h"
#import "Goal.h"
#import "AbstractViewController.h"
#import "AppDelegate.h"

@interface ViewControllerGoal ()

@property(nonatomic,strong) IBOutlet UIScrollView* thisScrollView;

@end

@implementation ViewControllerGoal


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

    
    self.title = @"Goals";
    //    self.navigationController.navigationBar.backgroundColor= [UIColor blackColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:86/255.0 blue:51/255.0 alpha:1];
    
    NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:44.0],NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = size;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    

    if(self.goal.Step1IsOn == YES) {
      [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
                
    }
            
    else {
       [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
                
    }
    
    
    if(self.goal.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
        
    }
    
    else {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
    }
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.textFieldGoal.text = [defaults objectForKey:@"Goal"];
    self.textFieldBy1.text = [defaults objectForKey:@"By1"];
    self.textFieldBy2.text = [defaults objectForKey:@"By2"];
    self.textFieldWhen.text = [defaults objectForKey:@"When"];
    self.textFieldWhere.text = [defaults objectForKey:@"Where"];
    self.textFieldOften.text = [defaults objectForKey:@"Often"];
    self.textFieldWhen2.text = [defaults objectForKey:@"When2"];
    self.textFieldWhere2.text = [defaults objectForKey:@"Where2"];
    self.textFieldOften2.text = [defaults objectForKey:@"Often2"];
    self.textFieldStep1.text = [defaults objectForKey:@"Step1"];
    self.textFieldStep2.text = [defaults objectForKey:@"Step2"];
    self.textFieldStep3.text = [defaults objectForKey:@"Step3"];
    self.textFieldStep4.text = [defaults objectForKey:@"Step3"];
    self.textFieldStep5.text = [defaults objectForKey:@"Step4"];
    self.buttonTappedStep1On = [defaults boolForKey:@"Step1Button"];
    self.buttonTappedStep2On = [defaults boolForKey:@"Step2Button"];
    self.buttonTappedStep3On = [defaults boolForKey:@"Step3Button"];
    self.buttonTappedStep4On = [defaults boolForKey:@"Step4Button"];
    self.buttonTappedStep5On = [defaults boolForKey:@"Step5Button"];
    
    if (self.goal.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
    if (self.goal.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
    if (self.goal.Step3IsOn) {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
    if (self.goal.Step4IsOn) {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
    if (self.goal.Step5IsOn) {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState: UIControlStateNormal];
    }
    else {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
    }
    
    self.thisScrollView.contentSize = CGSizeMake(320, 1100);
    
    [self.appDelegate loadPersistent];
    
}

//
//-(IBAction)goalControl:(id)sender {
//    switch (self.goalNumber) {
//        case goal1:
//            [self loadGoal1Persistent];
//            self.goalControlSegment.backgroundColor = [UIColor greenColor];
//            break;
//        case goal2:
//            [self loadGoal2Persistent];
//            break;
//        case goal3:
//            [self loadGoal3Persistent];
//            
//            break;
//        default:
//            break;
//    }
//}



-(IBAction)resignKeyboard:(id)sender {
    [self.textFieldGoal resignFirstResponder];
    [self.textFieldWhen resignFirstResponder];
    [self.textFieldWhere resignFirstResponder];
    [self.textFieldOften resignFirstResponder];
    [self.textFieldWhen2 resignFirstResponder];
    [self.textFieldWhere2 resignFirstResponder];
    [self.textFieldOften2 resignFirstResponder];
    [self.textFieldBy1 resignFirstResponder];
    [self.textFieldBy2 resignFirstResponder];
    [self.textFieldStep1 resignFirstResponder];
    [self.textFieldStep2 resignFirstResponder];
    [self.textFieldStep3 resignFirstResponder];
    [self.textFieldStep4 resignFirstResponder];
    [self.textFieldStep5 resignFirstResponder];
    [self.goalNickname resignFirstResponder];

    
}

-(IBAction)trackProgress:(id)sender {
    
    [self saveDefaults];
    ProgressViewController* progressViewController = (ProgressViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ProgressViewController"];
    [self.navigationController pushViewController:progressViewController animated:YES];
    
}

-(IBAction)checkGoal:(id)sender {
    GoalCheckViewController* goalCheckViewController = (GoalCheckViewController*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"GoalCheckViewController"];
    [self.navigationController pushViewController:goalCheckViewController animated:YES];
    
}

-(IBAction)gamePlan:(id)sender {
    ViewControllerGamePlan* viewControllerGamePlan = (ViewControllerGamePlan*)
    [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
     instantiateViewControllerWithIdentifier:@"ViewControllerGamePlan"];
    [self.navigationController pushViewController:viewControllerGamePlan animated:YES];
}


-(IBAction)buttonTapped1:(id)sender
{
    if (self.goal.Step1IsOn) {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step1IsOn = YES;
        
        
    }
    else {
        [self.step1 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step1IsOn = NO;
        
        
    }
}

-(IBAction)buttonTapped2:(id)sender
{
    if (self.goal.Step2IsOn) {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step2IsOn = NO;
    }
    
    
    
    else {
        [self.step2 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step2IsOn = YES;
    }
    
}


-(IBAction)buttonTapped3:(id)sender
{
    if (self.goal.Step3IsOn) {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step3IsOn = NO;
    }
    else {
        [self.step3 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step3IsOn = YES;
    }
    
    
}
-(IBAction)buttonTapped4:(id)sender
{
    if (self.goal.Step4IsOn) {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        
        self.goal.Step4IsOn = NO;
    }
    else {
        [self.step4 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step4IsOn = YES;
    }
    
}
-(IBAction)buttonTapped5:(id)sender
{
    if (self.goal.Step5IsOn) {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState: UIControlStateNormal];
        self.goal.Step5IsOn = NO;
    }
    else {
        [self.step5 setImage:[UIImage imageNamed:@"checkbox-filled.png"] forState:UIControlStateNormal];
        self.goal.Step5IsOn = YES;
    }
}

//-(IBAction)clearAll:(id)sender {
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you want to clear all?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear all",nil];
//    [alert show];
//    
//}
//
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 0) {
//    }
//    else if (buttonIndex == 1) {
//        self.textFieldGoal.text = @"";
//        self.textFieldBy1.text = @"";
//        self.textFieldBy2.text = @"";
//        self.textFieldWhen.text = @"";
//        self.textFieldWhere.text = @"";
//        self.textFieldOften.text = @"";
//        self.textFieldWhen2.text = @"";
//        self.textFieldWhere2.text = @"";
//        self.textFieldOften2.text = @"";
//        self.textFieldStep1.text = @"";
//        self.textFieldStep2.text = @"";
//        self.textFieldStep3.text = @"";
//        self.textFieldStep4.text = @"";
//        self.textFieldStep5.text = @"";
//        self.goal.Step1IsOn = NO;
//        [self.step1 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
//        self.goal.Step2IsOn = NO;
//        [self.step2 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
//        self.goal.Step3IsOn = NO;
//        [self.step3 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
//        self.goal.Step4IsOn = NO;
//        [self.step4 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
//        self.goal.Step5IsOn = NO;
//        [self.step5 setImage:[UIImage imageNamed:@"checkbox-empty.V2.png"] forState:UIControlStateNormal];
//    }
//}

-(void)saveGoal1Defaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setValue:self.textFieldGoal.text forKeyPath:@"Goal"];
    [defaults setValue:self.textFieldBy1.text forKeyPath:@"By1"];
    [defaults setValue:self.textFieldBy2.text forKeyPath:@"By2"];
    [defaults setValue:self.textFieldWhen.text forKeyPath:@"When"];
    [defaults setValue:self.textFieldWhere.text forKeyPath:@"Where"];
    [defaults setValue:self.textFieldOften.text forKeyPath:@"Often"];
    [defaults setValue:self.textFieldWhen.text forKeyPath:@"When2"];
    [defaults setValue:self.textFieldWhere.text forKeyPath:@"Where2"];
    [defaults setValue:self.textFieldOften.text forKeyPath:@"Often2"];
    [defaults setValue:self.textFieldStep1.text forKeyPath:@"Step1"];
    [defaults setValue:self.textFieldStep2.text forKeyPath:@"Step2"];
    [defaults setValue:self.textFieldStep3.text forKeyPath:@"Step3"];
    [defaults setValue:self.textFieldStep4.text forKeyPath:@"Step4"];
    [defaults setValue:self.textFieldStep5.text forKeyPath:@"Step5"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep1On forKey:@"Step1Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step2Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step3Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step4Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step5Button"];

}

-(void)saveGoal2Defaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:self.textFieldGoal.text forKeyPath:@"Goal"];
    [defaults setValue:self.textFieldBy1.text forKeyPath:@"By1"];
    [defaults setValue:self.textFieldBy2.text forKeyPath:@"By2"];
    [defaults setValue:self.textFieldWhen.text forKeyPath:@"When"];
    [defaults setValue:self.textFieldWhere.text forKeyPath:@"Where"];
    [defaults setValue:self.textFieldOften.text forKeyPath:@"Often"];
    [defaults setValue:self.textFieldWhen.text forKeyPath:@"When2"];
    [defaults setValue:self.textFieldWhere.text forKeyPath:@"Where2"];
    [defaults setValue:self.textFieldOften.text forKeyPath:@"Often2"];
    [defaults setValue:self.textFieldStep1.text forKeyPath:@"Step1"];
    [defaults setValue:self.textFieldStep2.text forKeyPath:@"Step2"];
    [defaults setValue:self.textFieldStep3.text forKeyPath:@"Step3"];
    [defaults setValue:self.textFieldStep4.text forKeyPath:@"Step4"];
    [defaults setValue:self.textFieldStep5.text forKeyPath:@"Step5"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep1On forKey:@"Step1Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step2Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step3Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step4Button"];
    [[NSUserDefaults standardUserDefaults]setBool:self.buttonTappedStep2On forKey:@"Step5Button"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)refreshGoal {
//    [self.collectionView reloadData];
//}

-(void)viewWillDisappear:(BOOL)animated {
    
   [self saveDefaults];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [self saveDefaults];
}

-(IBAction)changeGoalName:(id)sender {

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
@end
