Shader "Hidden/VacuumShaders/Curved World/VertexLit/Diffuse" {
	Properties {
		[CurvedWorldGearMenu] V_CW_Label_Tag ("", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Default Visual Options", Float) = 0
		[CurvedWorldLargeLabel] V_CW_Label_Albedo ("Albedo", Float) = 0
		_Color ("  Color", Vector) = (1,1,1,1)
		_MainTex ("  Map", 2D) = "white" {}
		[CurvedWorldUVScroll] _V_CW_MainTex_Scroll ("    ", Vector) = (0,0,0,0)
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Curved World Optionals", Float) = 0
		[HideInInspector] _V_CW_Rim_Color ("", Vector) = (1,1,1,1)
		[HideInInspector] _V_CW_Rim_Bias ("", Range(-1, 1)) = 0.2
		[HideInInspector] _V_CW_Rim_Power ("", Range(0.5, 8)) = 3
	}
	SubShader {
		LOD 150
		Tags { "CurvedWorldAvailableOptions" = "V_CW_VERTEX_COLOR;V_CW_RIM;V_CW_FOG;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "VertexLit/Diffuse" "RenderType" = "CurvedWorld_Opaque" }
		Pass {
			LOD 150
			Tags { "CurvedWorldAvailableOptions" = "V_CW_VERTEX_COLOR;V_CW_RIM;V_CW_FOG;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "VertexLit/Diffuse" "LIGHTMODE" = "Vertex" "RenderType" = "CurvedWorld_Opaque" }
			Lighting On
			GpuProgramID 51407
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
					#else
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					#endif
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
					#else
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					#endif
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
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
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat5.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat5.xy;
					    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
					#else
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					#endif
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TANGENT0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat6.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat6.xy;
					    u_xlat6.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD3 = u_xlat5.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat5;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
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
					uniform 	mediump vec4 unity_FogColor;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp float vs_TEXCOORD3;
					varying mediump vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 unity_LightPosition[8];
					uniform 	mediump vec4 unity_LightAtten[8];
					uniform 	vec4 unity_SpotDirection[8];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TANGENT0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp float vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					mediump vec3 u_xlat16_8;
					vec2 u_xlat16;
					vec2 u_xlat24;
					float u_xlat27;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					void main()
					{
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
					    u_xlat3.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat3.xyz;
					    u_xlat4.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat4.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat4.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat27 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat4.xyz = vec3(u_xlat27) * u_xlat4.xyz;
					    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat5.xyz;
					    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat5.xyz;
					    u_xlat27 = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat5.xyz;
					    u_xlat7.xyz = u_xlat4.xyz * u_xlat6.yzx;
					    u_xlat4.xyz = u_xlat4.zxy * u_xlat6.zxy + (-u_xlat7.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + (-_V_CW_PivotPoint_Position.yzx);
					    u_xlat5.xyz = u_xlat5.xzy * vec3(u_xlat27) + u_xlat3.zyx;
					    u_xlat4.xyz = (-u_xlat4.zxy) + u_xlat3.yzx;
					    u_xlat6.xy = u_xlat3.yy + (-_V_CW_Bias.xy);
					    u_xlat6.xy = max(u_xlat6.xy, _zero2.xy);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat7.z = u_xlat6.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat6.x * _V_CW_Bend.x;
					    u_xlat7.y = 0.0;
					    u_xlat6.xy = u_xlat7.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat3.xyz = u_xlat7.xyz * vec3(0.00100000005, 0.00100000005, 0.00100000005) + u_xlat3.xyz;
					    u_xlat24.xy = u_xlat5.yy + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat7.z = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat7.x = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat5.xz = u_xlat7.xz * vec2(0.00100000005, 0.00100000005) + u_xlat5.zx;
					    u_xlat24.xy = u_xlat4.xx + (-_V_CW_Bias.xy);
					    u_xlat24.xy = max(u_xlat24.xy, _zero2.xy);
					    u_xlat24.xy = u_xlat24.xy * u_xlat24.xy;
					    u_xlat16.x = u_xlat24.y * (-_V_CW_Bend.y);
					    u_xlat16.y = u_xlat24.x * _V_CW_Bend.x;
					    u_xlat4.yz = u_xlat16.xy * vec2(0.00100000005, 0.00100000005) + u_xlat4.yz;
					    u_xlat6.xzw = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat6.yyy + u_xlat6.xzw;
					    u_xlat6.xyz = u_xlat6.xyz + in_POSITION0.xyz;
					    u_xlat4.xyz = (-u_xlat3.yzx) + u_xlat4.xyz;
					    u_xlat3.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat5.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat4.zxy * u_xlat3.yzx + (-u_xlat5.xyz);
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat3.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat3.zzz + u_xlat3.xyw;
					    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
					    u_xlat4 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat4;
					    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat4;
					    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
					    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
					    u_xlat6.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat6.xy;
					    u_xlat6.xyz = u_xlat4.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat4.xxx + u_xlat6.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat4.zzz + u_xlat6.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat4.www + u_xlat4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
					    u_xlat0.y = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.z = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
					    u_xlat16_8.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat1.xyz = u_xlat16_8.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xyz = (-u_xlat4.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
					        u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat28 = max(u_xlat28, 9.99999997e-07);
					        u_xlat29 = inversesqrt(u_xlat28);
					        u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					        u_xlat28 = u_xlat28 * unity_LightAtten[u_xlati_loop_1].z + 1.0;
					        u_xlat28 = float(1.0) / u_xlat28;
					        u_xlat29 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat29 = u_xlat29 + (-unity_LightAtten[u_xlati_loop_1].x);
					        u_xlat29 = u_xlat29 * unity_LightAtten[u_xlati_loop_1].y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
					#else
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					#endif
					        u_xlat28 = u_xlat28 * u_xlat29;
					        u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					        u_xlat2.x = max(u_xlat2.x, 0.0);
					        u_xlat28 = u_xlat28 * u_xlat2.x;
					        u_xlat1.xyz = unity_LightColor[u_xlati_loop_1].xyz * vec3(u_xlat28) + u_xlat1.xyz;
					    }
					    vs_TEXCOORD3 = u_xlat5.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat5;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.w = 1.0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_FogColor;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp float vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					float u_xlat3;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_TEXCOORD1.xyz + (-unity_FogColor.xyz);
					    u_xlat3 = vs_TEXCOORD3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
					#else
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
			}
		}
		Pass {
			LOD 150
			Tags { "CurvedWorldAvailableOptions" = "V_CW_VERTEX_COLOR;V_CW_RIM;V_CW_FOG;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "VertexLit/Diffuse" "LIGHTMODE" = "VertexLM" "RenderType" = "CurvedWorld_Opaque" }
			GpuProgramID 85446
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    u_xlat0.x = vs_TEXCOORD3;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in highp float vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    u_xlat0.x = vs_TEXCOORD3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
			}
		}
		Pass {
			LOD 150
			Tags { "CurvedWorldAvailableOptions" = "V_CW_VERTEX_COLOR;V_CW_RIM;V_CW_FOG;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "VertexLit/Diffuse" "LIGHTMODE" = "VertexLMRGBM" "RenderType" = "CurvedWorld_Opaque" }
			GpuProgramID 189168
			Program "vp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					attribute highp vec4 in_TEXCOORD1;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
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
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform lowp sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					varying highp vec2 vs_TEXCOORD0;
					varying mediump vec2 vs_TEXCOORD1;
					varying highp float vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    u_xlat0.x = vs_TEXCOORD3;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	vec4 _MainTex_ST;
					uniform 	mediump vec2 _V_CW_MainTex_Scroll;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out highp float vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = _V_CW_MainTex_Scroll.xy * _Time.xx + u_xlat0.xy;
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD1.xy = u_xlat0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	mediump vec4 unity_Lightmap_HDR;
					uniform 	mediump vec4 _Color;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D unity_Lightmap;
					in highp vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in highp float vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.xyz;
					    u_xlat16_1.xyz = texture(unity_Lightmap, vs_TEXCOORD1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
					    u_xlat0.x = vs_TEXCOORD3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG_OFF" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "FOG_LINEAR" "V_CW_VERTEX_COLOR_OFF" "V_CW_RIM_OFF" "V_CW_FOG" }
					"!!GLES3"
				}
			}
		}
		Pass {
			Name "ShadowCaster"
			LOD 150
			Tags { "CurvedWorldAvailableOptions" = "V_CW_VERTEX_COLOR;V_CW_RIM;V_CW_FOG;" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "VertexLit/Diffuse" "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "CurvedWorld_Opaque" "SHADOWSUPPORT" = "true" }
			GpuProgramID 233480
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
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
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
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
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
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
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
					attribute highp vec4 in_POSITION0;
					varying highp vec3 vs_TEXCOORD0;
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
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
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
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
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
	CustomEditor "CurvedWorld_Material_Editor"
}