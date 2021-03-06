// ///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2010-2011, Frank Blumenberg
//
// See License.txt for complete licensing and attribution information.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ///////////////////////////////////////////////////////////////////////////////


#import "IKParamSet.h"

@implementation IKParamSet

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

+ (id)settingWithData:(NSData *)data{
  return [[[IKParamSet alloc] initWithData:data] autorelease];
}

- (id)initWithData:(NSData*)data{
  self = [super init];
  if (self != nil) {
    const char * bytes = [data bytes];
    
    _parameter88.Index = bytes[0];
    _parameter88.Revision = bytes[1];
    
    if( _parameter88.Revision==88 ){
        memcpy(&_parameter88,[data bytes],sizeof(_parameter88));
    }
    else {
      if(_parameter88.Revision==85){
        memcpy(&_parameter85,[data bytes],sizeof(_parameter85));

        memcpy(&_parameter88,[data bytes],sizeof(_parameter85));
        _parameter88.BitConfig=_parameter85.BitConfig;
        _parameter88.ServoCompInvert=_parameter85.ServoCompInvert;
        _parameter88.ExtraConfig=_parameter85.ExtraConfig;

        memcpy(_parameter88.Name,_parameter85.Name,12);
      }
    }
  }
  return self;
}

- (NSData*) data{
  
  NSData* d=nil;
  if( _parameter88.Revision==88 ){
    unsigned char payloadData[sizeof(_parameter88)];
    
    memcpy((unsigned char *)(payloadData),(unsigned char *)&_parameter88,sizeof(_parameter88));
    
    d = [NSData dataWithBytes:payloadData length:sizeof(payloadData)];  
  }
  else {
    unsigned char payloadData[sizeof(_parameter85)];

    memcpy(&_parameter85,&_parameter88,sizeof(_parameter85));
    _parameter85.BitConfig=_parameter88.BitConfig;
    _parameter85.ServoCompInvert=_parameter88.ServoCompInvert;
    _parameter85.ExtraConfig=_parameter88.ExtraConfig;
    memcpy(_parameter85.Name,_parameter88.Name,12);

    memcpy((unsigned char *)(payloadData),(unsigned char *)&_parameter85,sizeof(_parameter85));
    
    d = [NSData dataWithBytes:payloadData length:sizeof(payloadData)];  
  }
  return d;
}

- (BOOL) isValid{
  return _parameter88.Revision==EEPARAM_REVISION || _parameter88.Revision==85;
}

//---------------------------------------------------
#pragma mark -
#pragma mark Properties
//---------------------------------------------------

- (id)valueForUndefinedKey:(NSString *)key{
  return nil;
}

- (NSNumber*) Index{
  
  return [NSNumber numberWithUnsignedChar:_parameter88.Index];
}
- (void) setIndex:(NSNumber*) value {
  
  _parameter88.Index = [value unsignedCharValue];
}

