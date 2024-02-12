Shader "Hidden/VacuumShaders/Curved World/ShadowCaster Cutout" {
	Properties {
		[CurvedWorldLargeLabel] V_CW_Label_Albedo ("Albedo", Float) = 0
		_Color ("  Color", Vector) = (1,1,1,1)
		_MainTex ("  Map (RGB) Trans (A)", 2D) = "white" {}
		[CurvedWorldUVScroll] _V_CW_MainTex_Scroll ("    ", Vector) = (0,0,0,0)
		[CurvedWorldLargeLabel] V_CW_Label_Cutoff ("Cutout", Float) = 0
		_Cutoff ("  Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		Pass {
			Name "ShadowCaster"
			Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
			GpuProgramID 29526
			Program "vp" {
				SubProgram "gles " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					float u_xlat10;
					bool u_xlatb10;
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
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * unity_LightShadowBias.z;
					    u_xlat1.xyz = (-u_xlat2.xyz) * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlatb10 = unity_LightShadowBias.z!=0.0;
					    u_xlat0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat6 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
					uniform 	mediump float _Cutoff;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
					    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					float u_xlat10;
					bool u_xlatb10;
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
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * unity_LightShadowBias.z;
					    u_xlat1.xyz = (-u_xlat2.xyz) * u_xlat1.xxx + u_xlat0.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(unity_LightShadowBias.z!=0.0);
					#else
					    u_xlatb10 = unity_LightShadowBias.z!=0.0;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
					    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
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
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD0.xyz = u_xlat1.xyz + (-_LightPositionRange.xyz);
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 unity_LightShadowBias;
					uniform 	mediump float _Cutoff;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
					    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = min(u_xlat0.x, 0.999000013);
					    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
					    u_xlat0 = fract(u_xlat0);
					    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat10;
					bool u_xlatb10;
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
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * unity_LightShadowBias.z;
					    u_xlat1.xyz = (-u_xlat2.xyz) * u_xlat1.xxx + u_xlat0.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(unity_LightShadowBias.z!=0.0);
					#else
					    u_xlatb10 = unity_LightShadowBias.z!=0.0;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
					    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
					    gl_Position.xyw = u_xlat0.xyw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
					    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES3"
				}
			}
		}
	}
}