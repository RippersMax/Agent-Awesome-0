using UnityEngine;

public class ShowVFX : MonoBehaviour
{
	public enum Weapons_VFX
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

	public AgentABehaviour player;
	public EnemyBehavoiur enemy;
	public Transform prefabVFX;
	public Transform prefabVFXPosition;
	public Transform newPrefab;
	public Material changeMaterial;
	public Transform characterMesh;
	public bool hideCharacter;
	public bool enableNewPrefab;
	public bool enableChangeMaterial;
	public float timeToShowVFX;
	public Weapons_VFX weapons;
}
