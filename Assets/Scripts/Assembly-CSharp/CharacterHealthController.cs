using UnityEngine;

public class CharacterHealthController : MonoBehaviour
{
	public enum Enemies
	{
		ThugGenerico = 0,
		HeavyThug1 = 1,
		HeavyThug2 = 2,
		Perro1 = 3,
		Perro2 = 4,
		Drone1 = 5,
		Drone2 = 6,
		Torreta = 7,
		PisoElectrico = 8,
	}

	public Enemies character;
}
