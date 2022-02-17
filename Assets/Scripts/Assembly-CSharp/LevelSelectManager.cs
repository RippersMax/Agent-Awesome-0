using UnityEngine;
using System.Collections.Generic;

public class LevelSelectManager : MonoBehaviour
{
	public bool allLevels;
	public List<GameObject> levels;
	public List<Texture> levelsUnlocked;
	public List<Texture> levelsLocked;
	public List<string> levelsName;
	public GameObject achievementsButton;
	public GameObject encyclopediaButton;
	public GameObject creditsButton;
	public GameObject bgm;
	public GameObject confirm;
}
