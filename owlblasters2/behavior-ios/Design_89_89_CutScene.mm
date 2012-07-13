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



@interface Design_89_89_CutScene : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _Cutscene1;

Actor* _Jumper;

}
@end

@implementation Design_89_89_CutScene

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_89_89_CutScene* self = (Design_89_89_CutScene*) theScript;
        [[Game game] setFont:[ self getFont:173] size:1];
        [[Game game] drawString:@"Hi There!" x:5 y:5];
        if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:1]])
{
            [[Game game] drawString:@"Owls Have Become" x:5 y:120];
            [[Game game] drawString:@"Hostile and the " x:5 y:150];
            [[Game game] drawString:@"World is completely" x:5 y:180];
            [[Game game] drawString:@"Controlled by them" x:5 y:210];
}

}];
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
Design_89_89_CutScene* self = (Design_89_89_CutScene*) theScript;
        if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:0]])
{
            _Cutscene1 = 1;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:1]])
{
            _Cutscene1 = 2;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:2]])
{
            _Cutscene1 = 3;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:3]])
{
            _Cutscene1 = 4;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:4]])
{
            _Cutscene1 = 5;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:5]])
{
            _Cutscene1 = 6;
}

        else if([self sameAs:[NSNumber numberWithFloat:_Cutscene1] two:[NSNumber numberWithFloat:7]])
{
            [self switchScene:1 leave:[self createFadeOut:((1000*1)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end