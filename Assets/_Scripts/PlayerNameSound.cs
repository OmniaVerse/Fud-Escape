using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerNameSound : MonoBehaviour
{
    public static PlayerNameSound instance { set; get; }

    public AudioSource Player1, Player2, Player3, Player4, Player5, Player6, Player7;


    // Start is called before the first frame update
    void Start()
    {
        instance = this;
    }

    
    public void Player1Sound()
    {
        Player1.Play();
    }


}
