using UnityEngine;
using System;
using System.Collections.Generic;

public class GameScore : MonoBehaviour
{
	[Serializable]
	public class lbl
	{
		public UILabel score;
		public UILabel finalScore;
		public UILabel magni;
		public UILabel calificacion;
	}

	[Serializable]
	public class anch
	{
		public GameObject win;
		public GameObject bonus;
		public GameObject buttons;
		public GameObject block;
		public GameObject calificacion;
		public GameObject scores;
	}

	[Serializable]
	public class clp
	{
		public AudioClip ehmok;
		public AudioClip didntsuck;
		public AudioClip kindacool;
		public AudioClip awesome;
		public AudioClip legendary;
		public AudioClip agentgod;
		public AudioClip missionStart;
	}

	public enum Weapons_List
	{
		Pistol = 0,
		ThrowingKnife = 1,
		AssaultRifle = 2,
		RPG = 3,
		Garrote = 4,
		StunGrenade = 5,
		BaconBomb = 6,
		HackGrenade = 7,
		ProximityMine = 8,
		ThugMask = 9,
	}

	public lbl labels;
	public anch anchors;
	public clp clips;
	public int pistola;
	public int throwKnife;
	public int assaultRifle;
	public int rPG;
	public int garrote;
	public int stunGrenade;
	public int baconBomb;
	public int hackGrenade;
	public int proximityMine;
	public int thugMask;
	public int killedTugGenmeric;
	public int killedTugHeavy1;
	public int killedTugHeavy2;
	public int killedPerros1;
	public int killedPerros2;
	public int killedDrone1;
	public int killedDrone2;
	public int killedTurret;
	public int killedPisoElectrico;
	public List<int> bonos;
	public int[] finishedLevel;
	public int finishDownloadedLevel;
	public int noDetectedByEnemy;
	public int humanEnemyKilled;
	public int timesHumanEnemyKilled;
	public int noUseTacticScreen;
	public int allEnemiesKilled;
	public int onlyOneWeaponUsed;
	public int onlyGranadeUsed;
	public int untouchable;
	public int noUseSupportTool;
	public List<int> Enemies;
}
