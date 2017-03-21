using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HexagonScript : MonoBehaviour {
    //[SerializeField]
    [Range(1,20)]
    public float wave = 1;

    private Transform[] _hexagonRT;
    private int _hexagonsCount;

    private Vector3 pos;

	// Use this for initialization
	void Start () {
        _hexagonsCount = transform.childCount;
        _hexagonRT = new Transform[_hexagonsCount];

        for (int i = 0; i < _hexagonsCount; i++)
        {
            _hexagonRT[i] = transform.GetChild(i).GetComponent<Transform>();
        }
	}
	
	// Update is called once per frame
	void Update () {


        for (int i = 0; i < _hexagonsCount; i++)
        {
            pos = _hexagonRT[i].position;
            pos.y = Mathf.Sin(Time.time+i)/wave;
            _hexagonRT[i].position = pos;
        }
	}
}
