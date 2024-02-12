Shader "Custom/Particle/ParticleUVAdd_PolarCoord" {
	Properties {
		_MainTex ("Base layer (RGB)", 2D) = "white" {}
		_DetailTex ("2nd layer (RGB)", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_MMultiplier ("Layer Multiplier", Float) = 2
		_Til_Offset ("Til_Offset", Vector) = (1,1,0,0)
		_Speed_offset ("Speed_offset", Float) = 0
		_Exp ("Exp", Float) = 0
		_Rotator ("Rotator", Float) = 0
		_Speed ("Speed", Float) = 0
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "SINE_BLEND"
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ZWrite Off
			Cull Off
			GpuProgramID 47928
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _DetailTex_ST;
					uniform 	float _MMultiplier;
					uniform 	vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	float _Speed;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.x + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.z + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.w + u_xlat0.x;
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
					    u_xlat0.xy = in_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = _Time.y * _Speed;
					    u_xlat1.x = sin(u_xlat6.x);
					    u_xlat2.x = cos(u_xlat6.x);
					    u_xlat6.xy = u_xlat0.xy * u_xlat1.xx;
					    u_xlat1.x = u_xlat0.y * u_xlat2.x + (-u_xlat6.x);
					    u_xlat1.y = u_xlat0.x * u_xlat2.x + u_xlat6.y;
					    vs_TEXCOORD0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
					    u_xlat0 = vec4(_MMultiplier) * _Color;
					    u_xlat0 = u_xlat0 * in_COLOR0;
					    vs_TEXCOORD1 = u_xlat0;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Color;
					uniform 	mediump float _Rotator;
					uniform 	mediump float _Exp;
					uniform 	mediump vec4 _Til_Offset;
					uniform 	mediump float _Speed_offset;
					uniform lowp sampler2D _DetailTex;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat10;
					bool u_xlatb10;
					mediump float u_xlat16_11;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
					    u_xlat16_1.x = u_xlat16_1.x * _Rotator;
					    u_xlat10 = u_xlat16_1.x * 3.14159274;
					    u_xlat2.x = sin(u_xlat10);
					    u_xlat3 = cos(u_xlat10);
					    u_xlat4.z = u_xlat2.x;
					    u_xlat4.y = u_xlat3;
					    u_xlat4.x = (-u_xlat2.x);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat4.xy);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat4.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_11 = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = float(1.0) / u_xlat16_11;
					    u_xlat16_16 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
					    u_xlat0.x = u_xlat16_16 * 0.0208350997 + -0.0851330012;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.180141002;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + -0.330299497;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.999866009;
					    u_xlat5 = u_xlat0.x * u_xlat16_11;
					    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
					    u_xlatb10 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
					    u_xlat5 = u_xlatb10 ? u_xlat5 : float(0.0);
					    u_xlat0.x = u_xlat16_11 * u_xlat0.x + u_xlat5;
					    u_xlatb5 = u_xlat16_1.y<(-u_xlat16_1.y);
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat0.x = u_xlat5 + u_xlat0.x;
					    u_xlat16_11 = min(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlatb5 = u_xlat16_11<(-u_xlat16_11);
					    u_xlat16_11 = max(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Exp;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Til_Offset.x;
					    u_xlatb10 = u_xlat16_11>=(-u_xlat16_11);
					    u_xlatb5 = u_xlatb10 && u_xlatb5;
					    u_xlat0.x = (u_xlatb5) ? (-u_xlat0.x) : u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 0.5;
					    u_xlat16_1.y = u_xlat0.x * _Til_Offset.y;
					    u_xlat0.x = _Time.y * _Speed_offset;
					    u_xlat16_1.xy = _Til_Offset.zw * u_xlat0.xx + u_xlat16_1.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_1.xy);
					    u_xlat16_1 = u_xlat10_0 * vec4(5.0, 5.0, 5.0, 5.0);
					    u_xlat1 = u_xlat16_1 * _Color;
					    u_xlat1 = u_xlat1 * _Color.wwww;
					    u_xlat0 = u_xlat10_0.wwww * u_xlat1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1.wwww;
					    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
					    SV_Target0 = u_xlat0 * u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _DetailTex_ST;
					uniform 	float _MMultiplier;
					uniform 	vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	float _Speed;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.x + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.z + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.w + u_xlat0.x;
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
					    u_xlat0.xy = in_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = _Time.y * _Speed;
					    u_xlat1.x = sin(u_xlat6.x);
					    u_xlat2.x = cos(u_xlat6.x);
					    u_xlat6.xy = u_xlat0.xy * u_xlat1.xx;
					    u_xlat1.x = u_xlat0.y * u_xlat2.x + (-u_xlat6.x);
					    u_xlat1.y = u_xlat0.x * u_xlat2.x + u_xlat6.y;
					    vs_TEXCOORD0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
					    u_xlat0 = vec4(_MMultiplier) * _Color;
					    u_xlat0 = u_xlat0 * in_COLOR0;
					    vs_TEXCOORD1 = u_xlat0;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Color;
					uniform 	mediump float _Rotator;
					uniform 	mediump float _Exp;
					uniform 	mediump vec4 _Til_Offset;
					uniform 	mediump float _Speed_offset;
					uniform lowp sampler2D _DetailTex;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat10;
					bool u_xlatb10;
					mediump float u_xlat16_11;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
					    u_xlat16_1.x = u_xlat16_1.x * _Rotator;
					    u_xlat10 = u_xlat16_1.x * 3.14159274;
					    u_xlat2.x = sin(u_xlat10);
					    u_xlat3 = cos(u_xlat10);
					    u_xlat4.z = u_xlat2.x;
					    u_xlat4.y = u_xlat3;
					    u_xlat4.x = (-u_xlat2.x);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat4.xy);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat4.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_11 = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = float(1.0) / u_xlat16_11;
					    u_xlat16_16 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
					    u_xlat0.x = u_xlat16_16 * 0.0208350997 + -0.0851330012;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.180141002;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + -0.330299497;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.999866009;
					    u_xlat5 = u_xlat0.x * u_xlat16_11;
					    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
					    u_xlatb10 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
					    u_xlat5 = u_xlatb10 ? u_xlat5 : float(0.0);
					    u_xlat0.x = u_xlat16_11 * u_xlat0.x + u_xlat5;
					    u_xlatb5 = u_xlat16_1.y<(-u_xlat16_1.y);
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat0.x = u_xlat5 + u_xlat0.x;
					    u_xlat16_11 = min(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlatb5 = u_xlat16_11<(-u_xlat16_11);
					    u_xlat16_11 = max(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Exp;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Til_Offset.x;
					    u_xlatb10 = u_xlat16_11>=(-u_xlat16_11);
					    u_xlatb5 = u_xlatb10 && u_xlatb5;
					    u_xlat0.x = (u_xlatb5) ? (-u_xlat0.x) : u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 0.5;
					    u_xlat16_1.y = u_xlat0.x * _Til_Offset.y;
					    u_xlat0.x = _Time.y * _Speed_offset;
					    u_xlat16_1.xy = _Til_Offset.zw * u_xlat0.xx + u_xlat16_1.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_1.xy);
					    u_xlat16_1 = u_xlat10_0 * vec4(5.0, 5.0, 5.0, 5.0);
					    u_xlat1 = u_xlat16_1 * _Color;
					    u_xlat1 = u_xlat1 * _Color.wwww;
					    u_xlat0 = u_xlat10_0.wwww * u_xlat1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1.wwww;
					    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
					    SV_Target0 = u_xlat0 * u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _DetailTex_ST;
					uniform 	float _MMultiplier;
					uniform 	vec4 _Color;
					uniform 	vec4 _Distort;
					uniform 	float _Speed;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * in_POSITION0.y;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.x + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.z + u_xlat0.x;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3;
					    u_xlat0.x = u_xlat3 * in_POSITION0.w + u_xlat0.x;
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
					    u_xlat0.xy = in_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = _Time.y * _Speed;
					    u_xlat1.x = sin(u_xlat6.x);
					    u_xlat2.x = cos(u_xlat6.x);
					    u_xlat6.xy = u_xlat0.xy * u_xlat1.xx;
					    u_xlat1.x = u_xlat0.y * u_xlat2.x + (-u_xlat6.x);
					    u_xlat1.y = u_xlat0.x * u_xlat2.x + u_xlat6.y;
					    vs_TEXCOORD0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _DetailTex_ST.xy + _DetailTex_ST.zw;
					    u_xlat0 = vec4(_MMultiplier) * _Color;
					    u_xlat0 = u_xlat0 * in_COLOR0;
					    vs_TEXCOORD1 = u_xlat0;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Color;
					uniform 	mediump float _Rotator;
					uniform 	mediump float _Exp;
					uniform 	mediump vec4 _Til_Offset;
					uniform 	mediump float _Speed_offset;
					uniform lowp sampler2D _DetailTex;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat10;
					bool u_xlatb10;
					mediump float u_xlat16_11;
					mediump float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
					    u_xlat16_1.x = u_xlat16_1.x * _Rotator;
					    u_xlat10 = u_xlat16_1.x * 3.14159274;
					    u_xlat2.x = sin(u_xlat10);
					    u_xlat3 = cos(u_xlat10);
					    u_xlat4.z = u_xlat2.x;
					    u_xlat4.y = u_xlat3;
					    u_xlat4.x = (-u_xlat2.x);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat4.xy);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat4.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_11 = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = float(1.0) / u_xlat16_11;
					    u_xlat16_16 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
					    u_xlat0.x = u_xlat16_16 * 0.0208350997 + -0.0851330012;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.180141002;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + -0.330299497;
					    u_xlat0.x = u_xlat16_16 * u_xlat0.x + 0.999866009;
					    u_xlat5 = u_xlat0.x * u_xlat16_11;
					    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
					    u_xlatb10 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
					    u_xlat5 = u_xlatb10 ? u_xlat5 : float(0.0);
					    u_xlat0.x = u_xlat16_11 * u_xlat0.x + u_xlat5;
					    u_xlatb5 = u_xlat16_1.y<(-u_xlat16_1.y);
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat0.x = u_xlat5 + u_xlat0.x;
					    u_xlat16_11 = min(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlatb5 = u_xlat16_11<(-u_xlat16_11);
					    u_xlat16_11 = max(u_xlat16_1.y, u_xlat16_1.x);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_1.x = sqrt(u_xlat16_1.x);
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Exp;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * _Til_Offset.x;
					    u_xlatb10 = u_xlat16_11>=(-u_xlat16_11);
					    u_xlatb5 = u_xlatb10 && u_xlatb5;
					    u_xlat0.x = (u_xlatb5) ? (-u_xlat0.x) : u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.318309873 + 0.5;
					    u_xlat16_1.y = u_xlat0.x * _Til_Offset.y;
					    u_xlat0.x = _Time.y * _Speed_offset;
					    u_xlat16_1.xy = _Til_Offset.zw * u_xlat0.xx + u_xlat16_1.xy;
					    u_xlat10_0 = texture2D(_MainTex, u_xlat16_1.xy);
					    u_xlat16_1 = u_xlat10_0 * vec4(5.0, 5.0, 5.0, 5.0);
					    u_xlat1 = u_xlat16_1 * _Color;
					    u_xlat1 = u_xlat1 * _Color.wwww;
					    u_xlat0 = u_xlat10_0.wwww * u_xlat1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1;
					    u_xlat0 = u_xlat0 * vs_TEXCOORD1.wwww;
					    u_xlat10_1 = texture2D(_DetailTex, vs_TEXCOORD0.zw);
					    SV_Target0 = u_xlat0 * u_xlat10_1;
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