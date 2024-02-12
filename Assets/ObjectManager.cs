using System.Collections;
using UnityEngine;

public class ObjectManager : MonoBehaviour
{
    public GameObject[] cubes;
    private int currentIndex = 0;

    private void Start()
    {
        StartCoroutine(CubeAppearanceSequence());

        // Load the saved cube index, or set it to 0 if no value is saved
        currentIndex = PlayerPrefs.GetInt("CurrentCubeIndex", 0);
        EnableDisableCubes();
    }

    private void EnableDisableCubes()
    {
        for (int i = 0; i < cubes.Length; i++)
        {
            cubes[i].SetActive(i == currentIndex);
        }
    }

    private IEnumerator CubeAppearanceSequence()
    {
        while (true)
        {
            // Wait for 1 minute (60 seconds)
            yield return new WaitForSeconds(10f);

            // Disable the current cube and increment the index
            cubes[currentIndex].SetActive(false);
            currentIndex++;

            // Wrap the index back to 0 if it exceeds the array length
            currentIndex %= cubes.Length;

            // Enable the next cube
            cubes[currentIndex].SetActive(true);

            // Save the current cube index
            PlayerPrefs.SetInt("CurrentCubeIndex", currentIndex);
            PlayerPrefs.Save();
        }
    }

    public void StartCubeSequence()
    {
        // Start the coroutine for the cube appearance sequence
        StartCoroutine(CubeAppearanceSequence());
    }
}

