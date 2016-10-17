//
//  ViewController.m
//  GoogleSignInProject
//
//  Created by LandtoSky on 9/4/16.
//  Copyright © 2016 landtosky2018. All rights reserved.
//

#import "ViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>

#define kClientId @"243342693867-p2rktj1kmmqu0sd1dh78evqn86akjl8c.apps.googleusercontent.com"

@interface ViewController()<GIDSignInDelegate, GIDSignInUIDelegate>{
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GIDSignIn* signIn = [GIDSignIn sharedInstance];
    //    if (self.fetchEmailToggle.isEnabled) {
    signIn.shouldFetchBasicProfile = YES;
    //    }
    signIn.clientID = kClientId;
    signIn.scopes = @[ @"profile", @"email" ];
    signIn.delegate = self;
    signIn.uiDelegate = self;

}


- (IBAction)onGoogleSignIn:(id)sender
{
    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)onGoolgeLogOut:(id)sender {
     [[GIDSignIn sharedInstance] signOut];
}



#pragma mark - Google SignIn Delegate
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error{
}

// Present Google SignIn ViewController
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

//Dismiss Google SignIn ViewController
-(void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
//    NSString *userId = user.userID;                  // For client-side use only!
//    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    
    NSLog(@"User Info ==>%@\n%@\n%@\n%@\n", fullName, givenName, familyName,email);
    // ...
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}




@end
