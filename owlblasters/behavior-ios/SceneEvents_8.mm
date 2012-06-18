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



@interface SceneEvents_8 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_8

-(void)load
{
	    [self doesCustomDrawing];
        [self saveGame];

        [[Assets get] loadAtlas:Gun Shop];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_8* self = (SceneEvents_8*) theScript;
        [[Game game] setFont:[ self getFont:365] size:1];
        [[Game game] drawString:@"Gun Select" x:10 y:10];
        [[Game game] setFont:[ self getFont:410] size:1];
        [[Game game] drawString:@"Cost:" x:70 y:100];
        [[Game game] drawString:@"DMG" x:70 y:125];
        [[Game game] drawString:@"ROF" x:70 y:150];
        [[Game game] drawString:@"PEN" x:70 y:175];
        [[Game game] setFont:[ self getFont:410] size:1];
        [[Game game] drawString:@"Credits:" x:70 y:210];
        [[Game game] setFont:[ self getFont:364] size:1];
        [[Game game] drawString:[NSNumber numberWithFloat:[[self getGameAttribute:@"Credits"] floatValue]] x:170 y:210];
        [[Game game] setFont:[ self getFont:233] size:1];
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:0]])
{
            [[Game game] drawString:@"Pistol" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:@"Owned" x:150 y:100];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:70 y:240];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [[Game game] drawString:@"Claws" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:500] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:2]])
{
            [[Game game] drawString:@"Revolver" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:1500] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:3]])
{
            [[Game game] drawString:@"Shotgun" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:5000] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:4]])
{
            [[Game game] drawString:@"Laser Pistol" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:10000] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:5]])
{
            [[Game game] drawString:@"Scythe" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:25000] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:6]])
{
            [[Game game] drawString:@"Thumper" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:50000] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:7]])
{
            [[Game game] drawString:@"Laser Rifle" x:70 y:50];
            [[Game game] setFont:[ self getFont:364] size:1];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:0] floatValue]] x:285 y:125];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:1] floatValue]] x:285 y:150];
            [[Game game] drawString:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:2] floatValue]] x:285 y:175];
            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:0] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:130 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:1] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:155 w:5 h:20];
}

            for(int index0 = 0; index0 < [[(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) objectAtIndex:2] floatValue]; index0++)
{
                [[Game game] setColor:[UIColor colorWithRed:51.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0]];
                [[Game game] fillRect:(120 + (index0 * 6)) y:180 w:5 h:20];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                [[Game game] drawString:[NSNumber numberWithFloat:100000] x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                [[Game game] drawString:@"Owned" x:150 y:100];
}

            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                [[Game game] drawString:@"Equipped" x:70 y:240];
                [[Game game] drawString:@"Owned" x:150 y:100];
}

}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end