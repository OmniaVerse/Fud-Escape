using System;
using UnityEngine;
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
using GoogleMobileAds;
using GoogleMobileAds.Api;
#endif

public class ADSController : MonoBehaviour
{
    //NOTE BUILD ANDROID API LEVEL 14 (ANDROID 4.0) HOẶC CAO HƠN
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
    private BannerView bannerView;
    private InterstitialAd interstitial;
   
    private RewardedAd rewardBasedVideo;
#endif
    public static ADSController Instance;

    void Awake()
    {
        Instance = this;
    }

    public void Start()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
      
      //  this.rewardBasedVideo.OnAdLeavingApplication += this.HandleRewardBasedVideoLeftApplication;
#endif       

    }
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
    // Returns an ad request with custom ad targeting.
    private AdRequest adRequest = new AdRequest.Builder().Build();
    //private AdRequest CreateAdRequest()
    //{
    //    return new AdRequest.Builder()
    //        .AddTestDevice(AdRequest.TestDeviceSimulator)
    //        .AddTestDevice(SystemInfo.deviceUniqueIdentifier)
    //        .AddKeyword("game")
    //        .SetGender(Gender.Male)
    //        .SetBirthday(new DateTime(1985, 1, 1))
    //        .TagForChildDirectedTreatment(false)
    //        .AddExtra("color_bg", "9B30FF")
    //        .Build();
    //}
#endif

    #region  Banner
    [SerializeField]
    string bannerAndroid, bannerIOS;
    public void RequestBanner()
    {
        // These ad units are configured to always serve test ads.
#if UNITY_EDITOR
        string adUnitId = "unused";
#elif UNITY_ANDROID
        string adUnitId = bannerAndroid;
#elif UNITY_IPHONE
        string adUnitId = bannerIOS;
#else
        string adUnitId = "unexpected_platform";
#endif
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
        this.bannerView = new BannerView(adUnitId, AdSize.SmartBanner, AdPosition.Top);

        // Register for ad events.
       
     //   this.bannerView.OnAdLeavingApplication += this.HandleAdLeftApplication;

        // Load a banner ad.
        this.bannerView.LoadAd(adRequest);
#endif
    }

    public void DestroyBanner()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
        this.bannerView.Destroy();
#endif
    }

    public void HideBanner()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
        this.bannerView.Hide();
#endif
    }

    public void ShowBanner()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
        this.bannerView.Show();
#endif
    }
    #endregion

    #region Interstitial
    [SerializeField]
    string interstitialAndroid, interstitialIOS;
   
    

    public void ShowInterstitial()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
       
#endif
    }


    public void DestroyInterstitial()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
        this.interstitial.Destroy();
#endif
    }
    #endregion

    #region Request Native Express
    [SerializeField]
    string nativeAndroid, nativeIOS;
    AdsState nativeState = AdsState.None;
    

   

    #endregion

    #region Reward Based Video
    [SerializeField]
    string rewardAndroid, rewardIOS;
    bool rewardVideoAutoShow = false;
    AdsState rewardState = AdsState.None;
    Action<bool> callBack;
    public void RequestRewardBasedVideo(bool autoShow, Action<bool> callBack = null)
    {
        this.callBack = callBack;
        if (rewardState == AdsState.Loaded && autoShow){
            ShowRewardBasedVideo();
            return;
        }
        else if (rewardState == AdsState.Loading) {
            rewardVideoAutoShow = autoShow;
            return;
        }
#if UNITY_EDITOR
        string adUnitId = "unused";
#elif UNITY_ANDROID
        string adUnitId = rewardAndroid;
#elif UNITY_IPHONE
        string adUnitId = rewardIOS;
#else
        string adUnitId = "unexpected_platform";
#endif
#if UNITY_ANDROID || UNITY_IOS || !EDITOR

       

       // this.rewardBasedVideo.LoadAd(adRequest, adUnitId);
#endif
        rewardVideoAutoShow = autoShow;
    }

    public void ShowRewardBasedVideo()
    {
#if UNITY_ANDROID || UNITY_IOS || !EDITOR
       
#endif
    }
    #endregion

