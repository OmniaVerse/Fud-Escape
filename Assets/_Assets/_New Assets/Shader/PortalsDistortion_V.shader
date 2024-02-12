Shader "Portals/Distortion_V" {
	Properties {
		[HDR] _TintColor ("Tint Color", Vector) = (1,1,1,1)
		_MainTex ("Base (RGB) Gloss (A)", 2D) = "black" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
		_BumpAmt ("Distortion", Float) = 10
		_InvFade ("Soft Particles Factor", Range(0, 10)) = 1
		[CurvedWorldGearMenu] V_CW_Label_Tag ("", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Default Visual Options", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Curved World Optionals", Float) = 0
		[Toggle] V_CW_PARTICLE_SYSTEM ("Use With Particle System", Float) = 0
	}
	SubShader {
		Tags { "CurvedWorldAvailableOptions" = " " "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Portals/Distortion" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		GrabPass {
		}
		Pass {
			Tags { "CurvedWorldAvailableOptions" = " " "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Portals/Distortion" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ZWrite Off
			Cull Off
			GpuProgramID 31533
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat2.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat2.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat2.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat2.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat2.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat2.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat2.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _BumpMap_ST;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4_V_CW_Camera2World[1].z;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[0].z * in_POSITION0.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[2].z * in_POSITION0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4_V_CW_Camera2World[3].z * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat0.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat0.xy = max(u_xlat0.xy, _zero2.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat1.x = u_xlat0.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat0.x * _V_CW_Bend.x;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4_V_CW_World2Camera[1];
					    u_xlat0 = hlslcc_mtx4x4_V_CW_World2Camera[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = u_xlat0 + in_POSITION0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position = u_xlat2;
					    vs_TEXCOORD0.z = u_xlat2.w / u_xlat0.x;
					    u_xlat0.xy = u_xlat2.ww + u_xlat2.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    vs_TEXCOORD0.w = u_xlat2.w;
					    vs_TEXCOORD3.w = u_xlat2.w;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.x = u_xlat2.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD1 = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    vs_TEXCOORD3.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
					    u_xlat1.xz = u_xlat2.xw * vec2(0.5, 0.5);
					    u_xlat1.w = u_xlat0.x * 0.5;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	float _BumpAmt;
					uniform 	vec4 _GrabTexture_TexelSize;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _GrabTexture;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD4;
					varying highp vec2 vs_TEXCOORD2;
					varying mediump vec4 vs_COLOR0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0.xy = texture2D(_BumpMap, vs_TEXCOORD4.xy).xy;
					    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat16_1.xy * vec2(vec2(_BumpAmt, _BumpAmt));
					    u_xlat0.xy = u_xlat0.xy * _GrabTexture_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD0.zz + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
					    u_xlat16_1.xyz = u_xlat2.xyz * _TintColor.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + u_xlat16_1.xyz;
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD3.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * _TintColor.xyz;
					    u_xlatb9 = _InvFade<0.00100000005;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
					    u_xlat9 = vs_TEXCOORD1;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = vs_COLOR0.w * _TintColor.w;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
			}
		}
	}
}