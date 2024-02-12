using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GDPRConsentNotice : MonoBehaviour
{

   void Start()
    {
        Invoke("StartGame", 6f);
    }


    private void StartGame()
    {
        // Perform any actions necessary to start the game
        // For example, load a new scene, initialize gameplay, etc.
        SceneManager.LoadScene("LoadData");
    }


}
