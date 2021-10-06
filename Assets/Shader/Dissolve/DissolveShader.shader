
Shader "Custom/dissolve" {
	/*
	* �e�N�X�`�����n����悤�ȕ\�����s��
	* 
	*/
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_DisolveTex("DisolveTex (RGB)", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
		_Threshold("Threshold", Range(0,1)) = 0.0
	}
	
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		// 
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _DisolveTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		half _Threshold;
		fixed4 _Color;


		/*
		* _DisolveTex�̃e�N�X�`���������ɁA���C���̃e�N�X�`����n�������\���ɂ���B
		* 
		* tex2D() : �e�N�X�`���}�b�s���O�֐��B2�����̔�ˉe�B
		*/
		void surf(Input IN, inout SurfaceOutputStandard o) {
			// _DisolveTex�̃e�N�X�`����UV���W�Ɋ�Â��ēǂݍ��ށB
			fixed4 m = tex2D(_DisolveTex, IN.uv_MainTex);
			// _DisolveTex��RGB�F�𐔒l������B
			half g = m.r * 0.2 + m.g * 0.7 + m.b * 0.1;
			// Desolve�p�̃e�N�X�`����RGB���l�̍��v������菭�Ȃ��ꍇ
			if (g < _Threshold) {
				discard;	// �s�N�Z����j������B�������𔲂���B
			}

			// _MainTex�̃e�N�X�`����UV���W�Ɋ�Â��ēǂݍ��ށB
			// _MainTex�e�N�X�`����RGB��_Color��RGB���������F���l���擾����B
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			// _MainTex�̐F���AProperties�̃��^���b�N��Smoothness���o�͂ɐݒ肷��B
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
