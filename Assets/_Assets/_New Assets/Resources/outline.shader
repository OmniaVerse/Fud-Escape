Shader "Hidden/VacuumShaders/Curved World/Outline" {
	Properties {
		_V_CW_OutlineColor ("Outline Color", Vector) = (0,0,0,1)
		_V_CW_OutlineWidth ("Outline width", Float) = 0.005
	}
	SubShader {
		Pass {
			Name "OUTLINE"
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			Cull Front
			GpuProgramID 49857
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	float _V_CW_OutlineWidth;
					uniform 	vec4 _V_CW_OutlineColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying mediump vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat6.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * u_xlat6.xx + u_xlat0.xy;
					    u_xlat6.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat6.xy = u_xlat6.xx + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat1.x = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = u_xlat1 + in_POSITION0;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat0.xy = u_xlat0.xy / u_xlat6.xx;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.zz;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_V_CW_OutlineWidth, _V_CW_OutlineWidth));
					    gl_Position.xy = u_xlat0.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_COLOR0 = _V_CW_OutlineColor;
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
					varying mediump vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	float _V_CW_OutlineWidth;
					uniform 	vec4 _V_CW_OutlineColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying mediump vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat6.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * u_xlat6.xx + u_xlat0.xy;
					    u_xlat6.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat6.xy = u_xlat6.xx + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat1.x = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = u_xlat1 + in_POSITION0;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat0.xy = u_xlat0.xy / u_xlat6.xx;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.zz;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_V_CW_OutlineWidth, _V_CW_OutlineWidth));
					    gl_Position.xy = u_xlat0.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_COLOR0 = _V_CW_OutlineColor;
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
					varying mediump vec4 vs_COLOR0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0 = vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	float _V_CW_OutlineWidth;
					uniform 	vec4 _V_CW_OutlineColor;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying mediump vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = u_xlat0.xx * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
					    u_xlat6.x = dot(u_xlat1.xyz, in_NORMAL0.xyz);
					    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * u_xlat6.xx + u_xlat0.xy;
					    u_xlat6.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[0].z * in_POSITION0.x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[2].z * in_POSITION0.z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[3].z * in_POSITION0.w + u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + (-_V_CW_PivotPoint_Position.z);
					    u_xlat6.xy = u_xlat6.xx + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat1.x = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat1.y = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_WorldToObject[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = u_xlat1 + in_POSITION0;
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat0.xy = u_xlat0.xy / u_xlat6.xx;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.zz;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_V_CW_OutlineWidth, _V_CW_OutlineWidth));
					    gl_Position.xy = u_xlat0.xy * vec2(0.00100000005, 0.00100000005) + u_xlat1.xy;
					    gl_Position.zw = u_xlat1.zw;
					    vs_COLOR0 = _V_CW_OutlineColor;
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
					varying mediump vec4 vs_COLOR0;
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
				SubProgram "gles " {
					Keywords { "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles " {
					Keywords { "FOG_EXP2" "V_CW_FOG_OFF" }
					"!!GLES"
				}
			}
		}
	}
}