Shader "Custom/Distorted/Transparent" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 63779
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _FogSilhouetteColor;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.x + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.z + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.xy = u_xlat0.xy;
					    u_xlat0.x = u_xlat0.y / u_xlat1.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat3.xy = (-u_xlat1.ww) + vec2(1000.0, 700.0);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00333333341, 0.00200000009);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9 = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _SkyGradientBottomColor.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _FogSilhouetteColor.xyz;
					    u_xlat3.x = u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    vs_TEXCOORD1.w = u_xlat3.y;
					    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
					    vs_TEXCOORD1.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat1.xyz;
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
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(_Factor);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _FogSilhouetteColor;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.x + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.z + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.xy = u_xlat0.xy;
					    u_xlat0.x = u_xlat0.y / u_xlat1.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat3.xy = (-u_xlat1.ww) + vec2(1000.0, 700.0);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00333333341, 0.00200000009);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9 = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _SkyGradientBottomColor.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _FogSilhouetteColor.xyz;
					    u_xlat3.x = u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    vs_TEXCOORD1.w = u_xlat3.y;
					    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
					    vs_TEXCOORD1.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat1.xyz;
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
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(_Factor);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _FogSilhouetteColor;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.x + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.z + u_xlat0.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.xy = u_xlat0.xy;
					    u_xlat0.x = u_xlat0.y / u_xlat1.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat3.xy = (-u_xlat1.ww) + vec2(1000.0, 700.0);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00333333341, 0.00200000009);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9 = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _SkyGradientBottomColor.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + _FogSilhouetteColor.xyz;
					    u_xlat3.x = u_xlat3.x;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    vs_TEXCOORD1.w = u_xlat3.y;
					    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
					    vs_TEXCOORD1.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat1.xyz;
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
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(_Factor);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
}