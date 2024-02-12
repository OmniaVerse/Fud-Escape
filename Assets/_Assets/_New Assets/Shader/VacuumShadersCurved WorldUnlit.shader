Shader "VacuumShaders/Curved World/Unlit" {
	Properties {
		[CurvedWorldGearMenu] V_CW_Label_Tag ("", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Default Visual Options", Float) = 0
		[CurvedWorldLargeLabel] V_CW_Label_Modes ("Modes", Float) = 0
		[CurvedWorldRenderingMode] V_CW_Rendering_Mode ("  Rendering", Float) = 0
		[CurvedWorldTextureMixMode] V_CW_Texture_Mix_Mode ("  Texture Mix", Float) = 0
		[CurvedWorldLargeLabel] V_CW_Label_Albedo ("Albedo", Float) = 0
		_Color ("  Color", Vector) = (1,1,1,1)
		_MainTex ("  Map (RGB) RefStr (A)", 2D) = "white" {}
		[CurvedWorldUVScroll] _V_CW_MainTex_Scroll ("    ", Vector) = (0,0,0,0)
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Curved World Optionals", Float) = 0
		[HideInInspector] _V_CW_Rim_Color ("", Vector) = (1,1,1,1)
		[HideInInspector] _V_CW_Rim_Bias ("", Range(-1, 1)) = 0.2
		[HideInInspector] _V_CW_Rim_Power ("", Range(0.5, 8)) = 3
		[HideInInspector] _EmissionMap ("", 2D) = "white" {}
		[HideInInspector] _EmissionColor ("", Vector) = (1,1,1,1)
		[HideInInspector] _V_CW_IBL_Intensity ("", Float) = 1
		[HideInInspector] _V_CW_IBL_Contrast ("", Float) = 1
		[HideInInspector] _V_CW_IBL_Cube ("", Cube) = "" {}
		[HideInInspector] _V_CW_IBL_Matcap ("", 2D) = "Gray" {}
		[HideInInspector] _V_CW_ReflectColor ("", Vector) = (1,1,1,1)
		[HideInInspector] _V_CW_ReflectStrengthAlphaOffset ("", Range(-1, 1)) = 0
		[HideInInspector] _V_CW_Cube ("", Cube) = "_Skybox" {}
		[HideInInspector] _V_CW_Fresnel_Bias ("", Range(-1, 1)) = 0
		[HideInInspector] _V_CW_NormalMapStrength ("", Float) = 1
		[HideInInspector] _V_CW_NormalMap ("", 2D) = "bump" {}
		[HideInInspector] _V_CW_NormalMap_UV_Scale ("", Float) = 1
		[HideInInspector] _V_CW_SecondaryNormalMap ("", 2D) = "" {}
		[HideInInspector] _V_CW_SecondaryNormalMap_UV_Scale ("", Float) = 1
	}
	SubShader {
		LOD 100
		Tags { "CurvedWorldAvailableOptions" = "V_CW_REFLECTIVE;V_CW_VERTEX_COLOR;V_CW_IBL;_EMISSION;V_CW_RIM;V_CW_FOG;_NORMALMAP;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Unlit/Opaque/Texture" "RenderType" = "CurvedWorld_Opaque" }
		Pass {
			Name "BASE"
			LOD 100
			Tags { "CurvedWorldAvailableOptions" = "V_CW_REFLECTIVE;V_CW_VERTEX_COLOR;V_CW_IBL;_EMISSION;V_CW_RIM;V_CW_FOG;_NORMALMAP;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Unlit/Opaque/Texture" "RenderType" = "CurvedWorld_Opaque" }
			GpuProgramID 27066
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD3 = 0.0;
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD3 = exp2(u_xlat0.x);
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD3 = 0.0;
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD3 = exp2(u_xlat0.x);
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy;
					    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
					    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG_OFF" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG" "V_CW_IBL_OFF" "V_CW_MATCAP_BLEND_MULTIPLY" "V_CW_REFLECTIVE_OFF" "V_CW_RIM_OFF" "V_CW_VERTEX_COLOR_OFF" "_EMISSION_OFF" "_NORMALMAP_OFF" }
					"!!GLES"
				}
			}
		}
	}
	CustomEditor "CurvedWorld_Material_Editor"
}