- (NSNumber*) Revision{
  return [NSNumber numberWithUnsignedChar:_parameter88.Revision];
}
- (void) setRevision:(NSNumber*) value {
  _parameter88.Revision = [value unsignedCharValue];
}
//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) Kanalbelegung_00{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[0]];
}
- (void) setKanalbelegung_00:(NSNumber*) value {
  _parameter88.Kanalbelegung[0] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_01{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[1]];
}
- (void) setKanalbelegung_01:(NSNumber*) value {
  _parameter88.Kanalbelegung[1] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_02{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[2]];
}
- (void) setKanalbelegung_02:(NSNumber*) value {
  _parameter88.Kanalbelegung[2] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_03{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[3]];
}
- (void) setKanalbelegung_03:(NSNumber*) value {
  _parameter88.Kanalbelegung[3] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_04{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[4]];
}
- (void) setKanalbelegung_04:(NSNumber*) value {
  _parameter88.Kanalbelegung[4] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_05{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[5]];
}
- (void) setKanalbelegung_05:(NSNumber*) value {
  _parameter88.Kanalbelegung[5] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_06{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[6]];
}
- (void) setKanalbelegung_06:(NSNumber*) value {
  _parameter88.Kanalbelegung[6] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_07{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[7]];
}
- (void) setKanalbelegung_07:(NSNumber*) value {
  _parameter88.Kanalbelegung[7] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_08{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[8]];
}
- (void) setKanalbelegung_08:(NSNumber*) value {
  _parameter88.Kanalbelegung[8] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_09{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[9]];
}
- (void) setKanalbelegung_09:(NSNumber*) value {
  _parameter88.Kanalbelegung[9] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_10{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[10]];
}
- (void) setKanalbelegung_10:(NSNumber*) value {
  _parameter88.Kanalbelegung[10] = [value unsignedCharValue];
}
- (NSNumber*) Kanalbelegung_11{
  return [NSNumber numberWithUnsignedChar:_parameter88.Kanalbelegung[11]];
}
- (void) setKanalbelegung_11:(NSNumber*) value {
  _parameter88.Kanalbelegung[11] = [value unsignedCharValue];
}
//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) GlobalConfig{
  return [NSNumber numberWithUnsignedChar:_parameter88.GlobalConfig];
}
- (void) setGlobalConfig:(NSNumber*) value {
  _parameter88.GlobalConfig = [value unsignedCharValue];
}
- (NSNumber*) GlobalConfig_HOEHENREGELUNG{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_HOEHENREGELUNG)==CFG_HOEHENREGELUNG)];
}
- (void) setGlobalConfig_HOEHENREGELUNG:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_HOEHENREGELUNG;
  else
     _parameter88.GlobalConfig &= ~CFG_HOEHENREGELUNG;
}
- (NSNumber*) GlobalConfig_HOEHEN_SCHALTER{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_HOEHEN_SCHALTER)==CFG_HOEHEN_SCHALTER)];
}
- (void) setGlobalConfig_HOEHEN_SCHALTER:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_HOEHEN_SCHALTER;
  else
     _parameter88.GlobalConfig &= ~CFG_HOEHEN_SCHALTER;
}
- (NSNumber*) GlobalConfig_HEADING_HOLD{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_HEADING_HOLD)==CFG_HEADING_HOLD)];
}
- (void) setGlobalConfig_HEADING_HOLD:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_HEADING_HOLD;
  else
     _parameter88.GlobalConfig &= ~CFG_HEADING_HOLD;
}
- (NSNumber*) GlobalConfig_KOMPASS_AKTIV{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_KOMPASS_AKTIV)==CFG_KOMPASS_AKTIV)];
}
- (void) setGlobalConfig_KOMPASS_AKTIV:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_KOMPASS_AKTIV;
  else
     _parameter88.GlobalConfig &= ~CFG_KOMPASS_AKTIV;
}
- (NSNumber*) GlobalConfig_KOMPASS_FIX{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_KOMPASS_FIX)==CFG_KOMPASS_FIX)];
}
- (void) setGlobalConfig_KOMPASS_FIX:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_KOMPASS_FIX;
  else
     _parameter88.GlobalConfig &= ~CFG_KOMPASS_FIX;
}
- (NSNumber*) GlobalConfig_GPS_AKTIV{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_GPS_AKTIV)==CFG_GPS_AKTIV)];
}
- (void) setGlobalConfig_GPS_AKTIV:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_GPS_AKTIV;
  else
     _parameter88.GlobalConfig &= ~CFG_GPS_AKTIV;
}
- (NSNumber*) GlobalConfig_ACHSENKOPPLUNG_AKTIV{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_ACHSENKOPPLUNG_AKTIV)==CFG_ACHSENKOPPLUNG_AKTIV)];
}
- (void) setGlobalConfig_ACHSENKOPPLUNG_AKTIV:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_ACHSENKOPPLUNG_AKTIV;
  else
     _parameter88.GlobalConfig &= ~CFG_ACHSENKOPPLUNG_AKTIV;
}
- (NSNumber*) GlobalConfig_DREHRATEN_BEGRENZER{
  return [NSNumber numberWithBool:((_parameter88.GlobalConfig&CFG_DREHRATEN_BEGRENZER)==CFG_DREHRATEN_BEGRENZER)];
}
- (void) setGlobalConfig_DREHRATEN_BEGRENZER:(NSNumber*) value {
  if([value boolValue])
     _parameter88.GlobalConfig |= CFG_DREHRATEN_BEGRENZER;
  else
     _parameter88.GlobalConfig &= ~CFG_DREHRATEN_BEGRENZER;
}

