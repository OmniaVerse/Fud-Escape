using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using System;

public class NameManager : MonoBehaviour
{
    public static NameManager Instance { set; get; }

    public string username;
    public string wallet;
    public string highestScore;
    public static bool status;
    public static int score = 0;
    public Button CharacterBtn;
    public bool IsNft = false;


    [Serializable]
    public class Nfts
    {
        public string name;
    }
    [Serializable]
    public class Scores
    {
        public string score;
        public string date;
    }
    [Serializable]
    public class Games
    {
        public string currency;
        public string chain;
        public int earningsTillDateInUSD;
        public int earningsTillDateInBlock;
        public int earningsTillDateInSphynx;
    }
    [Serializable]
    public class RoadRunner
    {
        public string account;
        public string preferredChain;
        public string wallet;
        public string name;
        public int measuringUnitTillDate;
        public int highestScore;
        public List<Games> games;
        public List<Scores> scores;
        public List<Nfts> nfts;
    }
    [Serializable]
    public class RoadRunnerInfo
    {
        public List<RoadRunner> roadRunner;
    }

    public static class JsonHelper
    {
        public static T[] FromJson<T>(string json)
        {
            Wrapper<T> wrapper = JsonUtility.FromJson<Wrapper<T>>(json);
            return wrapper.Items;
        }

        public static string ToJson<T>(T[] array)
        {
            Wrapper<T> wrapper = new Wrapper<T>();
            wrapper.Items = array;
            return JsonUtility.ToJson(wrapper);
        }

        public static string ToJson<T>(T[] array, bool prettyPrint)
        {
            Wrapper<T> wrapper = new Wrapper<T>();
            wrapper.Items = array;
            return JsonUtility.ToJson(wrapper, prettyPrint);
        }

        [Serializable]
        private class Wrapper<T>
        {
            public T[] Items;
        }
    }

    IEnumerator SendDetailsForUser()
    {
        string url = "https://matangazo-server-prod-xcrlpods6q-uc.a.run.app/v1/fudescape?account=" + username + "&wallet=" + wallet + "&score=" + score;
        UnityWebRequest www = UnityWebRequest.Get(url);
        yield return www.SendWebRequest();

        if (www.isHttpError)
        {
            Debug.Log(www.error);
        }
        else
        {
            // Show results as text
            string json = fixJson(www.downloadHandler.text);
            RoadRunner[] roadRunner = JsonHelper.FromJson<RoadRunner>(json);
            Debug.Log("Successful");
        }
    }

   

    IEnumerator GetDetailsForUser()
    {
        UnityWebRequest www = UnityWebRequest.Get("https://matangazo-server-prod-xcrlpods6q-uc.a.run.app/v1/fudescape?account=" + username);
        yield return www.SendWebRequest();

        if (www.isHttpError)
        {
            Debug.Log(www.error);
        }
        else
        {
            // Show results as text
            string json = fixJson(www.downloadHandler.text);
            RoadRunner[] roadRunner = JsonHelper.FromJson<RoadRunner>(json);

            if (roadRunner != null && roadRunner.Length > 0)
            {
                status = true;
                username = roadRunner[0].account.ToString();
                wallet = roadRunner[0].wallet.ToString();
                highestScore = roadRunner[0].highestScore.ToString();

                // Get the list of scores
                List<Scores> scores = roadRunner[0].scores;

                // Calculate the total score
                float totalScore = 0.0f;
                for (int a = 0; a < scores.Count; a++)
                {
                    totalScore += (float)Convert.ToDouble(scores[a].score);
                }

                // Get the list of NFTs
                List<Nfts> nfts = roadRunner[0].nfts;

                // Check if the user owns the ARIA NFT
                IsNft = false;
                for (int a = 0; a < nfts.Count; a++)
                {
                    if (nfts[a].name == "ARIA")
                    {
                        IsNft = true;
                        Debug.Log("Name Match");
                        CharacterBtn.interactable = true;
                        
                    }
                }
            }
            else
            {
                Debug.Log("Name Does Not Match");
                CharacterBtn.interactable = false;
            }
        }
    }

    

    void NameUpdate()
    {
        username = PlayfabManager.Instance.playFabUsername;

      //  StartCoroutine(CallSendDetailsForUserEveryTwoSeconds());
      //  StartCoroutine(CallGetDetailsForUserEveryTwoSeconds());

    }




        string fixJson(string value)
    {
        value = "{\"Items\":" + value + "}";
        return value;
    }

    private void Awake()
    {

        StartCoroutine(CallSendDetailsForUserEveryTwoSeconds());
        StartCoroutine(CallGetDetailsForUserEveryTwoSeconds());

    }

    private void Start()
    {

        InvokeRepeating("NameUpdate", 0f, 60f);

        // Start the coroutine to call SendDetailsForUser every 2 seconds
     //   StartCoroutine(CallSendDetailsForUserEveryTwoSeconds());
    //    StartCoroutine(CallGetDetailsForUserEveryTwoSeconds());
       
    }

    IEnumerator CallSendDetailsForUserEveryTwoSeconds()
    {
        while (true)
        {
            // Call the SendDetailsForUser coroutine
            yield return StartCoroutine(SendDetailsForUser());

            // Wait for 2 seconds
            yield return new WaitForSeconds(1f);
        }
    }

    IEnumerator CallGetDetailsForUserEveryTwoSeconds()
    {
        while (true)
        {
            // Call the SendDetailsForUser coroutine
            yield return StartCoroutine(GetDetailsForUser());

            // Wait for 2 seconds
            yield return new WaitForSeconds(1f);
        }
    }

    



    private void Update()
    {
       username= PlayfabManager.Instance.playFabUsername;
    }
}
