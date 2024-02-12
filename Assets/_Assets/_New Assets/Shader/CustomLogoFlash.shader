Shader "Custom/LogoFlash" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_FlashColor ("Flash Color", Vector) = (1,1,1,1)
		_Angle ("Flash Angle", Range(0, 180)) = 45
		_Width ("Flash Width", Range(0, 1)) = 0.2
		_LoopTime ("Loop Time", Float) = 1
		_Interval ("Time Interval", Float) = 3
	}
	SubShader {
		Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			GpuProgramID 156
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _FlashColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0 = in_COLOR0 * _FlashColor;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec4 _Time;
					uniform 	vec4 _FlashColor;
					uniform 	float _Angle;
					uniform 	float _Width;
					uniform 	float _LoopTime;
					uniform 	float _Interval;
					uniform lowp sampler2D _MainTex;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					bool u_xlatb9;
					float trunc(float x) { return sign(x)*floor(abs(x)); }
					vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
					vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
					vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }
					
					void main()
					{
					    u_xlat0 = _LoopTime + _Interval;
					    u_xlat3 = _Time.y / u_xlat0;
					    u_xlat3 = trunc(u_xlat3);
					    u_xlat0 = (-u_xlat3) * u_xlat0 + _Time.y;
					    u_xlat0 = u_xlat0 + (-_Interval);
					    u_xlat0 = u_xlat0 / _LoopTime;
					    u_xlat3 = _Angle * 0.0174444001;
					    u_xlat1.x = sin(u_xlat3);
					    u_xlat2 = cos(u_xlat3);
					    u_xlat3 = u_xlat1.x / u_xlat2;
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat6 = u_xlat3 + 1.0;
					    u_xlatb9 = 0.0<u_xlat3;
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : 1.0;
					    u_xlat9 = (u_xlatb9) ? 0.0 : u_xlat3;
					    u_xlat3 = vs_TEXCOORD0.y * u_xlat3 + vs_TEXCOORD0.x;
					    u_xlat6 = (-u_xlat9) + u_xlat6;
					    u_xlat0 = u_xlat0 * u_xlat6 + u_xlat9;
					    u_xlatb6 = u_xlat3<u_xlat0;
					    u_xlat9 = u_xlat0 + (-_Width);
					    u_xlat0 = u_xlat0 + u_xlat9;
					    u_xlatb9 = u_xlat9<u_xlat3;
					    u_xlat0 = u_xlat3 * 2.0 + (-u_xlat0);
					    u_xlat0 = abs(u_xlat0) / _Width;
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlatb3 = u_xlatb6 && u_xlatb9;
					    u_xlat0 = u_xlatb3 ? u_xlat0 : float(0.0);
					    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = _FlashColor.xyz * vec3(u_xlat0) + u_xlat1.xyz;
					    SV_Target0 = u_xlat1;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Unlit/Transparent"
}