Shader "ScratchCard/MaskProgress" {
	Properties {
		_MainTex ("Main", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 59216
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
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
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					int u_xlati1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					mediump float u_xlat16_3;
					float u_xlat4;
					bool u_xlatb4;
					lowp float u_xlat10_5;
					int u_xlati8;
					float u_xlat11;
					bool u_xlatb11;
					void main()
					{
					    u_xlat16_0 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
					    {
					        u_xlat4 = float(u_xlati_loop_1);
					        u_xlat2.x = u_xlat4 * 0.0666666701;
					        u_xlat16_3 = u_xlat16_0;
					        u_xlati8 = 0;
					        for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
					            u_xlatb11 = u_xlati8>=16;
					            if(u_xlatb11){break;}
					            u_xlat11 = float(u_xlati8);
					            u_xlat2.y = u_xlat11 * 0.0666666701;
					            u_xlat10_5 = texture2D(_MainTex, u_xlat2.xy).w;
					            u_xlat16_3 = u_xlat16_3 + u_xlat10_5;
					            u_xlati8 = u_xlati8 + 1;
					            u_xlat16_3 = u_xlat16_3;
					        }
					        u_xlat16_0 = u_xlat16_3;
					    }
					    u_xlat16_2 = u_xlat16_0 * 0.00390625;
					    SV_Target0.xyz = vec3(u_xlat16_2) * vs_COLOR0.xyz;
					    SV_Target0.w = vs_COLOR0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
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
					    vs_COLOR0 = in_COLOR0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					int u_xlati1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					mediump float u_xlat16_3;
					float u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_5;
					int u_xlati8;
					float u_xlat11;
					bool u_xlatb11;
					void main()
					{
					    u_xlat16_0 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
					    {
					        u_xlat4 = float(u_xlati_loop_1);
					        u_xlat2.x = u_xlat4 * 0.0666666701;
					        u_xlat16_3 = u_xlat16_0;
					        u_xlati8 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb11 = !!(u_xlati8>=16);
					#else
					            u_xlatb11 = u_xlati8>=16;
					#endif
					            if(u_xlatb11){break;}
					            u_xlat11 = float(u_xlati8);
					            u_xlat2.y = u_xlat11 * 0.0666666701;
					            u_xlat16_5 = texture(_MainTex, u_xlat2.xy).w;
					            u_xlat16_3 = u_xlat16_3 + u_xlat16_5;
					            u_xlati8 = u_xlati8 + 1;
					            u_xlat16_3 = u_xlat16_3;
					        }
					        u_xlat16_0 = u_xlat16_3;
					    }
					    u_xlat16_2 = u_xlat16_0 * 0.00390625;
					    SV_Target0.xyz = vec3(u_xlat16_2) * vs_COLOR0.xyz;
					    SV_Target0.w = vs_COLOR0.w;
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
			}
		}
	}
}