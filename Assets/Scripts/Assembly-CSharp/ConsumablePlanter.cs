using UnityEngine;

public class ConsumablePlanter : MonoBehaviour
{
	public enum ConsumType
	{
		ThugMask = 0,
		BodyArmor = 1,
		HealthKit = 2,
	}

	public float radius;
	public ConsumType consumType;
	public LayerMask scenographyMask;
	public LayerMask mask;
}
