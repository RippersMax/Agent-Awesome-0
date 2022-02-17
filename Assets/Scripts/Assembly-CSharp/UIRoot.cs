using UnityEngine;

public class UIRoot : MonoBehaviour
{
	public enum Scaling
	{
		Flexible = 0,
		Constrained = 1,
		ConstrainedOnMobiles = 2,
	}

	public Scaling scalingStyle;
	public int manualWidth;
	public int manualHeight;
	public int minimumHeight;
	public int maximumHeight;
	public bool fitWidth;
	public bool fitHeight;
	public bool adjustByDPI;
	public bool shrinkPortraitUI;
}
