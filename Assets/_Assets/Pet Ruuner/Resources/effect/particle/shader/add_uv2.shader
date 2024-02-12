Shader "VFX/Add_UV2" {
	Properties {
		_Texture ("Texture", 2D) = "white" {}
		[HDR] _Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_U ("U", Float) = 0
		_V ("V", Float) = 0
		_Mask ("Mask", 2D) = "white" {}
		_Mask_U ("Mask_U", Float) = 0
		_Mask_V ("Mask_V", Float) = 0
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend One One, One One
			ZWrite Off
			GpuProgramID 37097
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
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
					    vs_TEXCOORD0 = in_TEXCOORD1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Mask_ST;
					uniform 	vec4 _Color;
					uniform 	float _V;
					uniform 	float _U;
					uniform 	float _Mask_U;
					uniform 	float _Mask_V;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Mask;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat4;
					lowp float u_xlat10_4;
					void main()
					{
					    u_xlat0 = vec4(_U, _V, _Mask_U, _Mask_V) * _Time.yyyy + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat4.xy = u_xlat0.zw * _Mask_ST.xy + _Mask_ST.zw;
					    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
					    u_xlat10_1 = texture2D(_Texture, u_xlat0.xy);
					    u_xlat1 = u_xlat10_1 * _Color;
					    u_xlat1 = u_xlat1 * vs_COLOR0;
					    u_xlat0.xyw = u_xlat1.www * u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat10_4) * u_xlat0.xyw;
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
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}