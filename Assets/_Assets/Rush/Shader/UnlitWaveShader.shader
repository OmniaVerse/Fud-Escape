Shader "Unlit/WaveShader" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Brightness ("Brightness", Float) = 1
		_Saturation ("Saturation", Float) = 1
		_Contrast ("Contrast", Float) = 1
		_LightColor ("LightColor", Vector) = (0,0,0,0)
		_WaveXpoint ("WaveXpoint", Float) = 10
		_Speed ("Speed", Float) = 5
		_Height ("Height", Float) = 2
		_FactorWave ("FactorWave", Float) = 2
		_MaxLegth ("MaxLegth", Float) = 180
	}
	SubShader {
		LOD 100
		Tags { "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 32134
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					bool u_xlatb6;
					bool u_xlatb9;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0;
					    u_xlat0 = u_xlat0 * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.x + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.z + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.w + u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat3.x = dot((-in_POSITION0.xyz), (-in_POSITION0.xyz));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _Time.z * _Speed;
					    u_xlat3.x = u_xlat3.x * 0.400000006 + u_xlat6;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * _Height;
					    u_xlat3.x = u_xlat3.x * RandomX;
					    u_xlat16_1 = _MaxLegth + -1.0;
					    u_xlatb6 = u_xlat16_1<in_POSITION0.z;
					    u_xlatb9 = in_POSITION0.z<1.0;
					    u_xlatb6 = u_xlatb6 || u_xlatb9;
					    u_xlat3.x = (u_xlatb6) ? 0.0 : u_xlat3.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat6 = u_xlat3.x + u_xlat1.y;
					    vs_POSITION1.y = u_xlat3.x;
					    u_xlat3.xyz = vec3(u_xlat6) * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_POSITION1.xzw = in_POSITION0.xzw;
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
					uniform 	mediump float _Brightness;
					uniform 	mediump vec3 _LightColor;
					uniform 	mediump float _FactorWave;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = vs_POSITION1.y / _FactorWave;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * 0.5 + 0.100000001;
					    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = _LightColor.xyz * vec3(_Brightness) + (-u_xlat1.xyz);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + u_xlat1.xyz;
					    SV_Target0 = u_xlat1;
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					bool u_xlatb6;
					bool u_xlatb9;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0;
					    u_xlat0 = u_xlat0 * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.x + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.z + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.w + u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat3.x = dot((-in_POSITION0.xyz), (-in_POSITION0.xyz));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _Time.z * _Speed;
					    u_xlat3.x = u_xlat3.x * 0.400000006 + u_xlat6;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * _Height;
					    u_xlat3.x = u_xlat3.x * RandomX;
					    u_xlat16_1 = _MaxLegth + -1.0;
					    u_xlatb6 = u_xlat16_1<in_POSITION0.z;
					    u_xlatb9 = in_POSITION0.z<1.0;
					    u_xlatb6 = u_xlatb6 || u_xlatb9;
					    u_xlat3.x = (u_xlatb6) ? 0.0 : u_xlat3.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat6 = u_xlat3.x + u_xlat1.y;
					    vs_POSITION1.y = u_xlat3.x;
					    u_xlat3.xyz = vec3(u_xlat6) * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_POSITION1.xzw = in_POSITION0.xzw;
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
					uniform 	mediump float _Brightness;
					uniform 	mediump vec3 _LightColor;
					uniform 	mediump float _FactorWave;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = vs_POSITION1.y / _FactorWave;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * 0.5 + 0.100000001;
					    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = _LightColor.xyz * vec3(_Brightness) + (-u_xlat1.xyz);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + u_xlat1.xyz;
					    SV_Target0 = u_xlat1;
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					bool u_xlatb6;
					bool u_xlatb9;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat0;
					    u_xlat0 = u_xlat0 * in_POSITION0.y;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.x + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.z + u_xlat0;
					    u_xlat3.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat3.x;
					    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat3.x;
					    u_xlat0 = u_xlat3.x * in_POSITION0.w + u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat3.x = dot((-in_POSITION0.xyz), (-in_POSITION0.xyz));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _Time.z * _Speed;
					    u_xlat3.x = u_xlat3.x * 0.400000006 + u_xlat6;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * _Height;
					    u_xlat3.x = u_xlat3.x * RandomX;
					    u_xlat16_1 = _MaxLegth + -1.0;
					    u_xlatb6 = u_xlat16_1<in_POSITION0.z;
					    u_xlatb9 = in_POSITION0.z<1.0;
					    u_xlatb6 = u_xlatb6 || u_xlatb9;
					    u_xlat3.x = (u_xlatb6) ? 0.0 : u_xlat3.x;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlat6 = u_xlat3.x + u_xlat1.y;
					    vs_POSITION1.y = u_xlat3.x;
					    u_xlat3.xyz = vec3(u_xlat6) * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat3.xyz;
					    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_POSITION1.xzw = in_POSITION0.xzw;
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
					uniform 	mediump float _Brightness;
					uniform 	mediump vec3 _LightColor;
					uniform 	mediump float _FactorWave;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					#define SV_Target0 gl_FragData[0]
					float u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = vs_POSITION1.y / _FactorWave;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * 0.5 + 0.100000001;
					    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = _LightColor.xyz * vec3(_Brightness) + (-u_xlat1.xyz);
					    u_xlat1.xyz = vec3(u_xlat0) * u_xlat2.xyz + u_xlat1.xyz;
					    SV_Target0 = u_xlat1;
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