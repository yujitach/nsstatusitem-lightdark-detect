//
//  AppDelegate.m
//  nsstatusitem-lightdark-detect
//
//  Created by Yuji on 10/25/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
{
    NSMutableArray<NSStatusItem*>* o;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"button.effectiveAppearance"]){
        NSStatusItem*item=object;
        NSAppearance*appearance=item.button.effectiveAppearance;
        NSString*appearanceName=(NSString*)(appearance.name);
        if([[appearanceName lowercaseString] containsString:@"dark"]){
            item.button.title=@"dark";
        }else{
            item.button.title=@"light";
        }
    }
}
-(IBAction)createStatusItem:(id)sender
{
    NSStatusItem*item=[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    item.button.title=@"foo";
    item.visible=YES;
    [item addObserver:self forKeyPath:@"button.effectiveAppearance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
    [o addObject:item];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    o=[NSMutableArray array];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
