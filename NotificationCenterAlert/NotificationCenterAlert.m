//
//  Copyright © 2013 Advantis
//

#import "NotificationCenterAlert.h"
#import "Notification.h"

@implementation NotificationCenterAlert

#pragma mark - AMBundleAction
- (id) runWithInput:(id)input fromAction:(AMAction *)action error:(NSDictionary **)errorInfo
{
    NSDictionary *params = self.parameters;

    NSUserNotification *notification = [NSUserNotification new];
    notification.title = params[UserNotification.title];
    notification.subtitle = params[UserNotification.subtitle];
    notification.informativeText = params[UserNotification.text];
    notification.soundName = NSUserNotificationDefaultSoundName;
    [notification autorelease];

    NSUserNotificationCenter *notificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    notificationCenter.delegate = self;
    [notificationCenter deliverNotification:notification];

    return input;
}

#pragma mark - NSUserNotificationCenterDelegate
- (BOOL) userNotificationCenter:(NSUserNotificationCenter *)center
      shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

@end
