using UnityEngine;
using System;
using System.Collections.Generic;

public class Encyclopedia : MonoBehaviour
{
	[Serializable]
	public class ene
	{
		public Encyclopedia.EnemyType type;
		public Encyclopedia.EnemyLevel level;
		public Texture icon;
		public Texture mapIcon;
		public string desc;
	}

	public enum EnemyType
	{
		GenericThug = 0,
		HeavyThug1 = 1,
		HeavyThug2 = 2,
		Dog1 = 3,
		Dog2 = 4,
		Drone1 = 5,
		Drone2 = 6,
		Turret = 7,
		PisoElectrico = 8,
		AssassinationTarget = 9,
	}

	public enum EnemyLevel
	{
		Office = 0,
		Lab = 1,
		HQ = 2,
	}

	public UILabel uiEnemyDesc;
	public UITexture uiEnemyIcon;
	public UITexture uiMapEnemyIcon;
	public GameObject hpLevel;
	public GameObject speedLevel;
	public GameObject rangeLevel;
	public GameObject damage1Level;
	public GameObject damage2Level;
	public Color pressedButton;
	public List<GameObject> enemiesButton;
	public ene[] enemyProps;
	public GameObject bgm;
}
