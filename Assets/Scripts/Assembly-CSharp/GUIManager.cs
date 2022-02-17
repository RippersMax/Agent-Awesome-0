using UnityEngine;
using System;
using System.Collections.Generic;

public class GUIManager : MonoBehaviour
{
	[Serializable]
	public class lbl
	{
		public UILabel score;
		public UILabel bullets;
		public UILabel multiplier;
		public UILabel gameOver;
		public UILabel nextLevel;
	}

	[Serializable]
	public class pan
	{
		public GameObject win;
		public GameObject lose;
		public GameObject gui;
		public GameObject options;
		public GameObject confirm;
	}

	[Serializable]
	public class anch
	{
		public GameObject back;
		public GameObject health;
		public GameObject options;
		public GameObject scores;
		public GameObject weapons;
	}

	[Serializable]
	public class btn
	{
		public GameObject back;
		public GameObject options;
		public GameObject ingame;
		public GameObject tactic;
		public GameObject prevWeapon;
		public GameObject nextWeapon;
		public GameObject weapon;
		public GameObject restartLevel;
		public GameObject nextLevel;
		public GameObject run;
		public GameObject stop;
	}

	[Serializable]
	public class txt
	{
		public UITexture weapon;
		public UITexture face;
	}

	[Serializable]
	public class cgn
	{
		public GameObject panel;
		public UITexture icon;
		public UILabel label;
		public UILabel desc;
	}

	[Serializable]
	public class clp
	{
		public AudioClip emptyMag;
		public AudioClip missionFailed;
		public AudioClip bluePrintUnlocked;
		public AudioClip viewChange;
	}

	[Serializable]
	public class opt
	{
		public GameObject audioOn;
		public GameObject audioOff;
		public GameObject musicOn;
		public GameObject musicOff;
		public GameObject dialogOn;
		public GameObject dialogOff;
	}

	public lbl labels;
	public pan panels;
	public anch anchors;
	public btn buttons;
	public txt textures;
	public cgn congrats;
	public clp clips;
	public opt options;
	public List<Texture> weapons;
	public List<Texture> faces;
	public List<string> gameOver;
	public LayerMask maskEnemyIcon;
	public Camera Camera_Tactic;
}
