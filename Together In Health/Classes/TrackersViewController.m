//
//  TrackersViewController.m
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import "TrackersViewController.h"
#import "SleepTrackerViewController.h"

@implementation TrackersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}


- (IBAction)trackersSegmentControl:(UISegmentedControl* )sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            SleepTrackerViewController* sleepTrackerViewController = (SleepTrackerViewController*)
            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"SleepTrackerViewController"];
            [self.navigationController pushViewController:sleepTrackerViewController animated:YES];
        }
            break;
        case 1:
        {
//            HealthQuestionsViewController* healthQuestionsViewController = (HealthQuestionsViewController*)
//            [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//             instantiateViewControllerWithIdentifier:@"HealthQuestionsViewController"];
//            [self.navigationController pushViewController:healthQuestionsViewController animated:YES];
        }
            break;
        case 2:

            break;
        case 3:

            break;
            default:
            break;
    }
}


@end
