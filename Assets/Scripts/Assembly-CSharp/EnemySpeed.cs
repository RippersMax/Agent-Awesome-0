using UnityEngine;

public class EnemySpeed : MonoBehaviour
{
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

	public EnemyType imEnemy;
}
