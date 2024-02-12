Shader "Projector/Multiply Test" {
	Properties {
		_Color ("Main Color", Vector) = (1,1,1,1)
		_ShadowTex ("Cookie", 2D) = "gray" {}
		_FalloffTex ("FallOff", 2D) = "white" {}
		_ShadowStrength ("Strength", Float) = 1
		_Diffuse ("Diffuse", Vector) = (1,1,1,1)
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" }
			Blend One One, One One
			ColorMask RGB -1
			ZWrite Off
			Offset -5, -1
			Fog {
				Mode Off
			}
			GpuProgramID 47773
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	mediump vec4 _Diffuse;
					uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					float u_xlat4;
					mediump vec3 u_xlat16_7;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.x + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.z + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
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
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_3 = dot(u_xlat0.xyz, vec3(0.577350259, 0.577350259, 0.577350259));
					    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
					    u_xlat16_7.xyz = _Color.xyz * _Diffuse.xyz;
					    vs_COLOR0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz;
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
					uniform 	float _ShadowStrength;
					uniform 	float _Factor;
					uniform lowp sampler2D _ShadowTex;
					uniform lowp sampler2D _FalloffTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp float u_xlat10_9;
					void main()
					{
					    u_xlat0.xyz = vs_COLOR0.xyz * vec3(_ShadowStrength);
					    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture2D(_ShadowTex, u_xlat1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat16_2 = (-u_xlat10_1.w) + 1.0;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_9 = texture2D(_FalloffTex, u_xlat1.xy).w;
					    u_xlat16_1.xyz = vec3(u_xlat10_9) * u_xlat0.xyz;
					    u_xlat16_1.w = u_xlat10_9 * u_xlat16_2;
					    u_xlat0 = u_xlat16_1 * vec4(_Factor);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	mediump vec4 _Diffuse;
					uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					float u_xlat4;
					mediump vec3 u_xlat16_7;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.x + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.z + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
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
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_3 = dot(u_xlat0.xyz, vec3(0.577350259, 0.577350259, 0.577350259));
					    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
					    u_xlat16_7.xyz = _Color.xyz * _Diffuse.xyz;
					    vs_COLOR0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz;
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
					uniform 	float _ShadowStrength;
					uniform 	float _Factor;
					uniform lowp sampler2D _ShadowTex;
					uniform lowp sampler2D _FalloffTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp float u_xlat10_9;
					void main()
					{
					    u_xlat0.xyz = vs_COLOR0.xyz * vec3(_ShadowStrength);
					    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture2D(_ShadowTex, u_xlat1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat16_2 = (-u_xlat10_1.w) + 1.0;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_9 = texture2D(_FalloffTex, u_xlat1.xy).w;
					    u_xlat16_1.xyz = vec3(u_xlat10_9) * u_xlat0.xyz;
					    u_xlat16_1.w = u_xlat10_9 * u_xlat16_2;
					    u_xlat0 = u_xlat16_1 * vec4(_Factor);
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	mediump vec4 _Diffuse;
					uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					float u_xlat4;
					mediump vec3 u_xlat16_7;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.x + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.z + u_xlat0.x;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat4;
					    u_xlat0.x = u_xlat4 * in_POSITION0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
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
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_3 = dot(u_xlat0.xyz, vec3(0.577350259, 0.577350259, 0.577350259));
					    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
					    u_xlat16_7.xyz = _Color.xyz * _Diffuse.xyz;
					    vs_COLOR0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz;
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
					uniform 	float _ShadowStrength;
					uniform 	float _Factor;
					uniform lowp sampler2D _ShadowTex;
					uniform lowp sampler2D _FalloffTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying mediump vec3 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp float u_xlat10_9;
					void main()
					{
					    u_xlat0.xyz = vs_COLOR0.xyz * vec3(_ShadowStrength);
					    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture2D(_ShadowTex, u_xlat1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat16_2 = (-u_xlat10_1.w) + 1.0;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_9 = texture2D(_FalloffTex, u_xlat1.xy).w;
					    u_xlat16_1.xyz = vec3(u_xlat10_9) * u_xlat0.xyz;
					    u_xlat16_1.w = u_xlat10_9 * u_xlat16_2;
					    u_xlat0 = u_xlat16_1 * vec4(_Factor);
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