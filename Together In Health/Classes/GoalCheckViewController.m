//
//  GoalCheckViewController.m
//  SimpleTable
//
//  Created by Cami Mandell on 12/29/14.
//  Copyright (c) 2014 Cami Mandell. All rights reserved.
//

#import "GoalCheckViewController.h"

@implementation GoalCheckViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.thisScrollView.contentSize = CGSizeMake(320, 720);
    
}


- (IBAction)segmentConfident:(UISegmentedControl* )sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there a similar goal that you are confident in? Would it help to start with a smaller goal?";
            break;
        case 1:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there a similar goal that you are confident in? Would it help to start with a smaller goal?";
            break;
        case 2:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there a similar goal that you are confident in? Would it help to start with a smaller goal?";
            break;
        case 3:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there anything you can do that will make you more confident in your goal?";
            break;
        case 4:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there anything you can do that will make you more confident in your goal?";
            break;
        case 5:
            self.textViewGoalCheck2.text = @"Why are you not confident in your goal? Is there anything you can do that will make you more confident in your goal?";
            break;
        case 6:
            self.textViewGoalCheck2.text = @"Being confident you can achieve your goal is really important. Is there anything else you can do to make you more confident. The more confident you are the better.";
            break;
        case 7:
            self.textViewGoalCheck2.text = @"Being confident you can achieve your goal is really important. Is there anything else you can do to make you more confident. The more confident you are the better.";
            break;
        case 8:
            self.textViewGoalCheck2.text = @"That's great you are confident you can achieve your goal! If your goal is important to you, you're ready to get started.";
            break;
        case 9:
            self.textViewGoalCheck2.text = @"That's great you are 100% confident you can achieve your goal! If your goal is important to you, you're ready to get started.";
            break;
        default:
            break;
    }
}

-(IBAction)segmentImportant:(UISegmentedControl* )sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.textViewGoalCheck.text = @"Think about why your goal isn't important to you. Is there anything you can change about your goal to make it more important to you? It's important that your goal is important to you.";
            break;
        case 1:
            self.textViewGoalCheck.text = @"Think about why your goal isn't important to you. Is there anything you can change about your goal to make it more important to you? It's important that your goal is important to you.";
            break;
        case 2:
            self.textViewGoalCheck.text = @"Why is your goal not very important to you? Can you think of a goal that is really important to you?";
            break;
        case 3:
            self.textViewGoalCheck.text = @"That's great you have a goal that is important to you. If you're confident in your goal, you're ready to get started!";
            break;
        case 4:
            self.textViewGoalCheck.text = @"That's great you have a goal that is important to you. If you're confident in your goal, you're ready to get started!";
            break;
        default:
            break;
    }
}

-(IBAction)goalCheck {
    
    self.textViewGoalCheck.hidden = NO;
    self.textViewGoalCheck2.hidden = NO;
    
}


@end
