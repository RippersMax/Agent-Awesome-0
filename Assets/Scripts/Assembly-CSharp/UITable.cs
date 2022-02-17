using UnityEngine;

public class UITable : UIWidgetContainer
{
	public enum Direction
	{
		Down = 0,
		Up = 1,
	}

	public enum Sorting
	{
		None = 0,
		Alphabetic = 1,
		Horizontal = 2,
		Vertical = 3,
		Custom = 4,
	}

	public int columns;
	public Direction direction;
	public Sorting sorting;
	public UIWidget.Pivot pivot;
	public bool hideInactive;
	public bool keepWithinPanel;
	public Vector2 padding;
}
