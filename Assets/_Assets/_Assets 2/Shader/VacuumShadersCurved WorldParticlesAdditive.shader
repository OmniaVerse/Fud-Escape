Shader "VacuumShaders/Curved World/Particles/Additive" {
	Properties {
		[CurvedWorldGearMenu] V_CW_Label_Tag ("", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Default Visual Options", Float) = 0
		_TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
		_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Curved World Optionals", Float) = 0
		[Toggle] V_CW_PARTICLE_SYSTEM ("Use With Particle System", Float) = 0
	}
	SubShader {
		Tags { "CurvedWorldAvailableOptions" = " " "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Particles/Additive" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CurvedWorldAvailableOptions" = " " "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Particles/Additive" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ColorMask RGB -1
			ZWrite Off
			Cull Off
			GpuProgramID 41567
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
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
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
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
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
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
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
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
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD2;
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
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
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
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD1;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp float vs_TEXCOORD1;
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
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp float vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * u_xlat16_1;
					    u_xlat1 = vs_TEXCOORD1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
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
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					float u_xlat1;
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
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD1;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
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
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp float vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
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
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp float vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat1 = vs_TEXCOORD1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
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
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
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
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
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
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
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
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD1;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec4 hlslcc_mtx4x4_V_CW_Camera2World[4];
					uniform 	vec4 hlslcc_mtx4x4_V_CW_World2Camera[4];
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp float vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
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
					    vs_TEXCOORD1 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp float vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
					    u_xlat16_0 = u_xlat16_0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * u_xlat16_1;
					    u_xlat1 = vs_TEXCOORD1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
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
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					float u_xlat1;
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
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD1;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
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
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp float vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_V_CW_World2Camera[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_V_CW_World2Camera[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD1 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    vs_TEXCOORD2.z = (-u_xlat0.x);
					    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat0.x * 0.5;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.w = u_xlat1.w;
					    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump vec4 _TintColor;
					uniform 	float _InvFade;
					uniform highp sampler2D _CameraDepthTexture;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp float vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
					    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
					    u_xlat0.x = u_xlat0.x * _InvFade;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
					    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
					    u_xlat0 = u_xlat0 * _TintColor;
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat1 = vs_TEXCOORD1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1);
					    SV_Target0 = u_xlat0;
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
				SubProgram "gles3 " {
					Keywords { "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "SOFTPARTICLES_ON" "V_CW_PARTICLE_SYSTEM_ON" }
					"!!GLES3"
				}
			}
		}
	}
	CustomEditor "CurvedWorld_Material_Editor"
}