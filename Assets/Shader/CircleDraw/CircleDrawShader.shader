Shader "Custom/CircleDraw" {
	/*
	* �I�u�W�F�N�g�̕\�ʂɉ~��`�悷��
	*/
	Properties{
		//_Offset("Offset", Float) = 0.0
		_Offset("Offset", Range(0, 3.1415)) = 0.0
		_Center("Center", Vector) = (0.0, 0.0, 0.0)
		_Color("Color", Color) = (0.5, 0.5, 0.5, 1)
	}

	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard 
		#pragma target 3.0

		struct Input {
			float3 worldPos;
		};
		
		float _Offset;
		float3 _Center;
		fixed4 _Color;
		
		/*
		* �I�u�W�F�N�g�ɉ~��`�悷��B
		* �~�̕`��ɂ� sin �g�𗘗p����B
		*/
		void surf(Input IN, inout SurfaceOutputStandard o) {
			// _Center�̍��W�ƁA�Y������s�N�Z���̈ʒu�̃��[���h���W�ł̋������擾����B
			float dist = distance(_Center, IN.worldPos);

			// �s�N�Z���ʒu�܂ł̋�������sin�̒l���擾����B
			// ���̋����̎����Ԋu�ŁA�����l���擾�ł���B 
			// sin(0) = 0, sin(��/2) = 1, sin(��)=0
			float val = abs(sin((dist + _Offset) * 5.0));
			
			// ���̋����̎����Ԋu(sin�g 0.0 <-> 1.0)�����͈͓��Ȃ甒���h��Ԃ�
			// (�~��`�悷��B)
			if (val > 0.985) {
				o.Albedo = fixed4(1, 1, 1, 1);
			}
			else {
				// �~�͈̔͊O�Ȃ�]���̐F����`�悷��
				o.Albedo = _Color;
			}
		}
		ENDCG
	}
	FallBack "Diffuse"
}
