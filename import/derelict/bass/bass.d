/*
* Copyright (c) 2004-2012 Derelict Developers
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
module derelict.bass.bass;

public
{
    import derelict.bass.types;
    import derelict.bass.funcs;
}

private
{
    import derelict.util.loader;

    version(darwin)
        version = MacOSX;
    version(OSX)
        version = MacOSX;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "bass.dll";    
    else static if (Derelict_OS_Mac)
        enum libNames = "libbass.dylib";
	else static if (Derelict_OS_Linux)
		enum libNames = "libbass.so";
    else
        static assert(0, "Need to implement BASS libNames for this operating system.");
}

class DerelictBASSLoader : SharedLibLoader
{

    protected
    {
        override void loadSymbols()
        {
            /* specific-plateform binding functions */
            version (Derelict_OS_Windows) {
                bindFunc(cast(void**)&BASS_GetDSoundObject, "BASS_GetDSoundObject");
                bindFunc(cast(void**)&BASS_SetEAXParameters, "BASS_SetEAXParameters");
                bindFunc(cast(void**)&BASS_GetEAXParameters, "BASS_GetEAXParameters");
            }
            bindFunc(cast(void**)&BASS_SetConfig, "BASS_SetConfig");
            bindFunc(cast(void**)&BASS_GetConfig, "BASS_GetConfig");
            bindFunc(cast(void**)&BASS_SetConfigPtr, "BASS_SetConfigPtr");
            bindFunc(cast(void**)&BASS_GetConfigPtr, "BASS_GetConfigPtr");
            bindFunc(cast(void**)&BASS_GetVersion, "BASS_GetVersion");
            bindFunc(cast(void**)&BASS_ErrorGetCode, "BASS_ErrorGetCode");
            bindFunc(cast(void**)&BASS_GetVersion, "BASS_GetVersion");
            bindFunc(cast(void**)&BASS_GetDeviceInfo, "BASS_GetDeviceInfo");
            bindFunc(cast(void**)&BASS_Init, "BASS_Init");
            bindFunc(cast(void**)&BASS_SetDevice, "BASS_SetDevice");
            bindFunc(cast(void**)&BASS_GetDevice, "BASS_GetDevice");
            bindFunc(cast(void**)&BASS_Free, "BASS_Free");
            bindFunc(cast(void**)&BASS_GetInfo, "BASS_GetInfo");
            bindFunc(cast(void**)&BASS_Update, "BASS_Update");
            bindFunc(cast(void**)&BASS_GetCPU, "BASS_GetCPU");
            bindFunc(cast(void**)&BASS_Start, "BASS_Start");
            bindFunc(cast(void**)&BASS_Stop, "BASS_Stop");
            bindFunc(cast(void**)&BASS_Pause, "BASS_Pause");
            bindFunc(cast(void**)&BASS_SetVolume, "BASS_SetVolume");
            bindFunc(cast(void**)&BASS_GetVolume, "BASS_GetVolume");
            bindFunc(cast(void**)&BASS_PluginLoad, "BASS_PluginLoad");
            bindFunc(cast(void**)&BASS_PluginFree, "BASS_PluginFree");
            bindFunc(cast(void**)&BASS_PluginGetInfo, "BASS_PluginGetInfo");
            bindFunc(cast(void**)&BASS_Set3DFactors, "BASS_Set3DFactors");
            bindFunc(cast(void**)&BASS_Get3DFactors, "BASS_Get3DFactors");
            bindFunc(cast(void**)&BASS_Set3DPosition, "BASS_Set3DPosition");
            bindFunc(cast(void**)&BASS_Get3DPosition, "BASS_Get3DPosition");
            bindFunc(cast(void**)&BASS_Apply3D, "BASS_Apply3D");
            bindFunc(cast(void**)&BASS_MusicLoad, "BASS_MusicLoad");
            bindFunc(cast(void**)&BASS_MusicFree, "BASS_MusicFree");
            bindFunc(cast(void**)&BASS_SampleLoad, "BASS_SampleLoad");
            bindFunc(cast(void**)&BASS_SampleCreate, "BASS_SampleCreate");
            bindFunc(cast(void**)&BASS_SampleFree, "BASS_SampleFree");
            bindFunc(cast(void**)&BASS_SampleSetData, "BASS_SampleSetData");
            bindFunc(cast(void**)&BASS_SampleGetData, "BASS_SampleGetData");
            bindFunc(cast(void**)&BASS_SampleGetInfo, "BASS_SampleGetInfo");
            bindFunc(cast(void**)&BASS_SampleSetInfo, "BASS_SampleSetInfo");
            bindFunc(cast(void**)&BASS_SampleGetChannel, "BASS_SampleGetChannel");
            bindFunc(cast(void**)&BASS_SampleGetChannels, "BASS_SampleGetChannels");
            bindFunc(cast(void**)&BASS_SampleStop, "BASS_SampleStop");
            bindFunc(cast(void**)&BASS_StreamCreate, "BASS_StreamCreate");
            bindFunc(cast(void**)&BASS_StreamCreateFile, "BASS_StreamCreateFile");
            bindFunc(cast(void**)&BASS_StreamCreateURL, "BASS_StreamCreateURL");
            bindFunc(cast(void**)&BASS_StreamCreateFileUser, "BASS_StreamCreateFileUser");
            bindFunc(cast(void**)&BASS_StreamFree, "BASS_StreamFree");
            bindFunc(cast(void**)&BASS_StreamGetFilePosition, "BASS_StreamGetFilePosition");
            bindFunc(cast(void**)&BASS_StreamPutData, "BASS_StreamPutData");
            bindFunc(cast(void**)&BASS_StreamPutFileData, "BASS_StreamPutFileData");
            bindFunc(cast(void**)&BASS_RecordGetDeviceInfo, "BASS_RecordGetDeviceInfo");
            bindFunc(cast(void**)&BASS_RecordInit, "BASS_RecordInit");
            bindFunc(cast(void**)&BASS_RecordSetDevice, "BASS_RecordSetDevice");
            bindFunc(cast(void**)&BASS_RecordGetDevice, "BASS_RecordGetDevice");
            bindFunc(cast(void**)&BASS_RecordFree, "BASS_RecordFree");
            bindFunc(cast(void**)&BASS_RecordGetInfo, "BASS_RecordGetInfo");
            bindFunc(cast(void**)&BASS_RecordGetInputName, "BASS_RecordGetInputName");
            bindFunc(cast(void**)&BASS_RecordSetInput, "BASS_RecordSetInput");
            bindFunc(cast(void**)&BASS_RecordGetInput, "BASS_RecordGetInput");
            bindFunc(cast(void**)&BASS_RecordStart, "BASS_RecordStart");
            bindFunc(cast(void**)&BASS_ChannelBytes2Seconds, "BASS_ChannelBytes2Seconds");
            bindFunc(cast(void**)&BASS_ChannelSeconds2Bytes, "BASS_ChannelSeconds2Bytes");
            bindFunc(cast(void**)&BASS_ChannelGetDevice, "BASS_ChannelGetDevice");
            bindFunc(cast(void**)&BASS_ChannelSetDevice, "BASS_ChannelSetDevice");
            bindFunc(cast(void**)&BASS_ChannelIsActive, "BASS_ChannelIsActive");
            bindFunc(cast(void**)&BASS_ChannelGetInfo, "BASS_ChannelGetInfo");
            bindFunc(cast(void**)&BASS_ChannelGetTags, "BASS_ChannelGetTags");
            bindFunc(cast(void**)&BASS_ChannelFlags, "BASS_ChannelFlags");
            bindFunc(cast(void**)&BASS_ChannelUpdate, "BASS_ChannelUpdate");
            bindFunc(cast(void**)&BASS_ChannelLock, "BASS_ChannelLock");
            bindFunc(cast(void**)&BASS_ChannelPlay, "BASS_ChannelPlay");
            bindFunc(cast(void**)&BASS_ChannelStop, "BASS_ChannelStop");
            bindFunc(cast(void**)&BASS_ChannelPause, "BASS_ChannelPause");
            bindFunc(cast(void**)&BASS_ChannelSetAttribute, "BASS_ChannelSetAttribute");
            bindFunc(cast(void**)&BASS_ChannelGetAttribute, "BASS_ChannelGetAttribute");
            bindFunc(cast(void**)&BASS_ChannelSlideAttribute, "BASS_ChannelSlideAttribute");
            bindFunc(cast(void**)&BASS_ChannelIsSliding, "BASS_ChannelIsSliding");
            bindFunc(cast(void**)&BASS_ChannelSet3DAttributes, "BASS_ChannelSet3DAttributes");
            bindFunc(cast(void**)&BASS_ChannelGet3DAttributes, "BASS_ChannelGet3DAttributes");
            bindFunc(cast(void**)&BASS_ChannelSet3DPosition, "BASS_ChannelSet3DPosition");
            bindFunc(cast(void**)&BASS_ChannelGet3DPosition, "BASS_ChannelGet3DPosition");
            bindFunc(cast(void**)&BASS_ChannelGetLength, "BASS_ChannelGetLength");
            bindFunc(cast(void**)&BASS_ChannelSetPosition, "BASS_ChannelSetPosition");
            bindFunc(cast(void**)&BASS_ChannelGetPosition, "BASS_ChannelGetPosition");
            bindFunc(cast(void**)&BASS_ChannelGetLevel, "BASS_ChannelGetLevel");
            bindFunc(cast(void**)&BASS_ChannelGetData, "BASS_ChannelGetData");
            bindFunc(cast(void**)&BASS_ChannelSetSync, "BASS_ChannelSetSync");
            bindFunc(cast(void**)&BASS_ChannelRemoveSync, "BASS_ChannelRemoveSync");
            bindFunc(cast(void**)&BASS_ChannelSetDSP, "BASS_ChannelSetDSP");
            bindFunc(cast(void**)&BASS_ChannelRemoveDSP, "BASS_ChannelRemoveDSP");
            bindFunc(cast(void**)&BASS_ChannelSetLink, "BASS_ChannelSetLink");
            bindFunc(cast(void**)&BASS_ChannelRemoveLink, "BASS_ChannelRemoveLink");
            bindFunc(cast(void**)&BASS_ChannelSetFX, "BASS_ChannelSetFX");
            bindFunc(cast(void**)&BASS_ChannelRemoveFX, "BASS_ChannelRemoveFX");
            bindFunc(cast(void**)&BASS_FXSetParameters, "BASS_FXSetParameters");
            bindFunc(cast(void**)&BASS_FXGetParameters, "BASS_FXGetParameters");
            bindFunc(cast(void**)&BASS_FXReset, "BASS_FXReset");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictBASSLoader DerelictBASS;

shared static this()
{
    DerelictBASS = new DerelictBASSLoader();
}

shared static ~this()
{
    DerelictBASS.unload();
}

