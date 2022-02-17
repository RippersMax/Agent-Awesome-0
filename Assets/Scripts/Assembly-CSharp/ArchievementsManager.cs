using UnityEngine;
using System;
using System.Collections.Generic;

public class ArchievementsManager : MonoBehaviour
{
	[Serializable]
	public class Archievements
	{
		public string title;
		public string description;
		public GameObject block;
		public bool isHidden;
	}

	public string hiddenDesc;
	public Color unlocked;
	public Color hidden;
	public List<ArchievementsManager.Archievements> archievements;
	public GameObject bgm;
}
