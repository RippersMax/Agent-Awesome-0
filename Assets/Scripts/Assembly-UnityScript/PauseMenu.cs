using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class PauseMenu : MonoBehaviour
{
	public bool paused;
	public GUITexture pausedGUI;
	public string gameName;
	public List<Transform> myList;
}
