using UnityEngine;

public class EnemyBehavoiur : MonoBehaviour
{
	[SerializeField]
	private Enemies enemyType;
	public Characters character;
	[SerializeField]
	private float health;
	[SerializeField]
	private VisionAgent vision;
	[SerializeField]
	private Battle_Agent battleAgent;
	[SerializeField]
	private LocalPathFollower pathFollower;
	public EnemyState state;
	public EnemyStateToAnimation enemyStateToAnimation;
	public CharacterAudioManager audioManager;
}
