//
//  TrackersViewController.h
//  TIHMaster
//
//  Created by Cami Mandell on 5/3/15.
//  Copyright (c) 2015 Cami Mandell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrackersViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *trackersControl;


-(IBAction)trackersSegmentControl:(id)sender;

@end
