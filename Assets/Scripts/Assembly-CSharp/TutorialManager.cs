using UnityEngine;
using System;

public class TutorialManager : MonoBehaviour
{
	[Serializable]
	public class prp
	{
		public TutorialManager.Character initWith;
		public string dialog;
		public bool isFinish;
	}

	public enum Character
	{
		AgentA = -1,
		Sally = 0,
		Objective1 = 1,
		Objective2 = 2,
		Objective3 = 3,
		Objective4 = 4,
		Objective5 = 5,
		Objective6 = 6,
		Objective7 = 7,
		Objective8 = 8,
		Objective9 = 9,
		Objective10 = 10,
		Objective11 = 11,
		Objective12 = 12,
	}

	public GameObject panel;
	public GameObject anchorAgenta;
	public GameObject anchorSally;
	public UILabel agentText;
	public UILabel sallyText;
	public UITexture sallyFace;
	public GameObject nextButtonAgenta;
	public GameObject nextButtonSally;
	public prp[] props;
	public GameObject help1;
	public GameObject help2;
	public GameObject help3;
	public GameObject help4;
	public GameObject help5;
	public GameObject help6;
}
