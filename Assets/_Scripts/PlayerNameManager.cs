using UnityEngine;
using UnityEngine.UI;

public class PlayerNameManager : MonoBehaviour
{
    public InputField nameInputField;
    private string playerNameKey = "PlayerName";

    private void Start()
    {
        // Load the player name from PlayerPrefs
        string savedName = PlayerPrefs.GetString(playerNameKey);
        nameInputField.text = savedName;
    }

    public void SavePlayerName()
    {
        string playerName = nameInputField.text;

        // Save the player name to PlayerPrefs
        PlayerPrefs.SetString(playerNameKey, playerName);
        PlayerPrefs.Save();
    }
}
