using System;
using UnityEngine;

[Serializable]
public class Level
{
	[SerializeField]
	private int score;
	[SerializeField]
	private int coins;
	[SerializeField]
	private int timerMin;
	[SerializeField]
	private int timerSec;
	[SerializeField]
	private string id;
}
