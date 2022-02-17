using System;
using UnityEngine;

[Serializable]
public class Base_Weapon
{
	public GameObject bulletName;
	public GameObject effectName;
	public GameObject hitEffect;
	[SerializeField]
	private Transform shootPoint;
	[SerializeField]
	private WeaponType weaponType;
	[SerializeField]
	private OwnerType owner;
	[SerializeField]
	private float minShootRange;
	[SerializeField]
	private float shootRatio;
	[SerializeField]
	private int basicBulletDamage;
	[SerializeField]
	private int minBulletCapacity;
	[SerializeField]
	private float shootRange;
	[SerializeField]
	private int bulletDamage;
	[SerializeField]
	private int bulletCapacity;
	[SerializeField]
	private GameScore.Weapons_List weaponName;
	[SerializeField]
	private bool unlocked;
	[SerializeField]
	private int price;
	[SerializeField]
	private bool purchased;
	public AudioClip shootClip;
	public AudioClip emptyMag;
}
