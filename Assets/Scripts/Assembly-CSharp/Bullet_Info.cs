using UnityEngine;

public class Bullet_Info : MonoBehaviour
{
	public int DamageValue;
	public GameScore.Weapons_List Weapon;
	public Vector3 startPos;
	public float lifeDistance;
	public Transform hitPrefab;
	public bool destroyWithDistance;
	public string hitEffect;
}
