Shader "Custom/Distorted/Multiply" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend DstColor Zero, DstColor Zero
			Fog {
				Mode Off
			}
			GpuProgramID 52636
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[1].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].xx + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].zz + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].ww + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * in_POSITION0.yy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat3 = (-u_xlat0.y) + 700.0;
					    u_xlat3 = u_xlat3 * 0.00200000009;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    vs_TEXCOORD1 = (-u_xlat3) + 1.0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(vs_TEXCOORD1);
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[1].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].xx + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].zz + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].ww + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * in_POSITION0.yy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat3 = (-u_xlat0.y) + 700.0;
					    u_xlat3 = u_xlat3 * 0.00200000009;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    vs_TEXCOORD1 = (-u_xlat3) + 1.0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(vs_TEXCOORD1);
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[1].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].xx + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].zz + u_xlat0.xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[1].ww + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * in_POSITION0.yy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[0].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[2].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].zw;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[3].zw * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat6.xy;
					    u_xlat0.xy = u_xlat6.xy * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat3 = (-u_xlat0.y) + 700.0;
					    u_xlat3 = u_xlat3 * 0.00200000009;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    vs_TEXCOORD1 = (-u_xlat3) + 1.0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = u_xlat0.xx * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(vs_TEXCOORD1);
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
	Fallback "Diffuse"
}