//
//  XDPlanLocalDefault.h
//  XDPlans
//
//  Created by xieyajie on 13-9-2.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#ifndef XDPlans_XDPlanLocalDefault_h
#define XDPlans_XDPlanLocalDefault_h

#if !defined __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
# define KTextAlignmentLeft UITextAlignmentLeft
# define KTextAlignmentCenter UITextAlignmentCenter
# define KTextAlignmentRight UITextAlignmentRight

#define KLineBreakModeClip UILineBreakModeClip

#else
# define KTextAlignmentLeft NSTextAlignmentLeft
# define KTextAlignmentCenter NSTextAlignmentCenter
# define KTextAlignmentRight NSTextAlignmentRight

#define KLineBreakModeClip NSLineBreakByClipping
#endif

//Notification
#define KNOTIFICATION_MOVE @"notification_move"


//menu
#define KSIDESLIP_PERCENT 0.5
#define KSIDESLIP_CELL_HEIGHT 60.0

//today
#define KTODAY_CELL_HEIGHT_NORMAL 80.0
#define KTODAY_CELL_HEIGHT_CONTENT 150.0

//weather
#define KWEATHER_TEMP_MAX @"temp1"
#define KWEATHER_TEMP_MIN @"temp2"
#define KWEATHER_WEATHER @"weather"
#define KWEATHER_IMAGE @"weather_image"



#endif
