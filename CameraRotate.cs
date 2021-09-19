using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

/*
 * MainCamera の 親オブジェクト にアタッチしてカメラのアングルを制御する
 */
public class CameraRotate : MonoBehaviour
{
    // カメラアングルの角度を変更するメソッド群
    private void RotateStartWorldAxisAdd()
    {
        // DOTweenを使用してカメラの親GameObjectのRotate情報を変更する。
        transform.DORotate(new Vector3(0, -360f, 0), 15f, RotateMode.WorldAxisAdd);
    }

    private void RotateStartWorldAxisAdd_Up()
    {
        transform.DORotate(new Vector3(45f, 0, 0), 3f, RotateMode.WorldAxisAdd);
    }

    private void RotateStartWorldAxisAdd_Up_20()
    {
        transform.DORotate(new Vector3(20f, 0, 0), 3f, RotateMode.WorldAxisAdd);
    }

    private void RotateStartWorldAxisAdd_Down()
    {
        transform.DORotate(new Vector3(-65f, 0, 0), 3f, RotateMode.WorldAxisAdd);
    }


    private void RotateStartWorldAxisAdd_R()
    {
        transform.DORotate(new Vector3(0, 360f, 0), 15f, RotateMode.WorldAxisAdd);
    }

    // Start is called before the first frame update
    void Start()
    {
        // カメラの視点を順次変更する
        Invoke("RotateStartWorldAxisAdd", 10f);
        Invoke("RotateStartWorldAxisAdd_Up", 25f);
        Invoke("RotateStartWorldAxisAdd", 30f);
        Invoke("RotateStartWorldAxisAdd_Down", 50f);
        Invoke("RotateStartWorldAxisAdd_R", 55f);
        Invoke("RotateStartWorldAxisAdd_Up_20", 70f);
    }


    // Update is called once per frame
    void Update()
    {
        
    }
}
