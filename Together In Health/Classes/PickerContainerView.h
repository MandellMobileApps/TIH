//
//  DatePickerView.h
//  Together In Health
//
//  Created by Jon Mandell on 10/11/17.
//  Copyright © 2017 MandellMobileApps. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PickerContainerViewDelegate;

@interface PickerContainerView : UIView <UIPickerViewDelegate>
{
    id<PickerContainerViewDelegate> pickerContainerViewDelegate;
}
@property(atomic, strong)id pickerContainerViewDelegate;
@property (nonatomic, strong)  UIButton *doneButton;
@property (nonatomic, strong)  UIButton *todayButton;
@property (nonatomic) NSInteger month;
@property (nonatomic) NSInteger year;
@property (nonatomic,strong) NSArray* months;
@property (nonatomic,strong) NSMutableArray* years;
@property (nonatomic, strong)  UIPickerView *pickerView;
@property (nonatomic) CGRect hideRect;
@property (nonatomic) CGRect showRect;
@property (nonatomic) BOOL pickerDidChangeBool;

+(PickerContainerView*)initializeWithSelfBounds:(CGRect)bounds andMonth:(NSInteger)month andYear:(NSInteger)year;
-(void)showPicker;
-(void) hidePicker;
@end

@protocol PickerContainerViewDelegate <NSObject>
    @required
        -(void) pickerViewChanged:(PickerContainerView *)thisPickerView;
@end
