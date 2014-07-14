/*
* Copyright (c) 2004-2013 Derelict Developers
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are
* met:
*
* * Redistributions of source code must retain the above copyright
*   notice, this list of conditions and the following disclaimer.
*
* * Redistributions in binary form must reproduce the above copyright
*   notice, this list of conditions and the following disclaimer in the
*   documentation and/or other materials provided with the distribution.
*
* * Neither the names 'Derelict', 'DerelictILUT', nor the names of its contributors
*   may be used to endorse or promote products derived from this software
*   without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
* PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
module derelict.bass.funcs;


private
{
    import derelict.util.loader;
    import derelict.util.system;
    import derelict.bass.types;
}

extern(System) @nogc nothrow
{
    alias BOOL function(int, int) da_BASS_SetConfig;
    alias int function(int) da_BASS_GetConfig;
    alias BOOL function(int, void*) da_BASS_SetConfigPtr;
    alias void* function(int) da_BASS_GetConfigPtr;
    alias int function() da_BASS_GetVersion; 
    alias int function() da_BASS_ErrorGetCode; 
    alias BOOL function(int, BASS_DEVICEINFO*) da_BASS_GetDeviceInfo;
    alias BOOL function(int, int, int, HWND, GUID*) da_BASS_Init;
    alias BOOL function(int) da_BASS_SetDevice;
    alias int function() da_BASS_GetDevice;
    alias BOOL function() da_BASS_Free;
    alias void* function(int) da_BASS_GetDSoundObject;
    alias BOOL function(BASS_INFO*) da_BASS_GetInfo;
    alias BOOL function(int) da_BASS_Update;
    alias float function() da_BASS_GetCPU;
    alias BOOL function() da_BASS_Start;
    alias BOOL function() da_BASS_Stop;
    alias BOOL function() da_BASS_Pause;
    alias BOOL function(float) da_BASS_SetVolume;
    alias float function() da_BASS_GetVolume;
    alias HPLUGIN function(char*, int) da_BASS_PluginLoad; 
    alias BOOL function(HPLUGIN) da_BASS_PluginFree; 
    alias BASS_PLUGININFO* function(HPLUGIN) da_BASS_PluginGetInfo; 
    alias BOOL function(float, float, float) da_BASS_Set3DFactors; 
    alias BOOL function(float*, float*, float*) da_BASS_Get3DFactors; 
    alias BOOL function(BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*) da_BASS_Set3DPosition; 
    alias BOOL function(BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*) da_BASS_Get3DPosition; 
    alias void function() da_BASS_Apply3D; 
    alias BOOL function(int, float, float, float) da_BASS_SetEAXParameters; 
    alias BOOL function(int*, float*, float*, float*) da_BASS_GetEAXParameters;
    alias HMUSIC function(BOOL, void*, long, int, int, int) da_BASS_MusicLoad; 
    alias BOOL function(HMUSIC) da_BASS_MusicFree;
    alias HSAMPLE function(BOOL, void*, long, int, int, int) da_BASS_SampleLoad; 
    alias HSAMPLE function(int, int, int, int, int) da_BASS_SampleCreate; 
    alias BOOL function(HSAMPLE) da_BASS_SampleFree; 
    alias BOOL function(HSAMPLE, void*) da_BASS_SampleSetData; 
    alias BOOL function(HSAMPLE, void*) da_BASS_SampleGetData; 
    alias BOOL function(HSAMPLE, BASS_SAMPLE*) da_BASS_SampleGetInfo; 
    alias BOOL function(HSAMPLE, BASS_SAMPLE*) da_BASS_SampleSetInfo; 
    alias HCHANNEL function(HSAMPLE, BOOL) da_BASS_SampleGetChannel; 
    alias int function(HSAMPLE, HCHANNEL*) da_BASS_SampleGetChannels; 
    alias BOOL function(HSAMPLE) da_BASS_SampleStop;
    alias HSTREAM function(int, int, int, STREAMPROC, void*) da_BASS_StreamCreate;
    alias HSTREAM function(BOOL, void*, long, long, int) da_BASS_StreamCreateFile;
    alias HSTREAM function(char*, int, int, DOWNLOADPROC, void*) da_BASS_StreamCreateURL; 
    alias HSTREAM function(int, int, BASS_FILEPROCS*, void*) da_BASS_StreamCreateFileUser; 
    alias BOOL function(HSTREAM) da_BASS_StreamFree;
    alias long function(HSTREAM, int) da_BASS_StreamGetFilePosition; 
    alias int function(HSTREAM, void*, int) da_BASS_StreamPutData; 
    alias int function(HSTREAM, void*, int) da_BASS_StreamPutFileData; 
    alias BOOL function(int, BASS_DEVICEINFO*) da_BASS_RecordGetDeviceInfo; 
    alias BOOL function(int) da_BASS_RecordInit; 
    alias BOOL function(int) da_BASS_RecordSetDevice; 
    alias int function() da_BASS_RecordGetDevice; 
    alias BOOL function() da_BASS_RecordFree; 
    alias BOOL function(BASS_RECORDINFO*) da_BASS_RecordGetInfo; 
    alias char* function(int) da_BASS_RecordGetInputName;
    alias BOOL function(int, int, float) da_BASS_RecordSetInput;
    alias int function(int, float*) da_BASS_RecordGetInput; 
    alias HRECORD function(int, int, int, RECORDPROC, void*) da_BASS_RecordStart;
    alias double function(int, long) da_BASS_ChannelBytes2Seconds;
    alias long function(int, double) da_BASS_ChannelSeconds2Bytes;
    alias int function(int) da_BASS_ChannelGetDevice;
    alias BOOL function(int, int) da_BASS_ChannelSetDevice;
    alias int function(int) da_BASS_ChannelIsActive;
    alias BOOL function(int, BASS_CHANNELINFO*) da_BASS_ChannelGetInfo;
    alias char* function(HSTREAM, int) da_BASS_ChannelGetTags;
    alias int function(int, int, int) da_BASS_ChannelFlags; 
    alias BOOL function(int, int) da_BASS_ChannelUpdate; 
    alias BOOL function(int, BOOL) da_BASS_ChannelLock;
    alias BOOL function(int, BOOL) da_BASS_ChannelPlay;
    alias BOOL function(int) da_BASS_ChannelStop;
    alias BOOL function(int) da_BASS_ChannelPause;
    alias BOOL function(int, int, float) da_BASS_ChannelSetAttribute; 
    alias BOOL function(int, int, float*) da_BASS_ChannelGetAttribute; 
    alias BOOL function(int, int, float, int) da_BASS_ChannelSlideAttribute; 
    alias BOOL function(int, int) da_BASS_ChannelIsSliding;
    alias BOOL function(int, int, float, float, int, int, int) da_BASS_ChannelSet3DAttributes; 
    alias BOOL function(int, int*, float*, float*, int*, int*, int*) da_BASS_ChannelGet3DAttributes; 
    alias BOOL function(int, BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*) da_BASS_ChannelSet3DPosition; 
    alias BOOL function(int, BASS_3DVECTOR*, BASS_3DVECTOR*, BASS_3DVECTOR*) da_BASS_ChannelGet3DPosition; 
    alias long function(int, int) da_BASS_ChannelGetLength; 
    alias BOOL function(int, long, int) da_BASS_ChannelSetPosition; 
    alias long function(int, int) da_BASS_ChannelGetPosition; 
    alias int function(int) da_BASS_ChannelGetLevel; 
    alias int function(int, void*, int) da_BASS_ChannelGetData;
    alias HSYNC function(int, int, long, SYNCPROC, void*) da_BASS_ChannelSetSync; 
    alias BOOL function(int, HSYNC) da_BASS_ChannelRemoveSync; 
    alias HDSP function(int, DSPPROC, void*, int) da_BASS_ChannelSetDSP;
    alias BOOL function(int, HDSP) da_BASS_ChannelRemoveDSP; 
    alias BOOL function(int, int) da_BASS_ChannelSetLink; 
    alias BOOL function(int, int) da_BASS_ChannelRemoveLink; 
    alias HFX function(int, int, int) da_BASS_ChannelSetFX;
    alias BOOL function(int, HFX) da_BASS_ChannelRemoveFX;
    alias BOOL function(HFX, void*) da_BASS_FXSetParameters;
    alias BOOL function(HFX, void*) da_BASS_FXGetParameters;
    alias BOOL function(HFX) da_BASS_FXReset;
}

__gshared
{
	  da_BASS_SetConfig BASS_SetConfig;
	  da_BASS_GetConfig BASS_GetConfig;
	  da_BASS_SetConfigPtr BASS_SetConfigPtr;
	  da_BASS_GetConfigPtr BASS_GetConfigPtr;
	  da_BASS_GetVersion BASS_GetVersion;
	  da_BASS_ErrorGetCode BASS_ErrorGetCode;
	  da_BASS_GetDeviceInfo BASS_GetDeviceInfo;
	  da_BASS_Init BASS_Init;
	  da_BASS_SetDevice BASS_SetDevice;
	  da_BASS_GetDevice BASS_GetDevice;
	  da_BASS_Free BASS_Free;
	  da_BASS_GetDSoundObject BASS_GetDSoundObject;
	  da_BASS_GetInfo BASS_GetInfo;
	  da_BASS_Update BASS_Update;
	  da_BASS_GetCPU BASS_GetCPU;
	  da_BASS_Start BASS_Start;
	  da_BASS_Stop BASS_Stop;
	  da_BASS_Pause BASS_Pause;
	  da_BASS_SetVolume BASS_SetVolume;
	  da_BASS_GetVolume BASS_GetVolume;
	  da_BASS_PluginLoad BASS_PluginLoad;
	  da_BASS_PluginFree BASS_PluginFree;
	  da_BASS_PluginGetInfo BASS_PluginGetInfo;
	  da_BASS_Set3DFactors BASS_Set3DFactors;
	  da_BASS_Get3DFactors BASS_Get3DFactors;
	  da_BASS_Set3DPosition BASS_Set3DPosition;
	  da_BASS_Get3DPosition BASS_Get3DPosition;
	  da_BASS_Apply3D BASS_Apply3D;
	  da_BASS_SetEAXParameters BASS_SetEAXParameters;
	  da_BASS_GetEAXParameters BASS_GetEAXParameters;
	  da_BASS_MusicLoad BASS_MusicLoad;
	  da_BASS_MusicFree BASS_MusicFree;
	  da_BASS_SampleLoad BASS_SampleLoad;
	  da_BASS_SampleCreate BASS_SampleCreate;
	  da_BASS_SampleFree BASS_SampleFree;
	  da_BASS_SampleSetData BASS_SampleSetData;
	  da_BASS_SampleGetData BASS_SampleGetData;
	  da_BASS_SampleGetInfo BASS_SampleGetInfo;
	  da_BASS_SampleSetInfo BASS_SampleSetInfo;
	  da_BASS_SampleGetChannel BASS_SampleGetChannel;
	  da_BASS_SampleGetChannels BASS_SampleGetChannels;
	  da_BASS_SampleStop BASS_SampleStop;
	  da_BASS_StreamCreate BASS_StreamCreate;
	  da_BASS_StreamCreateFile BASS_StreamCreateFile;
	  da_BASS_StreamCreateURL BASS_StreamCreateURL;
	  da_BASS_StreamCreateFileUser BASS_StreamCreateFileUser;
	  da_BASS_StreamFree BASS_StreamFree;
	  da_BASS_StreamGetFilePosition BASS_StreamGetFilePosition;
	  da_BASS_StreamPutData BASS_StreamPutData;
	  da_BASS_StreamPutFileData BASS_StreamPutFileData;
	  da_BASS_RecordGetDeviceInfo BASS_RecordGetDeviceInfo;
	  da_BASS_RecordInit BASS_RecordInit;
	  da_BASS_RecordSetDevice BASS_RecordSetDevice;
	  da_BASS_RecordGetDevice BASS_RecordGetDevice;
	  da_BASS_RecordFree BASS_RecordFree;
	  da_BASS_RecordGetInfo BASS_RecordGetInfo;
	  da_BASS_RecordGetInputName BASS_RecordGetInputName;
	  da_BASS_RecordSetInput BASS_RecordSetInput;
	  da_BASS_RecordGetInput BASS_RecordGetInput;
	  da_BASS_RecordStart BASS_RecordStart;
	  da_BASS_ChannelBytes2Seconds BASS_ChannelBytes2Seconds;
	  da_BASS_ChannelSeconds2Bytes BASS_ChannelSeconds2Bytes;
	  da_BASS_ChannelGetDevice BASS_ChannelGetDevice;
	  da_BASS_ChannelSetDevice BASS_ChannelSetDevice;
	  da_BASS_ChannelIsActive BASS_ChannelIsActive;
	  da_BASS_ChannelGetInfo BASS_ChannelGetInfo;
	  da_BASS_ChannelGetTags BASS_ChannelGetTags;
	  da_BASS_ChannelFlags BASS_ChannelFlags;
	  da_BASS_ChannelUpdate BASS_ChannelUpdate;
	  da_BASS_ChannelLock BASS_ChannelLock;
	  da_BASS_ChannelPlay BASS_ChannelPlay;
	  da_BASS_ChannelStop BASS_ChannelStop;
	  da_BASS_ChannelPause BASS_ChannelPause;
	  da_BASS_ChannelSetAttribute BASS_ChannelSetAttribute;
	  da_BASS_ChannelGetAttribute BASS_ChannelGetAttribute;
	  da_BASS_ChannelSlideAttribute BASS_ChannelSlideAttribute;
	  da_BASS_ChannelIsSliding BASS_ChannelIsSliding;
	  da_BASS_ChannelSet3DAttributes BASS_ChannelSet3DAttributes;
	  da_BASS_ChannelGet3DAttributes BASS_ChannelGet3DAttributes;
	  da_BASS_ChannelSet3DPosition BASS_ChannelSet3DPosition;
	  da_BASS_ChannelGet3DPosition BASS_ChannelGet3DPosition;
	  da_BASS_ChannelGetLength BASS_ChannelGetLength;
	  da_BASS_ChannelSetPosition BASS_ChannelSetPosition;
	  da_BASS_ChannelGetPosition BASS_ChannelGetPosition;
	  da_BASS_ChannelGetLevel BASS_ChannelGetLevel;
	  da_BASS_ChannelGetData BASS_ChannelGetData;
	  da_BASS_ChannelSetSync BASS_ChannelSetSync;
	  da_BASS_ChannelRemoveSync BASS_ChannelRemoveSync;
	  da_BASS_ChannelSetDSP BASS_ChannelSetDSP;
	  da_BASS_ChannelRemoveDSP BASS_ChannelRemoveDSP;
	  da_BASS_ChannelSetLink BASS_ChannelSetLink;
	  da_BASS_ChannelRemoveLink BASS_ChannelRemoveLink;
	  da_BASS_ChannelSetFX BASS_ChannelSetFX;
	  da_BASS_ChannelRemoveFX BASS_ChannelRemoveFX;
	  da_BASS_FXSetParameters BASS_FXSetParameters;
	  da_BASS_FXGetParameters BASS_FXGetParameters;
	  da_BASS_FXReset BASS_FXReset;
}
