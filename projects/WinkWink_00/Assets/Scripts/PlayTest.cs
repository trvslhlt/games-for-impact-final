using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayTest : MonoBehaviour {

	void Start () {
		
	}

	void Update () {
		int fingerCount = 0;
		foreach (Touch touch in Input.touches) {
			if (touch.phase != TouchPhase.Ended && touch.phase != TouchPhase.Canceled) {
				fingerCount++;
			}
		}	
		if (fingerCount > 0) {
			print ("user has " + fingerCount + " finger(s) touching the screen");
		} else {
			print ("nothing");
		}
	}
}
