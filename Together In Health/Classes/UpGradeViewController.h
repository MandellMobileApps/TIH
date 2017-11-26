//
//  UpGradeViewController.h
//  Together In Health
//
//  Created by Cami Mandell on 11/7/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractViewController.h"

@interface UpGradeViewController : AbstractViewController <UITextFieldDelegate>

@property(nonatomic, strong) IBOutlet UITextField* emailTextField;

@end
