Shader "VacuumShaders/Curved World/Sprites/Default" {
	Properties {
		[CurvedWorldGearMenu] V_CW_Label_Tag ("", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Default Visual Options", Float) = 0
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Vector) = (1,1,1,1)
		[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
		[CurvedWorldLabel] V_CW_Label_UnityDefaults ("Curved World Optionals", Float) = 0
	}
	SubShader {
		Tags { "CanUseSpriteAtlas" = "true" "CurvedWorldAvailableOptions" = "" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Sprites/Default" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "CanUseSpriteAtlas" = "true" "CurvedWorldAvailableOptions" = "" "CurvedWorldNoneRemoveableKeywords" = "" "CurvedWorldTag" = "Sprites/Default" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 7448
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _Color;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = in_COLOR0 * _Color;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _AlphaSplitEnabled;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _AlphaTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp float u_xlat10_1;
					bool u_xlatb1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled);
					    if(u_xlatb1){
					        u_xlat10_1 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).x;
					        u_xlat16_2 = u_xlat10_1;
					    } else {
					        u_xlat16_2 = u_xlat10_0.w;
					    //ENDIF
					    }
					    u_xlat16_5.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
					    u_xlat16_2 = u_xlat16_2 * vs_COLOR0.w;
					    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_5.xyz;
					    SV_Target0.w = u_xlat16_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _Color;
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = in_COLOR0 * _Color;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	float _AlphaSplitEnabled;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _AlphaTex;
					in mediump vec4 vs_COLOR0;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					bool u_xlatb1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled));
					#else
					    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled);
					#endif
					    if(u_xlatb1){
					        u_xlat16_1 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
					        u_xlat16_2 = u_xlat16_1;
					    } else {
					        u_xlat16_2 = u_xlat16_0.w;
					    //ENDIF
					    }
					    u_xlat16_5.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
					    u_xlat16_2 = u_xlat16_2 * vs_COLOR0.w;
					    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_5.xyz;
					    SV_Target0.w = u_xlat16_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles " {
					Keywords { "PIXELSNAP_ON" }
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _Color;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_COLOR0;
					attribute highp vec2 in_TEXCOORD0;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
					vec2 roundEven(vec2 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); return a; }
					vec3 roundEven(vec3 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); return a; }
					vec4 roundEven(vec4 a) { a.x = roundEven(a.x); a.y = roundEven(a.y); a.z = roundEven(a.z); a.w = roundEven(a.w); return a; }
					
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
					    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
					    u_xlat0.xy = roundEven(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
					    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
					    gl_Position.zw = u_xlat0.zw;
					    u_xlat0 = in_COLOR0 * _Color;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _AlphaSplitEnabled;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _AlphaTex;
					varying mediump vec4 vs_COLOR0;
					varying mediump vec2 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					lowp float u_xlat10_1;
					bool u_xlatb1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled);
					    if(u_xlatb1){
					        u_xlat10_1 = texture2D(_AlphaTex, vs_TEXCOORD0.xy).x;
					        u_xlat16_2 = u_xlat10_1;
					    } else {
					        u_xlat16_2 = u_xlat10_0.w;
					    //ENDIF
					    }
					    u_xlat16_5.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
					    u_xlat16_2 = u_xlat16_2 * vs_COLOR0.w;
					    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_5.xyz;
					    SV_Target0.w = u_xlat16_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 " {
					Keywords { "PIXELSNAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec3 _V_CW_Bend;
					uniform 	vec3 _V_CW_Bias;
					uniform 	vec4 _V_CW_PivotPoint_Position;
					uniform 	vec2 _zero2;
					uniform 	mediump vec4 _Color;
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
					    u_xlat0.xy = roundEven(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
					    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
					    gl_Position.zw = u_xlat0.zw;
					    u_xlat0 = in_COLOR0 * _Color;
					    vs_COLOR0 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					uniform 	float _AlphaSplitEnabled;
					uniform mediump sampler2D _MainTex;
					uniform mediump sampler2D _AlphaTex;
					in mediump vec4 vs_COLOR0;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump float u_xlat16_1;
					bool u_xlatb1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled));
					#else
					    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AlphaSplitEnabled);
					#endif
					    if(u_xlatb1){
					        u_xlat16_1 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
					        u_xlat16_2 = u_xlat16_1;
					    } else {
					        u_xlat16_2 = u_xlat16_0.w;
					    //ENDIF
					    }
					    u_xlat16_5.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
					    u_xlat16_2 = u_xlat16_2 * vs_COLOR0.w;
					    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_5.xyz;
					    SV_Target0.w = u_xlat16_2;
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
				SubProgram "gles " {
					Keywords { "PIXELSNAP_ON" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "PIXELSNAP_ON" }
					"!!GLES3"
				}
			}
		}
	}
	CustomEditor "CurvedWorld_Material_Editor"
}