//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) Hoehe_MinGas{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_MinGas];
}
- (void) setHoehe_MinGas:(NSNumber*) value {
  _parameter88.Hoehe_MinGas = [value unsignedCharValue];
}
- (NSNumber*) Luftdruck_D{
  return [NSNumber numberWithUnsignedChar:_parameter88.Luftdruck_D];
}
- (void) setLuftdruck_D:(NSNumber*) value {
  _parameter88.Luftdruck_D = [value unsignedCharValue];
}
- (NSNumber*) MaxHoehe{
  return [NSNumber numberWithUnsignedChar:_parameter88.MaxHoehe];
}
- (void) setMaxHoehe:(NSNumber*) value {
  _parameter88.MaxHoehe = [value unsignedCharValue];
}
- (NSNumber*) Hoehe_P{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_P];
}
- (void) setHoehe_P:(NSNumber*) value {
  _parameter88.Hoehe_P = [value unsignedCharValue];
}
- (NSNumber*) Hoehe_Verstaerkung{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_Verstaerkung];
}
- (void) setHoehe_Verstaerkung:(NSNumber*) value {
  _parameter88.Hoehe_Verstaerkung = [value unsignedCharValue];
}
- (NSNumber*) Hoehe_ACC_Wirkung{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_ACC_Wirkung];
}
- (void) setHoehe_ACC_Wirkung:(NSNumber*) value {
  _parameter88.Hoehe_ACC_Wirkung = [value unsignedCharValue];
}
- (NSNumber*) Hoehe_HoverBand{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_HoverBand];
}
- (void) setHoehe_HoverBand:(NSNumber*) value {
  _parameter88.Hoehe_HoverBand = [value unsignedCharValue];
}
- (NSNumber*) Hoehe_GPS_Z{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_GPS_Z];
}
- (void) setHoehe_GPS_Z:(NSNumber*) value {
  _parameter88.Hoehe_GPS_Z = [value unsignedCharValue];
}
//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) Hoehe_StickNeutralPoint{
  return [NSNumber numberWithUnsignedChar:_parameter88.Hoehe_StickNeutralPoint];
}
- (void) setHoehe_StickNeutralPoint:(NSNumber*) value {
  _parameter88.Hoehe_StickNeutralPoint = [value unsignedCharValue];
}
- (NSNumber*) Stick_P{
  return [NSNumber numberWithUnsignedChar:_parameter88.Stick_P];
}
- (void) setStick_P:(NSNumber*) value {
  _parameter88.Stick_P = [value unsignedCharValue];
}
- (NSNumber*) Stick_D{
  return [NSNumber numberWithUnsignedChar:_parameter88.Stick_D];
}
- (void) setStick_D:(NSNumber*) value {
  _parameter88.Stick_D = [value unsignedCharValue];
}
- (NSNumber*) StickGier_P{
  return [NSNumber numberWithUnsignedChar:_parameter88.StickGier_P];
}
- (void) setStickGier_P:(NSNumber*) value {
  _parameter88.StickGier_P = [value unsignedCharValue];
}
- (NSNumber*) Gas_Min{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gas_Min];
}
- (void) setGas_Min:(NSNumber*) value {
  _parameter88.Gas_Min = [value unsignedCharValue];
}
- (NSNumber*) Gas_Max{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gas_Max];
}
- (void) setGas_Max:(NSNumber*) value {
  _parameter88.Gas_Max = [value unsignedCharValue];
}
- (NSNumber*) GyroAccFaktor{
  return [NSNumber numberWithUnsignedChar:_parameter88.GyroAccFaktor];
}
- (void) setGyroAccFaktor:(NSNumber*) value {
  _parameter88.GyroAccFaktor = [value unsignedCharValue];
}
- (NSNumber*) KompassWirkung{
  return [NSNumber numberWithUnsignedChar:_parameter88.KompassWirkung];
}
- (void) setKompassWirkung:(NSNumber*) value {
  _parameter88.KompassWirkung = [value unsignedCharValue];
}
- (NSNumber*) Gyro_P{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_P];
}
- (void) setGyro_P:(NSNumber*) value {
  _parameter88.Gyro_P = [value unsignedCharValue];
}
- (NSNumber*) Gyro_I{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_I];
}
- (void) setGyro_I:(NSNumber*) value {
  _parameter88.Gyro_I = [value unsignedCharValue];
}
- (NSNumber*) Gyro_D{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_D];
}
- (void) setGyro_D:(NSNumber*) value {
  _parameter88.Gyro_D = [value unsignedCharValue];
}
- (NSNumber*) Gyro_Gier_P{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_Gier_P];
}
- (void) setGyro_Gier_P:(NSNumber*) value {
  _parameter88.Gyro_Gier_P = [value unsignedCharValue];
}
- (NSNumber*) Gyro_Gier_I{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_Gier_I];
}
- (void) setGyro_Gier_I:(NSNumber*) value {
  _parameter88.Gyro_Gier_I = [value unsignedCharValue];
}
- (NSNumber*) Gyro_Stability{
  return [NSNumber numberWithUnsignedChar:_parameter88.Gyro_Stability];
}
- (void) setGyro_Stability:(NSNumber*) value {
  _parameter88.Gyro_Stability = [value unsignedCharValue];
}
- (NSNumber*) UnterspannungsWarnung{
  return [NSNumber numberWithUnsignedChar:_parameter88.UnterspannungsWarnung];
}
- (void) setUnterspannungsWarnung:(NSNumber*) value {
  _parameter88.UnterspannungsWarnung = [value unsignedCharValue];
}
- (NSNumber*) NotGas{
  return [NSNumber numberWithUnsignedChar:_parameter88.NotGas];
}
- (void) setNotGas:(NSNumber*) value {
  _parameter88.NotGas = [value unsignedCharValue];
}
- (NSNumber*) NotGasZeit{
  return [NSNumber numberWithUnsignedChar:_parameter88.NotGasZeit];
}
- (void) setNotGasZeit:(NSNumber*) value {
  _parameter88.NotGasZeit = [value unsignedCharValue];
}
- (NSNumber*) Receiver{
  return [NSNumber numberWithUnsignedChar:_parameter88.Receiver];
}
- (void) setReceiver:(NSNumber*) value {
  _parameter88.Receiver = [value unsignedCharValue];
}
- (NSNumber*) I_Faktor{
  return [NSNumber numberWithUnsignedChar:_parameter88.I_Faktor];
}
- (void) setI_Faktor:(NSNumber*) value {
  _parameter88.I_Faktor = [value unsignedCharValue];
}
- (NSNumber*) UserParam1{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam1];
}
- (void) setUserParam1:(NSNumber*) value {
  _parameter88.UserParam1 = [value unsignedCharValue];
}
- (NSNumber*) UserParam2{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam2];
}
- (void) setUserParam2:(NSNumber*) value {
  _parameter88.UserParam2 = [value unsignedCharValue];
}
- (NSNumber*) UserParam3{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam3];
}
- (void) setUserParam3:(NSNumber*) value {
  _parameter88.UserParam3 = [value unsignedCharValue];
}
- (NSNumber*) UserParam4{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam4];
}
- (void) setUserParam4:(NSNumber*) value {
  _parameter88.UserParam4 = [value unsignedCharValue];
}
- (NSNumber*) ServoNickControl{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoNickControl];
}
- (void) setServoNickControl:(NSNumber*) value {
  _parameter88.ServoNickControl = [value unsignedCharValue];
}
- (NSNumber*) ServoNickComp{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoNickComp];
}
- (void) setServoNickComp:(NSNumber*) value {
  _parameter88.ServoNickComp = [value unsignedCharValue];
}
- (NSNumber*) ServoNickMin{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoNickMin];
}
- (void) setServoNickMin:(NSNumber*) value {
  _parameter88.ServoNickMin = [value unsignedCharValue];
}
- (NSNumber*) ServoNickMax{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoNickMax];
}
- (void) setServoNickMax:(NSNumber*) value {
  _parameter88.ServoNickMax = [value unsignedCharValue];
}
- (NSNumber*) ServoRollControl{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoRollControl];
}
- (void) setServoRollControl:(NSNumber*) value {
  _parameter88.ServoRollControl = [value unsignedCharValue];
}
- (NSNumber*) ServoRollComp{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoRollComp];
}
- (void) setServoRollComp:(NSNumber*) value {
  _parameter88.ServoRollComp = [value unsignedCharValue];
}
- (NSNumber*) ServoRollMin{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoRollMin];
}
- (void) setServoRollMin:(NSNumber*) value {
  _parameter88.ServoRollMin = [value unsignedCharValue];
}
- (NSNumber*) ServoRollMax{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoRollMax];
}
- (void) setServoRollMax:(NSNumber*) value {
  _parameter88.ServoRollMax = [value unsignedCharValue];
}
- (NSNumber*) ServoNickRefresh{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoNickRefresh];
}
- (void) setServoNickRefresh:(NSNumber*) value {
  _parameter88.ServoNickRefresh = [value unsignedCharValue];
}
- (NSNumber*) ServoManualControlSpeed{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoManualControlSpeed];
}
- (void) setServoManualControlSpeed:(NSNumber*) value {
  _parameter88.ServoManualControlSpeed = [value unsignedCharValue];
}
- (NSNumber*) CamOrientation{
  return [NSNumber numberWithUnsignedChar:_parameter88.CamOrientation];
}
- (void) setCamOrientation:(NSNumber*) value {
  _parameter88.CamOrientation = [value unsignedCharValue];
}
- (NSNumber*) Servo3{
  return [NSNumber numberWithUnsignedChar:_parameter88.Servo3];
}
- (void) setServo3:(NSNumber*) value {
  _parameter88.Servo3 = [value unsignedCharValue];
}
- (NSNumber*) Servo4{
  return [NSNumber numberWithUnsignedChar:_parameter88.Servo4];
}
- (void) setServo4:(NSNumber*) value {
  _parameter88.Servo4 = [value unsignedCharValue];
}
- (NSNumber*) Servo5{
  return [NSNumber numberWithUnsignedChar:_parameter88.Servo5];
}
- (void) setServo5:(NSNumber*) value {
  _parameter88.Servo5 = [value unsignedCharValue];
}
- (NSNumber*) LoopGasLimit{
  return [NSNumber numberWithUnsignedChar:_parameter88.LoopGasLimit];
}
- (void) setLoopGasLimit:(NSNumber*) value {
  _parameter88.LoopGasLimit = [value unsignedCharValue];
}
- (NSNumber*) LoopThreshold{
  return [NSNumber numberWithUnsignedChar:_parameter88.LoopThreshold];
}
- (void) setLoopThreshold:(NSNumber*) value {
  _parameter88.LoopThreshold = [value unsignedCharValue];
}
- (NSNumber*) LoopHysterese{
  return [NSNumber numberWithUnsignedChar:_parameter88.LoopHysterese];
}
- (void) setLoopHysterese:(NSNumber*) value {
  _parameter88.LoopHysterese = [value unsignedCharValue];
}
- (NSNumber*) AchsKopplung1{
  return [NSNumber numberWithUnsignedChar:_parameter88.AchsKopplung1];
}
- (void) setAchsKopplung1:(NSNumber*) value {
  _parameter88.AchsKopplung1 = [value unsignedCharValue];
}
- (NSNumber*) AchsKopplung2{
  return [NSNumber numberWithUnsignedChar:_parameter88.AchsKopplung2];
}
- (void) setAchsKopplung2:(NSNumber*) value {
  _parameter88.AchsKopplung2 = [value unsignedCharValue];
}
- (NSNumber*) CouplingYawCorrection{
  return [NSNumber numberWithUnsignedChar:_parameter88.CouplingYawCorrection];
}
- (void) setCouplingYawCorrection:(NSNumber*) value {
  _parameter88.CouplingYawCorrection = [value unsignedCharValue];
}
- (NSNumber*) WinkelUmschlagNick{
  return [NSNumber numberWithUnsignedChar:_parameter88.WinkelUmschlagNick];
}
- (void) setWinkelUmschlagNick:(NSNumber*) value {
  _parameter88.WinkelUmschlagNick = [value unsignedCharValue];
}
- (NSNumber*) WinkelUmschlagRoll{
  return [NSNumber numberWithUnsignedChar:_parameter88.WinkelUmschlagRoll];
}
- (void) setWinkelUmschlagRoll:(NSNumber*) value {
  _parameter88.WinkelUmschlagRoll = [value unsignedCharValue];
}
- (NSNumber*) GyroAccAbgleich{
  return [NSNumber numberWithUnsignedChar:_parameter88.GyroAccAbgleich];
}
- (void) setGyroAccAbgleich:(NSNumber*) value {
  _parameter88.GyroAccAbgleich = [value unsignedCharValue];
}
- (NSNumber*) Driftkomp{
  return [NSNumber numberWithUnsignedChar:_parameter88.Driftkomp];
}
- (void) setDriftkomp:(NSNumber*) value {
  _parameter88.Driftkomp = [value unsignedCharValue];
}
- (NSNumber*) DynamicStability{
  return [NSNumber numberWithUnsignedChar:_parameter88.DynamicStability];
}
- (void) setDynamicStability:(NSNumber*) value {
  _parameter88.DynamicStability = [value unsignedCharValue];
}
- (NSNumber*) UserParam5{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam5];
}
- (void) setUserParam5:(NSNumber*) value {
  _parameter88.UserParam5 = [value unsignedCharValue];
}
- (NSNumber*) UserParam6{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam6];
}
- (void) setUserParam6:(NSNumber*) value {
  _parameter88.UserParam6 = [value unsignedCharValue];
}
- (NSNumber*) UserParam7{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam7];
}
- (void) setUserParam7:(NSNumber*) value {
  _parameter88.UserParam7 = [value unsignedCharValue];
}
- (NSNumber*) UserParam8{
  return [NSNumber numberWithUnsignedChar:_parameter88.UserParam8];
}
- (void) setUserParam8:(NSNumber*) value {
  _parameter88.UserParam8 = [value unsignedCharValue];
}
- (NSNumber*) J16Bitmask{
  return [NSNumber numberWithUnsignedChar:_parameter88.J16Bitmask];
}
- (void) setJ16Bitmask:(NSNumber*) value {
  _parameter88.J16Bitmask = [value unsignedCharValue];
}
- (NSNumber*) J16Timing{
  return [NSNumber numberWithUnsignedChar:_parameter88.J16Timing];
}
- (void) setJ16Timing:(NSNumber*) value {
  _parameter88.J16Timing = [value unsignedCharValue];
}
- (NSNumber*) J17Bitmask{
  return [NSNumber numberWithUnsignedChar:_parameter88.J17Bitmask];
}
- (void) setJ17Bitmask:(NSNumber*) value {
  _parameter88.J17Bitmask = [value unsignedCharValue];
}
- (NSNumber*) J17Timing{
  return [NSNumber numberWithUnsignedChar:_parameter88.J17Timing];
}
- (void) setJ17Timing:(NSNumber*) value {
  _parameter88.J17Timing = [value unsignedCharValue];
}
- (NSNumber*) WARN_J16_Bitmask{
  return [NSNumber numberWithUnsignedChar:_parameter88.WARN_J16_Bitmask];
}
- (void) setWARN_J16_Bitmask:(NSNumber*) value {
  _parameter88.WARN_J16_Bitmask = [value unsignedCharValue];
}
- (NSNumber*) WARN_J17_Bitmask{
  return [NSNumber numberWithUnsignedChar:_parameter88.WARN_J17_Bitmask];
}
- (void) setWARN_J17_Bitmask:(NSNumber*) value {
  _parameter88.WARN_J17_Bitmask = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsModeControl{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsModeControl];
}
- (void) setNaviGpsModeControl:(NSNumber*) value {
  _parameter88.NaviGpsModeControl = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsGain{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsGain];
}
- (void) setNaviGpsGain:(NSNumber*) value {
  _parameter88.NaviGpsGain = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsP{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsP];
}
- (void) setNaviGpsP:(NSNumber*) value {
  _parameter88.NaviGpsP = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsI{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsI];
}
- (void) setNaviGpsI:(NSNumber*) value {
  _parameter88.NaviGpsI = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsD{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsD];
}
- (void) setNaviGpsD:(NSNumber*) value {
  _parameter88.NaviGpsD = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsPLimit{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsPLimit];
}
- (void) setNaviGpsPLimit:(NSNumber*) value {
  _parameter88.NaviGpsPLimit = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsILimit{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsILimit];
}
- (void) setNaviGpsILimit:(NSNumber*) value {
  _parameter88.NaviGpsILimit = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsDLimit{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsDLimit];
}
- (void) setNaviGpsDLimit:(NSNumber*) value {
  _parameter88.NaviGpsDLimit = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsACC{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsACC];
}
- (void) setNaviGpsACC:(NSNumber*) value {
  _parameter88.NaviGpsACC = [value unsignedCharValue];
}
- (NSNumber*) NaviGpsMinSat{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviGpsMinSat];
}
- (void) setNaviGpsMinSat:(NSNumber*) value {
  _parameter88.NaviGpsMinSat = [value unsignedCharValue];
}
- (NSNumber*) NaviStickThreshold{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviStickThreshold];
}
- (void) setNaviStickThreshold:(NSNumber*) value {
  _parameter88.NaviStickThreshold = [value unsignedCharValue];
}
- (NSNumber*) NaviWindCorrection{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviWindCorrection];
}
- (void) setNaviWindCorrection:(NSNumber*) value {
  _parameter88.NaviWindCorrection = [value unsignedCharValue];
}
- (NSNumber*) NaviAccCompensation{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviAccCompensation];
}
- (void) setNaviAccCompensation:(NSNumber*) value {
  _parameter88.NaviAccCompensation = [value unsignedCharValue];
}
- (NSNumber*) NaviOperatingRadius{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviOperatingRadius];
}
- (void) setNaviOperatingRadius:(NSNumber*) value {
  _parameter88.NaviOperatingRadius = [value unsignedCharValue];
}
- (NSNumber*) NaviAngleLimitation{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviAngleLimitation];
}
- (void) setNaviAngleLimitation:(NSNumber*) value {
  _parameter88.NaviAngleLimitation = [value unsignedCharValue];
}
- (NSNumber*) NaviPH_LoginTime{
  return [NSNumber numberWithUnsignedChar:_parameter88.NaviPH_LoginTime];
}
- (void) setNaviPH_LoginTime:(NSNumber*) value {
  _parameter88.NaviPH_LoginTime = [value unsignedCharValue];
}
- (NSNumber*) ExternalControl{
  return [NSNumber numberWithUnsignedChar:_parameter88.ExternalControl];
}
- (void) setExternalControl:(NSNumber*) value {
  _parameter88.ExternalControl = [value unsignedCharValue];
}
- (NSNumber*) OrientationAngle{
  return [NSNumber numberWithUnsignedChar:_parameter88.OrientationAngle];
}
- (void) setOrientationAngle:(NSNumber*) value {
  _parameter88.OrientationAngle = [value unsignedCharValue];
}
- (NSNumber*) CareFreeModeControl{
  return [NSNumber numberWithUnsignedChar:_parameter88.CareFreeModeControl];
}
- (void) setCareFreeModeControl:(NSNumber*) value {
  _parameter88.CareFreeModeControl = [value unsignedCharValue];
}
- (NSNumber*) MotorSafetySwitch{
  return [NSNumber numberWithUnsignedChar:_parameter88.MotorSafetySwitch];
}
- (void) setMotorSafetySwitch:(NSNumber*) value {
  _parameter88.MotorSafetySwitch = [value unsignedCharValue];
}
- (NSNumber*) MotorSmooth{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithUnsignedChar:_parameter88.MotorSmooth];
}
- (void) setMotorSmooth:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  _parameter88.MotorSmooth = [value unsignedCharValue];
}
- (NSNumber*) ComingHomeAltitude{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithUnsignedChar:_parameter88.ComingHomeAltitude];
}
- (void) setComingHomeAltitude:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  _parameter88.ComingHomeAltitude = [value unsignedCharValue];
}
- (NSNumber*) FailSafeTime{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithUnsignedChar:_parameter88.FailSafeTime];
}
- (void) setFailSafeTime:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  _parameter88.FailSafeTime = [value unsignedCharValue];
}
- (NSNumber*) MaxAltitude{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithUnsignedChar:_parameter88.MaxAltitude];
}
- (void) setMaxAltitude:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  _parameter88.MaxAltitude = [value unsignedCharValue];
}


