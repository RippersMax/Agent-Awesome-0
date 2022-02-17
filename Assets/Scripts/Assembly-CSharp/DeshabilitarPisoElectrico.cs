using UnityEngine;

public class DeshabilitarPisoElectrico : MonoBehaviour
{
	public float timeOverFloor;
	public bool floorDisabled;
	public Transform PisoCollider;
	public Transform prefabVFX;
	public Transform icon;
	public Transform button;
	public Material enabledFloor;
	public AudioClip pisoDesactivado;
}
