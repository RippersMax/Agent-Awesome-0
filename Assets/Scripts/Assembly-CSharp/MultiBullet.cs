using UnityEngine;

public class MultiBullet : MonoBehaviour
{
	public enum Bullet
	{
		Pistol = 0,
		Throwknife = 1,
		AssaultRifle = 2,
		RPG = 3,
		Garrote = 4,
		StunGrenade = 5,
		BaconBomb = 6,
		HackGrenade = 7,
		ProximityMine = 8,
		ThugMask = 9,
		PisoElectrico = 10,
		GenericThug = 11,
		HeavyThug1 = 12,
		HeavyThug2 = 13,
		Dog1 = 14,
		Dog2 = 15,
		Drone1 = 16,
		Drone2 = 17,
		Turret = 18,
		AssassinationTarget = 19,
	}

	public Bullet bullet;
	public int damageValue;
}
