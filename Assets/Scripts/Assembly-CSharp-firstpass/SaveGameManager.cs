using UnityEngine;
using System;

public class SaveGameManager : MonoBehaviour
{
	[Serializable]
	public class StoredEntry
	{
		public GameObject gameObject;
		public string Id;
	}

	public Object[] requiredObjects;
	public StoredReferences Reference;
}
