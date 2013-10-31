//
//  LouisvilleLushAppDelegate.m
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 9/25/11.
//  Copyright 2011 AutoLean, Inc. All rights reserved.
//

#import "LouisvilleLushAppDelegate.h"
#import "HappyHourTableViewController.h"
#import "CreditsTableViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "LouisvilleMapViewController.h"
#import "EstablishmentAnnotation.h"
#import "HappyHour.h"
#import "StarsScrollViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation LouisvilleLushAppDelegate

@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize tabBarController=_tabBarController;
@synthesize backgroundImage=_backgroundImage;
@synthesize skylineImage=_skylineImage;
@synthesize starsScroller1;
@synthesize starsScroller2;
@synthesize moonScroller;

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ih %02im", hours, minutes, seconds];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	//NSLog(@"Parser is now parsing HappyHours.xml");
}

- (void)parseXMLFileAtURL:(NSString *)URL
{	   
    NSURL *xmlURL = [NSURL URLWithString:URL];
	xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	[xmlParser setDelegate:self];
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
    [xmlParser parse];
}

- (void)parseXMLFileWithData:(NSData *)data
{	
    locationData = [[NSMutableArray alloc] init];
    arrayToday = [[NSMutableArray alloc] init];
    arrayTonight = [[NSMutableArray alloc] init];
    arrayTomorrow = [[NSMutableArray alloc] init];
    array2Days = [[NSMutableArray alloc] init];
    array3Days = [[NSMutableArray alloc] init];
    array4Days = [[NSMutableArray alloc] init];
    array5Days = [[NSMutableArray alloc] init];
    array6Days = [[NSMutableArray alloc] init];
    array7Days = [[NSMutableArray alloc] init];
    arrayBowmanField = [[NSMutableArray alloc] init];
    arrayButchertown = [[NSMutableArray alloc] init];
    arrayClifton = [[NSMutableArray alloc] init];
    arrayDowntown = [[NSMutableArray alloc] init];
    arrayEastEnd = [[NSMutableArray alloc] init];
    arrayGermantown = [[NSMutableArray alloc] init];
    arrayHarrodsCreek = [[NSMutableArray alloc] init];
    arrayHighlands = [[NSMutableArray alloc] init];
    arrayJeffersontown = [[NSMutableArray alloc] init];
    arrayMiddletown = [[NSMutableArray alloc] init];
    arrayNewAlbany = [[NSMutableArray alloc] init];
    arrayOkolona = [[NSMutableArray alloc] init];
    arrayOldLouisville = [[NSMutableArray alloc] init];
    arrayProspect = [[NSMutableArray alloc] init];
    arraySouthEnd = [[NSMutableArray alloc] init];
    arrayStMatthews = [[NSMutableArray alloc] init];
    arrayWestport = [[NSMutableArray alloc] init];
    
    xmlParser = [[NSXMLParser alloc] initWithData:data];
	[xmlParser setDelegate:self];
	[xmlParser setShouldProcessNamespaces:NO];
    [xmlParser setShouldReportNamespacePrefixes:NO];
    [xmlParser setShouldResolveExternalEntities:NO];
    [xmlParser parse];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Check network settings, unable to download happy hour information for Louisville KY!", [parseError code]];
	//NSLog(@"Error parsing XML: %@", [NSString stringWithFormat:@"%@", [parseError code]]);
	
    //If unable to connect to website, then app is pointless.  Notify user of error and send app to background.
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        exit(0);
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
	Establishment = [elementName copy];
	if ([elementName isEqualToString:@"Establishment"]) {
		dictEstablishments = [[NSMutableDictionary alloc] init];
		annotationEstablishment = [[EstablishmentAnnotation alloc] init];
        happyHour = [[HappyHour alloc] init];
        EstablishmentName = [[NSMutableString alloc] init];
		Location = [[NSMutableString alloc] init];
		Latitude = [[NSMutableString alloc] init];
		Longitude = [[NSMutableString alloc] init];
        StartTime = [[NSMutableString alloc] init];
        EndTime = [[NSMutableString alloc] init];
        occursSunday = [[NSMutableString alloc] init];
        occursMonday = [[NSMutableString alloc] init];
        occursTuesday = [[NSMutableString alloc] init];
        occursWednesday = [[NSMutableString alloc] init];
        occursThursday = [[NSMutableString alloc] init];
        occursFriday = [[NSMutableString alloc] init];
        occursSaturday = [[NSMutableString alloc] init];
        hasFood = [[NSMutableString alloc] init];
        hasBeer = [[NSMutableString alloc] init];
        hasCocktails = [[NSMutableString alloc] init];
        hasWine = [[NSMutableString alloc] init];
        phoneNumber = [[NSMutableString alloc] init];
        eventDescription = [[NSMutableString alloc] init];
        establishmentAddress = [[NSMutableString alloc] init];
	}
    if ([elementName isEqualToString:@"Sunday"]) {
        [occursSunday appendString:@"TRUE"];
    }
	if ([elementName isEqualToString:@"Monday"]) {
        [occursMonday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"Tuesday"]) {
        [occursTuesday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"Wednesday"]) {
        [occursWednesday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"Thursday"]) {
        [occursThursday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"Friday"]) {
        [occursFriday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"Saturday"]) {
        [occursSaturday appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"F"]) {
        [hasFood appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"W"]) {
        [hasWine appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"B"]) {
        [hasBeer appendString:@"TRUE"];
    }
    if ([elementName isEqualToString:@"C"]) {
        [hasCocktails appendString:@"TRUE"];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"Establishment"]) {
		[dictEstablishments setObject:EstablishmentName forKey:@"EstablishmentName"];
		[dictEstablishments setObject:Location forKey:@"Neighborhood"];
		[dictEstablishments setObject:Latitude forKey:@"Latitude"];
		[dictEstablishments setObject:Longitude forKey:@"Longitude"];
        [dictEstablishments setObject:StartTime forKey:@"Start"];
        [dictEstablishments setObject:EndTime forKey:@"End"];
        [dictEstablishments setObject:occursSunday forKey:@"Sunday"];
        [dictEstablishments setObject:occursMonday forKey:@"Monday"];
        [dictEstablishments setObject:occursTuesday forKey:@"Tuesday"];
        [dictEstablishments setObject:occursWednesday forKey:@"Wednesday"];
        [dictEstablishments setObject:occursThursday forKey:@"Thursday"];
        [dictEstablishments setObject:occursFriday forKey:@"Friday"];
        [dictEstablishments setObject:occursSaturday forKey:@"Saturday"];
        [dictEstablishments setObject:hasFood forKey:@"Food"];
        [dictEstablishments setObject:hasBeer forKey:@"Beer"];
        [dictEstablishments setObject:hasWine forKey:@"Wine"];
        [dictEstablishments setObject:hasCocktails forKey:@"Cocktails"];
        [dictEstablishments setObject:phoneNumber forKey:@"PhoneNumber"];
        [dictEstablishments setObject:eventDescription forKey:@"EventDescription"];
        [dictEstablishments setObject:establishmentAddress forKey:@"Address"];
        
        annotationEstablishment.latitude = [[dictEstablishments objectForKey:@"Latitude"] floatValue];
        annotationEstablishment.longitude = [[dictEstablishments objectForKey:@"Longitude"] floatValue];
		annotationEstablishment.title = [dictEstablishments objectForKey:@"EstablishmentName"];
        annotationEstablishment.subtitle = [dictEstablishments objectForKey:@"Neighborhood"];
        
        happyHour.title = [dictEstablishments objectForKey:@"EstablishmentName"];
        happyHour.subtitle = [dictEstablishments objectForKey:@"Neighborhood"];
        happyHour.hasFood = [dictEstablishments objectForKey:@"Food"];
        happyHour.hasWine = [dictEstablishments objectForKey:@"Wine"];
        happyHour.hasBeer = [dictEstablishments objectForKey:@"Beer"];
        happyHour.hasCocktails = [dictEstablishments objectForKey:@"Cocktails"];
        happyHour.phoneNumber = [dictEstablishments objectForKey:@"PhoneNumber"];
        happyHour.eventDescription = [dictEstablishments objectForKey:@"EventDescription"];
        happyHour.address = [dictEstablishments objectForKey:@"Address"];
        happyHour.latitude = [[dictEstablishments objectForKey:@"Latitude"] floatValue];
        happyHour.longitude = [[dictEstablishments objectForKey:@"Longitude"] floatValue];
        happyHour.startTime = [dictEstablishments objectForKey:@"Start"];
        happyHour.endTime = [dictEstablishments objectForKey:@"End"];
        happyHour.occursSunday = [dictEstablishments objectForKey:@"Sunday"];
        happyHour.occursMonday = [dictEstablishments objectForKey:@"Monday"];
        happyHour.occursTuesday = [dictEstablishments objectForKey:@"Tuesday"];
        happyHour.occursWednesday = [dictEstablishments objectForKey:@"Wednesday"];
        happyHour.occursThursday = [dictEstablishments objectForKey:@"Thursday"];
        happyHour.occursFriday = [dictEstablishments objectForKey:@"Friday"];
        happyHour.occursSaturday= [dictEstablishments objectForKey:@"Saturday"];
        //Add Time Constraints for Map
        
        NSArray *componentsStart = [[dictEstablishments objectForKey:@"Start"] componentsSeparatedByString:@":"];
        NSString *strStartHour = [componentsStart objectAtIndex:0];
        NSArray *componentsEnd = [[dictEstablishments objectForKey:@"End"] componentsSeparatedByString:@":"];
        NSString *strEndHour = [componentsEnd objectAtIndex:0];
        
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Bowman Field"])
        {
            [arrayBowmanField addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Butchertown"])
        {
            [arrayButchertown addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Clifton"])
        {
            [arrayClifton addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Downtown"])
        {
            [arrayDowntown addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"East End"])
        {
            [arrayEastEnd addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Germantown"])
        {
            [arrayGermantown addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Harrods Creek"])
        {
            [arrayHarrodsCreek addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Highlands"])
        {
            [arrayHighlands addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Jeffersontown"])
        {
            [arrayJeffersontown addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Middletown"])
        {
            [arrayMiddletown addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"New Albany"])
        {
            [arrayNewAlbany addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Okolona"])
        {
            [arrayOkolona addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Old Louisville"])
        {
            [arrayOldLouisville addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Prospect"])
        {
            [arrayProspect addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"South End"])
        {
            [arraySouthEnd addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"St Matthews"])
        {
            [arrayStMatthews addObject:happyHour];
        }
        if([[dictEstablishments objectForKey:@"Neighborhood"] isEqualToString:@"Westport"])
        {
            [arrayWestport addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:strTomorrow] isEqualToString:@"TRUE"])
        {
            [arrayTomorrow addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str2Days] isEqualToString:@"TRUE"])
        {
            [array2Days addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str3Days] isEqualToString:@"TRUE"])
        {
            [array3Days addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str4Days] isEqualToString:@"TRUE"])
        {
            [array4Days addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str5Days] isEqualToString:@"TRUE"])
        {
            [array5Days addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str6Days] isEqualToString:@"TRUE"])
        {
            [array6Days addObject:happyHour];
        }
        if ([[dictEstablishments objectForKey:str7Days] isEqualToString:@"TRUE"])
        {
            [array7Days addObject:happyHour];
        }

        //Happy Hour starts and ends on same day
        if ([strStartHour floatValue] < [strEndHour floatValue])
        {
            if ([[dictEstablishments objectForKey:strToday] isEqualToString:@"TRUE"])
            {
                //Happy Hour currently underway   
                if([strStartHour floatValue] < [strHour floatValue] && [strHour floatValue] < [strEndHour floatValue])
                {
                    [locationData addObject:annotationEstablishment];
                    
                    NSDateFormatter* timeLeftCalculator = [[[NSDateFormatter alloc] init] autorelease];
                    [timeLeftCalculator setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease]];
                    [timeLeftCalculator setDateFormat:@"HH:mm:ss:SS"];
                    
                    NSDate* firstDate = [timeLeftCalculator dateFromString:[timeLeftCalculator stringFromDate:[NSDate date]]];
                    strEndHour = [NSString stringWithFormat:@"%@%@",strEndHour,@":00:00:00"];
                    NSDate* secondDate = [timeLeftCalculator dateFromString:strEndHour];
                    
                    NSTimeInterval timeDifference = [secondDate timeIntervalSinceDate:firstDate];
                    happyHour.timeLeft = [NSMutableString stringWithString:[self stringFromTimeInterval:timeDifference]];
                    [arrayToday addObject:happyHour];
                }
                
                //Happy Hour hasn't started, but will later tonight
                if([strStartHour floatValue] > [strHour floatValue])
                {
                    [arrayTonight addObject:happyHour];
                }
            }
        }
        
        //Happy Hour starts one day but ends the next day
        if ([strStartHour floatValue] > [strEndHour floatValue])
        {
            if ([[dictEstablishments objectForKey:strYesterday] isEqualToString:@"TRUE"])
            {
                if ([strHour floatValue] < [strEndHour floatValue])
                {
                    [locationData addObject:annotationEstablishment];
                    NSDateFormatter* timeLeftCalculator = [[[NSDateFormatter alloc] init] autorelease];
                    [timeLeftCalculator setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease]];
                    [timeLeftCalculator setDateFormat:@"HH:mm:ss:SS"];
                    NSDate* firstDate = [timeLeftCalculator dateFromString:[timeLeftCalculator stringFromDate:[NSDate date]]];
                    strEndHour = [NSString stringWithFormat:@"%@%@",strEndHour,@":00:00:00"];
                    NSDate* secondDate = [timeLeftCalculator dateFromString:strEndHour];
                    NSTimeInterval timeDifference = [secondDate timeIntervalSinceDate:firstDate];
                    happyHour.timeLeft = [NSMutableString stringWithString:[self stringFromTimeInterval:timeDifference]];
                    [arrayToday addObject:happyHour];
                }
            }
            
            if ([[dictEstablishments objectForKey:strToday] isEqualToString:@"TRUE"])
            {
                if ([strStartHour floatValue] < [strHour floatValue])
                {
                    [locationData addObject:annotationEstablishment];
                    
                    NSDateFormatter* timeLeftCalculator = [[[NSDateFormatter alloc] init] autorelease];
                    [timeLeftCalculator setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease]];
                    [timeLeftCalculator setDateFormat:@"HH:mm:ss:SS"];
                    NSDate* firstDate = [timeLeftCalculator dateFromString:[timeLeftCalculator stringFromDate:[NSDate date]]];
                    strEndHour = [NSString stringWithFormat:@"%@%@",strEndHour,@":00:00:00"];
                    NSDate* secondDate = [[timeLeftCalculator dateFromString:strEndHour] dateByAddingTimeInterval:86400]; 
                    //Need to add 24h to move from this morning to tomorrow morning.
                    NSTimeInterval timeDifference = [secondDate timeIntervalSinceDate:firstDate];
                    happyHour.timeLeft = [NSMutableString stringWithString:[self stringFromTimeInterval:timeDifference]];
                    [arrayToday addObject:happyHour];
                }
                
                if([strStartHour floatValue] > [strHour floatValue])
                {
                    [arrayTonight addObject:happyHour];
                }
            }

        }

	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	if ([Establishment isEqualToString:@"EstablishmentName"]) {
		[EstablishmentName appendString:string];
	} else if ([Establishment isEqualToString:@"Neighborhood"]) {
		[Location appendString:string];
    } else if ([Establishment isEqualToString:@"Latitude"]) {
		[Latitude appendString:string];
	} else if ([Establishment isEqualToString:@"Longitude"]) {
		[Longitude appendString:string];
	} else if ([Establishment isEqualToString:@"Start"]) {
        [StartTime appendString:string];
    } else if([Establishment isEqualToString:@"End"]) {
        [EndTime appendString:string];
    } else if([Establishment isEqualToString:@"Telephone"]) {
        [phoneNumber appendString:string];
    } else if([Establishment isEqualToString:@"Description"]) {
        [eventDescription appendString:string];
    } else if([Establishment isEqualToString:@"Address"]) {
        [establishmentAddress appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	//NSLog(@"COMPLETE!");
	//NSLog(@"Machine array has %d items", [locationData count]);
    
}

- (void)reloadHappyHourXML {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    strHour = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"EEEE"];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:-1];
    NSDate *dateYesterday = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    strYesterday = [dateFormatter stringFromDate:dateYesterday];
    strToday = [dateFormatter stringFromDate:[NSDate date]];
    
    [comps setDay:1];
    NSDate *dateTomorrow = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    strTomorrow = [dateFormatter stringFromDate:dateTomorrow];
    [comps setDay:2];
    NSDate *date2Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str2Days = [dateFormatter stringFromDate:date2Days];
    [comps setDay:3];
    NSDate *date3Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str3Days = [dateFormatter stringFromDate:date3Days];
    [comps setDay:4];
    NSDate *date4Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str4Days = [dateFormatter stringFromDate:date4Days];
    [comps setDay:5];
    NSDate *date5Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str5Days = [dateFormatter stringFromDate:date5Days];
    [comps setDay:6];
    NSDate *date6Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str6Days = [dateFormatter stringFromDate:date6Days];
    [comps setDay:7];
    NSDate *date7Days = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    str7Days = [dateFormatter stringFromDate:date7Days];
    [comps release];
    
    [dateFormatter release];
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://www.louisvillelush.com/HappyHours.xml"];
    NSData *dataEstablishments = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error)
        NSLog(@"Download error: %@",error);
    
    [self parseXMLFileWithData:dataEstablishments];
    
    HappyHourTableViewController *happyHourTableViewController = [[HappyHourTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navHappyHourController = [[[UINavigationController alloc] initWithRootViewController:happyHourTableViewController] autorelease];
    [navHappyHourController setNavigationBarHidden:YES animated:YES];
    happyHourTableViewController.happyHours_Today = arrayToday;
    happyHourTableViewController.happyHours_Tonight = arrayTonight;
    happyHourTableViewController.happyHours_Tomorrow = arrayTomorrow;
    happyHourTableViewController.happyHours_2Days = array2Days;
    happyHourTableViewController.happyHours_3Days = array3Days;
    happyHourTableViewController.happyHours_4Days = array4Days;
    happyHourTableViewController.happyHours_5Days = array5Days;
    happyHourTableViewController.happyHours_6Days = array6Days;
    happyHourTableViewController.happyHours_7Days = array7Days;
    happyHourTableViewController.happyHours_BowmanField = arrayBowmanField;
    happyHourTableViewController.happyHours_Butchertown = arrayButchertown;
    happyHourTableViewController.happyHours_Clifton = arrayClifton;
    happyHourTableViewController.happyHours_Downtown = arrayDowntown;
    happyHourTableViewController.happyHours_EastEnd = arrayEastEnd;
    happyHourTableViewController.happyHours_Germantown = arrayGermantown;
    happyHourTableViewController.happyHours_HarrodsCreek = arrayHarrodsCreek;
    happyHourTableViewController.happyHours_Highlands = arrayHighlands;
    happyHourTableViewController.happyHours_Jeffersontown = arrayJeffersontown;
    happyHourTableViewController.happyHours_Middletown = arrayMiddletown;
    happyHourTableViewController.happyHours_NewAlbany = arrayNewAlbany;
    happyHourTableViewController.happyHours_Okolona = arrayOkolona;
    happyHourTableViewController.happyHours_OldLouisville = arrayOldLouisville;
    happyHourTableViewController.happyHours_Prospect = arrayProspect;
    happyHourTableViewController.happyHours_SouthEnd = arraySouthEnd;
    happyHourTableViewController.happyHours_StMatthews = arrayStMatthews;
    happyHourTableViewController.happyHours_Westport = arrayWestport;
    happyHourTableViewController.strTomorrow = strTomorrow;
    happyHourTableViewController.str2Days = str2Days;
    happyHourTableViewController.str3Days = str3Days;
    happyHourTableViewController.str4Days = str4Days;
    happyHourTableViewController.str5Days = str5Days;
    happyHourTableViewController.str6Days = str6Days;
    happyHourTableViewController.str7Days = str7Days;
    [happyHourTableViewController view];
    navHappyHourController.tabBarItem.image = [UIImage imageNamed:@"88-beer-mug.png"];
    navHappyHourController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navHappyHourController.title = @"Happy Hours";
    [happyHourTableViewController release];
    
    LouisvilleMapViewController *mapViewController = [[LouisvilleMapViewController alloc] init];
    UINavigationController *navMapViewController = [[[UINavigationController alloc] initWithRootViewController:mapViewController] autorelease];
    mapViewController.annotationData = locationData;
    [navMapViewController setNavigationBarHidden:YES animated:YES];
    [mapViewController view];
    navMapViewController.tabBarItem.image = [UIImage imageNamed:@"72-pin.png"];
    navMapViewController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navMapViewController.title = @"Now";
    [mapViewController release]; 
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    UINavigationController *navSecondViewController = [[[UINavigationController alloc] initWithRootViewController:secondViewController] autorelease];
    [navSecondViewController setNavigationBarHidden:YES animated:YES];
    navSecondViewController.tabBarItem.image = [UIImage imageNamed:@"47-bicycle.png"];
    navSecondViewController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navSecondViewController.title = @"Drivers";
    [secondViewController release];
    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    UINavigationController *navThirdViewController = [[[UINavigationController alloc] initWithRootViewController:thirdViewController] autorelease];
    [thirdViewController view];
    url = [NSURL URLWithString:@"http://www.louisvillelush.com/advertisement.png"];
    NSData *dataAdvertisement  = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error)
    {   
        UIImage *imgAdvertisement = [UIImage imageNamed:@"advertise_button.png"];
        thirdViewController.imgAdvertisement.image = imgAdvertisement;
        thirdViewController.imgAdvertisement.tag = 0;
        
    }
    else
    {
        UIImage *imgAdvertisement = [[UIImage alloc] initWithData:dataAdvertisement];
        thirdViewController.imgAdvertisement.image = imgAdvertisement;
        thirdViewController.imgAdvertisement.tag = 1;
    }
    //thirdViewController.imgAdvertisement.image = [UIImage imageNamed:@"advertise_button.png"];
    navThirdViewController.tabBarItem.image = [UIImage imageNamed:@"85-trophy.png"];
    navThirdViewController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navThirdViewController.title = @"Featured";
    [thirdViewController release];
    
    CreditsTableViewController *creditsTableViewController = [[CreditsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navCreditsController = [[[UINavigationController alloc] initWithRootViewController:creditsTableViewController] autorelease];
    [navCreditsController setNavigationBarHidden:YES animated:YES];
    [creditsTableViewController view];
    navCreditsController.tabBarItem.image = [UIImage imageNamed:@"144-martini.png"];
    navCreditsController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    navCreditsController.title = @"Credits";
    [creditsTableViewController release];
    
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects: navHappyHourController, navMapViewController, navThirdViewController, navSecondViewController, navCreditsController, nil]];
    
    self.window.rootViewController = self.tabBarController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    locationData = [[NSMutableArray array] retain];
    arrayToday = [[NSMutableArray array] retain];
    
    _backgroundImage.image = [UIImage imageNamed:@"background.png"];
    _skylineImage.image = [UIImage imageNamed:@"skyline.png"];
    
    starsScroller1.starsImage.image = [UIImage imageNamed:@"starlayer1.png"];
    starsScroller2.starsImage.image = [UIImage imageNamed:@"starlayer2.png"];
    moonScroller.starsImage.image = [UIImage imageNamed:@"moonlayer.png"];
    starsScroller1.contentSize = starsScroller1.starsImage.frame.size;
    starsScroller2.contentSize = starsScroller2.starsImage.frame.size;
    moonScroller.contentSize = moonScroller.starsImage.frame.size;
    starsScroller1.starsImage.alpha = 0;
    starsScroller2.starsImage.alpha = 0;
    moonScroller.starsImage.alpha = 0;
    
    [self reloadHappyHourXML]; 
    [starsScroller1 doAnimatedScrollTo:CGPointMake(0, 40)];
    [starsScroller2 doAnimatedScrollTo:CGPointMake(0, -140)];
    [moonScroller doAnimatedScrollTo:CGPointMake(0, 95)];
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/5secondIntro.m4a", [[NSBundle mainBundle] resourcePath]]];
    
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = 0;
	if (audioPlayer == nil)
		NSLog(@"%@",[error description]);
	else
		[audioPlayer play];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    exit(0);
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    [self reloadHappyHourXML];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)dealloc
{
    [_window release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [super dealloc];
}

- (void)awakeFromNib
{
    /*
     Typically you should set up the Core Data stack here, usually by passing the managed object context to the first view controller.
     self.<#View controller#>.managedObjectContext = self.managedObjectContext;
    */
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LouisvilleLush" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LouisvilleLush.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
