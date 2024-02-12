Shader "Custom/Sky" {
	Properties {
		_GradientFade ("Fade", Float) = 1
		_GradientOffset ("Gradient offset", Float) = 0
	}
	SubShader {
		Tags { "QUEUE" = "Background+2000" "RenderType" = "Opaque" }
		Pass {
			Tags { "QUEUE" = "Background+2000" "RenderType" = "Opaque" }
			ZWrite Off
			Fog {
				Mode Off
			}
			GpuProgramID 34660
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat0.x = u_xlat0.y / u_xlat0.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    u_xlat2.x = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    vs_COLOR0.xyz = u_xlat0.xxx * u_xlat2.xyz + _SkyGradientBottomColor.xyz;
					    vs_COLOR0.w = 1.0;
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
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vs_COLOR0;
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
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat0.x = u_xlat0.y / u_xlat0.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    u_xlat2.x = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    vs_COLOR0.xyz = u_xlat0.xxx * u_xlat2.xyz + _SkyGradientBottomColor.xyz;
					    vs_COLOR0.w = 1.0;
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
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vs_COLOR0;
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
					uniform 	float _SkyGradientOffset;
					uniform 	vec4 _SkyGradientBottomColor;
					uniform 	vec4 _SkyGradientTopColor;
					attribute highp vec4 in_POSITION0;
					varying highp vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat0.x = u_xlat0.y / u_xlat0.w;
					    u_xlat0.x = u_xlat0.x + (-_SkyGradientOffset);
					    u_xlat2.x = (-_SkyGradientOffset) + 1.0;
					    u_xlat0.x = u_xlat0.x / u_xlat2.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2.xyz = (-_SkyGradientBottomColor.xyz) + _SkyGradientTopColor.xyz;
					    vs_COLOR0.xyz = u_xlat0.xxx * u_xlat2.xyz + _SkyGradientBottomColor.xyz;
					    vs_COLOR0.w = 1.0;
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
					varying highp vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vs_COLOR0;
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
	Fallback "Diffuse"
}