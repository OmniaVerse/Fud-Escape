Shader "UI Extensions/Particles/Multiply" {
	Properties {
		_MainTex ("Particle Texture", 2D) = "white" {}
		_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
	}
	SubShader {
		Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend Zero SrcColor, Zero SrcColor
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
			GpuProgramID 31012
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
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
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w;
					    u_xlat16_0 = vs_COLOR0 * u_xlat10_0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    SV_Target0 = vec4(u_xlat1) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    SV_Target0 = u_xlat0.wwww * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat10_1.w * vs_COLOR0.w;
					    u_xlat16_1 = vs_COLOR0 * u_xlat10_1 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = vec3(u_xlat3) * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat3 * u_xlat16_1.w + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat0.www * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat0.w * u_xlat16_1.w + 1.0;
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat10_1.w * vs_COLOR0.w;
					    u_xlat16_1 = vs_COLOR0 * u_xlat10_1 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = vec3(u_xlat3) * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat3 * u_xlat16_1.w + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat1.x = u_xlat1.x * (-u_xlat1.x);
					    vs_TEXCOORD1 = exp2(u_xlat1.x);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat0.www * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat0.w * u_xlat16_1.w + 1.0;
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
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
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w;
					    u_xlat16_0 = vs_COLOR0 * u_xlat10_0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    SV_Target0 = vec4(u_xlat1) * u_xlat16_0 + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    SV_Target0 = u_xlat0.wwww * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat10_1.w * vs_COLOR0.w;
					    u_xlat16_1 = vs_COLOR0 * u_xlat10_1 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = vec3(u_xlat3) * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat3 * u_xlat16_1.w + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat0.www * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat0.w * u_xlat16_1.w + 1.0;
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    vs_COLOR0 = in_COLOR0;
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
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat10_1.w * vs_COLOR0.w;
					    u_xlat16_1 = vs_COLOR0 * u_xlat10_1 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = vec3(u_xlat3) * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat3 * u_xlat16_1.w + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat1.x = u_xlat1.x * (-u_xlat1.x);
					    vs_TEXCOORD1 = exp2(u_xlat1.x);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat4;
					    vs_TEXCOORD2.z = (-u_xlat4);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat0.w;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.w = u_xlat0.x * u_xlat10_1.w;
					    u_xlat0.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
					    u_xlat16_1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat0.www * u_xlat16_1.xyz;
					    SV_Target0.w = u_xlat0.w * u_xlat16_1.w + 1.0;
					    u_xlat0.x = vs_TEXCOORD1;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "UNITY_UI_ALPHACLIP" }
					"!!GLES"
				}
			}
		}
	}
}