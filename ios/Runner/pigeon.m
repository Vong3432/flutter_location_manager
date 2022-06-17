// Autogenerated from Pigeon (v3.1.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface LocationStatus ()
+ (LocationStatus *)fromMap:(NSDictionary *)dict;
+ (nullable LocationStatus *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface LocationCoordinate ()
+ (LocationCoordinate *)fromMap:(NSDictionary *)dict;
+ (nullable LocationCoordinate *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation LocationStatus
+ (instancetype)makeWithStatus:(NSString *)status {
  LocationStatus* pigeonResult = [[LocationStatus alloc] init];
  pigeonResult.status = status;
  return pigeonResult;
}
+ (LocationStatus *)fromMap:(NSDictionary *)dict {
  LocationStatus *pigeonResult = [[LocationStatus alloc] init];
  pigeonResult.status = GetNullableObject(dict, @"status");
  NSAssert(pigeonResult.status != nil, @"");
  return pigeonResult;
}
+ (nullable LocationStatus *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [LocationStatus fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"status" : (self.status ?: [NSNull null]),
  };
}
@end

@implementation LocationCoordinate
+ (instancetype)makeWithLatitude:(NSNumber *)latitude
    longitude:(NSNumber *)longitude {
  LocationCoordinate* pigeonResult = [[LocationCoordinate alloc] init];
  pigeonResult.latitude = latitude;
  pigeonResult.longitude = longitude;
  return pigeonResult;
}
+ (LocationCoordinate *)fromMap:(NSDictionary *)dict {
  LocationCoordinate *pigeonResult = [[LocationCoordinate alloc] init];
  pigeonResult.latitude = GetNullableObject(dict, @"latitude");
  NSAssert(pigeonResult.latitude != nil, @"");
  pigeonResult.longitude = GetNullableObject(dict, @"longitude");
  NSAssert(pigeonResult.longitude != nil, @"");
  return pigeonResult;
}
+ (nullable LocationCoordinate *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [LocationCoordinate fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"latitude" : (self.latitude ?: [NSNull null]),
    @"longitude" : (self.longitude ?: [NSNull null]),
  };
}
@end

@interface LocationAPICodecReader : FlutterStandardReader
@end
@implementation LocationAPICodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [LocationCoordinate fromMap:[self readValue]];
    
    case 129:     
      return [LocationStatus fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface LocationAPICodecWriter : FlutterStandardWriter
@end
@implementation LocationAPICodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[LocationCoordinate class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[LocationStatus class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface LocationAPICodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation LocationAPICodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[LocationAPICodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[LocationAPICodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *LocationAPIGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    LocationAPICodecReaderWriter *readerWriter = [[LocationAPICodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void LocationAPISetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<LocationAPI> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.LocationAPI.getLocationStatus"
        binaryMessenger:binaryMessenger
        codec:LocationAPIGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getLocationStatusWithError:)], @"LocationAPI api (%@) doesn't respond to @selector(getLocationStatusWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        LocationStatus *output = [api getLocationStatusWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.LocationAPI.getLocationCoord"
        binaryMessenger:binaryMessenger
        codec:LocationAPIGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getLocationCoordWithError:)], @"LocationAPI api (%@) doesn't respond to @selector(getLocationCoordWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        LocationCoordinate *output = [api getLocationCoordWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.LocationAPI.requestLocationPermission"
        binaryMessenger:binaryMessenger
        codec:LocationAPIGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(requestLocationPermissionWithError:)], @"LocationAPI api (%@) doesn't respond to @selector(requestLocationPermissionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api requestLocationPermissionWithError:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.LocationAPI.listenLocationCoordinate"
        binaryMessenger:binaryMessenger
        codec:LocationAPIGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(listenLocationCoordinateWithError:)], @"LocationAPI api (%@) doesn't respond to @selector(listenLocationCoordinateWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api listenLocationCoordinateWithError:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.LocationAPI.stopListenLocationCoordinate"
        binaryMessenger:binaryMessenger
        codec:LocationAPIGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopListenLocationCoordinateWithError:)], @"LocationAPI api (%@) doesn't respond to @selector(stopListenLocationCoordinateWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        [api stopListenLocationCoordinateWithError:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
