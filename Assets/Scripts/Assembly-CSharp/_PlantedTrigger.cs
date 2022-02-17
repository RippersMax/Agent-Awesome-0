using UnityEngine;

public class _PlantedTrigger : MonoBehaviour
{
	public enum GrenadeType
	{
		StunGrenade = 0,
		BaconBomb = 1,
		HackGrenade = 2,
	}

	public float radius;
	public LayerMask scenographyMask;
	public float launchDistance;
	public GameObject bombPrefab;
	public LayerMask viewMask;
	public GrenadeType grenadeType;
}
