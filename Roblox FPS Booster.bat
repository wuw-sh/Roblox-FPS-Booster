@echo off
reg add "HKCU\Console" /v "FontFamily" /t REG_DWORD /d 0x00000000 /f
reg add "HKCU\Console" /v "FaceName" /t REG_SZ /d "Lucida Console" /f

cls

rem Color Foreground
rem Dark
set color.foreground.black=[30m
set color.foreground.red=[31m
set color.foreground.green=[32m
set color.foreground.yellow=[33m
set color.foreground.blue=[34m
set color.foreground.magenta=[35m
set color.foreground.cyan=[36m
set color.foreground.white=[37m
rem Light
set color.foreground.lightBlack=[90m
set color.foreground.lightRed=[91m
set color.foreground.lightGreen=[92m
set color.foreground.lightYellow=[93m
set color.foreground.lightBlue=[94m
set color.foreground.lightMagenta=[95m
set color.foreground.lightCyan=[96m
set color.foreground.lightWhite=[97m

rem Color Background
rem Dark
set color.background.black=[40m
set color.background.red=[41m
set color.background.green=[42m
set color.background.yellow=[43m
set color.background.blue=[44m
set color.background.magenta=[45m
set color.background.cyan=[46m
set color.background.white=[47m
rem Light
set color.background.lightBlack=[100m
set color.background.lightRed=[101m
set color.background.lightGreen=[102m
set color.background.lightYellow=[103m
set color.background.lightBlue=[104m
set color.background.lightMagenta=[105m
set color.background.lightCyan=[106m
set color.background.lightWhite=[107m

rem Color Bold
set color.bold=[1m

rem Color Underline
set color.underline=[4m

rem Color Italic
set color.italic=[3m

rem Color Reversed
set color.reversed=[7m

rem Color Invisible
set color.invisible=[8m

rem Color Strike
set color.strike=[9m

rem Color Reset
set color.reset=[0m

rem Color Foreground Reset
set color.foreground.reset=[39m

rem Color Background Reset
set color.background.reset=[49m

rem Color Bold Reset
set color.bold.reset=[22m

rem Color Underline Reset
set color.underline.reset=[24m

rem Color Italic Reset
set color.italic.reset=[23m

rem Color Reversed Reset
set color.reversed.reset=[27m

rem Color Invisible Reset
set color.invisible.reset=[28m

rem Color Strike Reset
set color.strike.reset=[29m

rem Color Reset All
set color.reset.all=[0;39;49m

cd %LocalAppData%\Roblox\Versions

set rbxApp=RobloxPlayerBeta.exe

for /d /r %%a in (*) do (
  if exist "%%a\%rbxApp%" (
    set dirPath=%%a
    goto :found
  )
)

if not defined dirPath (
  goto :notfound
)

:found {
  goto :main
  
  :app {
    cls
      
    if %toggle% == true (
      set toggleText=✅ %color.foreground.lightGreen%on%color.reset%
      if not exist ClientAppSettings.json (
        copy /y ClientAppSettings_clone.json ClientAppSettings.json
        cls
      )
    ) else (
      set toggleText=❌ %color.foreground.lightRed%off%color.reset%
      if exist ClientAppSettings.json (
        del ClientAppSettings.json
      )
    )

    echo ┌──────────────────────┐
    echo │  %color.bold%%color.foreground.lightMagenta%Roblox FPS Booster%color.reset%  │
    echo └──────────────────────┘
    echo  └ %color.bold%%color.foreground.lightYellow%Status%color.reset%: %toggleText%
    echo  └ %color.bold%%color.foreground.lightYellow%Author%color.reset%: %color.foreground.lightCyan%@%color.foreground.lightWhite%wuw.sh %color.reset%(%color.foreground.lightCyan%https://github.com/wuw-sh%color.reset%)
    echo  └ %color.bold%%color.foreground.lightYellow%Version%color.reset%: %color.foreground.lightCyan%1.0.2%color.reset%
    echo  └ %color.bold%%color.foreground.lightYellow%Repository%color.reset%: %color.foreground.lightCyan%https://github.com/wuw-sh/Roblox-FPS-Booster%color.reset%
    echo.

    set /p enter = "%color.bold%( Press %color.reset%%color.background.lightGreen%%color.foreground.black% Enter %color.reset%%color.bold% to toggle %color.foreground.lightYellow%Status %color.reset%%color.bold%)%color.reset.all%"
    
    if %toggle% == true (
      set toggle=false
      powershell.exe -Command "$json = Get-Content 'config.json' | ConvertFrom-Json; $json.toggle = $false; $json | ConvertTo-Json -Depth 100 | Set-Content 'config.json'"
    ) else (
      set toggle=true
      powershell.exe -Command "$json = Get-Content 'config.json' | ConvertFrom-Json; $json.toggle = $true; $json | ConvertTo-Json -Depth 100 | Set-Content 'config.json'"
    )
    
    echo.
    echo %color.bold%%color.foreground.lightCyan%Changing %color.foreground.lightGreen%status %color.reset%. . .%color.reset%
    timeout /t 0 /nobreak >nul
    if "%enter%" == "" goto :app
    goto :app
  }

  :main {
    cd %dirPath%
    if exist ClientSettings (
      cd ClientSettings
      if not exist config.json (
        (
          echo {
          echo  "toggle": true
          echo }
        ) > config.json
      )
      set toggle=true
      for /f "delims=" %%a in ('powershell.exe -Command "(Get-Content config.json | ConvertFrom-Json).toggle.ToString().ToLower()"') do set toggle=%%a
      goto :app
    ) else (
      mkdir ClientSettings
      cd ClientSettings

      (
        echo {
        echo  "toggle": true
        echo }
      ) > config.json

      (
        echo {
        echo   "FIntFlagUpdateVersion": 114,
        echo   "FStringNewInGameMenuForcedUserIds": "2323539704;3822626535;4126963942;2627408279;4329723352",
        echo   "DFIntSecondsBetweenDynamicVariableReloading": 31557600,
        echo   "FIntRolloutEnrollmentExpirationMinutes": 31557600,
        echo   "DFFlagDynamicFastVariableReloaderTest1": false,
        echo   "FFlagExecDynInitTests": false,
        echo   "DFFlagEarlyExitIfHang": false,
        echo   "DFFlagRenderTC2_6": true,
        echo   "FFlagRenderTC2_Disable": false,
        echo   "FIntRenderTC2_PercentageRollout": 100,
        echo   "FIntRenderTC2_MaxTextureSize": 1024,
        echo   "FIntTerrainOTAMaxTextureSize": 1024,
        echo   "FIntUITextureMaxRenderTextureSize": 512,
        echo   "FFlagRenderFixTC2MemoryLeak": true,
        echo   "FFlagLoadCoreScriptsFromPatchOnly": true,
        echo   "FIntMaxCachedPatches": 3,
        echo   "DFIntAppLaunchFlowThrottlingRate": 0,
        echo   "FIntMeshContentProviderForceCacheSize": 200000000,
        echo   "FIntAnimationClipCacheBytes": 200000000,
        echo   "FIntEmotesAnimationsPerPlayerCacheSize": 200000000,
        echo   "FIntDefaultMeshCacheSizeMB": 2048,
        echo   "FIntSmoothTerrainPhysicsCacheSize": 200000000,
        echo   "DFIntHttpCurlConnectionCacheSize": 200000000,
        echo   "FIntHttpCurlMaxCachedHandlesPerHost": 200000000,
        echo   "FIntHttpCurlMaxHostsRequestsInProgress": 64,
        echo   "DFIntHttpCurlMaxConnectionsPerHost": 100,
        echo   "DFIntHttpCacheRefreshHundredthsPercent": 100,
        echo   "DFIntHttpCacheRetryCount": 6,
        echo   "DFIntHttpConnMaxAge": 21600,
        echo   "DFIntHttpMaxRedirects": 6,
        echo   "DFIntHttpMaxRetries": 6,
        echo   "DFIntHttpMaxRetryAfterSec": 1,
        echo   "DFIntMaxHttpResultResponseSize": 16384,
        echo   "DFIntUserIdPlayerNameCacheSize": 200000000,
        echo   "DFIntUserIdPlayerNameLifetimeSeconds": 604800,
        echo   "DFIntFriendsListCacheExpirationInSeconds": 300,
        echo   "DFIntGetFriendsOnlineCacheExpirationInSeconds": 120,
        echo   "DFIntGetFriendsOnlineFailureExpirationInSeconds": 60,
        echo   "DFIntGetProductInfoAssetCacheSecs": 60,
        echo   "DFIntGetProductInfoGamepassCacheSecs": 60,
        echo   "DFIntGetProductInfoProductCacheSecs": 60,
        echo   "DFIntGetProductInfoSubscriptionCacheSecs": 60,
        echo   "DFIntGamePassOwnershipCacheSeconds": 60,
        echo   "DFIntPlayerSubscriptionCacheIntervalSeconds": 60,
        echo   "FIntTaskSchedulerAutoThreadLimit": 16,
        echo   "DFIntTaskSchedulerTargetFps": 500,
        echo   "FIntSSAOMipLevels": 0,
        echo   "DFIntMaxActiveAnimationTracks": 512,
        echo   "DFIntJoinDataCompressionLevel": 8,
        echo   "DFIntClusterCompressionLevel": 8,
        echo   "DFIntNetworkSchemaCompressionRatio": 18,
        echo   "DFIntAbuseReportV1Percentage": 100,
        echo   "DFIntAbuseReportV2Percentage": 100,
        echo   "FFlagHandleAltEnterFullscreenManually": false,
        echo   "DFFlagTaskSchedulerAvoidYieldInBackground": true,
        echo   "DFFlagTaskSchedulerBlockingShutdownInClients": true,
        echo   "FFlagEnableQuickGameLaunch": false,
        echo   "FFlagPreloadAllFonts": true,
        echo   "FFlagPreloadMinimalFonts": true,
        echo   "FFlagRemoveRedundantFontPreloading": true,
        echo   "FFlagPreloadTextureItemsOption4": true,
        echo   "DFFlagContentProviderSupportsSymlinks": true,
        echo   "DFFlagHttpClientOptimizeReqQueuing": false,
        echo   "FFlagClientAssetFormatResolution5": false,
        echo   "FFlagBatchAssetApi": true,
        echo   "FFlagBatchAssetApiRollout": true,
        echo   "FIntBatchAssetApiRolloutHundredthPercent": 100,
        echo   "DFFlagReportHttpBatchApiRejectedUrl": true,
        echo   "DFLogBatchAssetApiLog": 6,
        echo   "FFlagBatchGfxGui2": true,
        echo   "FFlagFinishFetchingAssetsCorrectly": true,
        echo   "FFlagEnableZeroLatencyCacheForVersionedAssets": true,
        echo   "FFlagAnimationClipMemCacheEnabled": true,
        echo   "FFlagRenderEnableGlobalInstancing4": true,
        echo   "FFlagRenderEnableGlobalInstancingD3D10": true,
        echo   "FFlagRenderEnableGlobalInstancingD3D11": true,
        echo   "FFlagRenderEnableGlobalInstancingMetal": true,
        echo   "FFlagRenderEnableGlobalInstancingVulkan": true,
        echo   "FFlagPrefetchProtocolUseCallbackArgument": true,
        echo   "DFFlagAddJobStartTimesExpiringPrefetch": true,
        echo   "FFlagPrefetchOneCopyDev": true,
        echo   "FFlagEnablePrefetchTimout": true,
        echo   "FFlagPrefetchOnEveryPlatform": true,
        echo   "FFlagCacheRequestedMaxSize": true,
        echo   "FFlagAudioAssetsInResizableCache2": true,
        echo   "DFFlagEnablePerformanceControlSoundCache3": false,
        echo   "DFFlagHttpCacheCleanBasedOnMemory": true,
        echo   "DFFlagHttpCacheMissingRedirects": true,
        echo   "DFFlagGraphicsRenderImageRemoveSprintf": true,
        echo   "DFFlagGraphicsRenderMatGenRemoveSprintf": true,
        echo   "DFFlagGraphicsRenderSmoothClusterRemoveSprintf": true,
        echo   "DFFlagGraphicsRenderTC2CoreRemoveSprintf": true,
        echo   "DFFlagGraphicsRenderTexManRemoveSprintf": true,
        echo   "DFFlagCSGNoSprintf": true,
        echo   "DFFlagFixUserInputServiceNotInitialized": true,
        echo   "FFlagSimCSG3KeepConsistentCFrame": true,
        echo   "FFlagSimCSG3LoadTreeFromSerialized": true,
        echo   "FFlagSimCSG3PartOperationsIncrementalUpdates": true,
        echo   "FFlagSimCSG3TreeEnableNewNormalize": true,
        echo   "FFlagSimCSGEnableCSGMeshSerializationVer5": true,
        echo   "FFlagSimCSGV3TriangleMeshPartGetConvexes": true,
        echo   "FFlagSimCSG3MegaAssetFetcherSkipCached": true,
        echo   "FFlagSimUseCSGV3TreeRule2Reduction": true,
        echo   "FFlagSimCSGV3SeparateDetachedCoplanarGraphs": true,
        echo   "FFlagSimCSGV3PruneNonManifoldVertexGraph": true,
        echo   "FFlagSimCSGV3IncrementalTriangulationStreamingCompression": true,
        echo   "FFlagSimCSGV3IncrementalTriangulationPhase3": true,
        echo   "FFlagSimCSGV3IncrementalTriangulationPhase2": true,
        echo   "FFlagSimCSGV3IncrementalTriangulationPhase1": true,
        echo   "FFlagSimCSGKeepPhysicalConfigData": true,
        echo   "FFlagSimCSGAllowLocalOperations": true,
        echo   "DFFlagSimCSG3UseQuadBallInExperience": true,
        echo   "FFlagSimCSG3NewAPIBreakApart": true,
        echo   "FFlagSimCSG3EnableNewAPI": true,
        echo   "FFlagSimCSG3AsyncWarmv2": true,
        echo   "FFlagSimCSG3AllowBodyToSave": true,
        echo   "FFlagCSGMeshDisableReadHash": true,
        echo   "FFlagCSGMeshDisableWriteHash": true,
        echo   "DFFlagCleanOldCSGData": true,
        echo   "FFlagGraphicsD3D11AllowThreadSafeTextureUpload": true,
        echo   "FFlagGraphicsDeviceEvents": true,
        echo   "FFlagGraphicsEnableD3D10Compute": true,
        echo   "FFlagGraphicsTextureCopy": true,
        echo   "FFlagSmoothClusterShaderRefactor": true,
        echo   "FIntMotionBuffers2": 100,
        echo   "FIntRenderShaderLoadAnalyticsHundredthPercent": 0,
        echo   "FIntRenderD3D11UncleanShutdownPercent": 100,
        echo   "FIntEnableCullableScene2HundredthPercent": 500,
        echo   "FFlagEnableCullableSceneOctree": true,
        echo   "DFFlagAlwaysPutSoundsOnDiskWhenLowOnMemory": true,
        echo   "FFlagTrackAllDeviceMemory6": true,
        echo   "FIntAbuseReportScreenshotMaxSize": 0,
        echo   "DFIntCrashReportingHundredthsPercentage": 0,
        echo   "DFIntCrashUploadErrorInfluxHundredthsPercentage": 0,
        echo   "DFIntCrashUploadToBacktracePercentage": 0,
        echo   "FFlagUpdateUICachesWithQuadTree3": true,
        echo   "DFFlagExperimentalRuntimeTextureCreation": true,
        echo   "FFlagFixGraphicsQuality": true,
        echo   "FFlagCommitToGraphicsQualityFix": true,
        echo   "FFlagFixTextureCompositorFramebufferManagement2": true,
        echo   "FFlagMemoryPrioritizationEnabledForTextures": true,
        echo   "FFlagTextureManagerMaySkipBlackReloadFallback": true,
        echo   "FFlagTextureManagerUsePerfControl": true,
        echo   "FFlagTextureManagerUsePerfControlDirectMapping": true,
        echo   "FFlagTextureManagerUsePerfControlV2Api": true,
        echo   "FFlagIntegrityCheckedProcessorUsePerfControl": true,
        echo   "FFlagIntegrityCheckedProcessorPerfControlEffects": true,
        echo   "FFlagIntegrityCheckedProcessorUsePerfControlV2Api": true,
        echo   "FFlagIntegrityCheckedProcessorClientSendsBatchEvents": false,
        echo   "DFFlagIntegrityCheckedProcessorDisableAllAdditions": true,
        echo   "FFlagNetProcessingFairnessEnabled1": true,
        echo   "FFlagNetProcessingFairnessEnabled2": true,
        echo   "DFFlagQueueDataPingFromSendData": true,
        echo   "FFlagDontCreatePingJob": true,
        echo   "FFlagPerfControlFireCallbacks3": true,
        echo   "FFlagSoundServiceUsePerfControlV2Api": false,
        echo   "DFIntPerformanceControlEventIngestHundredthPercentageSent": 0,
        echo   "DFIntPerformanceControlHundredthPercentageSent": 0,
        echo   "FFlagPerformanceControlChangeTunableEagerly": true,
        echo   "FFlagPerformanceControlDynamicUtilityCurves": true,
        echo   "FFlagPerformanceControlMimicMemoryPrioritization": true,
        echo   "DFFlagPerformanceControlProportionalPlanner2": true,
        echo   "DFFlagPerformanceControlProportionalPlannerForV2_2": true,
        echo   "FFlagPerformanceControlSimpleMPLogic": true,
        echo   "DFFlagESGamePerfMonitorEnabled": false,
        echo   "DFIntESGamePerfMonitorHundredthsPercentage": 0,
        echo   "FIntGamePerfMonitorPercentage": 0,
        echo   "DFFlagEnablePerfAudioCollection": false,
        echo   "DFFlagEnablePerfDataCoreCategoryTimersCollection2": false,
        echo   "DFFlagEnablePerfDataCoreTimersCollection2": false,
        echo   "DFFlagEnablePerfDataCountersCollection": false,
        echo   "DFFlagEnablePerfDataGatherTelemetry2": false,
        echo   "DFFlagEnablePerfDataMemoryCategoriesCollection2": false,
        echo   "DFFlagEnablePerfDataMemoryCollection": false,
        echo   "DFFlagEnablePerfDataMemoryPerformanceCleanup3": false,
        echo   "DFFlagEnablePerfDataMemoryPressureCollection": false,
        echo   "DFFlagEnablePerfDataReportThermals": false,
        echo   "DFFlagEnablePerfDataSubsystemTimersCollection2": false,
        echo   "DFFlagEnablePerfDataSummaryMode": false,
        echo   "DFFlagEnablePerfRenderStatsCollection2": false,
        echo   "DFFlagEnablePerfStatsCollection3": false,
        echo   "DFIntPerfDataGlobalThrottleHundredthsPercent": 100000,
        echo   "FFlagRenderGpuTextureCompressor": true,
        echo   "FFlagRenderLightGridEfficientTextureAtlasUpdate": true,
        echo   "DFIntRenderingThrottleDelayInMS": 100,
        echo   "FFlagReadHSRAlwaysVisibleData": true,
        echo   "FFlagApplyHSRAlwaysVisibleData": true,
        echo   "FFlagEnableLinearCageDeformer2": true,
        echo   "FFlagUseFallbackTextureStatusLoaded2": true,
        echo   "FFlagHumanoidDeferredSyncFunction5": true,
        echo   "DFFlagHumanoidOnlyStepInWorkspace": true,
        echo   "FFlagHumanoidParallelFasterSetCollision": true,
        echo   "FFlagHumanoidParallelFasterWakeUp": true,
        echo   "FFlagHumanoidParallelFixTickleFloor2": true,
        echo   "FFlagHumanoidParallelOnStep2": true,
        echo   "FFlagHumanoidParallelSafeCofmUpdate": true,
        echo   "FFlagHumanoidParallelSafeUnseat": true,
        echo   "FFlagHumanoidParallelUseManager4": true,
        echo   "FFlagCloudsUseBC4Compression": true,
        echo   "FIntClientCompressionFormatRequestPC": 3,
        echo   "FFlagCloudsMvpForceNoHistory": true,
        echo   "DFFlagThrottleDeveloperConsoleEvents": true,
        echo   "FFlagFastGPULightCulling3": false,
        echo   "FFlagDebugForceFSMCPULightCulling": false,
        echo   "DFFlagSimIfNoInterp2": true,
        echo   "FFlagUseMediumpSamplers": true,
        echo   "DFFlagCollectibleItemInExperiencePurchaseEnabled": true,
        echo   "DFFlagCollectibleItemInInspectAndBuyEnabled": true,
        echo   "DFIntCollectibleItemInExperiencePurchaseRolloutPercentage": 100,
        echo   "DFFlagIntegrateSendInPeer": true,
        echo   "DFFlagLocServiceGetSourceLanguageFromWebAPI": true,
        echo   "DFFlagPlayerConfigurer2886": true,
        echo   "FFlagPlayerConfigurer2759": true,
        echo   "DFFlagPredictedOOM": false,
        echo   "DFFlagPredictedOOMAbs": false,
        echo   "DFFlagUsePredictedOOMAbsLimitForMemoryCurve": false,
        echo   "DFFlagOOMTimestamp": false,
        echo   "DFIntPredictedOOMPercent": 0,
        echo   "FFlagKickClientOnCoreGuiRenderOverflow": false,
        echo   "FFlagLuaAppSystemBar": true,
        echo   "FFlagGraphicsGLTextureReduction": true,
        echo   "FFlagEnableInGameMenuV3": false,
        echo   "FFlagDisableNewIGMinDUA": true,
        echo   "DFFlagDisconnectPlayerOnRemove2": false,
        echo   "FFlagMovePrerender": false,
        echo   "DFFlagContentProviderInit": true,
        echo   "FFlagEnqueueTextureGarbageCollection": true,
        echo   "FFlagProcessEventQueueOnInput": true,
        echo   "FFlagQueueAndDropExtraEvents": true,
        echo   "DFFlagCollectionServiceRefactor": true,
        echo   "DFFlagEnableParallelFrustumQueries2": true,
        echo   "DFFlagJointIrregularityOptimization": true,
        echo   "DFFlagPlayerAvoidNetworkDependency": true,
        echo   "DFFlagShouldMuteDMBeforeClosing3": true,
        echo   "DFFlagSpecialCaseSupportRbxCdnInAppDataModel2": true,
        echo   "DFFlagSupportYouTubeInAppDataModelIfRbxCdnAllowed": true,
        echo   "DFFlagVoxelizerDisableTerrainSIMD": true,
        echo   "DFFlagSSOnlyQueueIfInWorkspace": true,
        echo   "FFlagResizeJobAfterReplicatorCreation": true,
        echo   "FFlagRuppTokenFallback": true,
        echo   "FFlagSanityCheckMultithreadedTextureManagerAccess": true,
        echo   "FFlagAssertDeletedTextureDataSane": true,
        echo   "FFlagSaveAccessTokenToSecureStore": true,
        echo   "FFlagSHDynamicLevelCount": true,
        echo   "FFlagSHExtendAssemblyBroadphaseExtentsClamps": true,
        echo   "DFFlagSHSkipNoPrimitivesForBreadthFirstSearch": true,
        echo   "FFlagAssemblyAllowBroadphaseExclusion2": true,
        echo   "FFlagParallelTerrainBroadphase2": true,
        echo   "DFIntInterpolationNumParallelTasks": 8,
        echo   "DFIntMegaReplicatorNumParallelTasks": 8,
        echo   "DFIntNetworkClusterPacketCacheNumParallelTasks": 8,
        echo   "DFIntPhysicsReceiveNumParallelTasks": 8,
        echo   "DFIntReplicationDataCacheNumParallelTasks": 8,
        echo   "FIntSimWorldTaskQueueParallelTasks": 8,
        echo   "FIntLuaGcParallelMinMultiTasks": 8,
        echo   "FFlagGraphicsEnable32Textures": true,
        echo   "FFlagGraphicsRenderDeprecateSprintf": true,
        echo   "FFlagTextureManagerDoNotRegisterPerfControlCallbackByDefault": true,
        echo   "FFlagTextureManagerMaySkipBlackReloadFallback2": true,
        echo   "FFlagTextureQualityReloadFix": true,
        echo   "FFlagThreadSafeTextureInvalidation2": true,
        echo   "DFLogHttpTrace": 0,
        echo   "DFLogHttpTraceError": 0,
        echo   "DFLogHttpTraceLight": 0,
        echo   "DFFlagAnimatorAnalyticsEnabled": false,
        echo   "FFlagReportFpsAndGfxQualityPercentiles": false,
        echo   "DFIntBrowserTrackerApiDeviceInitializeRolloutPercentage": 0,
        echo   "DFFlagBrowserTrackerIdTelemetryEnabled": false,
        echo   "DFIntBrowserTrackerIdTelemetryThrottleHundredthsPercent": 100000,
        echo   "DFFlagSessionTelemetryLayeredClothing": false,
        echo   "DFFlagSessionTelemetrySnapshotEnabled2": false,
        echo   "DFFlagSessionTrackingRecordHasLocation": false,
        echo   "DFFlagSessionTrackingRecordUserClickMinRadiusTime": false,
        echo   "FFlagAddGameInstanceIdToSessionTracking": false,
        echo   "FFlagNavigationAnalyticsSessionId": false,
        echo   "FFlagRbxAnalyticsExposePlaySessionId": false,
        echo   "FFlagReportELFInSessionTracking": false,
        echo   "FFlagReportJoinAllCount": false,
        echo   "FFlagReportJoinTelemetry": false,
        echo   "FFlagJoinTimeCounters": false,
        echo   "FFlagSessionTelemetryApp": false,
        echo   "FFlagShowPlaySessionIdForHelpTab": false,
        echo   "DFFlagAddPlaySessionIdTelemetry": false,
        echo   "DFIntLoginTelemetryHundredthsPercent": 0,
        echo   "FIntReportDeviceInfoRollout": 0,
        echo   "DFIntReportDeviceInfoRate": 0,
        echo   "DFIntReportFmodErrorsRate": 0,
        echo   "DFFlagAddUserIdToSessionTracking": false,
        echo   "DFFlagBacklogDetectorSessionId": false,
        echo   "DFFlagBacklogDetectorEventIngest": false,
        echo   "DFFlagBaseNetworkMetrics": false,
        echo   "DFFlagHttpClientRequestMetrics2": false,
        echo   "DFFlagHttpPointsErrorMetrics": false,
        echo   "DFFlagHttpPointsResponseMetrics": false,
        echo   "DFFlagHttpLogRedirects": false,
        echo   "DFFlagHttpTraceErrorCurrentUrl": false,
        echo   "DFFlagHttpTraceErrorProxy": false,
        echo   "DFFlagHttpServiceErrorLogEnabled": false,
        echo   "DFFlagNewInferredCrashSystem": false,
        echo   "DFFlagNewInferredCrashSystemV2": false,
        echo   "DFFlagNewInferredCrashTelemetrySystem": false,
        echo   "DFFlagInferredCrashMemReportingV2": false,
        echo   "DFFlagInferredCrashSystemSuccessReportMove": false,
        echo   "DFFlagInfluxReportLastVisitedUrlHost": false,
        echo   "DFIntInfluxReportLocalFilterStringPermyriad": 0,
        echo   "DFIntInfluxTattletaleV2Permyriad": 0,
        echo   "DFIntHttpInfluxHundredthsPercentage": 0,
        echo   "DFIntHttpInfluxReportsPerMillion": 0,
        echo   "DFIntHttpGAFailureReportPercent": 0,
        echo   "DFIntGoogleAnalyticsLoadPlayerHundredth": 0,
        echo   "DFIntHttpAnalyticsMaxHistory": 0,
        echo   "DFIntCountOldChatAPIUsageHundrethsPercent": 0,
        echo   "DFIntCoreGuiRenderOverflowKicksReportHundredthsPercent": 0,
        echo   "DFIntCookieProtocolAnalyticsHundredthsPercentage": 0,
        echo   "DFIntCookieProtocolAnalyticsPriorityHundredthsPercentage": 0,
        echo   "DFIntCoreScriptsAnalyticsHundredthsPercentage": 0,
        echo   "DFIntDataModelPatcherErrorInfluxHundredthsPercentage": 0,
        echo   "DFIntDataModelPatcherFunnelInfluxHundredthsPercentage": 0,
        echo   "DFIntCSGv2OperationInfluxHundredthsPercentage": 0,
        echo   "DFIntCSGV3OperationMetricsHundredthsPercentage": 0,
        echo   "FStringImmersiveAdsUniverseWhitelist": "0",
        echo   "FFlagImmersiveAdsWhitelistDisabled": false,
        echo   "FFlagAdGuiEnabled3": false,
        echo   "FFlagEnableAdsAPI": false,
        echo   "FFlagEnableBackendAdsProviderTimerService": false,
        echo   "FFlagAdPortalEnabled3": false,
        echo   "FFlagAdServiceEnabled": false,
        echo   "FFlagEnableAdPortalTimerService2": false,
        echo   "DFFlagEnableAdUnitName": false,
        echo   "FFlagEnableAdGuiTimerService": false,
        echo   "FFlagAdGuiTextLabelEnabled": false,
        echo   "FFlagAdPortalAdFetchEnabled": false,
        echo   "DFFlagAdGuiImpressionDisabled": true,
        echo   "DFFlagEnableGCapsHardwareTelemetry": false,
        echo   "DFFlagAudioDeviceTelemetry": false,
        echo   "FFlagEnableSoundTelemetry": false,
        echo   "DFFlagEnableHardwareTelemetry": false,
        echo   "DFIntHardwareTelemetryHundredthsPercent": 0,
        echo   "DFFlagEphemeralCounterInfluxReportingEnabled": false,
        echo   "DFIntEphemeralCounterInfluxReportingPriorityHundredthsPercent": 0,
        echo   "DFIntEphemeralCounterInfluxReportingThrottleHundredthsPercent": 100000,
        echo   "DFIntEphemeralStatsInfluxReportingPriorityHundredthsPercent": 0,
        echo   "DFIntEphemeralStatsInfluxReportingThrottleHundredthsPercent": 100000,
        echo   "DFFlagVoiceChatEnableEventCounters3": false,
        echo   "DFFlagVoiceChatEnableEventLogging5": false,
        echo   "DFFlagVoiceChatUnderrunErrorsTelemetry": false,
        echo   "DFFlagVoiceChatHttpResultBodyEmptyTelemetry": false,
        echo   "FFlagVoiceChatEnableBlockTelemetry": false,
        echo   "FFlagVoiceChatReportTaskStats": false,
        echo   "FFlagVoiceChatSignalRTimingCounterToStat": false,
        echo   "FFlagVoiceChatStatsJoinSubsOnUsersError": false,
        echo   "FFlagVoiceChatStatsMultistreamSubscriptionsV2": false,
        echo   "FFlagVoiceChatWaitForSignalRJoinStageMetrics": false,
        echo   "FFlagEnableFlagRolloutCrashReportingWindows": false,
        echo   "DFFlagEnableTelemetryAppNameOverride": false,
        echo   "DFIntLogFileTelemetryInfluxDbHundredthsPercentage": 0,
        echo   "DFIntLmsClientMaxTargets": 0,
        echo   "FFlagLocServicePerformanceAnalyticsEnabled": false,
        echo   "DFFlagDebugAnalyticsSendUserId": false,
        echo   "DFStringAnalyticsEventStreamUrlEndpoint": "opt-out",
        echo   "DFStringAltHttpPointsReporterUrl": "https://opt-out.roblox.com",
        echo   "DFStringAltTelegrafHTTPTransportUrl": "http://opt-out.roblox.com",
        echo   "DFStringTelegrafHTTPTransportUrl": "https://opt-out.roblox.com",
        echo   "DFStringLmsRecipeEndpoint": "/opt-out",
        echo   "DFStringLmsReportEndpoint": "/opt-out",
        echo   "DFFlagEnableLightstepReporting2": false,
        echo   "DFIntLightstepHTTPTransportHundredthsPercent2": 0,
        echo   "DFStringLightstepHTTPTransportUrlHost": "https://opt-out.roblox.com",
        echo   "DFStringLightstepHTTPTransportUrlPath": "/opt-out",
        echo   "DFStringLightstepToken": "opt-out",
        echo   "DFStringHttpPointsReporterUrl": "https://opt-out.roblox.com",
        echo   "DFStringCrashUploadToBacktraceBaseUrl": "https://opt-out.roblox.com",
        echo   "FFlagBacktraceMainSourcePathEnabled": false,
        echo   "FStringErrorUploadToBacktraceBaseUrl": "https://opt-out.roblox.com",
        echo   "DFFlagReportGlobalAnalyticsUniverseAndPlaceIds": false,
        echo   "DFStringRobloxAnalyticsSubDomain": "opt-out",
        echo   "DFStringRobloxAnalyticsURL": "https://opt-out.roblox.com",
        echo   "DFStringAnalyticsNS1ApplicationId": "opt-out",
        echo   "DFStringAnalyticsNS1BeaconConfig": "https://opt-out.roblox.com"
        echo }
      ) > ClientAppSettings_clone.json

      set toggle=true

      echo ✅ %color.foreground.green%Roblox FPS Boost has been applied!%color.reset%
      echo.

      set /p enter = "%color.bold%( Press %color.reset%%color.background.lightGreen%%color.foreground.black% Enter %color.reset%%color.bold% to open %color.foreground.lightMagenta%Roblox FPS Booster %color.reset%%color.bold%)%color.reset.all%"

      if "%enter%" == "" goto :app
      goto :app
    )
  }
}

:notfound {
  echo ❌ %color.background.lightRed%%color.bold% Roblox is not installed, Please install Roblox and try again. %color.reset%
  echo (ctrl %color.foreground.lightGreen%+ %color.reset%click) this link to %color.foreground.lightGreen%install%color.reset% Roblox: 🔗%color.foreground.lightCyan%https://www.roblox.com/download/client%color.reset%
  echo.

  set /p enter = "%color.bold%( Press %color.reset%%color.background.lightGreen%%color.foreground.black% Enter %color.reset%%color.bold% to %color.foreground.lightRed%Exit %color.reset%%color.bold%)%color.reset.all%"

  if "%enter%" == "" exit
  exit
}