//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) BitConfig{
  return [NSNumber numberWithUnsignedChar:_parameter88.BitConfig];
}
- (void) setBitConfig:(NSNumber*) value {
  _parameter88.BitConfig = [value unsignedCharValue];
}
- (NSNumber*) BitConfig_LOOP_OBEN{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_LOOP_OBEN)==CFG_LOOP_OBEN)];
}
- (void) setBitConfig_LOOP_OBEN:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_LOOP_OBEN;
  else
     _parameter88.BitConfig &= ~CFG_LOOP_OBEN;
}
- (NSNumber*) BitConfig_LOOP_UNTEN{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_LOOP_UNTEN)==CFG_LOOP_UNTEN)];
  
}
- (void) setBitConfig_LOOP_UNTEN:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_LOOP_UNTEN;
  else
     _parameter88.BitConfig &= ~CFG_LOOP_UNTEN;
}
- (NSNumber*) BitConfig_LOOP_LINKS{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_LOOP_LINKS)==CFG_LOOP_LINKS)];
}
- (void) setBitConfig_LOOP_LINKS:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_LOOP_LINKS;
  else
     _parameter88.BitConfig &= ~CFG_LOOP_LINKS;
}
- (NSNumber*) BitConfig_LOOP_RECHTS{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_LOOP_RECHTS)==CFG_LOOP_RECHTS)];
}
- (void) setBitConfig_LOOP_RECHTS:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_LOOP_RECHTS;
  else
     _parameter88.BitConfig &= ~CFG_LOOP_RECHTS;
}
- (NSNumber*) BitConfig_MOTOR_BLINK1{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_MOTOR_BLINK1)==CFG_MOTOR_BLINK1)];
}
- (void) setBitConfig_MOTOR_BLINK1:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_MOTOR_BLINK1;
  else
     _parameter88.BitConfig &= ~CFG_MOTOR_BLINK1;
}
- (NSNumber*) BitConfig_MOTOR_BLINK2{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_MOTOR_BLINK2)==CFG_MOTOR_BLINK2)];
}
- (void) setBitConfig_MOTOR_BLINK2:(NSNumber*) value {
  if([value boolValue])
    _parameter88.BitConfig |= CFG_MOTOR_BLINK2;
  else
    _parameter88.BitConfig &= ~CFG_MOTOR_BLINK2;
}
- (NSNumber*) BitConfig_MOTOR_OFF_LED1{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_MOTOR_OFF_LED1)==CFG_MOTOR_OFF_LED1)];
}
- (void) setBitConfig_MOTOR_OFF_LED1:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_MOTOR_OFF_LED1;
  else
     _parameter88.BitConfig &= ~CFG_MOTOR_OFF_LED1;
}
- (NSNumber*) BitConfig_MOTOR_OFF_LED2{
  return [NSNumber numberWithBool:((_parameter88.BitConfig&CFG_MOTOR_OFF_LED2)==CFG_MOTOR_OFF_LED2)];
}
- (void) setBitConfig_MOTOR_OFF_LED2:(NSNumber*) value {
  if([value boolValue])
     _parameter88.BitConfig |= CFG_MOTOR_OFF_LED2;
  else
     _parameter88.BitConfig &= ~CFG_MOTOR_OFF_LED2;
}
//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) ServoCompInvert{
  return [NSNumber numberWithUnsignedChar:_parameter88.ServoCompInvert];
}
- (void) setServoCompInvert:(NSNumber*) value {
  _parameter88.ServoCompInvert = [value unsignedCharValue];
}
- (NSNumber*) ServoCompInvert_NICK{
  return [NSNumber numberWithBool:((_parameter88.ServoCompInvert&CFG_SERVOCOMPINVERT_NICK)==CFG_SERVOCOMPINVERT_NICK)];
}
- (void) setServoCompInvert_NICK:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ServoCompInvert |= CFG_SERVOCOMPINVERT_NICK;
  else
     _parameter88.ServoCompInvert &= ~CFG_SERVOCOMPINVERT_NICK;
}
- (NSNumber*) ServoCompInvert_ROLL{
  return [NSNumber numberWithBool:((_parameter88.ServoCompInvert&CFG_SERVOCOMPINVERT_ROLL)==CFG_SERVOCOMPINVERT_ROLL)];
}
- (void) setServoCompInvert_ROLL:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ServoCompInvert |= CFG_SERVOCOMPINVERT_ROLL;
  else
     _parameter88.ServoCompInvert &= ~CFG_SERVOCOMPINVERT_ROLL;
}