#if UNITY_ANDROID || UNITY_IOS || !EDITOR
    #region Banner callback handlers

    public void HandleAdLoaded(object sender, EventArgs args)
    {
        print("Banner: Đã load xong");
    }

    public void HandleAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("Banner: Lỗi khi load");
    }

    public void HandleAdOpened(object sender, EventArgs args)
    {
        print("Banner: Đã hiển thị");
    }

    public void HandleAdClosed(object sender, EventArgs args)
    {
        print("Banner: Đã đóng");
    }

    public void HandleAdLeftApplication(object sender, EventArgs args)
    {
        print("Banner: Rời khỏi ứng dụng");
    }

    #endregion

    #region Interstitial callback handlers

    public void HandleInterstitialLoaded(object sender, EventArgs args)
    {
        print("Interstitial: Đã load xong");
      
    }

    public void HandleInterstitialFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("Interstitial: Load lỗi");
      
    }

    public void HandleInterstitialOpened(object sender, EventArgs args)
    {
        print("Interstitial: Đã show");
    }

    public void HandleInterstitialClosed(object sender, EventArgs args)
    {
        print("Interstitial: Đã đóng");
    }

    public void HandleInterstitialLeftApplication(object sender, EventArgs args)
    {
        print("Interstitial: Rời khỏi ứng dụng");
    }

    #endregion

    #region Native express ad callback handlers

    public void HandleNativeExpressAdLoaded(object sender, EventArgs args)
    {
        print("Native express: Đã load xong");
        nativeState = AdsState.Loaded;
    }

    public void HandleNativeExpresseAdFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("Native express: Load lỗi");
        nativeState = AdsState.Error;
    }

    public void HandleNativeExpressAdOpened(object sender, EventArgs args)
    {
        print("Native express: Đã show");
        nativeState = AdsState.None;
    }

    public void HandleNativeExpressAdClosed(object sender, EventArgs args)
    {
        print("Native express: Đã đóng");
    }

    public void HandleNativeExpressAdLeftApplication(object sender, EventArgs args)
    {
        print("Native express: Rời khỏi ứng dụng");
    }

    #endregion

    #region Reward Based Video callback handlers

    public void HandleRewardBasedVideoLoaded(object sender, EventArgs args)
    {
        print("Reward Based Video: Đã load xong");
        rewardState = AdsState.Loaded;
        this.callBack(false);
        if (rewardVideoAutoShow) ShowRewardBasedVideo();
    }

    public void HandleRewardBasedVideoFailedToLoad(object sender, AdFailedToLoadEventArgs args)
    {
        print("Reward Based Video: Load lỗi");
        rewardState = AdsState.Error;
        this.callBack(false);
    }

    public void HandleRewardBasedVideoOpened(object sender, EventArgs args)
    {
        print("Reward Based Video: Đã mở");
    }

    public void HandleRewardBasedVideoStarted(object sender, EventArgs args)
    {
        print("Reward Based Video: Đã bắt đầu chạy");
    }

    public void HandleRewardBasedVideoClosed(object sender, EventArgs args)
    {
        print("Reward Based Video: Đã đóng");
    }

    public void HandleRewardBasedVideoRewarded(object sender, Reward args)
    {
        //string type = args.Type;
        //double amount = args.Amount;
        print("Reward Based Video: Đã xem hoàn thành = Xử lý trả thưởng");
        this.callBack(true);
    }

    public void HandleRewardBasedVideoLeftApplication(object sender, EventArgs args)
    {
        print("Reward Based Video: Rời khỏi ứng dụng");
    }

    #endregion
#endif
}

enum AdsState { 
    None,
    Created,
    Loading,
    Loaded,
    Error
}