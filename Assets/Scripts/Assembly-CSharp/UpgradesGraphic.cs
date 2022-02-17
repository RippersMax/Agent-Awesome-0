using UnityEngine;

public class UpgradesGraphic : MonoBehaviour
{
	[SerializeField]
	private int availableUpgrades;
	[SerializeField]
	private int actualUpgrade;
	public UITexture[] upgradeLevels;
	public Color upgradedColor;
}
