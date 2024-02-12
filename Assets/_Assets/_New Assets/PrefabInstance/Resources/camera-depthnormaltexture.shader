Shader "Hidden/Camera-DepthNormalTexture" {
	Properties {
		_MainTex ("", 2D) = "white" {}
		_Cutoff ("", Float) = 0.5
		_Color ("", Vector) = (1,1,1,1)
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 42137
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
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
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
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
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "TransparentCutout" }
		Pass {
			Tags { "RenderType" = "TransparentCutout" }
			GpuProgramID 78610
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
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
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
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
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "TreeBark" }
		Pass {
			Tags { "RenderType" = "TreeBark" }
			GpuProgramID 141567
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute mediump vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat8 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
					    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
					    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
					    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat4 = in_COLOR0.y * 0.100000001;
					    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
					    u_xlat0.z = 0.300000012;
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat4;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat12 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * in_NORMAL0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
					    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in mediump vec4 in_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat8 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
					    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
					    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
					    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat4 = in_COLOR0.y * 0.100000001;
					    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
					    u_xlat0.z = 0.300000012;
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat4 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat4;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat12 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * in_NORMAL0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
					    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "TreeLeaf" }
		Pass {
			Tags { "RenderType" = "TreeLeaf" }
			GpuProgramID 235912
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute mediump vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					void main()
					{
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
					    u_xlat1 = u_xlat0 * in_NORMAL0.yyyy;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat2;
					    u_xlat1 = in_NORMAL0.xxxx * u_xlat2 + u_xlat1;
					    u_xlat24 = -abs(in_TANGENT0.w) + 1.0;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat24) + in_POSITION0.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * _TreeInstanceScale.xyz;
					    u_xlat26 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat4.y = u_xlat26 + in_COLOR0.x;
					    u_xlat26 = u_xlat4.y + in_COLOR0.y;
					    u_xlat4.x = dot(u_xlat3.xyz, vec3(u_xlat26));
					    u_xlat4 = u_xlat4.xxyy + _Time.yyyy;
					    u_xlat4 = u_xlat4 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat4 = fract(u_xlat4);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat4 = fract(u_xlat4);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat5 = abs(u_xlat4) * abs(u_xlat4);
					    u_xlat4 = -abs(u_xlat4) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat4 = u_xlat4 * u_xlat5;
					    u_xlat4.xy = u_xlat4.yw + u_xlat4.xz;
					    u_xlat5.xyz = u_xlat4.yyy * _Wind.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * in_TEXCOORD1.yyy;
					    u_xlat6.y = u_xlat4.y * in_TEXCOORD1.y;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat7;
					    u_xlat1 = in_NORMAL0.zzzz * u_xlat7 + u_xlat1;
					    u_xlat25 = dot(u_xlat1, u_xlat1);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat25) + (-in_NORMAL0.xyz);
					    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + in_NORMAL0.xyz;
					    u_xlat24 = in_COLOR0.y * 0.100000001;
					    u_xlat6.xz = u_xlat1.xz * vec2(u_xlat24);
					    u_xlat4.z = 0.300000012;
					    u_xlat4.xyz = u_xlat4.xzx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * _Wind.www + u_xlat3.xyz;
					    u_xlat3.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat3.xyz;
					    u_xlat24 = dot(_SquashPlaneNormal.xyz, u_xlat3.xyz);
					    u_xlat24 = u_xlat24 + _SquashPlaneNormal.w;
					    u_xlat4.xyz = (-vec3(u_xlat24)) * _SquashPlaneNormal.xyz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(_SquashAmount) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat4;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat4;
					    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat24 = inversesqrt(u_xlat24);
					    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(u_xlat7.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat3.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat3.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat3.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat3.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in mediump vec4 in_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					void main()
					{
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
					    u_xlat1 = u_xlat0 * in_NORMAL0.yyyy;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat2;
					    u_xlat1 = in_NORMAL0.xxxx * u_xlat2 + u_xlat1;
					    u_xlat24 = -abs(in_TANGENT0.w) + 1.0;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat24) + in_POSITION0.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * _TreeInstanceScale.xyz;
					    u_xlat26 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat4.y = u_xlat26 + in_COLOR0.x;
					    u_xlat26 = u_xlat4.y + in_COLOR0.y;
					    u_xlat4.x = dot(u_xlat3.xyz, vec3(u_xlat26));
					    u_xlat4 = u_xlat4.xxyy + _Time.yyyy;
					    u_xlat4 = u_xlat4 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat4 = fract(u_xlat4);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat4 = fract(u_xlat4);
					    u_xlat4 = u_xlat4 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat5 = abs(u_xlat4) * abs(u_xlat4);
					    u_xlat4 = -abs(u_xlat4) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat4 = u_xlat4 * u_xlat5;
					    u_xlat4.xy = u_xlat4.yw + u_xlat4.xz;
					    u_xlat5.xyz = u_xlat4.yyy * _Wind.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * in_TEXCOORD1.yyy;
					    u_xlat6.y = u_xlat4.y * in_TEXCOORD1.y;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat7;
					    u_xlat1 = in_NORMAL0.zzzz * u_xlat7 + u_xlat1;
					    u_xlat25 = dot(u_xlat1, u_xlat1);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat25) + (-in_NORMAL0.xyz);
					    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + in_NORMAL0.xyz;
					    u_xlat24 = in_COLOR0.y * 0.100000001;
					    u_xlat6.xz = u_xlat1.xz * vec2(u_xlat24);
					    u_xlat4.z = 0.300000012;
					    u_xlat4.xyz = u_xlat4.xzx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat4.xyz * _Wind.www + u_xlat3.xyz;
					    u_xlat3.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat3.xyz;
					    u_xlat24 = dot(_SquashPlaneNormal.xyz, u_xlat3.xyz);
					    u_xlat24 = u_xlat24 + _SquashPlaneNormal.w;
					    u_xlat4.xyz = (-vec3(u_xlat24)) * _SquashPlaneNormal.xyz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
					    u_xlat3.xyz = vec3(_SquashAmount) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat4;
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat4;
					    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat24 = inversesqrt(u_xlat24);
					    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(u_xlat7.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat3.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat3.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat3.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat3.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
			GpuProgramID 292131
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
			GpuProgramID 358409
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
			Cull Front
			GpuProgramID 426855
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = (-u_xlat0.xyz);
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = (-u_xlat0.xyz);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "TreeBillboard" }
		Pass {
			Tags { "RenderType" = "TreeBillboard" }
			Cull Off
			GpuProgramID 462453
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _TreeBillboardCameraRight;
					uniform 	vec4 _TreeBillboardCameraUp;
					uniform 	vec4 _TreeBillboardCameraFront;
					uniform 	vec4 _TreeBillboardCameraPos;
					uniform 	vec4 _TreeBillboardDistances;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec2 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
					    u_xlat1.xy = in_TEXCOORD1.xy;
					    u_xlat1.z = in_TEXCOORD0.y;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
					    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
					    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
					    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
					    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb1 = 0.0<in_TEXCOORD0.y;
					    vs_TEXCOORD0.y = u_xlatb1 ? 1.0 : float(0.0);
					    vs_TEXCOORD0.x = in_TEXCOORD0.x;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 1.0);
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + -0.00100000005;
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _TreeBillboardCameraRight;
					uniform 	vec4 _TreeBillboardCameraUp;
					uniform 	vec4 _TreeBillboardCameraFront;
					uniform 	vec4 _TreeBillboardCameraPos;
					uniform 	vec4 _TreeBillboardDistances;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec2 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_TreeBillboardDistances.x<u_xlat0.x);
					#else
					    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
					#endif
					    u_xlat1.xy = in_TEXCOORD1.xy;
					    u_xlat1.z = in_TEXCOORD0.y;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
					    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
					    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
					    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
					    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.0<in_TEXCOORD0.y);
					#else
					    u_xlatb1 = 0.0<in_TEXCOORD0.y;
					#endif
					    vs_TEXCOORD0.y = u_xlatb1 ? 1.0 : float(0.0);
					    vs_TEXCOORD0.x = in_TEXCOORD0.x;
					    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + -0.00100000005;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "GrassBillboard" }
		Pass {
			Tags { "RenderType" = "GrassBillboard" }
			Cull Off
			GpuProgramID 588872
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _CameraRight;
					uniform 	vec3 _CameraUp;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
					    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
					    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
					    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5 = (-u_xlat5) + _WaveAndDistance.w;
					    u_xlat5 = dot(_CameraPosition.ww, vec2(u_xlat5));
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    vs_COLOR0.w = u_xlat5;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * vs_COLOR0.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _CameraRight;
					uniform 	vec3 _CameraUp;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_WaveAndDistance.w<u_xlat0.x);
					#else
					    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
					#endif
					    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
					    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
					    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5 = (-u_xlat5) + _WaveAndDistance.w;
					    u_xlat5 = dot(_CameraPosition.ww, vec2(u_xlat5));
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
					#else
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					#endif
					    vs_COLOR0.w = u_xlat5;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "Grass" }
		Pass {
			Tags { "RenderType" = "Grass" }
			Cull Off
			GpuProgramID 632893
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
					    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
					    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat1 = u_xlat0 * u_xlat0;
					    u_xlat2 = u_xlat0 * u_xlat1;
					    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
					    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
					    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat0.x = u_xlat0.x * 0.699999988;
					    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
					    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    u_xlat1.y = in_POSITION0.y;
					    u_xlat0.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x) + _WaveAndDistance.w;
					    u_xlat0.x = dot(_CameraPosition.ww, u_xlat0.xx);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    vs_COLOR0.w = u_xlat0.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat2.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat2.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat2.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat2.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * vs_COLOR0.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
					    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
					    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat1 = u_xlat0 * u_xlat0;
					    u_xlat2 = u_xlat0 * u_xlat1;
					    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
					    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
					    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat0.x = u_xlat0.x * 0.699999988;
					    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
					    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    u_xlat1.y = in_POSITION0.y;
					    u_xlat0.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = (-u_xlat0.x) + _WaveAndDistance.w;
					    u_xlat0.x = dot(_CameraPosition.ww, u_xlat0.xx);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    vs_COLOR0.w = u_xlat0.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat2.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat2.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat2.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat2.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_Opaque" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_Opaque" }
			GpuProgramID 677073
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat10;
					float u_xlat21;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat1.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat1.xy = max(u_xlat1.xy, _zero2.xy);
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat2.z = u_xlat1.y * (-_V_CW_Bend.y);
					    u_xlat2.x = u_xlat1.x * _V_CW_Bend.x;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.xzw = u_xlat1.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.yyy + u_xlat1.xzw;
					    u_xlat1.xyz = u_xlat1.xyz + in_POSITION0.xyz;
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat2.y = 0.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat0.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat21) + u_xlat0.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat0.xyz = u_xlat0.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat0.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat0.yz;
					    u_xlat0.xyz = (-u_xlat2.yzx) + u_xlat0.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD0.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat10;
					float u_xlat21;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat1.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat1.xy = max(u_xlat1.xy, _zero2.xy);
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat2.z = u_xlat1.y * (-_V_CW_Bend.y);
					    u_xlat2.x = u_xlat1.x * _V_CW_Bend.x;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.xzw = u_xlat1.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.yyy + u_xlat1.xzw;
					    u_xlat1.xyz = u_xlat1.xyz + in_POSITION0.xyz;
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat2.y = 0.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat0.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat21) + u_xlat0.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat0.xyz = u_xlat0.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat0.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat0.yz;
					    u_xlat0.xyz = (-u_xlat2.yzx) + u_xlat0.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD0.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_TransparentCutout" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_TransparentCutout" }
			GpuProgramID 722888
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat10;
					float u_xlat21;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat1.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat1.xy = max(u_xlat1.xy, _zero2.xy);
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat2.z = u_xlat1.y * (-_V_CW_Bend.y);
					    u_xlat2.x = u_xlat1.x * _V_CW_Bend.x;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.xzw = u_xlat1.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.yyy + u_xlat1.xzw;
					    u_xlat1.xyz = u_xlat1.xyz + in_POSITION0.xyz;
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.y = 0.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat0.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat21) + u_xlat0.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat0.xyz = u_xlat0.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat0.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat0.yz;
					    u_xlat0.xyz = (-u_xlat2.yzx) + u_xlat0.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * _Color.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat10;
					float u_xlat21;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat1.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat1.xy = max(u_xlat1.xy, _zero2.xy);
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat2.z = u_xlat1.y * (-_V_CW_Bend.y);
					    u_xlat2.x = u_xlat1.x * _V_CW_Bend.x;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.xzw = u_xlat1.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.yyy + u_xlat1.xzw;
					    u_xlat1.xyz = u_xlat1.xyz + in_POSITION0.xyz;
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.y = 0.0;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat0.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat5.xyz = vec3(u_xlat21) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat21) + u_xlat0.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat0.xyz = u_xlat0.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat0.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat0.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat0.yz;
					    u_xlat0.xyz = (-u_xlat2.yzx) + u_xlat0.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_TreeBark" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_TreeBark" }
			GpuProgramID 800909
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute mediump vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					float u_xlat14;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat14 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat14));
					    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
					    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
					    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat7 = in_COLOR0.y * 0.100000001;
					    u_xlat3.xz = vec2(u_xlat7) * in_NORMAL0.xz;
					    u_xlat0.z = 0.300000012;
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in mediump vec4 in_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					float u_xlat14;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat14 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat14));
					    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
					    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
					    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
					    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat7 = in_COLOR0.y * 0.100000001;
					    u_xlat3.xz = vec2(u_xlat7) * in_NORMAL0.xz;
					    u_xlat0.z = 0.300000012;
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat4.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_TreeLeaf" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_TreeLeaf" }
			GpuProgramID 886118
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					attribute mediump vec4 in_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec2 u_xlat18;
					float u_xlat20;
					float u_xlat30;
					float u_xlat32;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat20 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat1;
					    u_xlat2 = u_xlat1 * in_NORMAL0.yyyy;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat3;
					    u_xlat2 = in_NORMAL0.xxxx * u_xlat3 + u_xlat2;
					    u_xlat30 = -abs(in_TANGENT0.w) + 1.0;
					    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat30) + in_POSITION0.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat4.xyz, vec3(u_xlat20));
					    u_xlat5 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat5 = u_xlat5 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = abs(u_xlat5) * abs(u_xlat5);
					    u_xlat5 = -abs(u_xlat5) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat5 = u_xlat5 * u_xlat6;
					    u_xlat0.xy = u_xlat5.yw + u_xlat5.xz;
					    u_xlat5.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * in_TEXCOORD1.yyy;
					    u_xlat6.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat0.z = 0.300000012;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat7;
					    u_xlat2 = in_NORMAL0.zzzz * u_xlat7 + u_xlat2;
					    u_xlat10 = dot(u_xlat2, u_xlat2);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat10) + (-in_NORMAL0.xyz);
					    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz + in_NORMAL0.xyz;
					    u_xlat10 = in_COLOR0.y * 0.100000001;
					    u_xlat6.xz = u_xlat2.xz * vec2(u_xlat10);
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat4.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat32 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat32 = u_xlat32 + _SquashPlaneNormal.w;
					    u_xlat4.xyz = (-vec3(u_xlat32)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat4.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat4.xyz = u_xlat4.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat5.xy = max(u_xlat5.xy, _zero2.xy);
					    u_xlat5.xy = u_xlat5.xy * u_xlat5.xy;
					    u_xlat6.z = u_xlat5.y * (-_V_CW_Bend.y);
					    u_xlat6.x = u_xlat5.x * _V_CW_Bend.x;
					    u_xlat5.xy = u_xlat6.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat5.xzw = u_xlat5.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat5.yyy + u_xlat5.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    u_xlat5 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat5 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat5;
					    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat8 = u_xlat5.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat5.xxxx + u_xlat8;
					    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat5.zzzz + u_xlat8;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat5.wwww + u_xlat8;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat8 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat8 = in_TANGENT0.xxxx * u_xlat3 + u_xlat8;
					    u_xlat8 = in_TANGENT0.zzzz * u_xlat7 + u_xlat8;
					    u_xlat0.x = dot(u_xlat8, u_xlat8);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx + (-in_TANGENT0.xyz);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + in_TANGENT0.xyz;
					    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat8.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xzy * vec3(u_xlat30) + u_xlat4.zyx;
					    u_xlat9.y = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat9.z = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat9.x = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat30 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat2.xyz = vec3(u_xlat30) * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.yzx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.zxy * u_xlat8.zxy + (-u_xlat9.xyz);
					    u_xlat2.xyz = (-u_xlat2.zxy) + u_xlat4.yzx;
					    u_xlat8.xy = u_xlat2.xx + (-_V_CW_Bias.xy);
					    u_xlat8.xy = max(u_xlat8.xy, _zero2.xy);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlat18.x = u_xlat8.y * (-_V_CW_Bend.y);
					    u_xlat18.y = u_xlat8.x * _V_CW_Bend.x;
					    u_xlat2.yz = u_xlat18.xy * vec2(0.00100000005, 0.00100000005) + u_xlat2.yz;
					    u_xlat6.y = 0.0;
					    u_xlat4.xyz = u_xlat6.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat4.yzx);
					    u_xlat6.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat8.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat8.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat0.xz = u_xlat8.xz * vec2(0.00100000005, 0.00100000005) + u_xlat0.zx;
					    u_xlat0.xyz = (-u_xlat4.xyz) + u_xlat0.xyz;
					    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat4.xyz);
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat2.z = dot(u_xlat7.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat5.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat5.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat5.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat5.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec4 _Wind;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in mediump vec4 in_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					float u_xlat10;
					vec2 u_xlat18;
					float u_xlat20;
					float u_xlat30;
					float u_xlat32;
					void main()
					{
					    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
					    u_xlat20 = u_xlat0.y + in_COLOR0.y;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat1;
					    u_xlat2 = u_xlat1 * in_NORMAL0.yyyy;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat3;
					    u_xlat2 = in_NORMAL0.xxxx * u_xlat3 + u_xlat2;
					    u_xlat30 = -abs(in_TANGENT0.w) + 1.0;
					    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat30) + in_POSITION0.xyz;
					    u_xlat4.xyz = u_xlat4.xyz * _TreeInstanceScale.xyz;
					    u_xlat0.x = dot(u_xlat4.xyz, vec3(u_xlat20));
					    u_xlat5 = u_xlat0.xxyy + _Time.yyyy;
					    u_xlat5 = u_xlat5 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat6 = abs(u_xlat5) * abs(u_xlat5);
					    u_xlat5 = -abs(u_xlat5) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat5 = u_xlat5 * u_xlat6;
					    u_xlat0.xy = u_xlat5.yw + u_xlat5.xz;
					    u_xlat5.xyz = u_xlat0.yyy * _Wind.xyz;
					    u_xlat5.xyz = u_xlat5.xyz * in_TEXCOORD1.yyy;
					    u_xlat6.y = u_xlat0.y * in_TEXCOORD1.y;
					    u_xlat0.z = 0.300000012;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat7;
					    u_xlat7 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat7;
					    u_xlat2 = in_NORMAL0.zzzz * u_xlat7 + u_xlat2;
					    u_xlat10 = dot(u_xlat2, u_xlat2);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat10) + (-in_NORMAL0.xyz);
					    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz + in_NORMAL0.xyz;
					    u_xlat10 = in_COLOR0.y * 0.100000001;
					    u_xlat6.xz = u_xlat2.xz * vec2(u_xlat10);
					    u_xlat0.xyz = u_xlat0.xzx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat4.xyz;
					    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
					    u_xlat32 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat32 = u_xlat32 + _SquashPlaneNormal.w;
					    u_xlat4.xyz = (-vec3(u_xlat32)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat4.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat4.xyz = u_xlat4.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat5.xy = max(u_xlat5.xy, _zero2.xy);
					    u_xlat5.xy = u_xlat5.xy * u_xlat5.xy;
					    u_xlat6.z = u_xlat5.y * (-_V_CW_Bend.y);
					    u_xlat6.x = u_xlat5.x * _V_CW_Bend.x;
					    u_xlat5.xy = u_xlat6.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat5.xzw = u_xlat5.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat5.yyy + u_xlat5.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    u_xlat5 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat5 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat5;
					    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat8 = u_xlat5.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat5.xxxx + u_xlat8;
					    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat5.zzzz + u_xlat8;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat5.wwww + u_xlat8;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat8 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat8 = in_TANGENT0.xxxx * u_xlat3 + u_xlat8;
					    u_xlat8 = in_TANGENT0.zzzz * u_xlat7 + u_xlat8;
					    u_xlat0.x = dot(u_xlat8, u_xlat8);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx + (-in_TANGENT0.xyz);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + in_TANGENT0.xyz;
					    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat8.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xzy * vec3(u_xlat30) + u_xlat4.zyx;
					    u_xlat9.y = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat9.z = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat9.x = dot(u_xlat2.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat30 = dot(u_xlat9.xyz, u_xlat9.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat2.xyz = vec3(u_xlat30) * u_xlat9.xyz;
					    u_xlat9.xyz = u_xlat8.yzx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.zxy * u_xlat8.zxy + (-u_xlat9.xyz);
					    u_xlat2.xyz = (-u_xlat2.zxy) + u_xlat4.yzx;
					    u_xlat8.xy = u_xlat2.xx + (-_V_CW_Bias.xy);
					    u_xlat8.xy = max(u_xlat8.xy, _zero2.xy);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlat18.x = u_xlat8.y * (-_V_CW_Bend.y);
					    u_xlat18.y = u_xlat8.x * _V_CW_Bend.x;
					    u_xlat2.yz = u_xlat18.xy * vec2(0.00100000005, 0.00100000005) + u_xlat2.yz;
					    u_xlat6.y = 0.0;
					    u_xlat4.xyz = u_xlat6.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat4.yzx);
					    u_xlat6.xy = u_xlat0.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat8.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat8.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat0.xz = u_xlat8.xz * vec2(0.00100000005, 0.00100000005) + u_xlat0.zx;
					    u_xlat0.xyz = (-u_xlat4.xyz) + u_xlat0.xyz;
					    u_xlat4.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat4.xyz);
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat30 = inversesqrt(u_xlat30);
					    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat0.xyz);
					    u_xlat2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat2.z = dot(u_xlat7.xyz, u_xlat0.xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat5.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat5.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat5.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat5.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "DisableBatching" = "true" "RenderType" = "CurvedWorld_TreeOpaque" }
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "CurvedWorld_TreeOpaque" }
			GpuProgramID 946786
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					varying highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD0.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
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
					varying highp vec4 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					out highp vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD0.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD0.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec4 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat1.xy = vs_TEXCOORD0.ww * vec2(1.0, 255.0);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.z = (-u_xlat1.y) * 0.00392156886 + u_xlat1.x;
					    u_xlat0.w = u_xlat1.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "DisableBatching" = "true" "RenderType" = "CurvedWorld_TreeTransparentCutout" }
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "CurvedWorld_TreeTransparentCutout" }
			GpuProgramID 986141
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    vs_TEXCOORD1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
		Pass {
			Tags { "DisableBatching" = "true" "RenderType" = "CurvedWorld_TreeTransparentCutout" }
			Cull Front
			GpuProgramID 1098330
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute mediump vec4 in_COLOR0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = (-u_xlat1.xyz);
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
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
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _TreeInstanceScale;
					uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
					uniform 	vec4 _SquashPlaneNormal;
					uniform 	float _SquashAmount;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in mediump vec4 in_COLOR0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					vec3 u_xlat11;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat21 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
					    u_xlat21 = u_xlat21 + _SquashPlaneNormal.w;
					    u_xlat1.xyz = (-vec3(u_xlat21)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].yzx;
					    u_xlat1.xyz = u_xlat1.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat2.xy = u_xlat1.yy + (-_V_CW_Bias.xy);
					    u_xlat2.xy = max(u_xlat2.xy, _zero2.xy);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat3.z = u_xlat2.y * (-_V_CW_Bend.y);
					    u_xlat3.x = u_xlat2.x * _V_CW_Bend.x;
					    u_xlat2.xy = u_xlat3.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat2.xzw = u_xlat2.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat2.yyy + u_xlat2.xzw;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat3.y = 0.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat1.xyz;
					    u_xlat3.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    u_xlat4.xy = in_NORMAL0.zx * vec2(0.0, 1.0);
					    u_xlat4.xy = in_NORMAL0.yz * vec2(1.0, 0.0) + (-u_xlat4.xy);
					    u_xlat11.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat4.xxx + u_xlat11.xyz;
					    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat5.xyz = vec3(u_xlat22) * u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xzy * vec3(u_xlat22) + u_xlat1.zyx;
					    u_xlat6.xyz = u_xlat3.xyz * u_xlat5.yzx;
					    u_xlat3.xyz = u_xlat3.zxy * u_xlat5.zxy + (-u_xlat6.xyz);
					    u_xlat1.xyz = u_xlat1.yzx + (-u_xlat3.zxy);
					    u_xlat3.xy = u_xlat1.xx + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat10.x = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat10.y = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat1.yz = u_xlat10.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.yz;
					    u_xlat1.xyz = (-u_xlat2.yzx) + u_xlat1.xyz;
					    u_xlat3.xy = u_xlat4.yy + (-_V_CW_Bias.xy);
					    u_xlat3.xy = max(u_xlat3.xy, _zero2.xy);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat5.z = u_xlat3.y * (-_V_CW_Bend.y);
					    u_xlat5.x = u_xlat3.x * _V_CW_Bend.x;
					    u_xlat4.xz = u_xlat5.xz * vec2(0.00100000005, 0.00100000005) + u_xlat4.zx;
					    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
					    u_xlat2.y = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
					    u_xlat2.z = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = (-u_xlat1.xyz);
					    u_xlat7 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat7;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_TreeBillboard" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_TreeBillboard" }
			Cull Off
			GpuProgramID 1143268
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _TreeBillboardCameraRight;
					uniform 	vec4 _TreeBillboardCameraUp;
					uniform 	vec4 _TreeBillboardCameraFront;
					uniform 	vec4 _TreeBillboardCameraPos;
					uniform 	vec4 _TreeBillboardDistances;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec2 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					float u_xlat6;
					bool u_xlatb6;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + (-_TreeBillboardCameraPos.xyz);
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlatb6 = _TreeBillboardDistances.x<u_xlat6;
					    u_xlat1.xy = in_TEXCOORD1.xy;
					    u_xlat1.z = in_TEXCOORD0.y;
					    u_xlat1.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
					    u_xlat6 = _TreeBillboardCameraPos.w * u_xlat6 + u_xlat1.y;
					    u_xlat0.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = abs(u_xlat1.xxx) * _TreeBillboardCameraFront.xyz;
					    u_xlat0.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * _TreeBillboardCameraUp.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb1 = 0.0<in_TEXCOORD0.y;
					    vs_TEXCOORD0.y = u_xlatb1 ? 1.0 : float(0.0);
					    vs_TEXCOORD0.x = in_TEXCOORD0.x;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 1.0);
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
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 + -0.00100000005;
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _TreeBillboardCameraRight;
					uniform 	vec4 _TreeBillboardCameraUp;
					uniform 	vec4 _TreeBillboardCameraFront;
					uniform 	vec4 _TreeBillboardCameraPos;
					uniform 	vec4 _TreeBillboardDistances;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec2 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					float u_xlat6;
					bool u_xlatb6;
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
					    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + (-_TreeBillboardCameraPos.xyz);
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(_TreeBillboardDistances.x<u_xlat6);
					#else
					    u_xlatb6 = _TreeBillboardDistances.x<u_xlat6;
					#endif
					    u_xlat1.xy = in_TEXCOORD1.xy;
					    u_xlat1.z = in_TEXCOORD0.y;
					    u_xlat1.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat6 = (-u_xlat1.y) + u_xlat1.z;
					    u_xlat6 = _TreeBillboardCameraPos.w * u_xlat6 + u_xlat1.y;
					    u_xlat0.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat1.xxx + u_xlat0.xyz;
					    u_xlat1.xyz = abs(u_xlat1.xxx) * _TreeBillboardCameraFront.xyz;
					    u_xlat0.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * _TreeBillboardCameraUp.www + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.0<in_TEXCOORD0.y);
					#else
					    u_xlatb1 = 0.0<in_TEXCOORD0.y;
					#endif
					    vs_TEXCOORD0.y = u_xlatb1 ? 1.0 : float(0.0);
					    vs_TEXCOORD0.x = in_TEXCOORD0.x;
					    u_xlat2.x = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 1.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 + -0.00100000005;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_Grass" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_Grass" }
			Cull Off
			GpuProgramID 1204031
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat15;
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
					    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat15 = in_COLOR0.w * _WaveAndDistance.z;
					    u_xlat2 = vec4(u_xlat15) * u_xlat1;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = (-u_xlat5.x) + _WaveAndDistance.w;
					    u_xlat5.x = dot(_CameraPosition.ww, u_xlat5.xx);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    vs_COLOR0.w = u_xlat5.x;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * vs_COLOR0.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat15;
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
					    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat15 = in_COLOR0.w * _WaveAndDistance.z;
					    u_xlat2 = vec4(u_xlat15) * u_xlat1;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = (-u_xlat5.x) + _WaveAndDistance.w;
					    u_xlat5.x = dot(_CameraPosition.ww, u_xlat5.xx);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
					#else
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					#endif
					    vs_COLOR0.w = u_xlat5.x;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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
	SubShader {
		Tags { "RenderType" = "CurvedWorld_GrassBillboard" }
		Pass {
			Tags { "RenderType" = "CurvedWorld_GrassBillboard" }
			Cull Off
			GpuProgramID 1255318
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _CameraRight;
					uniform 	vec3 _CameraUp;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					attribute mediump vec4 in_COLOR0;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlatb15 = _WaveAndDistance.w<u_xlat15;
					    u_xlat1.xy = (bool(u_xlatb15)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
					    u_xlat0.xyz = u_xlat1.xxx * _CameraRight.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.yyy * _CameraUp.xyz + u_xlat0.xyz;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = (-u_xlat5.x) + _WaveAndDistance.w;
					    u_xlat5.x = dot(_CameraPosition.ww, u_xlat5.xx);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    vs_COLOR0.w = u_xlat5.x;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform lowp sampler2D _MainTex;
					varying mediump vec4 vs_COLOR0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat10_0 * vs_COLOR0.w + (-_Cutoff);
					    u_xlatb0 = u_xlat16_1<0.0;
					    if(((int(u_xlatb0) * -1))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _WavingTint;
					uniform 	vec4 _WaveAndDistance;
					uniform 	vec4 _CameraPosition;
					uniform 	vec3 _CameraRight;
					uniform 	vec3 _CameraUp;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in mediump vec4 in_COLOR0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat15;
					bool u_xlatb15;
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
					    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(_WaveAndDistance.w<u_xlat15);
					#else
					    u_xlatb15 = _WaveAndDistance.w<u_xlat15;
					#endif
					    u_xlat1.xy = (bool(u_xlatb15)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
					    u_xlat0.xyz = u_xlat1.xxx * _CameraRight.xyz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.yyy * _CameraUp.xyz + u_xlat0.xyz;
					    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
					    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
					    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
					    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
					    u_xlat1 = fract(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
					    u_xlat2 = u_xlat1 * u_xlat1;
					    u_xlat3 = u_xlat1 * u_xlat2;
					    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
					    u_xlat3 = u_xlat2 * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
					    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
					    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
					    u_xlat15 = u_xlat15 * 0.699999988;
					    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
					    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
					    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = (-u_xlat5.x) + _WaveAndDistance.w;
					    u_xlat5.x = dot(_CameraPosition.ww, u_xlat5.xx);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
					#else
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					#endif
					    vs_COLOR0.w = u_xlat5.x;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
					    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
					    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.w;
					    vs_TEXCOORD1.w = (-u_xlat0.x);
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
					    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump float _Cutoff;
					uniform mediump sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					mediump float u_xlat16_1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
					    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat16_1<0.0);
					#else
					    u_xlatb0 = u_xlat16_1<0.0;
					#endif
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = vs_TEXCOORD1.z + 1.0;
					    u_xlat0.xy = vs_TEXCOORD1.xy / u_xlat0.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD1.ww * vec2(1.0, 255.0);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat0.z = (-u_xlat2.y) * 0.00392156886 + u_xlat2.x;
					    u_xlat0.w = u_xlat2.y;
					    SV_Target0 = u_xlat0;
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