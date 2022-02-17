using UnityEngine;
using System;
using System.Collections.Generic;

public class WeaponStore : MonoBehaviour
{
	[Serializable]
	public class lbl
	{
		public UILabel magnificents;
		public UILabel actualWeaponUILabel;
		public UILabel weaponDesc;
		public UILabel buyUpgrade;
	}

	[Serializable]
	public class btn
	{
		public GameObject buy;
		public GameObject ok;
		public GameObject back;
		public GameObject okConfirm;
		public GameObject cancelConfirm;
	}

	[Serializable]
	public class pan
	{
		public GameObject left;
		public GameObject right;
		public GameObject warning;
		public GameObject confirm;
		public GameObject root;
	}

	[Serializable]
	public class hlp
	{
		public GameObject help1;
		public GameObject help2;
		public GameObject help3;
		public GameObject help4;
		public GameObject help5;
	}

	public Texture[] weaponIcons;
	public string[] weaponDescription;
	public lbl labels;
	public btn buttons;
	public pan panels;
	public hlp helps;
	public List<GameObject> weaponsButton;
	public UITexture actualWeaponUITexture;
	public UpgradesGraphic CapacityUpgrades;
	public UpgradesGraphic DamageUpgrades;
	public UpgradesGraphic RangeUpgrades;
	public UILabel DamageUpgadesLabel;
	public UILabel DamageUpgadesLevelLabel;
	public GameObject CapacityUpgadesPanel;
	public UILabel CapacityUpgadesLevelLabel;
	public GameObject RangeUpgadesPanel;
	public UILabel RangeUpgadesLevelLabel;
	public UIButton ApplyCapacityUpgrade;
	public UILabel PriceCapacityUpgrade;
	public UIButton ApplyDamageUpgrade;
	public UILabel PriceDamageUpgrade;
	public UIButton ApplyRangeUpgrade;
	public UILabel PriceRangeUpgrade;
	public Transform UI_ShowBuyData;
	public Transform UI_ShowUnlockData;
	public Transform UI_ShowUpgradeData;
	public Color pressedButton;
	public GameObject bgm;
	public AudioClip buyClip;
	public AudioClip upgradeClip;
	public int[] weaponXLevel;
}
