Shader "Custom/Distorted/Character" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Factor ("Factor", Float) = 1
	}
	SubShader {
		Pass {
			Fog {
				Mode Off
			}
			GpuProgramID 33766
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.z / u_xlat0.w;
					    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _ProjectionParams.z;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    gl_Position.xy = u_xlat1.xx * _Distort.xy + u_xlat0.xy;
					    gl_Position.zw = u_xlat0.zw;
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
					uniform 	float colorType;
					uniform 	float _Factor;
					uniform 	vec4 mapClipRange;
					uniform 	float mapHideType;
					uniform 	vec4 clipRange;
					uniform 	vec4 _Mask_newguide;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb2;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Factor);
					    u_xlatb2 = mapHideType==1.0;
					    if(u_xlatb2){
					        u_xlatb2 = mapClipRange.y<vs_TEXCOORD1.z;
					        if(u_xlatb2){
					            if((-1)!=0){discard;}
					            u_xlat1.w = u_xlat0.w;
					            SV_Target0 = u_xlat1;
					            return;
					        } else {
					            u_xlat0.xyz = u_xlat1.xyz;
					            SV_Target0 = u_xlat0;
					            return;
					        }
					    } else {
					        u_xlatb10 = mapHideType==2.0;
					        if(u_xlatb10){
					            u_xlatb10 = vs_TEXCOORD1.z<mapClipRange.y;
					            if(u_xlatb10){
					                if((-1)!=0){discard;}
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            } else {
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            }
					        } else {
					            u_xlatb10 = mapHideType==3.0;
					            if(u_xlatb10){
					                u_xlatb10 = mapClipRange.x<vs_TEXCOORD1.x;
					                if(u_xlatb10){
					                    if((-1)!=0){discard;}
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                } else {
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                }
					            } else {
					                u_xlatb10 = mapHideType==4.0;
					                if(u_xlatb10){
					                    u_xlatb10 = vs_TEXCOORD1.x<mapClipRange.x;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    }
					                } else {
					                    u_xlatb10 = clipRange.y<vs_TEXCOORD1.y;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlatb10 = colorType<1.0;
					                        if(u_xlatb10){
					                            u_xlat0.xyz = u_xlat1.xyz;
					                            u_xlat1 = u_xlat0 * _Mask_newguide;
					                            SV_Target0 = u_xlat1;
					                            return;
					                        } else {
					                            u_xlat0.x = dot(u_xlat0.xyz, vec3(0.170000002, 0.170000002, 0.170000002));
					                            SV_Target0 = u_xlat0.xxxw;
					                            return;
					                        }
					                    }
					                }
					            }
					        }
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.z / u_xlat0.w;
					    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _ProjectionParams.z;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    gl_Position.xy = u_xlat1.xx * _Distort.xy + u_xlat0.xy;
					    gl_Position.zw = u_xlat0.zw;
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
					uniform 	float colorType;
					uniform 	float _Factor;
					uniform 	vec4 mapClipRange;
					uniform 	float mapHideType;
					uniform 	vec4 clipRange;
					uniform 	vec4 _Mask_newguide;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb2;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Factor);
					    u_xlatb2 = mapHideType==1.0;
					    if(u_xlatb2){
					        u_xlatb2 = mapClipRange.y<vs_TEXCOORD1.z;
					        if(u_xlatb2){
					            if((-1)!=0){discard;}
					            u_xlat1.w = u_xlat0.w;
					            SV_Target0 = u_xlat1;
					            return;
					        } else {
					            u_xlat0.xyz = u_xlat1.xyz;
					            SV_Target0 = u_xlat0;
					            return;
					        }
					    } else {
					        u_xlatb10 = mapHideType==2.0;
					        if(u_xlatb10){
					            u_xlatb10 = vs_TEXCOORD1.z<mapClipRange.y;
					            if(u_xlatb10){
					                if((-1)!=0){discard;}
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            } else {
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            }
					        } else {
					            u_xlatb10 = mapHideType==3.0;
					            if(u_xlatb10){
					                u_xlatb10 = mapClipRange.x<vs_TEXCOORD1.x;
					                if(u_xlatb10){
					                    if((-1)!=0){discard;}
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                } else {
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                }
					            } else {
					                u_xlatb10 = mapHideType==4.0;
					                if(u_xlatb10){
					                    u_xlatb10 = vs_TEXCOORD1.x<mapClipRange.x;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    }
					                } else {
					                    u_xlatb10 = clipRange.y<vs_TEXCOORD1.y;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlatb10 = colorType<1.0;
					                        if(u_xlatb10){
					                            u_xlat0.xyz = u_xlat1.xyz;
					                            u_xlat1 = u_xlat0 * _Mask_newguide;
					                            SV_Target0 = u_xlat1;
					                            return;
					                        } else {
					                            u_xlat0.x = dot(u_xlat0.xyz, vec3(0.170000002, 0.170000002, 0.170000002));
					                            SV_Target0 = u_xlat0.xxxw;
					                            return;
					                        }
					                    }
					                }
					            }
					        }
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _Distort;
					attribute highp vec4 in_POSITION0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat1.x = u_xlat0.z / u_xlat0.w;
					    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * _ProjectionParams.z;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    gl_Position.xy = u_xlat1.xx * _Distort.xy + u_xlat0.xy;
					    gl_Position.zw = u_xlat0.zw;
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
					uniform 	float colorType;
					uniform 	float _Factor;
					uniform 	vec4 mapClipRange;
					uniform 	float mapHideType;
					uniform 	vec4 clipRange;
					uniform 	vec4 _Mask_newguide;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb2;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz + (-vs_TEXCOORD1.xyz);
					    u_xlat1.xyz = vs_TEXCOORD1.www * u_xlat1.xyz + vs_TEXCOORD1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Factor);
					    u_xlatb2 = mapHideType==1.0;
					    if(u_xlatb2){
					        u_xlatb2 = mapClipRange.y<vs_TEXCOORD1.z;
					        if(u_xlatb2){
					            if((-1)!=0){discard;}
					            u_xlat1.w = u_xlat0.w;
					            SV_Target0 = u_xlat1;
					            return;
					        } else {
					            u_xlat0.xyz = u_xlat1.xyz;
					            SV_Target0 = u_xlat0;
					            return;
					        }
					    } else {
					        u_xlatb10 = mapHideType==2.0;
					        if(u_xlatb10){
					            u_xlatb10 = vs_TEXCOORD1.z<mapClipRange.y;
					            if(u_xlatb10){
					                if((-1)!=0){discard;}
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            } else {
					                u_xlat0.xyz = u_xlat1.xyz;
					                SV_Target0 = u_xlat0;
					                return;
					            }
					        } else {
					            u_xlatb10 = mapHideType==3.0;
					            if(u_xlatb10){
					                u_xlatb10 = mapClipRange.x<vs_TEXCOORD1.x;
					                if(u_xlatb10){
					                    if((-1)!=0){discard;}
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                } else {
					                    u_xlat0.xyz = u_xlat1.xyz;
					                    SV_Target0 = u_xlat0;
					                    return;
					                }
					            } else {
					                u_xlatb10 = mapHideType==4.0;
					                if(u_xlatb10){
					                    u_xlatb10 = vs_TEXCOORD1.x<mapClipRange.x;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    }
					                } else {
					                    u_xlatb10 = clipRange.y<vs_TEXCOORD1.y;
					                    if(u_xlatb10){
					                        if((-1)!=0){discard;}
					                        u_xlat0.xyz = u_xlat1.xyz;
					                        SV_Target0 = u_xlat0;
					                        return;
					                    } else {
					                        u_xlatb10 = colorType<1.0;
					                        if(u_xlatb10){
					                            u_xlat0.xyz = u_xlat1.xyz;
					                            u_xlat1 = u_xlat0 * _Mask_newguide;
					                            SV_Target0 = u_xlat1;
					                            return;
					                        } else {
					                            u_xlat0.x = dot(u_xlat0.xyz, vec3(0.170000002, 0.170000002, 0.170000002));
					                            SV_Target0 = u_xlat0.xxxw;
					                            return;
					                        }
					                    }
					                }
					            }
					        }
					    }
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