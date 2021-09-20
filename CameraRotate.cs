using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;


/*
 * Main Camera �̐eGameObject�ɃA�^�b�`���A�J�����̃A���O���������ύX������
 */
public class CameraRotate : MonoBehaviour
{
    // MainCamera �� �A���O����ύX���郁�\�b�h�Q.
    private void RotateStartWorldAxisAdd()
    {
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
