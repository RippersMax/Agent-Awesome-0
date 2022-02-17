using UnityEngine;

public class LoadScenes : MonoBehaviour
{
	public enum Scenes
	{
		Menu = 0,
		Levels = 1,
		Encyclopedia = 2,
		Achievements = 3,
		Store = 4,
		Credits = 5,
		This = 6,
		Quit = 7,
	}

	public Scenes scenes;
	public GameObject warningPanel;
}
