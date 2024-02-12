Shader "Mages/Alpha_diss" {
	Properties {
		_Texture ("Texture", 2D) = "white" {}
		_Tex_Color ("Tex_Color", Vector) = (0.5,0.5,0.5,1)
		_Tex_U_speed ("Tex_U_speed", Float) = 0
		_Tex_V_speed ("Tex_V_speed", Float) = 0
		[MaterialToggle] _Dissolve ("Dissolve", Float) = 1
		_Dissolve_Tex ("Dissolve_Tex", 2D) = "white" {}
		_Color_power ("Color_power", Float) = 1
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		LOD 100
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			GpuProgramID 4162
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute highp vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = in_TEXCOORD1;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	vec4 _Texture_ST;
					uniform 	vec4 _Tex_Color;
					uniform 	float _Tex_U_speed;
					uniform 	float _Tex_V_speed;
					uniform 	vec4 _Dissolve_Tex_ST;
					uniform 	mediump float _Dissolve;
					uniform 	float _Color_power;
					uniform lowp sampler2D _Texture;
					uniform lowp sampler2D _Dissolve_Tex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD1;
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
					    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
					    u_xlatb0 = u_xlat0.x>=vs_TEXCOORD1.x;
					    u_xlat2.x = (-_Dissolve) + 1.0;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat2.xy = vec2(_Tex_U_speed, _Tex_V_speed) * _Time.yy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat2.xy * _Texture_ST.xy + _Texture_ST.zw;
					    u_xlat10_1 = texture2D(_Texture, u_xlat2.xy);
					    u_xlat2.x = u_xlat10_1.w * vs_COLOR0.w;
					    SV_Target0.w = u_xlat0.x * u_xlat2.x;
					    u_xlat0.xyz = _Tex_Color.xyz * vec3(_Color_power);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
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
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "ShadowCaster"
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Cull Off
			Offset 1, 1
			GpuProgramID 85149
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
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
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
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
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD0;
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
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					void main()
					{
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
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "SHADOWS_DEPTH" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "SHADOWS_CUBE" }
					"!!GLES"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}