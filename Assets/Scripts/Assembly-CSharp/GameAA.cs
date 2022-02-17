using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class GameAA
{
	[SerializeField]
	private List<Level> levels;
	[SerializeField]
	private List<Base_Weapon> armas;
	[SerializeField]
	private int magnifiCENTS;
	[SerializeField]
	private string lastLevel;
	[SerializeField]
	private int garroteKill;
	[SerializeField]
	private int knifeKill;
	[SerializeField]
	private int killedEnemies;
	[SerializeField]
	private int earnedMagni;
	[SerializeField]
	private bool credits;
	[SerializeField]
	private bool audioOnOff;
	[SerializeField]
	private bool musicOnOff;
	[SerializeField]
	private bool dialogOnOff;
	[SerializeField]
	private bool firstPlay;
	[SerializeField]
	private bool firstPlayStore;
	[SerializeField]
	private bool secondPlayStore;
	[SerializeField]
	private bool firstEquip;
	[SerializeField]
	private int actualLevelID;
	[SerializeField]
	private Player player;
}
