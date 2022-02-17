using System;
using UnityEngine;

[Serializable]
public class Spawner : MonoBehaviour
{
	public GameObject prefab;
	public Transform target;
	public GameObject other;
	public Mesh createMesh;
	public string[] testArrayItems;
}
