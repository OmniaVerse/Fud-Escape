using System;
using System.Collections;
using System.Collections.Generic;
using GoogleMobileAds.Api;
using UnityEngine;
using UnityEngine.UI;

public class Ad4 : MonoBehaviour {


   
    public Button Adbutton;


    private InterstitialAd interstitial_Ad;
    private RewardedAd rewardedAd;

    private string interstitial_Ad_ID;
    private string rewardedAd_ID;

   


    void Start () {

        // android ids 
        interstitial_Ad_ID = "ca-app-pub-5135356527293281/9593692449";
        rewardedAd_ID = "ca-app-pub-5135356527293281/5888335430";

        MobileAds.Initialize (initStatus => { });

        
        RequestInterstitial ();
        RequestRewardedVideo ();

    }

    


    private void RequestInterstitial () {
        interstitial_Ad = new InterstitialAd (interstitial_Ad_ID);
        interstitial_Ad.OnAdLoaded += HandleOnAdLoaded;
        AdRequest request = new AdRequest.Builder ().Build ();
        interstitial_Ad.LoadAd (request);
    }

    public void RequestRewardedVideo () {
        rewardedAd = new RewardedAd (rewardedAd_ID);
        rewardedAd.OnAdLoaded += RewardedAd_OnAdLoaded;
        rewardedAd.OnAdFailedToLoad += RewardedAd_OnAdFailedToLoad;
        rewardedAd.OnUserEarnedReward += HandleUserEarnedReward;
        rewardedAd.OnAdClosed += HandleRewardedAdClosed;
        rewardedAd.OnAdFailedToShow += HandleRewardedAdFailedToShow;
        
        AdRequest request = new AdRequest.Builder ().Build ();
        rewardedAd.LoadAd (request);
        
    }

    public void ShowInterstitial () {
        if (interstitial_Ad.IsLoaded ()) {
            interstitial_Ad.Show ();
            RequestInterstitial ();
        }

    }

    public void ShowRewardedVideo () {
        if (rewardedAd.IsLoaded ()) {
           
            rewardedAd.Show ();
        }
        else
        {
            RequestRewardedVideo();
        }
    }

    private void RewardedAd_OnAdFailedToLoad(object sender, AdFailedToLoadEventArgs e)
    {
       
        Adbutton.interactable = false;
        RequestRewardedVideo();
    }

    private void RewardedAd_OnAdLoaded(object sender, EventArgs e)
    {
       
        Adbutton.interactable = true;
        
    }

    public void HandleOnAdLoaded (object sender, EventArgs args) {

    }

    public void HandleRewardedAdFailedToShow (object sender, AdErrorEventArgs args) {
        RequestRewardedVideo ();
    }

    public void HandleRewardedAdClosed (object sender, EventArgs args) {

        Modules.HeadStart();

       

        RequestRewardedVideo();
    }

    public void HandleUserEarnedReward (object sender, Reward args) {
        RequestRewardedVideo ();
    }

    public void HandleOnAdRewarded(object sender, EventArgs args)
    {
        
    }

  

}