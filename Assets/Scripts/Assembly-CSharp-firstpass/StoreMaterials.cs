using UnityEngine;
using System;
using System.Collections.Generic;

public class StoreMaterials : MonoBehaviour
{
	[Serializable]
	public class MaterialProperty
	{
		public enum PropertyType
		{
			unknown = -1,
			color = 0,
			vector = 1,
			texture = 2,
			textureOffset = 3,
			textureScale = 4,
			matrix = 5,
			real = 6,
		}

		public string name;
		public PropertyType type;
	}

	public List<StoreMaterials.MaterialProperty> MaterialProperties;
}
