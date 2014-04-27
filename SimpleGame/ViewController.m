//
//  ViewController.m
//  SimpleGame
//
//  Created by Luis Alberto Lamadrid on 4/26/14.
//  Copyright (c) 2014 Luis Alberto Lamadrid. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

//This method replaced "ViewDidLoad" to make the screen landscape
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    SKView * skView = (SKView *)self.view;

    if (!skView.scene) {
        
        //Configure the view.
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        //Create and configure the scene.
        SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        //Present the scene.
        [skView presentScene:scene];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
