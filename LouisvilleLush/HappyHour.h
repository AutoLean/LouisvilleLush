//
//  HappyHour.h
//  LouisvilleLush
//
//  Created by Jeffrey Jackson on 10/17/11.
//  Copyright (c) 2011 AutoLean, Inc. All rights reserved.
//



@interface HappyHour : NSObject
{
    NSString *title; 
    NSString *subtitle;
    NSString *address;
    NSString *city;
    NSString *state;
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
    NSMutableString *timeLeft;
    NSMutableString *startTime;
    NSMutableString *endTime;
    
    float distance;
    float latitude;
    float longitude;
}

@property (nonatomic,copy) NSString *title; 
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *state;
@property (nonatomic,copy) NSMutableString *occursSunday;
@property (nonatomic,copy) NSMutableString *occursMonday;
@property (nonatomic,copy) NSMutableString *occursTuesday;
@property (nonatomic,copy) NSMutableString *occursWednesday;
@property (nonatomic,copy) NSMutableString *occursThursday;
@property (nonatomic,copy) NSMutableString *occursFriday;
@property (nonatomic,copy) NSMutableString *occursSaturday;
@property (nonatomic,copy) NSMutableString *hasFood;
@property (nonatomic,copy) NSMutableString *hasBeer;
@property (nonatomic,copy) NSMutableString *hasWine;
@property (nonatomic,copy) NSMutableString *hasCocktails;
@property (nonatomic,copy) NSMutableString *phoneNumber;
@property (nonatomic,copy) NSMutableString *eventDescription;
@property (nonatomic,copy) NSMutableString *timeLeft;
@property (nonatomic,copy) NSMutableString *startTime;
@property (nonatomic,copy) NSMutableString *endTime;


@property (nonatomic) float distance;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;


@end
