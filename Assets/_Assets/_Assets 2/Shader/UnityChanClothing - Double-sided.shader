Shader "UnityChan/Clothing - Double-sided" {
	Properties {
		_Color ("Main Color", Vector) = (1,1,1,1)
		_ShadowColor ("Shadow Color", Vector) = (0.8,0.8,1,1)
		_SpecularPower ("Specular Power", Float) = 20
		_EdgeThickness ("Outline Thickness", Float) = 1
		_DepthBias ("Outline Depth Bias", Float) = 0.00012
		_MainTex ("Diffuse", 2D) = "white" {}
		_FalloffSampler ("Falloff Control", 2D) = "white" {}
		_RimLightSampler ("RimLight Control", 2D) = "white" {}
		_SpecularReflectionSampler ("Specular / Reflection Mask", 2D) = "white" {}
		_EnvMapSampler ("Environment Map", 2D) = "" {}
		_NormalMapSampler ("Normal Map", 2D) = "" {}
	}
	SubShader {
		Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
		Pass {
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Cull Off
			GpuProgramID 63542
			Program "fp" {
				SubProgram "gles " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3"
				}
				SubProgram "gles " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES"
				}
				SubProgram "gles3 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
					"!!GLES3"
				}
			}
		}
		Pass {
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
			ZTest Less
			Cull Front
			GpuProgramID 120899
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
	Fallback "Transparent/Cutout/Diffuse"
}