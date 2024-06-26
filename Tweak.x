/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.
	
	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end

for (UIView *v in self.subviews) {
		if (v isKindOfClass:[UIView a1]) {
			for (UIView *v2 in v.subviews) {
				if (v2 isKindOfClass: [UIVisualEffectView a2]) {
					for (UIView *v3 in v2.subviews) {
						if (v3 isKindOfClass: [UIVisualEffectBackdropView a3]) {
							v3.backgroundColor = UIColor(1,0,0,1);
						}
					}
				}
			}
		}
	}
*/

#import <UIKit/UIKit.h>

@interface CSQuickActionsButton : UIView

@end

%hook CSQuickActionsButton

-(void)didMoveToWindow {
	%orig;
	
	self.subviews[0].subviews[0].subviews[0].backgroundColor = [UIColor redColor];
}

%end

@interface CSProminentTimeView : UIView

@end

%hook CSProminentTimeView

-(void)didMoveToWindow {
	%orig;
	
	//self.bounds = CGRectMake(0,-100, self.bounds.size.width, self.bounds.size.height);d
}

%end

@interface SBFLockScreenDateViewController : UIView
	@property (assign,nonatomic) BOOL restrictsVibrancy;   
@end

%hook SBFLockScreenDateViewController

-(void)viewDidLoad {
	self.restrictsVibrancy = YES;
	%orig;
}

%end

@interface SBFLockScreenDateView : UIView
	@property (assign,nonatomic) BOOL restrictsVibrancy;
	@property (nonatomic,retain) UIColor * textColor;  
@end

%hook SBFLockScreenDateView

-(void)didMoveToWindow {
	self.restrictsVibrancy = YES;
	[self setTextColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]];
	%orig;
}

-(void)setTextColor:(UIColor *)arg1 {
	arg1 = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
	%orig(arg1);
}

-(void)setDate:(NSDate *)arg1 {
	[self setTextColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]];
	%orig(arg1);
}

%end