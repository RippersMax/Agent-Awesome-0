using UnityEngine;

public class Enemy_Behaviour : MonoBehaviour
{
	public enum EnemyState
	{
		Relax = 0,
		Travel = 1,
		Detect = 2,
		Shoot = 3,
		Melee = 4,
	}

	public enum EnemyType
	{
		ThugGenerico = 0,
		HeavyThug1 = 1,
		HeavyThug2 = 2,
		Perros1 = 3,
		Perros2 = 4,
		Drone1 = 5,
		Drone2 = 6,
		Torretas = 7,
		PisoElectrico = 8,
	}

	public Transform player;
	public float fieldOfView;
	public float visionDetection;
	public float behindRange;
	public float sideRange;
	public float travelDistance;
	public float gunAttackArea;
	public float meleeAttackArea;
	public LayerMask RayDetectionLayer;
	public bool seePlayer;
	public bool onAlert;
	public EnemyState state;
	public TargetState targetState;
	public EnemyType imEnemy;
}
