
Shader "Custom/dissolve" {
	/*
	* テクスチャが溶けるような表現を行う
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
		* _DisolveTexのテクスチャ情報を元に、メインのテクスチャを溶かした表現にする。
		* 
		* tex2D() : テクスチャマッピング関数。2次元の非射影。
		*/
		void surf(Input IN, inout SurfaceOutputStandard o) {
			// _DisolveTexのテクスチャをUV座標に基づいて読み込む。
			fixed4 m = tex2D(_DisolveTex, IN.uv_MainTex);
			// _DisolveTexのRGB色を数値化する。
			half g = m.r * 0.2 + m.g * 0.7 + m.b * 0.1;
			// Desolve用のテクスチャのRGB数値の合計が一定より少ない場合
			if (g < _Threshold) {
				discard;	// ピクセルを破棄する。当処理を抜ける。
			}

			// _MainTexのテクスチャをUV座標に基づいて読み込む。
			// _MainTexテクスチャのRGBと_ColorのRGBをかけた色情報値を取得する。
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			// _MainTexの色情報、PropertiesのメタリックとSmoothnessを出力に設定する。
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
