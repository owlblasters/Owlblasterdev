#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface SceneEvents_10 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _Y;

float _X;

}
@end

@implementation SceneEvents_10

-(void)load
{
	    [self doesCustomDrawing];
        _Y = 600;
        _X = 500;
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_10* self = (SceneEvents_10*) theScript;
        [[Game game] setFont:[ self getFont:205] size:1];
        [[Game game] drawString:@"Owl Blaster" x:5 y:(_Y - 500)];
        [[Game game] drawString:@"Development" x:5 y:(_Y - 450)];
        [[Game game] setFont:[ self getFont:362] size:1];
        [[Game game] drawString:@"Credits" x:5 y:(_Y - 400)];
        [[Game game] setFont:[ self getFont:365] size:1];
        [[Game game] drawString:@"Developers" x:5 y:(_Y + 50)];
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:@"Jonathan Wu" x:5 y:(_Y + 100)];
        [[Game game] drawString:@"David Silin" x:5 y:(_Y + 150)];
        [[Game game] setFont:[ self getFont:233] size:1];
        [[Game game] drawString:@"Artists" x:5 y:(_Y + 200)];
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:@"Marlon Antunez" x:5 y:(_Y + 250)];
        [[Game game] drawString:@"Kapu" x:5 y:(_Y + 280)];
        [[Game game] drawString:@"Sunrisekingdom" x:5 y:(_Y + 310)];
        [[Game game] drawString:@"IWonderZero" x:5 y:(_Y + 340)];
        [[Game game] drawString:@"Micro Mister" x:5 y:(_Y + 370)];
        [[Game game] drawString:@"Ceric" x:5 y:(_Y + 400)];
        [[Game game] setFont:[ self getFont:364] size:1];
        [[Game game] drawString:@"Music and Sounds" x:5 y:(_Y + 500)];
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:@"Metal Renard" x:5 y:(_Y + 530)];
        [[Game game] drawString:@"Stencyl" x:5 y:(_Y + 560)];
        [[Game game] setFont:[ self getFont:362] size:1];
        [[Game game] drawString:@"Thanks For" x:_X y:200];
        [[Game game] drawString:@"Playing!" x:_X y:250];
}];
    [self doPeriodically:1000 * 0.01 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_10* self = (SceneEvents_10*) theScript;
        [self doLater:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_10* self = (SceneEvents_10*) theScript;
                    if((_Y >= -600))
{
                        _Y -= .7;
}

}]];
        [self doLater:1000 * 12 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_10* self = (SceneEvents_10*) theScript;
                    if((_X >= 5))
{
                        _X -= 1;
}

}]];
}]];
     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
SceneEvents_10* self = (SceneEvents_10*) theScript;
        [self switchScene:6 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end