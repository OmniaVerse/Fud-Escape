using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using GoogleMobileAds.Api;


public class Banner_Ad : MonoBehaviour
{
    string AppID = "ca-app-pub-5135356527293281~7159100793";

    string BannerAd_ID = "ca-app-pub-5135356527293281/9827580446";

    private BannerView bannerView;
    // Start is called before the first frame update
    void Start()
    {
        MobileAds.Initialize(initStatus => { });
        BannerRequest();
        ShowBannerAd();
        Debug.Log("Show banner Ad");
    }

    public void BannerRequest()
    {
        this.bannerView = new BannerView(BannerAd_ID, AdSize.Banner, AdPosition.Top);
    }

    public void ShowBannerAd()
    {
        // Create an empty ad request.
        AdRequest request = new AdRequest.Builder().Build();

        // Load the banner with the request.
        this.bannerView.LoadAd(request);
    }
   
}
