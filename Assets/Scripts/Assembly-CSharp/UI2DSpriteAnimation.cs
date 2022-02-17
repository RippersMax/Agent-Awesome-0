using UnityEngine;

public class UI2DSpriteAnimation : MonoBehaviour
{
	[SerializeField]
	protected int framerate;
	public bool ignoreTimeScale;
	public bool loop;
	public Sprite[] frames;
}
