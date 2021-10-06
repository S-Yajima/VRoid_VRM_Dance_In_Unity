Shader "Custom/CircleDraw" {
	/*
	* オブジェクトの表面に円を描画する
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
		* オブジェクトに円を描画する。
		* 円の描画には sin 波を利用する。
		*/
		void surf(Input IN, inout SurfaceOutputStandard o) {
			// _Centerの座標と、該当するピクセルの位置のワールド座標での距離を取得する。
			float dist = distance(_Center, IN.worldPos);

			// ピクセル位置までの距離からsinの値を取得する。
			// 一定の距離の周期間隔で、同じ値を取得できる。 
			// sin(0) = 0, sin(π/2) = 1, sin(π)=0
			float val = abs(sin((dist + _Offset) * 5.0));
			
			// 一定の距離の周期間隔(sin波 0.0 <-> 1.0)が一定範囲内なら白く塗りつぶす
			// (円を描画する。)
			if (val > 0.985) {
				o.Albedo = fixed4(1, 1, 1, 1);
			}
			else {
				// 円の範囲外なら従来の色情報を描画する
				o.Albedo = _Color;
			}
		}
		ENDCG
	}
	FallBack "Diffuse"
}
