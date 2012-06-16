#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

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



@interface Design_65_65_DrawHealth : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _Blinking;

}
@end

@implementation Design_65_65_DrawHealth

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_65_65_DrawHealth* self = (Design_65_65_DrawHealth*) theScript;
        if(([self asNumber:[mActor getActorValue:@"hitPoints"]] <= ([self asNumber:[mActor getActorValue:@"maxHealth"]] / 3)))
{
            if(!(_Blinking))
{
                _Blinking = TRUE;
                [[Game game] setColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]];
                [self doLater:1000 * .2 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_65_65_DrawHealth* self = (Design_65_65_DrawHealth*) theScript;
                            [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]];
                            [self doLater:1000 * .2 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_65_65_DrawHealth* self = (Design_65_65_DrawHealth*) theScript;
                                        _Blinking = FALSE;
}]];
}]];
}

}

        else
{

}

        [[Game game] setStrokeColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
        [[Game game] setStrokeThickness:2];
        [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
        [[Game game] fillRect:50 y:0 w:30 h:5];
        [[Game game] setColor:[UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
        [[Game game] fillRect:50 y:0 w:(([self asNumber:[mActor getActorValue:@"hitPoints"]] / [self asNumber:[mActor getActorValue:@"maxHealth"]]) * 30) h:5];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end