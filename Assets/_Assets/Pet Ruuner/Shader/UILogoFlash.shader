Shader "UI/LogoFlash" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			GpuProgramID 51900
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
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
					uniform 	vec4 _Time;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Time.y * 0.333333343;
					    u_xlati0 = int(u_xlat0.x);
					    u_xlati0 = u_xlati0 * 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = (-u_xlat0.x) + _Time.y;
					    u_xlat2.x = u_xlat0.x + -2.0;
					    u_xlatb0 = 2.0<u_xlat0.x;
					    u_xlat4 = u_xlat2.x * 1.42857146 + -0.0500000007;
					    u_xlat2.y = (-vs_TEXCOORD0.y) * 0.268664062 + u_xlat4;
					    u_xlat6 = vs_TEXCOORD0.y * 0.268664062;
					    u_xlat2.x = u_xlat2.x * 1.42857146 + (-u_xlat6);
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0299999993, 0.0299999993);
					    u_xlat6 = u_xlat2.x + u_xlat2.y;
					    u_xlatb4 = u_xlat2.y<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat2.x;
					    u_xlatb2 = u_xlatb2 && u_xlatb4;
					    u_xlat4 = (-u_xlat6) * 0.5 + vs_TEXCOORD0.x;
					    u_xlat4 = -abs(u_xlat4) * 2.0 + 0.0500000007;
					    u_xlat4 = u_xlat4 * 20.0;
					    u_xlati2 = u_xlatb2 ? int(u_xlat4) : int(0);
					    u_xlat0.x = u_xlatb0 ? float(u_xlati2) : float(0.0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0.xxxx + u_xlat10_1;
					    u_xlatb1 = 0.5<u_xlat10_1.w;
					    SV_Target0 = bool(u_xlatb1) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
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
					uniform 	vec4 _Time;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Time.y * 0.333333343;
					    u_xlati0 = int(u_xlat0.x);
					    u_xlati0 = u_xlati0 * 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = (-u_xlat0.x) + _Time.y;
					    u_xlat2.x = u_xlat0.x + -2.0;
					    u_xlatb0 = 2.0<u_xlat0.x;
					    u_xlat4 = u_xlat2.x * 1.42857146 + -0.0500000007;
					    u_xlat2.y = (-vs_TEXCOORD0.y) * 0.268664062 + u_xlat4;
					    u_xlat6 = vs_TEXCOORD0.y * 0.268664062;
					    u_xlat2.x = u_xlat2.x * 1.42857146 + (-u_xlat6);
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0299999993, 0.0299999993);
					    u_xlat6 = u_xlat2.x + u_xlat2.y;
					    u_xlatb4 = u_xlat2.y<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat2.x;
					    u_xlatb2 = u_xlatb2 && u_xlatb4;
					    u_xlat4 = (-u_xlat6) * 0.5 + vs_TEXCOORD0.x;
					    u_xlat4 = -abs(u_xlat4) * 2.0 + 0.0500000007;
					    u_xlat4 = u_xlat4 * 20.0;
					    u_xlati2 = u_xlatb2 ? int(u_xlat4) : int(0);
					    u_xlat0.x = u_xlatb0 ? float(u_xlati2) : float(0.0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0.xxxx + u_xlat10_1;
					    u_xlatb1 = 0.5<u_xlat10_1.w;
					    SV_Target0 = bool(u_xlatb1) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
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
					uniform 	vec4 _Time;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _Time.y * 0.333333343;
					    u_xlati0 = int(u_xlat0.x);
					    u_xlati0 = u_xlati0 * 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat0.x = (-u_xlat0.x) + _Time.y;
					    u_xlat2.x = u_xlat0.x + -2.0;
					    u_xlatb0 = 2.0<u_xlat0.x;
					    u_xlat4 = u_xlat2.x * 1.42857146 + -0.0500000007;
					    u_xlat2.y = (-vs_TEXCOORD0.y) * 0.268664062 + u_xlat4;
					    u_xlat6 = vs_TEXCOORD0.y * 0.268664062;
					    u_xlat2.x = u_xlat2.x * 1.42857146 + (-u_xlat6);
					    u_xlat2.xy = u_xlat2.xy + vec2(0.0299999993, 0.0299999993);
					    u_xlat6 = u_xlat2.x + u_xlat2.y;
					    u_xlatb4 = u_xlat2.y<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat2.x;
					    u_xlatb2 = u_xlatb2 && u_xlatb4;
					    u_xlat4 = (-u_xlat6) * 0.5 + vs_TEXCOORD0.x;
					    u_xlat4 = -abs(u_xlat4) * 2.0 + 0.0500000007;
					    u_xlat4 = u_xlat4 * 20.0;
					    u_xlati2 = u_xlatb2 ? int(u_xlat4) : int(0);
					    u_xlat0.x = u_xlatb0 ? float(u_xlati2) : float(0.0);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0.xxxx + u_xlat10_1;
					    u_xlatb1 = 0.5<u_xlat10_1.w;
					    SV_Target0 = bool(u_xlatb1) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
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