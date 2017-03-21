using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DayLight : MonoBehaviour {
    [SerializeField]
    private Transform _directionalLight;
    [SerializeField]
    private HexagonScript _hexagonScript;
    [SerializeField]
    private Transform _cameraPivot;

    private float lightpos;
    private bool night = false;

    private Coroutine _routine;
    private bool _routineStart = false;

	void Update () {
        _directionalLight.Rotate(0.25f,0,0);
        _cameraPivot.Rotate(0, 0.05f, 0);
        lightpos = Mathf.Abs(_directionalLight.localRotation.x);

       if ( lightpos > 0.9f && !night) {
            //Night
            night = true;
            if (_routineStart)
                StopCoroutine(_routine);

            _routine = StartCoroutine(DayLightTransition());
        }

        if (lightpos < 0.1f && night) {
            //Day
            night = false;
            if (_routineStart)
                StopCoroutine(_routine);

            _routine = StartCoroutine(DayLightTransition());
        }

    }

    IEnumerator DayLightTransition() {
        _routineStart = true;

        float t=0;
        int nightWave = 2;
        int dayWave = 20;
        float curWave = _hexagonScript.wave;
        float toWave;

        int seconds = 4;

        if (night)
        {
            toWave = nightWave;
        }
        else {
            toWave = dayWave;
        }

        while (t < seconds) {
            t += Time.deltaTime;
            _hexagonScript.wave = Mathf.Lerp(curWave, toWave, Mathf.SmoothStep(0,1, t / seconds));
            yield return null;
        }
        _routineStart = false;

    }
}
