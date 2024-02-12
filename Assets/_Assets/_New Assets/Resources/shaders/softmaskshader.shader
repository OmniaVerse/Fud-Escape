Shader "UI Extensions/SoftMaskShader" {
	Properties {
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Vector) = (1,1,1,1)
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
		_AlphaMask ("AlphaMask - Must be Wrapped", 2D) = "white" {}
		_CutOff ("CutOff", Float) = 0
		[MaterialToggle] _HardBlend ("HardBlend", Float) = 0
		_FlipAlphaMask ("Flip Alpha Mask", Float) = 0
		_NoOuterClip ("Outer Clip", Float) = 0
	}
	SubShader {
		Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask 0 -1
			ZWrite Off
			Cull Off
			Stencil {
				ReadMask 0
				WriteMask 0
				Comp Disabled
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 63197
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	vec4 _AlphaMask_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
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
					    u_xlat0 = in_COLOR0 * _Color;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_POSITION0.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
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
					uniform 	mediump vec4 _TextureSampleAdd;
					uniform 	int _UseAlphaClip;
					uniform 	int _FlipAlphaMask;
					uniform 	float _CutOff;
					uniform 	int _HardBlend;
					uniform 	int _NoOuterClip;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _AlphaMask;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					int u_xlati1;
					bvec4 u_xlatb1;
					int u_xlati2;
					bool u_xlatb2;
					float u_xlat3;
					mediump float u_xlat16_3;
					bool u_xlatb5;
					mediump float u_xlat16_7;
					float u_xlat9;
					bool u_xlatb12;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
					    u_xlat0 = u_xlat0 * vs_COLOR0;
					    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb1.zw = greaterThanEqual(vec4(0.0, 0.0, 1.0, 1.0), vs_TEXCOORD1.xxxy).zw;
					    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
					    u_xlati2 = int((_NoOuterClip!=0) ? -1 : 0);
					    u_xlatb2 = u_xlati2==0;
					    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlati1 = int((u_xlat1.x!=0.0) ? -1 : 0);
					    u_xlatb1.x = u_xlati1==0;
					    u_xlatb1.x = u_xlatb1.x && u_xlatb2;
					    if(u_xlatb1.x){
					        u_xlat16_3 = 0.0;
					    } else {
					        u_xlat1.x = texture2D(_AlphaMask, vs_TEXCOORD1.xy).w;
					        u_xlatb5 = _CutOff>=u_xlat1.x;
					        u_xlat1.x = (_HardBlend != 0) ? 1.0 : u_xlat1.x;
					        u_xlat1.x = (u_xlatb5) ? 0.0 : u_xlat1.x;
					        u_xlatb5 = _FlipAlphaMask==1;
					        u_xlat9 = (-u_xlat1.x) + 1.0;
					        u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
					        u_xlat3 = u_xlat0.w * u_xlat1.x;
					        u_xlat16_3 = u_xlat3;
					    //ENDIF
					    }
					    u_xlatb12 = _UseAlphaClip!=0;
					    u_xlat16_7 = u_xlat16_3 + -0.00100000005;
					    u_xlatb1.x = u_xlat16_7<0.0;
					    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
					    if(((int(u_xlatb12) * -1))!=0){discard;}
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = u_xlat16_3;
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
}