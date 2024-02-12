Shader "UI Extensions/Particles/VertexLit Blended" {
	Properties {
		_EmisColor ("Emissive Color", Vector) = (0.2,0.2,0.2,0)
		_MainTex ("Particle Texture", 2D) = "white" {}
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
	}
	SubShader {
		Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
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
			Fog {
				Mode Off
			}
			GpuProgramID 59586
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat15;
					mediump float u_xlat16_17;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
					    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
					    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
					    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
					    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
					    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
					    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
					    vs_COLOR0.w = in_COLOR0.w;
					    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "POINT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = u_xlat30 * 0.5;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SPOT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat28 = max(u_xlat28, 0.0);
					        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
					        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
					        u_xlat16_34 = u_xlat16_34 * 0.5;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat15;
					mediump float u_xlat16_17;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
					    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
					    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
					    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
					    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
					    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
					    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
					    vs_COLOR0.w = in_COLOR0.w;
					    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    vs_TEXCOORD1 = u_xlat0.x;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "POINT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = u_xlat30 * 0.5;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD1 = u_xlat0.x;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SPOT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat28 = max(u_xlat28, 0.0);
					        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
					        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
					        u_xlat16_34 = u_xlat16_34 * 0.5;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD1 = u_xlat0.x;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat15;
					mediump float u_xlat16_17;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
					    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
					    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
					    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
					    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
					    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_17 = max(u_xlat16_17, 0.0);
					    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
					    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
					    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
					    vs_COLOR0.w = in_COLOR0.w;
					    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "POINT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = u_xlat30 * 0.5;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SPOT" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	mediump vec4 _EmisColor;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec3 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec3 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					bool u_xlatb4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_7;
					mediump vec3 u_xlat16_8;
					bool u_xlatb13;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					mediump float u_xlat16_34;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
					    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
					    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
					    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
					    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
					    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
					    u_xlat16_2.xyz = u_xlat16_7.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
					        u_xlat30 = float(1.0) / u_xlat30;
					        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
					        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
					        u_xlatb4 = u_xlatb13 && u_xlatb4;
					        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat28 = inversesqrt(u_xlat28);
					        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
					        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat28 = max(u_xlat28, 0.0);
					        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
					        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
					        u_xlat16_34 = u_xlat16_34 * 0.5;
					        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
					        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
					        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
					        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
					        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
					    }
					    u_xlat16_2.w = in_COLOR0.w;
					    vs_COLOR0 = u_xlat16_2;
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump float u_xlat16_7;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
					    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat16_7;
					    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
					Keywords { "POINT" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "SPOT" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "POINT" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SPOT" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "POINT" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SPOT" }
					"!!GLES"
				}
			}
		}
	}
}