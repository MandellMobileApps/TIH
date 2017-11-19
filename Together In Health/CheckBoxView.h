//
//  CheckBoxView.h
//  Traveler1
//
//  Created by Jon Mandell on 11/16/13.
//  Copyright (c) 2013 Jon Mandell. All rights reserved.
//

#import "AbstractCustomView.h"

@protocol CheckboxDelegate;

@interface CheckBoxView : AbstractCustomView
{
	id<CheckboxDelegate> checkboxDelegate;
}
@property(nonatomic) BOOL checked;
@property(nonatomic) BOOL changeMade;
@property(atomic, assign)id IBOutlet checkboxDelegate;

+(CheckBoxView*) checkboxWithFrame:(CGRect)frame isChecked:(BOOL)isChecked delegate:(id)delegate tag:(int)thisTag;

@end

@protocol CheckboxDelegate <NSObject>
	@required
		-(void) checkBoxStatusChanged:(CheckBoxView *)thisCheckbox;
@end
