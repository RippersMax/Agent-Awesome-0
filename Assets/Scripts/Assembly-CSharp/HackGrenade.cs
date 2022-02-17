using UnityEngine;

public class HackGrenade : BaseBomb
{
	public int damageRadius;
	public LayerMask enemyMask;
	public LayerMask playerMask;
	public LayerMask pisoMask;
	public LayerMask levelMask;
	public GameObject hackFX;
}
