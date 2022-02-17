using UnityEngine;
using System;
using System.Collections.Generic;

public class VFXManager : MonoBehaviour
{
	[Serializable]
	public class props
	{
		public Transform prefabVFX;
		public Transform prefabVFXPosition;
		public Transform newPrefab;
		public Material changeMaterial;
		public Transform characterMesh;
		public bool hideCharacter;
		public bool enableNewPrefab;
		public bool enableChangeMaterial;
		public float timeToShowVFX;
		public float timeToDespawnNewPrefab;
		public List<VFXManager.Weapons_Type> weapons;
	}

	public enum Weapons_Type
	{
		Pistol = 0,
		ThrowingKnife = 1,
		AssaultRifle = 2,
		RPG = 3,
		Garrote = 4,
		StunGrenade = 5,
		BaconBomb = 6,
		HackGrenade = 7,
		ProximityMine = 8,
		ThugMask = 9,
		PisoElectrico = 10,
		Explosion = 11,
	}

	public List<VFXManager.props> properties;
}
