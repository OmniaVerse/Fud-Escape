Shader "Water/TextureNormal/ReflectCurved" {
	Properties {
		_MainTex ("Main Texture", 2D) = "black" {}
		_AmbientMultiplier ("Ambient strength", Range(0, 10)) = 1
		_Transparency ("Transparency", Range(0, 1)) = 0.8
		_NormalStrength ("Normal strength", Range(0, 1)) = 1
		_NormalTex ("Normalmap", 2D) = "blue" {}
		_LightDir ("LightDirection", Vector) = (0,1,0,1)
		_Shininess ("Shininess", Float) = 200
		_Movement ("Movement", Vector) = (0.01,0.01,-0.01,0)
		_UVOffset ("Auto.gen", Vector) = (0,0,0,0)
		_ReflectionTex ("Reflection", 2D) = "black" {}
		_Reflectivity ("Reflectivity", Float) = 0
		_Refraction ("Refraction", Float) = 2
	}
	SubShader {
		Tags { "QUEUE" = "Transparent-1" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent-1" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 13547
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _NormalTex_ST;
					uniform 	vec4 _UVOffset;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD3;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_TEXCOORD0.xyxy * _NormalTex_ST.xyxy + _NormalTex_ST.zwzw;
					    vs_TEXCOORD2 = u_xlat0 + _UVOffset;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = u_xlat0.xy + _UVOffset.xy;
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
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	float _AmbientMultiplier;
					uniform 	float _NormalStrength;
					uniform 	float _Shininess;
					uniform 	vec4 _LightDir;
					uniform 	float _Transparency;
					uniform 	float _Reflectivity;
					uniform 	float _Refraction;
					uniform lowp sampler2D _NormalTex;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _MainTex;
					varying highp vec4 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec2 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					vec4 u_xlat2;
					lowp vec2 u_xlat10_2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					float u_xlat5;
					float u_xlat7;
					float u_xlat15;
					float u_xlat17;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_NormalTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xzy * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xz = u_xlat16_1.xz * vec2(vec2(_NormalStrength, _NormalStrength));
					    u_xlat0.w = u_xlat16_1.y * _NormalStrength + (-_NormalStrength);
					    u_xlat0.xyz = u_xlat0.xwz + vec3(0.0, 1.0, 0.0);
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat10_2.xy = texture2D(_NormalTex, vs_TEXCOORD2.zw).xy;
					    u_xlat16_1.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xz = u_xlat16_1.xy * vec2(vec2(_NormalStrength, _NormalStrength));
					    u_xlat2.xz = clamp(u_xlat2.xz, 0.0, 1.0);
					    u_xlat2.y = 0.0;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat15 = dot(_LightDir.xyz, _LightDir.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * _LightDir.xyz;
					    u_xlat15 = dot((-u_xlat3.xyz), u_xlat2.xyz);
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat2.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat3.xyz);
					    u_xlat5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.xzw = u_xlat0.xzz * vec3(vec3(_Refraction, _Refraction, _Refraction)) + vs_TEXCOORD0.xyw;
					    u_xlat0.xz = u_xlat0.xz / u_xlat0.ww;
					    u_xlat10_0.xzw = texture2D(_ReflectionTex, u_xlat0.xz).xyz;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat3.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = -abs(u_xlat3.y) + _Reflectivity;
					    u_xlat7 = u_xlat7 + 1.0;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _Shininess;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.5;
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat3.xyz = u_xlat16_1.xyz * vec3(_AmbientMultiplier);
					    u_xlat3.xyz = max(vec3(u_xlat5), u_xlat3.xyz);
					    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD3.xy).xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat10_4.xyz;
					    u_xlat5 = (-u_xlat7) + 1.0;
					    u_xlat2.xzw = u_xlat3.xyz * vec3(u_xlat5) + u_xlat2.xxx;
					    SV_Target0.xyz = u_xlat10_0.xzw * vec3(u_xlat7) + u_xlat2.xzw;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
					    SV_Target0.w = _Transparency;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _NormalTex_ST;
					uniform 	vec4 _UVOffset;
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_TEXCOORD0.xyxy * _NormalTex_ST.xyxy + _NormalTex_ST.zwzw;
					    vs_TEXCOORD2 = u_xlat0 + _UVOffset;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD3.xy = u_xlat0.xy + _UVOffset.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	float _AmbientMultiplier;
					uniform 	float _NormalStrength;
					uniform 	float _Shininess;
					uniform 	vec4 _LightDir;
					uniform 	float _Transparency;
					uniform 	float _Reflectivity;
					uniform 	float _Refraction;
					uniform mediump sampler2D _NormalTex;
					uniform mediump sampler2D _ReflectionTex;
					uniform mediump sampler2D _MainTex;
					in highp vec4 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec2 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					float u_xlat7;
					float u_xlat15;
					float u_xlat17;
					void main()
					{
					    u_xlat16_0.xyz = texture(_NormalTex, vs_TEXCOORD2.xy).xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xzy * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xz = u_xlat16_1.xz * vec2(vec2(_NormalStrength, _NormalStrength));
					    u_xlat0.w = u_xlat16_1.y * _NormalStrength + (-_NormalStrength);
					    u_xlat0.xyz = u_xlat0.xwz + vec3(0.0, 1.0, 0.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
					#else
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					#endif
					    u_xlat16_2.xy = texture(_NormalTex, vs_TEXCOORD2.zw).xy;
					    u_xlat16_1.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xz = u_xlat16_1.xy * vec2(vec2(_NormalStrength, _NormalStrength));
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xz = min(max(u_xlat2.xz, 0.0), 1.0);
					#else
					    u_xlat2.xz = clamp(u_xlat2.xz, 0.0, 1.0);
					#endif
					    u_xlat2.y = 0.0;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat15 = dot(_LightDir.xyz, _LightDir.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat3.xyz = vec3(u_xlat15) * _LightDir.xyz;
					    u_xlat15 = dot((-u_xlat3.xyz), u_xlat2.xyz);
					    u_xlat15 = u_xlat15 + u_xlat15;
					    u_xlat2.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat3.xyz);
					    u_xlat5 = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.xzw = u_xlat0.xzz * vec3(vec3(_Refraction, _Refraction, _Refraction)) + vs_TEXCOORD0.xyw;
					    u_xlat0.xz = u_xlat0.xz / u_xlat0.ww;
					    u_xlat16_0.xzw = texture(_ReflectionTex, u_xlat0.xz).xyz;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat3.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
					#else
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					#endif
					    u_xlat7 = -abs(u_xlat3.y) + _Reflectivity;
					    u_xlat7 = u_xlat7 + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
					#else
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					#endif
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _Shininess;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.5;
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat3.xyz = u_xlat16_1.xyz * vec3(_AmbientMultiplier);
					    u_xlat3.xyz = max(vec3(u_xlat5), u_xlat3.xyz);
					    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD3.xy).xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
					    u_xlat5 = (-u_xlat7) + 1.0;
					    u_xlat2.xzw = u_xlat3.xyz * vec3(u_xlat5) + u_xlat2.xxx;
					    SV_Target0.xyz = u_xlat16_0.xzw * vec3(u_xlat7) + u_xlat2.xzw;
					#ifdef UNITY_ADRENO_ES3
					    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
					#else
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
					#endif
					    SV_Target0.w = _Transparency;
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
	Fallback "Diffuse"
}