using UnityEngine;

public class ShotScript : MonoBehaviour {

	public int damage = 1;
	public bool isEnemyShot = false;

	void Start () {
		Destroy (gameObject, 20);
	}
	
	// Update is called once per frame
	void Update () {
		MoveScript move = gameObject.GetComponent<MoveScript> ();
		Debug.Log (move.direction);
	}
}
