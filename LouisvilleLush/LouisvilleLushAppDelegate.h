//
//  LouisvilleLushAppDelegate.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 9/25/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HappyHourTableViewController.h"
#import "EstablishmentAnnotation.h"
#import "HappyHour.h"
#import "StarsScrollViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LouisvilleLushAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate, UITabBarControllerDelegate, NSXMLParserDelegate>
{
    NSXMLParser *xmlParser;
	NSMutableDictionary *dictEstablishments;
    
    NSMutableArray *locationData;
    EstablishmentAnnotation *annotationEstablishment;
    NSString *Establishment;
	NSMutableString *EstablishmentName;
    NSMutableString *Location;
    NSMutableString *Latitude;
    NSMutableString *Longitude;
    NSMutableString *StartTime;
    NSMutableString *EndTime;
    NSMutableString *occursSunday;
    NSMutableString *occursMonday;
    NSMutableString *occursTuesday;
    NSMutableString *occursWednesday;
    NSMutableString *occursThursday;
    NSMutableString *occursFriday;
    NSMutableString *occursSaturday;
    NSMutableString *hasFood;
    NSMutableString *hasBeer;
    NSMutableString *hasWine;
    NSMutableString *hasCocktails;
    NSMutableString *phoneNumber;
    NSMutableString *eventDescription;
    NSMutableString *establishmentAddress;
    
    NSMutableArray *arrayToday;
    NSMutableArray *arrayTonight;
    NSMutableArray *arrayTomorrow;
    NSMutableArray *array2Days;
    NSMutableArray *array3Days;
    NSMutableArray *array4Days;
    NSMutableArray *array5Days;
    NSMutableArray *array6Days;
    NSMutableArray *array7Days;
    
    NSMutableArray *arrayBowmanField;
    NSMutableArray *arrayButchertown;
    NSMutableArray *arrayClifton;
    NSMutableArray *arrayDowntown;
    NSMutableArray *arrayEastEnd;
    NSMutableArray *arrayGermantown;
    NSMutableArray *arrayHarrodsCreek;
    NSMutableArray *arrayHighlands;
    NSMutableArray *arrayJeffersontown;
    NSMutableArray *arrayMiddletown;
    NSMutableArray *arrayNewAlbany;
    NSMutableArray *arrayOkolona;
    NSMutableArray *arrayOldLouisville;
    NSMutableArray *arrayProspect;
    NSMutableArray *arraySouthEnd;
    NSMutableArray *arrayStMatthews;
    NSMutableArray *arrayWestport;
    
    HappyHour *happyHour;
    
    NSDateFormatter *dateFormatter;
    NSString *strYesterday;
    NSString *strToday;
    NSString *strTomorrow;
    NSString *str2Days;
    NSString *str3Days;
    NSString *str4Days;
    NSString *str5Days;
    NSString *str6Days;
    NSString *str7Days;
    
    NSString *strHour;
    
    AVAudioPlayer *audioPlayer;
    
    StarsScrollViewController *starsScroller1;
    StarsScrollViewController *starsScroller2;
    StarsScrollViewController *moonScroller;
}
    
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UIImageView *skylineImage;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) IBOutlet StarsScrollViewController *starsScroller1;
@property (nonatomic, retain) IBOutlet StarsScrollViewController *starsScroller2;
@property (nonatomic, retain) IBOutlet StarsScrollViewController *moonScroller;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval;

@end
