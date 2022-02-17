using System;
using UnityEngine;

[Serializable]
public class PoolOptions
{
	public GameObject prefab;
	public int preLoad;
	public bool limit;
	public int maxCount;
}
