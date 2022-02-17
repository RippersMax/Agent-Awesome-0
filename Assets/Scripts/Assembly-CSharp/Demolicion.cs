using UnityEngine;

public class Demolicion : MonoBehaviour
{
	public GameObject mine;
	public float plantedRadius;
	public float timeOverFloor;
	public float timeToShowMine;
	public bool bombPlanted;
	public LayerMask mask;
	public GameObject icon;
	public AudioClip planted;
	public AudioClip interrupted;
	public Transform demolitionPosition;
	public Transform mineBox;
}