//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSNumber*) ExtraConfig{
  return [NSNumber numberWithUnsignedChar:_parameter88.ExtraConfig];
}
- (void) setExtraConfig:(NSNumber*) value {
  _parameter88.ExtraConfig = [value unsignedCharValue];
}
- (NSNumber*) ExtraConfig_HEIGHT_LIMIT{
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG2_HEIGHT_LIMIT)==CFG2_HEIGHT_LIMIT)];
}
- (void) setExtraConfig_HEIGHT_LIMIT:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ExtraConfig |= CFG2_HEIGHT_LIMIT;
  else
     _parameter88.ExtraConfig &= ~CFG2_HEIGHT_LIMIT;
}
- (NSNumber*) ExtraConfig_VARIO_BEEP{
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG2_VARIO_BEEP)==CFG2_VARIO_BEEP)];
}
- (void) setExtraConfig_VARIO_BEEP:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ExtraConfig |= CFG2_VARIO_BEEP;
  else
     _parameter88.ExtraConfig &= ~CFG2_VARIO_BEEP;
}
- (NSNumber*) ExtraConfig_SENSITIVE_RC{
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_SENSITIVE_RC)==CFG_SENSITIVE_RC)];
}
- (void) setExtraConfig_SENSITIVE_RC:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ExtraConfig |= CFG_SENSITIVE_RC;
  else
     _parameter88.ExtraConfig &= ~CFG_SENSITIVE_RC;
}
- (NSNumber*) ExtraConfig_3_3V_REFERENCE{
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_3_3V_REFERENCE)==CFG_3_3V_REFERENCE)];
}
- (void) setExtraConfig_3_3V_REFERENCE:(NSNumber*) value {
  if([value boolValue])
     _parameter88.ExtraConfig |= CFG_3_3V_REFERENCE;
  else
     _parameter88.ExtraConfig &= ~CFG_3_3V_REFERENCE;
}
- (NSNumber*) ExtraConfig_NO_RCOFF_BEEPING{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_NO_RCOFF_BEEPING)==CFG_NO_RCOFF_BEEPING)];
}
- (void) setExtraConfig_NO_RCOFF_BEEPING:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  if([value boolValue])
    _parameter88.ExtraConfig |= CFG_NO_RCOFF_BEEPING;
  else
    _parameter88.ExtraConfig &= ~CFG_NO_RCOFF_BEEPING;
}
- (NSNumber*) ExtraConfig_GPS_AID{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_GPS_AID)==CFG_GPS_AID)];
}
- (void) setExtraConfig_GPS_AID:(NSNumber*) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  if([value boolValue])
    _parameter88.ExtraConfig |= CFG_GPS_AID;
  else
    _parameter88.ExtraConfig &= ~CFG_GPS_AID;
}
- (NSNumber*) ExtraConfig_LEARNABLE_CAREFREE{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_LEARNABLE_CAREFREE)==CFG_LEARNABLE_CAREFREE)];
}
- (void) setExtraConfig_LEARNABLE_CAREFREE:(NSNumber *) value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  if([value boolValue])
    _parameter88.ExtraConfig |= CFG_LEARNABLE_CAREFREE;
  else
    _parameter88.ExtraConfig &= ~CFG_LEARNABLE_CAREFREE;
}
- (NSNumber*) ExtraConfig_IGNORE_MAG_ERR_AT_STARTUP{
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  return [NSNumber numberWithBool:((_parameter88.ExtraConfig&CFG_IGNORE_MAG_ERR_AT_STARTUP)==CFG_IGNORE_MAG_ERR_AT_STARTUP)];
}
- (void) setExtraConfig_IGNORE_MAG_ERR_AT_STARTUP:(NSNumber *)value {
  NSAssert(_parameter88.Revision==88, @"Wrong parameter revision %d", _parameter88.Revision);
  if([value boolValue])
    _parameter88.ExtraConfig |= CFG_IGNORE_MAG_ERR_AT_STARTUP;
  else
    _parameter88.ExtraConfig &= ~CFG_IGNORE_MAG_ERR_AT_STARTUP;
}

//---------------------------------------------------
#pragma mark -
//---------------------------------------------------
- (NSString*) Name {
  return [NSString stringWithCString:_parameter88.Name encoding:NSASCIIStringEncoding];
}
- (void) setName:(NSString*)name {

  memset(_parameter88.Name, 0, 12);
  
  [name getBytes:(void*)_parameter88.Name 
       maxLength:12 
      usedLength:NULL 
        encoding:NSASCIIStringEncoding 
         options:0 
           range:NSMakeRange(0,[name length]) 
  remainingRange:NULL];
}

@end
