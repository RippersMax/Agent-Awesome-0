using UnityEngine;

public class PathPoint : MonoBehaviour
{
	[SerializeField]
	private Transform nextPoint;
	[SerializeField]
	private Transform backPoint;
	public bool startPoint;
	public LineRenderer[] lineRenderers;
}
