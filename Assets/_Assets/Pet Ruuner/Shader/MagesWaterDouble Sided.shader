Shader "Mages/Water/Double Sided" {
	Properties {
		[HDR] _Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_Tex ("Tex", 2D) = "white" {}
		_Diss ("Diss", 2D) = "black" {}
		_liangdu ("liangdu", Float) = 0.6
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
		Pass {
			Name "FORWARD"
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
			Cull Off
			GpuProgramID 23003
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform 	float _liangdu;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					const int BITWISE_BIT_COUNT = 32;
					int op_modi(int x, int y) { return x - y * (x / y); }
					ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
					ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
					ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }
					
					int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
					ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
					ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
					ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }
					
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD1.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat10_2 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    u_xlat0.x = float(op_and(int((gl_FrontFacing ? 1 : 0)), 1065353216));
					    u_xlat2.xyz = _Color.xyz * vec3(_liangdu);
					    u_xlat1.xyz = (-vec3(_liangdu)) * _Color.xyz + _Color.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "ShadowCaster"
			LOD 100
			Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
			Cull Off
			Offset 1, 1
			GpuProgramID 120591
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD1;
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
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD1;
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
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD1;
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
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec2 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
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
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
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
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD2 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_ST;
					uniform 	vec4 _Diss_ST;
					uniform lowp sampler2D _Tex;
					uniform lowp sampler2D _Diss;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					lowp float u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _Diss_ST.xy + _Diss_ST.zw;
					    u_xlat0.x = texture2D(_Diss, u_xlat0.xy).x;
					    u_xlatb0 = vs_TEXCOORD2.x>=u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD1.xy * _Tex_ST.xy + _Tex_ST.zw;
					    u_xlat10_1 = texture2D(_Tex, u_xlat1.xy).x;
					    u_xlat0.x = u_xlat10_1 * u_xlat0.x + -0.5;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(u_xlatb0){discard;}
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
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!GLES"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}