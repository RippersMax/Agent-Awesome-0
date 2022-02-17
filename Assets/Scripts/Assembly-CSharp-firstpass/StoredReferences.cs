using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class StoredReferences : ScriptableObject
{
	public List<SaveGameManager.StoredEntry> entries;
}
