using UnityEngine;
using System;
using System.Collections.Generic;

public class WeaponSelection : MonoBehaviour
{
	[Serializable]
	public class btn
	{
		public GameObject prevWeapon;
		public GameObject nextWeapon;
		public GameObject addWeapon;
		public GameObject weaponIcon;
		public GameObject startMission;
		public GameObject backScene;
		public GameObject store;
	}

	[Serializable]
	public class hlp
	{
		public GameObject help1;
		public GameObject help2;
		public GameObject help3;
		public GameObject help4;
	}

	public btn buttons;
	public hlp helps;
	public UITexture UITexture_WeaponRender;
	public List<Texture> weapons;
	public GameObject uiLoading;
	public UILabel levelName;
	public UILabel levelDesc;
	public UILabel weaponName;
	public UITexture levelIcon;
	public List<Texture> levelsIcon;
	public List<string> levelsName;
	public List<string> levelsDesc;
	public GameObject bgm;
	public Transform panel;
}
