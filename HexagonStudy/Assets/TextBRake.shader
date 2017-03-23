// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:2,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:14,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-4794-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31958,y:32712,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:388,x:31958,y:32937,varname:node_388,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4794,x:32440,y:32898,varname:node_4794,prsc:2|A-7241-RGB,B-388-RGB,C-1521-RGB,D-100-OUT;n:type:ShaderForge.SFN_Tex2d,id:1521,x:31839,y:32311,varname:_Tex,prsc:0,tex:0bc6ea90104bc3246b4e0f28943f5778,ntxv:0,isnm:False|UVIN-8706-UVOUT,TEX-4478-TEX;n:type:ShaderForge.SFN_UVTile,id:8706,x:31604,y:32311,varname:uvtile,prsc:0|UVIN-5082-UVOUT,WDT-214-OUT,HGT-5565-OUT,TILE-8803-OUT;n:type:ShaderForge.SFN_TexCoord,id:5082,x:31337,y:32110,varname:node_5082,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:214,x:31346,y:32255,varname:node_214,prsc:0,v1:2;n:type:ShaderForge.SFN_Tex2dAsset,id:4478,x:31839,y:32522,ptovrint:False,ptlb:TexMain,ptin:_TexMain,varname:_TexMain,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0bc6ea90104bc3246b4e0f28943f5778,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:5565,x:31346,y:32363,varname:node_5565,prsc:2,v1:2;n:type:ShaderForge.SFN_Time,id:7924,x:30738,y:32523,varname:node_7924,prsc:2;n:type:ShaderForge.SFN_Vector1,id:7106,x:31145,y:32683,varname:node_7106,prsc:2,v1:3;n:type:ShaderForge.SFN_Ceil,id:8803,x:31346,y:32535,varname:node_8803,prsc:2|IN-3299-OUT;n:type:ShaderForge.SFN_Multiply,id:3640,x:30956,y:32535,varname:node_3640,prsc:2|A-2199-OUT,B-7924-T;n:type:ShaderForge.SFN_Vector1,id:2199,x:30738,y:32449,varname:node_2199,prsc:2,v1:6;n:type:ShaderForge.SFN_Fmod,id:3299,x:31145,y:32535,varname:node_3299,prsc:2|A-3640-OUT,B-7106-OUT;n:type:ShaderForge.SFN_Lerp,id:100,x:32338,y:32388,varname:node_100,prsc:2|A-1169-RGB,B-1180-RGB,T-1521-R;n:type:ShaderForge.SFN_Color,id:1169,x:32338,y:31940,ptovrint:False,ptlb:Color1,ptin:_Color1,varname:_Color1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:1180,x:32338,y:32174,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:_Color2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.9172413,c3:1,c4:1;proporder:7241-4478-1169-1180;pass:END;sub:END;*/

Shader "Shader Forge/TextBRake" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _TexMain ("TexMain", 2D) = "white" {}
        _Color1 ("Color1", Color) = (1,0,0,1)
        _Color2 ("Color2", Color) = (0,0.9172413,1,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcColor Zero
            Cull Off
            ZWrite Off
            ColorMask RGB
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform sampler2D _TexMain; uniform float4 _TexMain_ST;
            uniform float4 _Color1;
            uniform float4 _Color2;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                fixed node_214 = 2.0;
                float4 node_7924 = _Time + _TimeEditor;
                float node_8803 = ceil(fmod((6.0*node_7924.g),3.0));
                float2 uvtile_tc_rcp = float2(1.0,1.0)/float2( node_214, 2.0 );
                float uvtile_ty = floor(node_8803 * uvtile_tc_rcp.x);
                float uvtile_tx = node_8803 - node_214 * uvtile_ty;
                fixed2 uvtile = (i.uv0 + float2(uvtile_tx, uvtile_ty)) * uvtile_tc_rcp;
                fixed4 _Tex = tex2D(_TexMain,TRANSFORM_TEX(uvtile, _TexMain));
                float3 emissive = (_Color.rgb*i.vertexColor.rgb*_Tex.rgb*lerp(_Color1.rgb,_Color2.rgb,_Tex.r));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            ColorMask RGB
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
