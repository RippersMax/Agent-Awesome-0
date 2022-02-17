using UnityEngine;

public class PathManager : MonoSingleton<PathManager>
{
	public Camera Camera_Tactic;
	public LayerMask mask;
	public LineRenderer lineRenderer;
	public Font timeFont;
	public Material playerPath;
	public AudioClip routeChange;
	public LineRenderer _AgentStartLine;
}
