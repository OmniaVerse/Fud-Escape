Shader "UI/Particles/Hidden" {
	Properties {
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 64171
			Program "vp" {
				SubProgram "gles " {
					"!!GLES
					#ifdef VERTEX
					#version 100
					
					void main()
					{
					    gl_Position = vec4(0.0, 0.0, 0.0, 0.0);
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
					    if((-1)!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles " {
					"!!GLES"
				}
			}
		}
	}
}