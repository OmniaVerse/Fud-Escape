Shader "Custom/MatCapSimpleCurved" {
	Properties {
		_Color ("Main Color", Vector) = (0.5,0.5,0.5,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MatCap ("MatCap (RGB)", 2D) = "white" {}
		_MatCapStrength ("MatCapStrength", Range(0, 3)) = 1
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 44999
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
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
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
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
					    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
					    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
					    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
					    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
					    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
					    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
					    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
					    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat2.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat2.xz;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _Color;
					uniform 	float _MatCapStrength;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 * vec4(_MatCapStrength);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    u_xlat0 = u_xlat0 * _Color;
					    SV_Target0 = u_xlat0 + u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
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
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
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
					    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
					    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
					    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
					    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
					    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
					    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
					    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
					    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat2.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat2.xz;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	vec4 _Color;
					uniform 	float _MatCapStrength;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _MatCap;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MatCap, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * vec4(_MatCapStrength);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat0 = u_xlat0 * _Color;
					    SV_Target0 = u_xlat0 + u_xlat0;
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
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
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
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
					    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
					    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
					    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
					    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
					    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
					    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
					    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat2.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat2.xz;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform 	vec4 _Color;
					uniform 	float _MatCapStrength;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MatCap;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat10_0 = texture2D(_MatCap, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat10_0 * vec4(_MatCapStrength);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * u_xlat10_1;
					    u_xlat0 = u_xlat0 * _Color;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
					    u_xlat6 = u_xlat0.w + u_xlat0.w;
					    SV_Target0.w = u_xlat6;
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
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
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp float vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
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
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[0].x;
					    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[1].x;
					    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4x4unity_WorldToObject[2].x;
					    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[0].y;
					    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[1].y;
					    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4x4unity_WorldToObject[2].y;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[0].z;
					    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[1].z;
					    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4x4unity_WorldToObject[2].z;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat2.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat2.xz;
					    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
					    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Color;
					uniform 	float _MatCapStrength;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _MatCap;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp float vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0 = texture(_MatCap, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat16_0 * vec4(_MatCapStrength);
					    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat0 = u_xlat0 * _Color;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + (-unity_FogColor.xyz);
					    u_xlat6 = u_xlat0.w + u_xlat0.w;
					    SV_Target0.w = u_xlat6;
					    u_xlat6 = vs_TEXCOORD2;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
					#else
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					#endif
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					"!!GLES"
				}
				SubProgram "gles3 " {
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES3"
				}
			}
		}
	}
	Fallback "Hidden/VacuumShaders/Curved World/VertexLit/Diffuse"
}