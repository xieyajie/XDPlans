//
//  XDWeatherManager.m
//  XDPlans
//
//  Created by xie yajie on 13-9-2.
//  Copyright (c) 2013年 XD. All rights reserved.
//

#import "XDWeatherManager.h"

#import "XDPlanLocalDefault.h"

static XDWeatherManager *weatherManager = nil;

@implementation XDWeatherManager

@synthesize weatherInfo = _weatherInfo;

+ (id)shareWeather
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weatherManager = [[XDWeatherManager alloc] init];
    });
    
    return weatherManager;
}

- (NSMutableDictionary *)weatherInfo
{
    if (_weatherInfo == nil) {
        _weatherInfo = [NSMutableDictionary dictionary];
    }
    
    NSURL *URL =[NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101100604.html"];
    NSError *error;
    NSString *stringFromFileAtURL = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:&error];
    
    NSString *strWeather = @"";
    NSString *fileName = @"晴.png";
    
    if(stringFromFileAtURL !=nil)
    {
        NSArray *strarray = [stringFromFileAtURL componentsSeparatedByString:@"\""];
        
        for(int i = 0;i < strarray.count;i++)
        {
            NSString *str = [strarray objectAtIndex:i];
            if(YES == [str isEqualToString:KWEATHER_TEMP_MAX])//最高温度
            {
                [_weatherInfo setObject:[strarray objectAtIndex:i + 2] forKey:KWEATHER_TEMP_MAX];
            }
            else if(YES == [str isEqualToString:KWEATHER_TEMP_MIN])//最低温度
            {
                [_weatherInfo setObject:[strarray objectAtIndex:i + 2] forKey:KWEATHER_TEMP_MIN];
            }
            else if(YES == [str isEqualToString:KWEATHER_WEATHER])//天气
            {
                [_weatherInfo setObject:[strarray objectAtIndex:i + 2] forKey:KWEATHER_WEATHER];
            }
            
        }
        
        if(NSNotFound != [strWeather rangeOfString:@"晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@",@"晴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"多云"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"多云.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"阴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"阴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"小雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雷"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雷雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雾"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雾.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"中雪"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"中雨"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"小雪"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"小雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"小雨"].location)
        {
            fileName = [[NSString alloc]initWithFormat:@"%@",@"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雨加雪"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雨夹雪.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"阵雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"中雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"雷阵雨"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"雷阵雨.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"大雨转晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"大雨转晴.png"];
        }
        if(NSNotFound != [strWeather rangeOfString:@"阴转晴"].location)
        {
            fileName =[[NSString alloc]initWithFormat:@"%@", @"阴转晴.png"];
        }
        
//        if(sweather !=nil)
//        {
//            self.weathText.text = sweather;
//        }
    }

    [_weatherInfo setObject:[UIImage imageNamed:fileName] forKey:KWEATHER_IMAGE];
    
    return _weatherInfo;
}

@end
