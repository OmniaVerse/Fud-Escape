Shader "Unlit/WaveShader2" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Brightness ("Brightness", Float) = 1
		_LightColor ("LightColor", Vector) = (0,0,0,0)
		_WaveXpoint ("WaveXpoint", Float) = 10
		_Speed ("Speed", Float) = 5
		_Height ("Height", Float) = 2
		_FactorWave ("FactorWave", Float) = 2
		_MaxLegth ("MaxLegth", Float) = 180
		_MinZ ("MinZ", Float) = 1
		_MinZ1 ("MinZ1", Float) = 1
		_MinZ2 ("MinZ2", Float) = 1
		_MinZ3 ("MinZ3", Float) = 1
		_MinZ4 ("MinZ4", Float) = 1
		_MinZ5 ("MinZ5", Float) = 1
		_MinZ6 ("MinZ6", Float) = 1
		_MinZ7 ("MinZ7", Float) = 1
		_MinZ8 ("MinZ8", Float) = 1
		_MinZ9 ("MinZ9", Float) = 1
		_Space ("Space", Float) = 1
		_Space2 ("Space2", Float) = 1
	}
	SubShader {
		LOD 100
		Tags { "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "RenderType" = "Opaque" }
			GpuProgramID 12757
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					uniform 	mediump float _MinZ;
					uniform 	mediump float _MinZ1;
					uniform 	mediump float _MinZ2;
					uniform 	mediump float _MinZ3;
					uniform 	mediump float _MinZ4;
					uniform 	mediump float _MinZ5;
					uniform 	mediump float _MinZ6;
					uniform 	mediump float _MinZ7;
					uniform 	mediump float _MinZ8;
					uniform 	mediump float _MinZ9;
					uniform 	mediump float _Space2;
					uniform 	mediump float _Space;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					bvec3 u_xlatb4;
					vec2 u_xlat5;
					bvec3 u_xlatb5;
					vec3 u_xlat6;
					bool u_xlatb6;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat0;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat6.x;
					    u_xlat12 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat12;
					    u_xlat18 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat18;
					    u_xlat6.x = u_xlat6.x * in_POSITION0.y;
					    u_xlat0 = u_xlat0 * in_POSITION0.x + u_xlat6.x;
					    u_xlat0 = u_xlat12 * in_POSITION0.z + u_xlat0;
					    u_xlat0 = u_xlat18 * in_POSITION0.w + u_xlat0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlatb6 = in_POSITION0.z<1.0;
					    u_xlat16_2 = _MaxLegth + -1.0;
					    u_xlatb12 = u_xlat16_2<in_POSITION0.z;
					    u_xlatb6 = u_xlatb12 || u_xlatb6;
					    if(u_xlatb6){
					        u_xlat2.x = 0.0;
					    } else {
					        u_xlatb6 = _MinZ<in_POSITION0.z;
					        u_xlat16_3.x = _MinZ + _Space;
					        u_xlatb12 = in_POSITION0.z<u_xlat16_3.x;
					        u_xlatb6 = u_xlatb12 && u_xlatb6;
					        if(u_xlatb6){
					            u_xlat16_3.x = _MinZ + 5.0;
					            u_xlat6.x = abs(u_xlat16_3.x);
					        } else {
					            u_xlatb12 = _MinZ1<in_POSITION0.z;
					            u_xlat16_3.x = _MinZ1 + _Space2;
					            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					            u_xlatb12 = u_xlatb18 && u_xlatb12;
					            if(u_xlatb12){
					                u_xlat6.x = abs(_MinZ1);
					            } else {
					                u_xlatb12 = _MinZ2<in_POSITION0.z;
					                u_xlat16_3.x = _MinZ2 + _Space;
					                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                if(u_xlatb12){
					                    u_xlat16_3.x = _MinZ2 + 6.0;
					                    u_xlat6.x = abs(u_xlat16_3.x);
					                } else {
					                    u_xlatb12 = _MinZ3<in_POSITION0.z;
					                    u_xlat16_3.x = _MinZ3 + _Space2;
					                    u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                    u_xlatb12 = u_xlatb18 && u_xlatb12;
					                    if(u_xlatb12){
					                        u_xlat6.x = abs(_MinZ3);
					                    } else {
					                        u_xlatb12 = _MinZ4<in_POSITION0.z;
					                        u_xlat16_3.x = _MinZ4 + _Space;
					                        u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                        u_xlatb12 = u_xlatb18 && u_xlatb12;
					                        if(u_xlatb12){
					                            u_xlat16_3.x = _MinZ4 + 5.0;
					                            u_xlat6.x = abs(u_xlat16_3.x);
					                        } else {
					                            u_xlatb12 = _MinZ5<in_POSITION0.z;
					                            u_xlat16_3.x = _MinZ5 + _Space2;
					                            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                            u_xlatb12 = u_xlatb18 && u_xlatb12;
					                            if(u_xlatb12){
					                                u_xlat6.x = abs(_MinZ5);
					                            } else {
					                                u_xlatb12 = _MinZ6<in_POSITION0.z;
					                                u_xlat16_3.x = _MinZ6 + _Space;
					                                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                                if(u_xlatb12){
					                                    u_xlat16_3.x = _MinZ6 + 5.0;
					                                    u_xlat6.x = abs(u_xlat16_3.x);
					                                } else {
					                                    u_xlatb4.xyz = lessThan(vec4(_MinZ7, _MinZ8, _MinZ9, _MinZ7), in_POSITION0.zzzz).xyz;
					                                    u_xlat16_3.xyz = vec3(_MinZ7, _MinZ8, _MinZ9) + vec3(_Space2, _Space, _Space2);
					                                    u_xlatb5.xyz = lessThan(in_POSITION0.zzzz, u_xlat16_3.xyzx).xyz;
					                                    u_xlat16_3.x = _MinZ8 + 5.0;
					                                    u_xlat12 = abs(u_xlat16_3.x);
					                                    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
					                                    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
					                                    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
					                                    u_xlat5.xy = abs(vec2(_MinZ7, _MinZ9));
					                                    u_xlat18 = u_xlatb4.z ? u_xlat5.y : float(0.0);
					                                    u_xlat12 = (u_xlatb4.y) ? u_xlat12 : u_xlat18;
					                                    u_xlat6.x = (u_xlatb4.x) ? u_xlat5.x : u_xlat12;
					                                }
					                            }
					                        }
					                    }
					                }
					            }
					        }
					        u_xlat12 = _Time.z * _Speed;
					        u_xlat6.x = u_xlat6.x * 0.400000006 + u_xlat12;
					        u_xlat6.x = sin(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * _Height;
					        u_xlat2.x = u_xlat6.x * RandomX;
					    }
					    u_xlat6.x = u_xlat1.y + u_xlat2.x;
					    u_xlat6.xyz = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat6.xyz;
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat2.yzw = in_POSITION0.xzw;
					    vs_POSITION1 = u_xlat2.yxzw;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					uniform 	mediump float _MinZ;
					uniform 	mediump float _MinZ1;
					uniform 	mediump float _MinZ2;
					uniform 	mediump float _MinZ3;
					uniform 	mediump float _MinZ4;
					uniform 	mediump float _MinZ5;
					uniform 	mediump float _MinZ6;
					uniform 	mediump float _MinZ7;
					uniform 	mediump float _MinZ8;
					uniform 	mediump float _MinZ9;
					uniform 	mediump float _Space2;
					uniform 	mediump float _Space;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					bvec3 u_xlatb4;
					vec2 u_xlat5;
					bvec3 u_xlatb5;
					vec3 u_xlat6;
					bool u_xlatb6;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat0;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat6.x;
					    u_xlat12 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat12;
					    u_xlat18 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat18;
					    u_xlat6.x = u_xlat6.x * in_POSITION0.y;
					    u_xlat0 = u_xlat0 * in_POSITION0.x + u_xlat6.x;
					    u_xlat0 = u_xlat12 * in_POSITION0.z + u_xlat0;
					    u_xlat0 = u_xlat18 * in_POSITION0.w + u_xlat0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlatb6 = in_POSITION0.z<1.0;
					    u_xlat16_2 = _MaxLegth + -1.0;
					    u_xlatb12 = u_xlat16_2<in_POSITION0.z;
					    u_xlatb6 = u_xlatb12 || u_xlatb6;
					    if(u_xlatb6){
					        u_xlat2.x = 0.0;
					    } else {
					        u_xlatb6 = _MinZ<in_POSITION0.z;
					        u_xlat16_3.x = _MinZ + _Space;
					        u_xlatb12 = in_POSITION0.z<u_xlat16_3.x;
					        u_xlatb6 = u_xlatb12 && u_xlatb6;
					        if(u_xlatb6){
					            u_xlat16_3.x = _MinZ + 5.0;
					            u_xlat6.x = abs(u_xlat16_3.x);
					        } else {
					            u_xlatb12 = _MinZ1<in_POSITION0.z;
					            u_xlat16_3.x = _MinZ1 + _Space2;
					            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					            u_xlatb12 = u_xlatb18 && u_xlatb12;
					            if(u_xlatb12){
					                u_xlat6.x = abs(_MinZ1);
					            } else {
					                u_xlatb12 = _MinZ2<in_POSITION0.z;
					                u_xlat16_3.x = _MinZ2 + _Space;
					                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                if(u_xlatb12){
					                    u_xlat16_3.x = _MinZ2 + 6.0;
					                    u_xlat6.x = abs(u_xlat16_3.x);
					                } else {
					                    u_xlatb12 = _MinZ3<in_POSITION0.z;
					                    u_xlat16_3.x = _MinZ3 + _Space2;
					                    u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                    u_xlatb12 = u_xlatb18 && u_xlatb12;
					                    if(u_xlatb12){
					                        u_xlat6.x = abs(_MinZ3);
					                    } else {
					                        u_xlatb12 = _MinZ4<in_POSITION0.z;
					                        u_xlat16_3.x = _MinZ4 + _Space;
					                        u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                        u_xlatb12 = u_xlatb18 && u_xlatb12;
					                        if(u_xlatb12){
					                            u_xlat16_3.x = _MinZ4 + 5.0;
					                            u_xlat6.x = abs(u_xlat16_3.x);
					                        } else {
					                            u_xlatb12 = _MinZ5<in_POSITION0.z;
					                            u_xlat16_3.x = _MinZ5 + _Space2;
					                            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                            u_xlatb12 = u_xlatb18 && u_xlatb12;
					                            if(u_xlatb12){
					                                u_xlat6.x = abs(_MinZ5);
					                            } else {
					                                u_xlatb12 = _MinZ6<in_POSITION0.z;
					                                u_xlat16_3.x = _MinZ6 + _Space;
					                                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                                if(u_xlatb12){
					                                    u_xlat16_3.x = _MinZ6 + 5.0;
					                                    u_xlat6.x = abs(u_xlat16_3.x);
					                                } else {
					                                    u_xlatb4.xyz = lessThan(vec4(_MinZ7, _MinZ8, _MinZ9, _MinZ7), in_POSITION0.zzzz).xyz;
					                                    u_xlat16_3.xyz = vec3(_MinZ7, _MinZ8, _MinZ9) + vec3(_Space2, _Space, _Space2);
					                                    u_xlatb5.xyz = lessThan(in_POSITION0.zzzz, u_xlat16_3.xyzx).xyz;
					                                    u_xlat16_3.x = _MinZ8 + 5.0;
					                                    u_xlat12 = abs(u_xlat16_3.x);
					                                    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
					                                    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
					                                    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
					                                    u_xlat5.xy = abs(vec2(_MinZ7, _MinZ9));
					                                    u_xlat18 = u_xlatb4.z ? u_xlat5.y : float(0.0);
					                                    u_xlat12 = (u_xlatb4.y) ? u_xlat12 : u_xlat18;
					                                    u_xlat6.x = (u_xlatb4.x) ? u_xlat5.x : u_xlat12;
					                                }
					                            }
					                        }
					                    }
					                }
					            }
					        }
					        u_xlat12 = _Time.z * _Speed;
					        u_xlat6.x = u_xlat6.x * 0.400000006 + u_xlat12;
					        u_xlat6.x = sin(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * _Height;
					        u_xlat2.x = u_xlat6.x * RandomX;
					    }
					    u_xlat6.x = u_xlat1.y + u_xlat2.x;
					    u_xlat6.xyz = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat6.xyz;
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat2.yzw = in_POSITION0.xzw;
					    vs_POSITION1 = u_xlat2.yxzw;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _Time;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					uniform 	mediump float _MaxLegth;
					uniform 	mediump float _Speed;
					uniform 	mediump float _Height;
					uniform 	mediump float RandomX;
					uniform 	mediump float _MinZ;
					uniform 	mediump float _MinZ1;
					uniform 	mediump float _MinZ2;
					uniform 	mediump float _MinZ3;
					uniform 	mediump float _MinZ4;
					uniform 	mediump float _MinZ5;
					uniform 	mediump float _MinZ6;
					uniform 	mediump float _MinZ7;
					uniform 	mediump float _MinZ8;
					uniform 	mediump float _MinZ9;
					uniform 	mediump float _Space2;
					uniform 	mediump float _Space;
					attribute highp vec4 in_POSITION0;
					attribute highp vec2 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_POSITION1;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					bvec3 u_xlatb4;
					vec2 u_xlat5;
					bvec3 u_xlatb5;
					vec3 u_xlat6;
					bool u_xlatb6;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[0].x + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[0].z + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[0].w + u_xlat0;
					    u_xlat6.x = hlslcc_mtx4x4unity_ObjectToWorld[1].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[1].x + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[1].z + u_xlat6.x;
					    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[1].w + u_xlat6.x;
					    u_xlat12 = hlslcc_mtx4x4unity_ObjectToWorld[2].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[2].x + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[2].z + u_xlat12;
					    u_xlat12 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[2].w + u_xlat12;
					    u_xlat18 = hlslcc_mtx4x4unity_ObjectToWorld[3].y * hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[0].z * hlslcc_mtx4x4unity_ObjectToWorld[3].x + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[2].z * hlslcc_mtx4x4unity_ObjectToWorld[3].z + u_xlat18;
					    u_xlat18 = hlslcc_mtx4x4unity_MatrixV[3].z * hlslcc_mtx4x4unity_ObjectToWorld[3].w + u_xlat18;
					    u_xlat6.x = u_xlat6.x * in_POSITION0.y;
					    u_xlat0 = u_xlat0 * in_POSITION0.x + u_xlat6.x;
					    u_xlat0 = u_xlat12 * in_POSITION0.z + u_xlat0;
					    u_xlat0 = u_xlat18 * in_POSITION0.w + u_xlat0;
					    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
					    u_xlatb6 = in_POSITION0.z<1.0;
					    u_xlat16_2 = _MaxLegth + -1.0;
					    u_xlatb12 = u_xlat16_2<in_POSITION0.z;
					    u_xlatb6 = u_xlatb12 || u_xlatb6;
					    if(u_xlatb6){
					        u_xlat2.x = 0.0;
					    } else {
					        u_xlatb6 = _MinZ<in_POSITION0.z;
					        u_xlat16_3.x = _MinZ + _Space;
					        u_xlatb12 = in_POSITION0.z<u_xlat16_3.x;
					        u_xlatb6 = u_xlatb12 && u_xlatb6;
					        if(u_xlatb6){
					            u_xlat16_3.x = _MinZ + 5.0;
					            u_xlat6.x = abs(u_xlat16_3.x);
					        } else {
					            u_xlatb12 = _MinZ1<in_POSITION0.z;
					            u_xlat16_3.x = _MinZ1 + _Space2;
					            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					            u_xlatb12 = u_xlatb18 && u_xlatb12;
					            if(u_xlatb12){
					                u_xlat6.x = abs(_MinZ1);
					            } else {
					                u_xlatb12 = _MinZ2<in_POSITION0.z;
					                u_xlat16_3.x = _MinZ2 + _Space;
					                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                if(u_xlatb12){
					                    u_xlat16_3.x = _MinZ2 + 6.0;
					                    u_xlat6.x = abs(u_xlat16_3.x);
					                } else {
					                    u_xlatb12 = _MinZ3<in_POSITION0.z;
					                    u_xlat16_3.x = _MinZ3 + _Space2;
					                    u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                    u_xlatb12 = u_xlatb18 && u_xlatb12;
					                    if(u_xlatb12){
					                        u_xlat6.x = abs(_MinZ3);
					                    } else {
					                        u_xlatb12 = _MinZ4<in_POSITION0.z;
					                        u_xlat16_3.x = _MinZ4 + _Space;
					                        u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                        u_xlatb12 = u_xlatb18 && u_xlatb12;
					                        if(u_xlatb12){
					                            u_xlat16_3.x = _MinZ4 + 5.0;
					                            u_xlat6.x = abs(u_xlat16_3.x);
					                        } else {
					                            u_xlatb12 = _MinZ5<in_POSITION0.z;
					                            u_xlat16_3.x = _MinZ5 + _Space2;
					                            u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                            u_xlatb12 = u_xlatb18 && u_xlatb12;
					                            if(u_xlatb12){
					                                u_xlat6.x = abs(_MinZ5);
					                            } else {
					                                u_xlatb12 = _MinZ6<in_POSITION0.z;
					                                u_xlat16_3.x = _MinZ6 + _Space;
					                                u_xlatb18 = in_POSITION0.z<u_xlat16_3.x;
					                                u_xlatb12 = u_xlatb18 && u_xlatb12;
					                                if(u_xlatb12){
					                                    u_xlat16_3.x = _MinZ6 + 5.0;
					                                    u_xlat6.x = abs(u_xlat16_3.x);
					                                } else {
					                                    u_xlatb4.xyz = lessThan(vec4(_MinZ7, _MinZ8, _MinZ9, _MinZ7), in_POSITION0.zzzz).xyz;
					                                    u_xlat16_3.xyz = vec3(_MinZ7, _MinZ8, _MinZ9) + vec3(_Space2, _Space, _Space2);
					                                    u_xlatb5.xyz = lessThan(in_POSITION0.zzzz, u_xlat16_3.xyzx).xyz;
					                                    u_xlat16_3.x = _MinZ8 + 5.0;
					                                    u_xlat12 = abs(u_xlat16_3.x);
					                                    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
					                                    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
					                                    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
					                                    u_xlat5.xy = abs(vec2(_MinZ7, _MinZ9));
					                                    u_xlat18 = u_xlatb4.z ? u_xlat5.y : float(0.0);
					                                    u_xlat12 = (u_xlatb4.y) ? u_xlat12 : u_xlat18;
					                                    u_xlat6.x = (u_xlatb4.x) ? u_xlat5.x : u_xlat12;
					                                }
					                            }
					                        }
					                    }
					                }
					            }
					        }
					        u_xlat12 = _Time.z * _Speed;
					        u_xlat6.x = u_xlat6.x * 0.400000006 + u_xlat12;
					        u_xlat6.x = sin(u_xlat6.x);
					        u_xlat6.x = u_xlat6.x * _Height;
					        u_xlat2.x = u_xlat6.x * RandomX;
					    }
					    u_xlat6.x = u_xlat1.y + u_xlat2.x;
					    u_xlat6.xyz = u_xlat6.xxx * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * u_xlat1.www + u_xlat6.xyz;
					    u_xlat1 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat6.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    gl_Position.xy = vec2(u_xlat0) * _Distort.xy + u_xlat1.xy;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    gl_Position.zw = u_xlat1.zw;
					    u_xlat2.yzw = in_POSITION0.xzw;
					    vs_POSITION1 = u_xlat2.yxzw;
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
					#define SV_Target0 gl_FragData[0]
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
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