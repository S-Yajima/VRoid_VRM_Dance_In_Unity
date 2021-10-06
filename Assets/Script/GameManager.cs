using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using TMPro;
using UniRx;

/*
 * cs�X�N���v�g����V�F�[�_�[�̃p�����^�ɒl��ݒ肷��B
 */

public class GameManager : MonoBehaviour
{
    // �f�o�b�O�p�̃e�L�X�g
    [SerializeField] TextMeshProUGUI test_gui = null;
    
    // �V�F�[�_�[�ɃA�N�Z�X���邽�߂̊e�I�u�W�F�N�g�̃����_���[
    [SerializeField] Renderer floor_renderer = null;
    [SerializeField] Renderer cube1_renderer = null;
    [SerializeField] Renderer cube2_renderer = null;
    [SerializeField] Renderer cube3_renderer = null;
    [SerializeField] Renderer sphere1_renderer = null;
    [SerializeField] Renderer sphere2_renderer = null;

    //
    private float renderer_offset = 0;
    private float diff = -0.01f;

    // ���̂� Dissolve�V�F�[�_�[ ��_Threshold �l
    private float sphere1_threshold = 1.0f;
    private float sphere2_threshold = 1.0f;


    private IEnumerator update_dissolve()
    {
        yield return new WaitForSeconds(2f);
        
        while (sphere1_threshold >= 0.18f)
        {
            sphere1_threshold -= 0.02f;
            sphere1_renderer.material.SetFloat("_Threshold", sphere1_threshold);
            yield return new WaitForSeconds(0.03f);
        }

        yield return new WaitForSeconds(1f);

        while (sphere2_threshold >= 0.18f)
        {
            sphere2_threshold -= 0.02f;
            sphere2_renderer.material.SetFloat("_Threshold", sphere2_threshold);
            yield return new WaitForSeconds(0.03f);
        }

        yield break;
    }


    /*
     * �T�[�N���̏�ԕύX
     */
    private IEnumerator update_circle()
    {
        yield return new WaitForSeconds(10f);
        diff = 0.01f;
        yield return new WaitForSeconds(10f);
        diff = 0;
        yield return new WaitForSeconds(10f);
        diff = -0.01f;
        yield return new WaitForSeconds(10f);
        diff = 0.01f;

        yield break;
    }


    /*
     * �T�[�N����Offset���X�V
     */
    private IEnumerator update_offset()
    {
        yield return new WaitForSeconds(10f);

        while (test_gui != null)
        {
            yield return new WaitForSeconds(0.03f);
            renderer_offset += diff;
            floor_renderer.material.SetFloat("_Offset", renderer_offset);
            cube1_renderer.material.SetFloat("_Offset", renderer_offset);
            cube2_renderer.material.SetFloat("_Offset", renderer_offset);
            cube3_renderer.material.SetFloat("_Offset", renderer_offset);
        }

        yield break;
    }


    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine("update_dissolve");
        StartCoroutine("update_offset");
        StartCoroutine("update_circle");

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
