using UnityEngine;

public class ProximityMinePlanter : MonoBehaviour
{
	[SerializeField]
	private bool planted;
	public float timer;
	public float radius;
	public Transform MineMesh;
	public LayerMask scenographyMask;
	public LayerMask mask;
	public bool Planting;
}
