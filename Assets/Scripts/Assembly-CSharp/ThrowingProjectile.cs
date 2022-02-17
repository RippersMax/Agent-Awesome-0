using UnityEngine;

public class ThrowingProjectile : MonoBehaviour
{
	[SerializeField]
	private Transform target;
	public float firingAngle;
	public float gravity;
	public float launchDistance;
	public GameObject ParentObject;
	public GameObject ProjectilePrefab;
}
