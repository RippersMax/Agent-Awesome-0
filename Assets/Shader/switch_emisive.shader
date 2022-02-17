Shader "Shader Forge/switch_emisive" {
Properties {
 _diffuse ("diffuse", 2D) = "white" {}
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARDBASE"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
MOV result.texcoord[0], vertex.texcoord[0];
ADD result.texcoord[2].xyz, R0, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
mov o1, v2
add o3.xyz, r0, c12.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecednfflcfodgchgghiopcmieikafimidlkoabaaaaaafaadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabcaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
MOV result.texcoord[0], vertex.texcoord[0];
ADD result.texcoord[2].xyz, R0, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
mov o1, v2
add o3.xyz, r0, c12.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecednfflcfodgchgghiopcmieikafimidlkoabaaaaaafaadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabcaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
MOV result.texcoord[0], vertex.texcoord[0];
ADD result.texcoord[2].xyz, R0, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
mov o1, v2
add o3.xyz, r0, c12.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecednfflcfodgchgghiopcmieikafimidlkoabaaaaaafaadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabcaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R0;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[3].zw, R0;
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.y
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
mov o0, r0
mov o1, v2
mov o4.zw, r0
add o3.xyz, r1, c14.x
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcdgpaoaaaagmlpopbjhiflipopiggegnabaaaaaabaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcmiacaaaaeaaaabaalcaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R0;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[3].zw, R0;
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.y
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
mov o0, r0
mov o1, v2
mov o4.zw, r0
add o3.xyz, r1, c14.x
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcdgpaoaaaagmlpopbjhiflipopiggegnabaaaaaabaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcmiacaaaaeaaaabaalcaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R0;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[3].zw, R0;
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.y
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
mov o0, r0
mov o1, v2
mov o4.zw, r0
add o3.xyz, r1, c14.x
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcdgpaoaaaagmlpopbjhiflipopiggegnabaaaaaabaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcmiacaaaaeaaaabaalcaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
MOV result.texcoord[0], vertex.texcoord[0];
ADD result.texcoord[2].xyz, R0, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
mov o1, v2
add o3.xyz, r0, c12.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecednfflcfodgchgghiopcmieikafimidlkoabaaaaaafaadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabcaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R0;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[3].zw, R0;
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.y
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
mov o0, r0
mov o1, v2
mov o4.zw, r0
add o3.xyz, r1, c14.x
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcdgpaoaaaagmlpopbjhiflipopiggegnabaaaaaabaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcmiacaaaaeaaaabaalcaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, c[2];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R3;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.z, R1, R0;
MAX R1.w, R0.z, c[5].x;
POW R2.x, R1.w, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[0], 2D;
DP3 R1.w, R0, c[5].yzww;
ADD R4.xyz, R1.w, -R0;
DP3 R1.w, R1, R3;
MAD R1.xyz, R4, c[6].x, R0;
MUL R3.xyz, R0, R0.w;
MAX R1.w, R1, c[5].x;
POW R1.w, R1.w, R1.x;
MUL R4.xyz, R1.w, c[3];
MUL R2.xyz, R2.x, c[3];
MUL R5.xyz, R1, R3;
MAD R1.xyz, R1, R2, R5;
ADD R4.xyz, R4, c[0];
ADD R2.xyz, R4, R3;
MAD R0.xyz, R2, R0, R1;
ADD result.color.xyz, R0, R3;
MOV result.color.w, c[6].z;
END
# 34 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"ps_3_0
dcl_2d s0
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
add r0.xyz, -v1, c1
dp3_pp r0.w, c2, c2
rsq_pp r0.w, r0.w
mul_pp r3.xyz, r0.w, c2
dp3 r1.x, r0, r0
rsq r0.w, r1.x
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.z, r1, r0
max r1.w, r0.z, c5.x
pow r2, r1.w, c6.y
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s0
dp3 r1.w, r0, c5.yzww
add r4.xyz, r1.w, -r0
dp3 r1.w, r1, r3
mad r1.xyz, r4, c6.x, r0
max r1.w, r1, c5.x
pow r3, r1.w, r1.x
mov r1.w, r2.x
mul r2.xyz, r1.w, c3
mov r1.w, r3.x
mul r3.xyz, r0, r0.w
mul r4.xyz, r1.w, c3
mul r5.xyz, r1, r3
mad r1.xyz, r1, r2, r5
add r4.xyz, r4, c0
add r2.xyz, r4, r3
mad r0.xyz, r2, r0, r1
add oC0.xyz, r0, r3
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_diffuse] 2D 0
ConstBuffer "$Globals" 48
Vector 16 [_LightColor0]
Vector 32 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednddekpomdepcpelhijikmoelmcdjfcnjabaaaaaanaafaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcoaaeaaaaeaaaaaaadiabaaaafjaaaaaeegiocaaa
aaaaaaaaadaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaincaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadcaaaaaldcaabaaaabaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaak
bcaabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaagaabaaa
acaaaaaadcaaaaamhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agajbaaaacaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaabjaaaaafhcaabaaaacaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaa
egiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaaigadbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, c[2];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R3;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.z, R1, R0;
MAX R1.w, R0.z, c[5].x;
POW R2.x, R1.w, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[0], 2D;
DP3 R1.w, R0, c[5].yzww;
ADD R4.xyz, R1.w, -R0;
DP3 R1.w, R1, R3;
MAD R1.xyz, R4, c[6].x, R0;
MUL R3.xyz, R0, R0.w;
MAX R1.w, R1, c[5].x;
POW R1.w, R1.w, R1.x;
MUL R4.xyz, R1.w, c[3];
MUL R2.xyz, R2.x, c[3];
MUL R5.xyz, R1, R3;
MAD R1.xyz, R1, R2, R5;
ADD R4.xyz, R4, c[0];
ADD R2.xyz, R4, R3;
MAD R0.xyz, R2, R0, R1;
ADD result.color.xyz, R0, R3;
MOV result.color.w, c[6].z;
END
# 34 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"ps_3_0
dcl_2d s0
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
add r0.xyz, -v1, c1
dp3_pp r0.w, c2, c2
rsq_pp r0.w, r0.w
mul_pp r3.xyz, r0.w, c2
dp3 r1.x, r0, r0
rsq r0.w, r1.x
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.z, r1, r0
max r1.w, r0.z, c5.x
pow r2, r1.w, c6.y
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s0
dp3 r1.w, r0, c5.yzww
add r4.xyz, r1.w, -r0
dp3 r1.w, r1, r3
mad r1.xyz, r4, c6.x, r0
max r1.w, r1, c5.x
pow r3, r1.w, r1.x
mov r1.w, r2.x
mul r2.xyz, r1.w, c3
mov r1.w, r3.x
mul r3.xyz, r0, r0.w
mul r4.xyz, r1.w, c3
mul r5.xyz, r1, r3
mad r1.xyz, r1, r2, r5
add r4.xyz, r4, c0
add r2.xyz, r4, r3
mad r0.xyz, r2, r0, r1
add oC0.xyz, r0, r3
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_diffuse] 2D 0
ConstBuffer "$Globals" 48
Vector 16 [_LightColor0]
Vector 32 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednddekpomdepcpelhijikmoelmcdjfcnjabaaaaaanaafaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcoaaeaaaaeaaaaaaadiabaaaafjaaaaaeegiocaaa
aaaaaaaaadaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaincaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadcaaaaaldcaabaaaabaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaak
bcaabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaagaabaaa
acaaaaaadcaaaaamhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agajbaaaacaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaabjaaaaafhcaabaaaacaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaa
egiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaaigadbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, c[2];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R3;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.z, R1, R0;
MAX R1.w, R0.z, c[5].x;
POW R2.x, R1.w, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[0], 2D;
DP3 R1.w, R0, c[5].yzww;
ADD R4.xyz, R1.w, -R0;
DP3 R1.w, R1, R3;
MAD R1.xyz, R4, c[6].x, R0;
MUL R3.xyz, R0, R0.w;
MAX R1.w, R1, c[5].x;
POW R1.w, R1.w, R1.x;
MUL R4.xyz, R1.w, c[3];
MUL R2.xyz, R2.x, c[3];
MUL R5.xyz, R1, R3;
MAD R1.xyz, R1, R2, R5;
ADD R4.xyz, R4, c[0];
ADD R2.xyz, R4, R3;
MAD R0.xyz, R2, R0, R1;
ADD result.color.xyz, R0, R3;
MOV result.color.w, c[6].z;
END
# 34 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"ps_3_0
dcl_2d s0
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
add r0.xyz, -v1, c1
dp3_pp r0.w, c2, c2
rsq_pp r0.w, r0.w
mul_pp r3.xyz, r0.w, c2
dp3 r1.x, r0, r0
rsq r0.w, r1.x
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.z, r1, r0
max r1.w, r0.z, c5.x
pow r2, r1.w, c6.y
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s0
dp3 r1.w, r0, c5.yzww
add r4.xyz, r1.w, -r0
dp3 r1.w, r1, r3
mad r1.xyz, r4, c6.x, r0
max r1.w, r1, c5.x
pow r3, r1.w, r1.x
mov r1.w, r2.x
mul r2.xyz, r1.w, c3
mov r1.w, r3.x
mul r3.xyz, r0, r0.w
mul r4.xyz, r1.w, c3
mul r5.xyz, r1, r3
mad r1.xyz, r1, r2, r5
add r4.xyz, r4, c0
add r2.xyz, r4, r3
mad r0.xyz, r2, r0, r1
add oC0.xyz, r0, r3
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_diffuse] 2D 0
ConstBuffer "$Globals" 48
Vector 16 [_LightColor0]
Vector 32 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednddekpomdepcpelhijikmoelmcdjfcnjabaaaaaanaafaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcoaaeaaaaeaaaaaaadiabaaaafjaaaaaeegiocaaa
aaaaaaaaadaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaincaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadcaaaaaldcaabaaaabaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaak
bcaabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaagaabaaa
acaaaaaadcaaaaamhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agajbaaaacaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaabjaaaaafhcaabaaaacaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaa
egiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaaigadbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.yzw, R0.w, c[2].xxyz;
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R1.yzww;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R0.xyz, R1.x, R0;
TXP R1.x, fragment.texcoord[3], texture[0], 2D;
FLR R3.x, R1;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R4, R0;
MAX R0.z, R0.x, c[5].x;
POW R2.w, R0.z, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[1], 2D;
MUL R5.xyz, R0, R0.w;
DP3 R0.w, R4, R1.yzww;
DP3 R2.x, R0, c[5].yzww;
ADD R2.xyz, R2.x, -R0;
MAD R2.xyz, R2, c[6].x, R0;
MUL R3.xyz, R3.x, c[3];
MAX R0.w, R0, c[5].x;
POW R0.w, R0.w, R2.x;
MUL R1.xyz, R1.x, c[3];
MAD R1.xyz, R0.w, R1, c[0];
MUL R3.xyz, R3, R2.w;
MUL R4.xyz, R2, R5;
MAD R2.xyz, R2, R3, R4;
ADD R1.xyz, R1, R5;
MAD R0.xyz, R1, R0, R2;
ADD result.color.xyz, R0, R5;
MOV result.color.w, c[6].z;
END
# 37 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
texldp r5.x, v3, s0
dp3_pp r0.w, c2, c2
rsq_pp r1.x, r0.w
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
frc r2.x, r5
add r2.x, r5, -r2
dp3 r1.w, v2, v2
rsq r1.w, r1.w
mul_pp r1.xyz, r1.x, c2
rsq r0.w, r0.w
mad r0.xyz, r0.w, r0, r1
mul r3.xyz, r1.w, v2
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r3, r0
max r1.w, r0.x, c5.x
pow r0, r1.w, c6.y
mov r1.w, r0.x
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s1
dp3 r2.w, r0, c5.yzww
mul r2.xyz, r2.x, c3
mul r2.xyz, r2, r1.w
dp3 r1.x, r3, r1
add r4.xyz, r2.w, -r0
max r1.w, r1.x, c5.x
mad r3.xyz, r4, c6.x, r0
mul r1.xyz, r0, r0.w
pow r4, r1.w, r3.x
mul r4.yzw, r3.xxyz, r1.xxyz
mad r2.xyz, r3, r2, r4.yzww
mul r5.xyz, r5.x, c3
mov r0.w, r4.x
mad r5.xyz, r0.w, r5, c0
add r3.xyz, r5, r1
mad r0.xyz, r3, r0, r2
add oC0.xyz, r0, r1
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednohpkpeackefpdbinehpfjacgjkiiaoaabaaaaaajmagaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcjeafaaaaeaaaaaaagfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaebaaaaafecaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaaihcaabaaaacaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaacaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaadaaaaaaagajbaaaaeaaaaaa
diaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaigadbaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.yzw, R0.w, c[2].xxyz;
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R1.yzww;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R0.xyz, R1.x, R0;
TXP R1.x, fragment.texcoord[3], texture[0], 2D;
FLR R3.x, R1;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R4, R0;
MAX R0.z, R0.x, c[5].x;
POW R2.w, R0.z, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[1], 2D;
MUL R5.xyz, R0, R0.w;
DP3 R0.w, R4, R1.yzww;
DP3 R2.x, R0, c[5].yzww;
ADD R2.xyz, R2.x, -R0;
MAD R2.xyz, R2, c[6].x, R0;
MUL R3.xyz, R3.x, c[3];
MAX R0.w, R0, c[5].x;
POW R0.w, R0.w, R2.x;
MUL R1.xyz, R1.x, c[3];
MAD R1.xyz, R0.w, R1, c[0];
MUL R3.xyz, R3, R2.w;
MUL R4.xyz, R2, R5;
MAD R2.xyz, R2, R3, R4;
ADD R1.xyz, R1, R5;
MAD R0.xyz, R1, R0, R2;
ADD result.color.xyz, R0, R5;
MOV result.color.w, c[6].z;
END
# 37 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
texldp r5.x, v3, s0
dp3_pp r0.w, c2, c2
rsq_pp r1.x, r0.w
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
frc r2.x, r5
add r2.x, r5, -r2
dp3 r1.w, v2, v2
rsq r1.w, r1.w
mul_pp r1.xyz, r1.x, c2
rsq r0.w, r0.w
mad r0.xyz, r0.w, r0, r1
mul r3.xyz, r1.w, v2
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r3, r0
max r1.w, r0.x, c5.x
pow r0, r1.w, c6.y
mov r1.w, r0.x
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s1
dp3 r2.w, r0, c5.yzww
mul r2.xyz, r2.x, c3
mul r2.xyz, r2, r1.w
dp3 r1.x, r3, r1
add r4.xyz, r2.w, -r0
max r1.w, r1.x, c5.x
mad r3.xyz, r4, c6.x, r0
mul r1.xyz, r0, r0.w
pow r4, r1.w, r3.x
mul r4.yzw, r3.xxyz, r1.xxyz
mad r2.xyz, r3, r2, r4.yzww
mul r5.xyz, r5.x, c3
mov r0.w, r4.x
mad r5.xyz, r0.w, r5, c0
add r3.xyz, r5, r1
mad r0.xyz, r3, r0, r2
add oC0.xyz, r0, r1
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednohpkpeackefpdbinehpfjacgjkiiaoaabaaaaaajmagaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcjeafaaaaeaaaaaaagfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaebaaaaafecaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaaihcaabaaaacaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaacaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaadaaaaaaagajbaaaaeaaaaaa
diaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaigadbaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[7] = { state.lightmodel.ambient,
		program.local[1..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.yzw, R0.w, c[2].xxyz;
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MAD R0.xyz, R0.w, R0, R1.yzww;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R0.xyz, R1.x, R0;
TXP R1.x, fragment.texcoord[3], texture[0], 2D;
FLR R3.x, R1;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R4, R0;
MAX R0.z, R0.x, c[5].x;
POW R2.w, R0.z, c[6].y;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0, R0, texture[1], 2D;
MUL R5.xyz, R0, R0.w;
DP3 R0.w, R4, R1.yzww;
DP3 R2.x, R0, c[5].yzww;
ADD R2.xyz, R2.x, -R0;
MAD R2.xyz, R2, c[6].x, R0;
MUL R3.xyz, R3.x, c[3];
MAX R0.w, R0, c[5].x;
POW R0.w, R0.w, R2.x;
MUL R1.xyz, R1.x, c[3];
MAD R1.xyz, R0.w, R1, c[0];
MUL R3.xyz, R3, R2.w;
MUL R4.xyz, R2, R5;
MAD R2.xyz, R2, R3, R4;
ADD R1.xyz, R1, R5;
MAD R0.xyz, R1, R0, R2;
ADD result.color.xyz, R0, R5;
MOV result.color.w, c[6].z;
END
# 37 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 64.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
texldp r5.x, v3, s0
dp3_pp r0.w, c2, c2
rsq_pp r1.x, r0.w
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
frc r2.x, r5
add r2.x, r5, -r2
dp3 r1.w, v2, v2
rsq r1.w, r1.w
mul_pp r1.xyz, r1.x, c2
rsq r0.w, r0.w
mad r0.xyz, r0.w, r0, r1
mul r3.xyz, r1.w, v2
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r3, r0
max r1.w, r0.x, c5.x
pow r0, r1.w, c6.y
mov r1.w, r0.x
mad r0.xy, v0, c4, c4.zwzw
texld r0, r0, s1
dp3 r2.w, r0, c5.yzww
mul r2.xyz, r2.x, c3
mul r2.xyz, r2, r1.w
dp3 r1.x, r3, r1
add r4.xyz, r2.w, -r0
max r1.w, r1.x, c5.x
mad r3.xyz, r4, c6.x, r0
mul r1.xyz, r0, r0.w
pow r4, r1.w, r3.x
mul r4.yzw, r3.xxyz, r1.xxyz
mad r2.xyz, r3, r2, r4.yzww
mul r5.xyz, r5.x, c3
mov r0.w, r4.x
mad r5.xyz, r0.w, r5, c0
add r3.xyz, r5, r1
mad r0.xyz, r3, r0, r2
add oC0.xyz, r0, r1
mov_pp oC0.w, c6.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecednohpkpeackefpdbinehpfjacgjkiiaoaabaaaaaajmagaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcjeafaaaaeaaaaaaagfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaajbcaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaagaabaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaaeaaaaaa
pgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaebaaaaafecaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaaihcaabaaaacaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaacaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaadaaaaaaagajbaaaaeaaaaaa
diaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaigadbaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
}
 }
 Pass {
  Name "FORWARDADD"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c16.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedphoonjfmjdpmhfhpohbmfclfgckglmfjabaaaaaadaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcoiacaaaaeaaaabaalkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaa
egbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
MOV result.texcoord[0], vertex.texcoord[0];
ADD result.texcoord[2].xyz, R0, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
mov o1, v2
add o3.xyz, r0, c12.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecednfflcfodgchgghiopcmieikafimidlkoabaaaaaafaadaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaa
egiccaaaaaaaaaaabcaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov o1, v2
mov o2, r0
dp4 o4.w, r0, c15
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c16.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedppffhamhegmjlbgdifpdniocpggocfmmabaaaaaadaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcoiacaaaaeaaaabaalkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaa
egbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaeaaaaaaegiocaaaaaaaaaaaaeaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c16.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedphoonjfmjdpmhfhpohbmfclfgckglmfjabaaaaaadaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcoiacaaaaeaaaabaalkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaa
egbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov o1, v2
mov o2, r0
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c16.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedfeddgjdlpboacnclloaagcjlgmnmgealabaaaaaadaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcoiacaaaaeaaaabaalkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaa
egbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaidcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiacaaaaaaaaaaaacaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaabaaa
aaaaaaaadcaaaaakdccabaaaaeaaaaaaegiacaaaaaaaaaaaaeaaaaaapgapbaaa
aaaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].w, R0, c[20];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP4 result.texcoord[4].w, R0, c[8];
DP4 result.texcoord[4].z, R0, c[7];
DP4 result.texcoord[4].y, R0, c[6];
DP4 result.texcoord[4].x, R0, c[5];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o1, v2
mov o2, r0
dp4 o4.w, r0, c19
dp4 o4.z, r0, c18
dp4 o4.y, r0, c17
dp4 o4.x, r0, c16
dp4 o5.w, r0, c7
dp4 o5.z, r0, c6
dp4 o5.y, r0, c5
dp4 o5.x, r0, c4
add o3.xyz, r1, c20.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefieceddfciflkbapejpaabjepoapgiamlkadbeabaaaaaapmaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaa
eaaaabaaohaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaamaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaaajaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaakaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
abaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].w, R0, c[20];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP4 result.texcoord[4].w, R0, c[8];
DP4 result.texcoord[4].z, R0, c[7];
DP4 result.texcoord[4].y, R0, c[6];
DP4 result.texcoord[4].x, R0, c[5];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o1, v2
mov o2, r0
dp4 o4.w, r0, c19
dp4 o4.z, r0, c18
dp4 o4.y, r0, c17
dp4 o4.x, r0, c16
dp4 o5.w, r0, c7
dp4 o5.z, r0, c6
dp4 o5.y, r0, c5
dp4 o5.x, r0, c4
add o3.xyz, r1, c20.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefieceddfciflkbapejpaabjepoapgiamlkadbeabaaaaaapmaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaa
eaaaabaaohaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaamaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaaajaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaakaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
abaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R0;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[3].zw, R0;
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.y
mul r1.y, r1, c12.x
mad o4.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
mov o0, r0
mov o1, v2
mov o4.zw, r0
add o3.xyz, r1, c14.x
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcdgpaoaaaagmlpopbjhiflipopiggegnabaaaaaabaaeaaaaadaaaaaa
cmaaaaaakaaaaaaaeaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
fdeieefcmiacaaaaeaaaabaalcaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaabaaaaaaibccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaa
egbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MUL R1.xyz, vertex.normal.y, c[10];
DP4 R2.w, vertex.position, c[4];
DP4 R2.z, vertex.position, c[3];
DP4 R0.w, vertex.position, c[8];
DP4 R2.x, vertex.position, c[1];
DP4 R2.y, vertex.position, c[2];
MUL R0.xyz, R2.xyww, c[0].y;
MUL R0.y, R0, c[17].x;
ADD result.texcoord[4].xy, R0, R0.z;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].y, R0, c[14];
MAD R1.xyz, vertex.normal.x, c[9], R1;
DP4 result.texcoord[3].x, R0, c[13];
MAD R0.xyz, vertex.normal.z, c[11], R1;
MOV result.position, R2;
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[4].zw, R2;
ADD result.texcoord[2].xyz, R0, c[0].x;
END
# 21 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c18, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
dp4 r2.w, v0, c3
dp4 r2.z, v0, c2
dp4 r0.w, v0, c7
dp4 r2.x, v0, c0
dp4 r2.y, v0, c1
mul r0.xyz, r2.xyww, c18.y
mul r0.y, r0, c16.x
mad o5.xy, r0.z, c17.zwzw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov o2, r0
dp4 o4.y, r0, c13
mad r1.xyz, v1.x, c8, r1
dp4 o4.x, r0, c12
mad r0.xyz, v1.z, c10, r1
mov o0, r2
mov o1, v2
mov o5.zw, r2
add o3.xyz, r0, c18.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 176
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedgadkdmloopgilbjgmgbdoaddofhppfajabaaaaaapaaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjaadaaaa
eaaaabaaoeaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaabaaaaaabaaaaaai
bccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
cccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
eccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadiaaaaai
dcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaaagaabaaaabaaaaaaegaabaaa
acaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaahaaaaaakgakbaaa
abaaaaaaegaabaaaabaaaaaadcaaaaakdccabaaaaeaaaaaaegiacaaaaaaaaaaa
aiaaaaaapgapbaaaabaaaaaaegaabaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
ADD result.texcoord[4].xyz, R0, -c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c17.x
add o5.xyz, r0, -c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaabhnmhllpjhcdhflkompgalmhpoiigaabaaaaaaiiaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcciadaaaa
eaaaabaamkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaajhccabaaaafaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaa
abaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
ADD result.texcoord[4].xyz, R0, -c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c17.x
add o5.xyz, r0, -c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaabhnmhllpjhcdhflkompgalmhpoiigaabaaaaaaiiaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcciadaaaa
eaaaabaamkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaajhccabaaaafaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaa
abaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].w, R0, c[20];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP4 result.texcoord[4].w, R0, c[8];
DP4 result.texcoord[4].z, R0, c[7];
DP4 result.texcoord[4].y, R0, c[6];
DP4 result.texcoord[4].x, R0, c[5];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o1, v2
mov o2, r0
dp4 o4.w, r0, c19
dp4 o4.z, r0, c18
dp4 o4.y, r0, c17
dp4 o4.x, r0, c16
dp4 o5.w, r0, c7
dp4 o5.z, r0, c6
dp4 o5.y, r0, c5
dp4 o5.x, r0, c4
add o3.xyz, r1, c20.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 176
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedclnfncodklkmfpmaobbklaoempfbjallabaaaaaapmaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaa
eaaaabaaohaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaamaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaagaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaahaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaaiaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaaajaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaakaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
abaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].w, R0, c[20];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP4 result.texcoord[4].w, R0, c[8];
DP4 result.texcoord[4].z, R0, c[7];
DP4 result.texcoord[4].y, R0, c[6];
DP4 result.texcoord[4].x, R0, c[5];
ADD result.texcoord[2].xyz, R1, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o1, v2
mov o2, r0
dp4 o4.w, r0, c19
dp4 o4.z, r0, c18
dp4 o4.y, r0, c17
dp4 o4.x, r0, c16
dp4 o5.w, r0, c7
dp4 o5.z, r0, c6
dp4 o5.y, r0, c5
dp4 o5.x, r0, c4
add o3.xyz, r1, c20.x
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 176
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedclnfncodklkmfpmaobbklaoempfbjallabaaaaaapmaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmadaaaa
eaaaabaaohaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaamaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaagaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaahaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaaiaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaaajaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaakaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaa
abaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
ADD result.texcoord[4].xyz, R0, -c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c17.x
add o5.xyz, r0, -c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaabhnmhllpjhcdhflkompgalmhpoiigaabaaaaaaiiaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcciadaaaa
eaaaabaamkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaajhccabaaaafaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaa
abaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[0], vertex.texcoord[0];
MOV result.texcoord[1], R0;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
ADD result.texcoord[2].xyz, R1, c[0].x;
ADD result.texcoord[4].xyz, R0, -c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o1, v2
mov o2, r0
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
add o3.xyz, r1, c17.x
add o5.xyz, r0, -c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaabhnmhllpjhcdhflkompgalmhpoiigaabaaaaaaiiaeaaaaadaaaaaa
cmaaaaaakaaaaaaafiabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcciadaaaa
eaaaabaamkaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaacaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaabaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaicccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaieccabaaaadaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaajhccabaaaafaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaabaaaaaa
abaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.x, R0, c[4];
POW R2.w, R0.x, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, R0.w, texture[0], 2D;
MUL R4.xyz, R0.w, c[2];
DP3 R0.w, R1, R2;
DP3 R1.w, R0, c[4].yzww;
ADD R3.xyz, R1.w, -R0;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 33 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mad r3.xy, v0, c3, c3.zwzw
mul r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.x, r1, r0
dp3 r1.x, r1, r2
max r1.w, r0.x, c4.x
pow r0, r1.w, c5.y
texld r3.xyz, r3, s1
mov r0.w, r0.x
dp3 r0.x, r3, c4.yzww
add r0.xyz, r0.x, -r3
mad r2.xyz, r0, c5.x, r3
max r2.w, r1.x, c4.x
pow r1, r2.w, r2.x
dp3 r0.x, v3, v3
texld r0.x, r0.x, s0
mul r0.xyz, r0.x, c2
mul r1.yzw, r0.xxyz, r0.w
mov r0.w, r1.x
mul r1.xyz, r2, r1.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r3, r1
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedgbcnlalimgkngjljmiadmdngkagofpfeabaaaaaaoiafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcoaaeaaaaeaaaaaaadiabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaam
hcaabaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaakgakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.z, R1, R0;
MAX R0.w, R0.z, c[4].x;
POW R1.w, R0.w, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[0], 2D;
DP3 R0.w, R0, c[4].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[5].x, R0;
MUL R4.xyz, R1.w, c[2];
MAX R0.w, R0, c[4].x;
MUL R2.xyz, R1, R4;
POW R0.w, R0.w, R1.x;
MUL R1.xyz, R0.w, c[2];
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[4].x;
END
# 30 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_diffuse] 2D 0
"ps_3_0
dcl_2d s0
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
mad_pp r1.xyz, -v1, c1.w, c1
dp3_pp r0.w, r1, r1
add r0.xyz, -v1, c0
rsq_pp r0.w, r0.w
mul_pp r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
rsq r0.w, r0.w
mul r0.xyz, r1.x, r0
mul r2.xyz, r0.w, v2
dp3 r0.z, r2, r0
mad r0.xy, v0, c3, c3.zwzw
texld r1.xyz, r0, s0
max r1.w, r0.z, c4.x
pow r0, r1.w, c5.y
dp3 r0.y, r1, c4.yzww
add r0.yzw, r0.y, -r1.xxyz
dp3 r1.w, r2, r3
mad r3.xyz, r0.yzww, c5.x, r1
max r0.y, r1.w, c4.x
pow r2, r0.y, r3.x
mul r0.xyz, r0.x, c2
mov r0.w, r2.x
mul r2.xyz, r3, r0
mul r0.xyz, r0.w, c2
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [_diffuse] 2D 0
ConstBuffer "$Globals" 48
Vector 16 [_LightColor0]
Vector 32 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedbpodegppjggoljiehhplagdhndodcbgkabaaaaaafaafaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcgaaeaaaaeaaaaaaabiabaaaafjaaaaaeegiocaaa
aaaaaaaaadaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaam
hcaabaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
dcaaaaaldcaabaaaabaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaa
acaaaaaaegacbaiaebaaaaaaabaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaa
acaaaaaaegacbaaaacaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaa
egacbaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
bjaaaaafhcaabaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.5, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.x, R0, c[4];
POW R2.w, R0.x, c[5].z;
RCP R0.w, fragment.texcoord[3].w;
MAD R3.xy, fragment.texcoord[3], R0.w, c[5].y;
TEX R0.w, R3, texture[0], 2D;
SLT R3.x, c[4], fragment.texcoord[3].z;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.w, R3.x, R0;
TEX R1.w, R1.w, texture[1], 2D;
MUL R1.w, R0, R1;
DP3 R0.w, R0, c[4].yzww;
MUL R4.xyz, R1.w, c[2];
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 39 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 0.00000000, 1.00000000, 0.50000000
def c6, 64.00000000, 0, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
max r0.w, r0, c4.x
pow r2, r0.w, c6.x
dp3 r0.w, r0, r3
mad r1.xy, v0, c3, c3.zwzw
texld r1.xyz, r1, s2
mov r1.w, r2.x
dp3 r2.x, r1, c4.yzww
add r0.xyz, r2.x, -r1
mad r3.xyz, r0, c5.x, r1
max r0.w, r0, c4.x
pow r2, r0.w, r3.x
rcp r0.x, v3.w
mad r4.xy, v3, r0.x, c5.w
dp3 r0.x, v3, v3
texld r0.w, r4, s0
cmp r0.y, -v3.z, c5, c5.z
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul r0.xyz, r0.x, c2
mul r2.yzw, r0.xxyz, r1.w
mov r0.w, r2.x
mul r2.xyz, r3, r2.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_diffuse] 2D 2
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedmmkdbamjejcddkenglelggifldpolfgkabaaaaaanmagaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcneafaaaaeaaaaaaahfabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadpcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaamhcaabaaa
aaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaak
dcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaah
mcaabaaaaaaaaaaaagbebaaaaeaaaaaapgbpbaaaaeaaaaaaaaaaaaakmcaabaaa
aaaaaaaakgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaadp
efaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadbaaaaahecaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaaeaaaaaa
abaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
ecaabaaaaaaaaaaadkaabaaaabaaaaaackaabaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
pgapbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
kgakbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaahocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagajbaaaabaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
baaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdp
koehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaa
pgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaa
ggggggdpggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaajgahbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_diffuse] 2D 2
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.z, R0.x, c[4].x;
POW R2.w, R0.z, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
TEX R0.w, fragment.texcoord[3], texture[1], CUBE;
TEX R1.w, R1.w, texture[0], 2D;
MUL R1.w, R1, R0;
DP3 R0.w, R0, c[4].yzww;
MUL R4.xyz, R1.w, c[2];
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 35 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_diffuse] 2D 2
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
dp3 r0.x, r0, r3
max r0.w, r0, c4.x
pow r2, r0.w, c5.y
mad r1.xy, v0, c3, c3.zwzw
texld r1.xyz, r1, s2
dp3 r0.w, r1, c4.yzww
mov r1.w, r2.x
add r2.xyz, r0.w, -r1
mad r3.xyz, r2, c5.x, r1
max r0.x, r0, c4
pow r2, r0.x, r3.x
dp3 r0.x, v3, v3
texld r0.w, v3, s1
texld r0.x, r0.x, s0
mul r0.x, r0, r0.w
mul r0.xyz, r0.x, c2
mul r2.yzw, r0.xxyz, r1.w
mov r0.w, r2.x
mul r2.xyz, r3, r2.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_LightTextureB0] 2D 1
SetTexture 1 [_LightTexture0] CUBE 0
SetTexture 2 [_diffuse] 2D 2
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedajpdmnhgmgohnkmlpjfheibdomaocpbfabaaaaaaeeagaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcdmafaaaaeaaaaaaaepabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaamhcaabaaa
aaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaak
dcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaakgakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbcbaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
diaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadcaaaaaldcaabaaa
acaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaaaceaaaaa
jkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaia
ebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaa
adaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaa
adaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.z, R0.x, c[4].x;
TEX R0.w, fragment.texcoord[3], texture[0], 2D;
MUL R4.xyz, R0.w, c[2];
DP3 R0.w, R1, R2;
POW R2.w, R0.z, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
DP3 R1.w, R0, c[4].yzww;
ADD R3.xyz, R1.w, -R0;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 32 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xy
mad_pp r1.xyz, -v1, c1.w, c1
dp3_pp r0.w, r1, r1
add r0.xyz, -v1, c0
rsq_pp r0.w, r0.w
mad r3.xy, v0, c3, c3.zwzw
mul_pp r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.x, r1, r0
max r1.w, r0.x, c4.x
pow r0, r1.w, c5.y
dp3 r0.w, r1, r2
texld r3.xyz, r3, s1
mov r1.w, r0.x
dp3 r0.y, r3, c4.yzww
add r0.xyz, r0.y, -r3
mad r1.xyz, r0, c5.x, r3
max r2.x, r0.w, c4
pow r0, r2.x, r1.x
texld r0.w, v3, s0
mul r2.xyz, r0.w, c2
mul r0.yzw, r2.xxyz, r1.w
mov r1.w, r0.x
mul r0.xyz, r1, r0.yzww
mul r1.xyz, r1.w, r2
mad oC0.xyz, r1, r3, r0
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedhmidbjhfldpdpeomphjaacjmeekdibjpabaaaaaammafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcmeaeaaaaeaaaaaaadbabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
dcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaam
hcaabaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaaeaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaapgapbaaaabaaaaaaegiccaaaaaaaaaaa
afaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaa
dcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaa
acaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaa
adaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaa
adaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaa
egacbaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaa
bjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
PARAM c[7] = { program.local[0..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.5, 1, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.z, R0.x, c[5].x;
POW R2.w, R0.z, c[6].w;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
RCP R0.w, fragment.texcoord[4].w;
TXP R3.x, fragment.texcoord[4], texture[2], 2D;
MAD R3.x, -fragment.texcoord[4].z, R0.w, R3;
MOV R0.w, c[6].z;
CMP R3.z, R3.x, c[2].x, R0.w;
RCP R1.w, fragment.texcoord[3].w;
MAD R3.xy, fragment.texcoord[3], R1.w, c[6].y;
TEX R0.w, R3, texture[0], 2D;
SLT R3.x, c[5], fragment.texcoord[3].z;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.w, R3.x, R0;
MUL R0.w, R0, R1;
MUL R1.w, R0, R3.z;
DP3 R0.w, R0, c[5].yzww;
MUL R4.xyz, R1.w, c[3];
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[6].x, R0;
MAX R0.w, R0, c[5].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[5].x;
END
# 45 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 0.00000000, 1.00000000, 0.50000000
def c7, 64.00000000, 0, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
dcl_texcoord4 v4
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
dp3 r0.x, r0, r3
max r0.w, r0, c5.x
pow r2, r0.w, c7.x
mad r1.xy, v0, c4, c4.zwzw
texld r1.xyz, r1, s3
dp3 r0.w, r1, c5.yzww
mov r1.w, r2.x
add r2.xyz, r0.w, -r1
mad r2.xyz, r2, c6.x, r1
max r0.x, r0, c5
pow r3, r0.x, r2.x
texldp r0.x, v4, s2
rcp r0.y, v4.w
mad r0.y, -v4.z, r0, r0.x
mov r0.z, c2.x
cmp r0.y, r0, c6.z, r0.z
rcp r0.x, v3.w
mad r4.xy, v3, r0.x, c6.w
dp3 r0.x, v3, v3
texld r0.w, r4, s0
cmp r0.z, -v3, c6.y, c6
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul r0.xyz, r0.x, c3
mul r3.yzw, r0.xxyz, r1.w
mov r0.w, r3.x
mul r2.xyz, r2, r3.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c5.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_diffuse] 2D 3
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedebilckdadmeigfmhfbhihfgippaegdbaabaaaaaanmahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefclmagaaaa
eaaaaaaakpabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaaeaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
aoaaaaahocaabaaaaaaaaaaaagbjbaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaajgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
dbaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaadhaaaaak
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaa
aaaaiadpdiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
dcaaaaamhcaabaaaabaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
cpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaec
bjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaa
pgapbaaaaaaaaaaaagajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
baaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdp
koehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaa
pgapbaaaaaaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaa
ggggggdpggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
agaabaaaabaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaa
adaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[7] = { program.local[0..4],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.5, 1, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R3;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R1.x, R0;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R2, R0;
MAX R0.z, R0.x, c[5].x;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R1.xyz, R0, texture[3], 2D;
MOV R0.x, c[6].z;
ADD R0.w, R0.x, -c[2].x;
TXP R0.x, fragment.texcoord[4], texture[2], SHADOW2D;
MAD R2.w, R0.x, R0, c[2].x;
RCP R0.y, fragment.texcoord[3].w;
MAD R0.xy, fragment.texcoord[3], R0.y, c[6].y;
TEX R0.w, R0, texture[0], 2D;
SLT R0.x, c[5], fragment.texcoord[3].z;
MUL R0.x, R0, R0.w;
DP3 R0.w, R2, R3;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.x, R0, R1.w;
MUL R0.y, R0.x, R2.w;
MUL R4.xyz, R0.y, c[3];
POW R0.z, R0.z, c[6].w;
MUL R5.xyz, R4, R0.z;
DP3 R0.x, R1, c[5].yzww;
ADD R0.xyz, R0.x, -R1;
MAD R0.xyz, R0, c[6].x, R1;
MAX R0.w, R0, c[5].x;
POW R0.w, R0.w, R0.x;
MUL R0.xyz, R0, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R1, R0;
MOV result.color.w, c[5].x;
END
# 44 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c5, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c6, 0.89999998, 0.00000000, 1.00000000, 0.50000000
def c7, 64.00000000, 0, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
dcl_texcoord4 v4
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
dp3 r0.x, r0, r3
max r0.w, r0, c5.x
pow r2, r0.w, c7.x
rcp r0.z, v3.w
mad r4.xy, v3, r0.z, c6.w
mad r1.xy, v0, c4, c4.zwzw
texld r1.xyz, r1, s3
dp3 r0.w, r1, c5.yzww
mov r1.w, r2.x
add r2.xyz, r0.w, -r1
mad r2.xyz, r2, c6.x, r1
max r0.x, r0, c5
pow r3, r0.x, r2.x
mov r0.x, c2
add r0.y, c6.z, -r0.x
texldp r0.x, v4, s2
mad r0.y, r0.x, r0, c2.x
dp3 r0.x, v3, v3
texld r0.w, r4, s0
cmp r0.z, -v3, c6.y, c6
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul r0.xyz, r0.x, c3
mul r3.yzw, r0.xxyz, r1.w
mov r0.w, r3.x
mul r2.xyz, r2, r3.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c5.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_diffuse] 2D 3
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedpigjlhnhnmpgaaiopikdibgebcpmmlikabaaaaaaomahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmagaaaa
eaaaaaaaldabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaaeaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
aoaaaaahocaabaaaaaaaaaaaagbjbaaaafaaaaaapgbpbaaaafaaaaaaehaaaaal
ccaabaaaaaaaaaaajgafbaaaaaaaaaaaaghabaaaadaaaaaaaagabaaaaaaaaaaa
dkaabaaaaaaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaadaaaaaa
biaaaaaaabeaaaaaaaaaiadpdcaaaaakccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaaakiacaaaadaaaaaabiaaaaaadiaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaadcaaaaamhcaabaaaabaaaaaapgipcaaa
acaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahocaabaaaabaaaaaapgapbaaaaaaaaaaaagajbaaaaaaaaaaa
dcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaabaaaaaakicaabaaaaaaaaaaaegacbaaa
acaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaa
adaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaaaaaaaaaadcaaaaamhcaabaaa
adaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaa
egacbaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
bjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
TXP R3.x, fragment.texcoord[3], texture[0], 2D;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.z, R0.x, c[4].x;
MUL R4.xyz, R3.x, c[2];
POW R1.w, R0.z, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
DP3 R0.w, R0, c[4].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R1.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 32 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
mad_pp r1.xyz, -v1, c1.w, c1
dp3_pp r0.w, r1, r1
add r0.xyz, -v1, c0
rsq_pp r0.w, r0.w
mad r3.xy, v0, c3, c3.zwzw
mul_pp r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.x, r1, r0
max r1.w, r0.x, c4.x
pow r0, r1.w, c5.y
dp3 r0.w, r1, r2
texld r3.xyz, r3, s1
mov r1.w, r0.x
dp3 r0.y, r3, c4.yzww
add r0.xyz, r0.y, -r3
mad r1.xyz, r0, c5.x, r3
max r2.x, r0.w, c4
pow r0, r2.x, r1.x
texldp r2.x, v3, s0
mul r2.xyz, r2.x, c2
mul r0.yzw, r2.xxyz, r1.w
mov r1.w, r0.x
mul r0.xyz, r1, r0.yzww
mul r1.xyz, r1.w, r2
mad oC0.xyz, r1, r3, r0
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_diffuse] 2D 1
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefieceddipingfjpbnndbfnneaokaeppekieopoabaaaaaaoiafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcoaaeaaaaeaaaaaaadiabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
lcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaam
hcaabaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aoaaaaahmcaabaaaaaaaaaaaagbebaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.z, R0.x, c[4].x;
POW R2.w, R0.z, c[5].y;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
TXP R3.x, fragment.texcoord[4], texture[0], 2D;
TEX R0.w, fragment.texcoord[3], texture[1], 2D;
MUL R1.w, R0, R3.x;
DP3 R0.w, R0, c[4].yzww;
MUL R4.xyz, R1.w, c[2];
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[5].x, R0;
MAX R0.w, R0, c[4].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[4].x;
END
# 34 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c5, 0.89999998, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xy
dcl_texcoord4 v4
mad_pp r1.xyz, -v1, c1.w, c1
dp3_pp r0.w, r1, r1
add r0.xyz, -v1, c0
rsq_pp r0.w, r0.w
mad r3.xy, v0, c3, c3.zwzw
mul_pp r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.x, r1, r0
max r1.w, r0.x, c4.x
pow r0, r1.w, c5.y
texld r3.xyz, r3, s2
dp3 r0.w, r1, r2
mov r2.w, r0.x
dp3 r0.y, r3, c4.yzww
add r0.xyz, r0.y, -r3
mad r2.xyz, r0, c5.x, r3
max r0.x, r0.w, c4
pow r1, r0.x, r2.x
texld r0.w, v3, s1
texldp r0.x, v4, s0
mul r0.x, r0.w, r0
mul r0.xyz, r0.x, c2
mul r1.yzw, r0.xxyz, r2.w
mov r0.w, r1.x
mul r1.xyz, r2, r1.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r3, r1
mov_pp oC0.w, c4.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_diffuse] 2D 2
ConstBuffer "$Globals" 176
Vector 144 [_LightColor0]
Vector 160 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedbmkfkjbfghbhpmbbeidlnnnanobjlmjjabaaaaaagiagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceiafaaaa
eaaaaaaafcabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadcaaaaam
hcaabaaaaaaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaamgaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aoaaaaahmcaabaaaaaaaaaaaagbebaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaaeaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadcaaaaal
dcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaabaaaaaakicaabaaaabaaaaaaegacbaaaacaaaaaa
aceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaamhcaabaaaadaaaaaa
egacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdpaaaaaaaaegacbaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaabjaaaaaf
hcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..5],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.97000003, 1, 64 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
DP3 R2.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.x, R0, c[6];
POW R1.w, R0.x, c[7].w;
TEX R0, fragment.texcoord[4], texture[0], CUBE;
DP4 R0.z, R0, c[8];
RSQ R2.w, R2.w;
RCP R0.y, R2.w;
MUL R0.y, R0, c[2].w;
MAD R0.y, -R0, c[7], R0.z;
MOV R0.x, c[7].z;
CMP R2.w, R0.y, c[3].x, R0.x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, R0.z, texture[1], 2D;
MUL R0.w, R0, R2;
MUL R4.xyz, R0.w, c[4];
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
DP3 R0.w, R0, c[6].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[7].x, R0;
MAX R0.w, R0, c[6].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R1.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[6].x;
END
# 43 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c7, 0.89999998, 0.97000003, 1.00000000, 64.00000000
def c8, 1.00000000, 0.00392157, 0.00001538, 0.00000006
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
max r0.w, r0, c6.x
pow r2, r0.w, c7.w
dp3 r0.w, r0, r3
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s2
mov r1.w, r2.x
dp3 r2.x, r1, c6.yzww
add r0.xyz, r2.x, -r1
mad r3.xyz, r0, c7.x, r1
max r0.w, r0, c6.x
pow r2, r0.w, r3.x
dp3 r0.x, v4, v4
rsq r2.y, r0.x
texld r0, v4, s0
dp4 r0.y, r0, c8
rcp r2.y, r2.y
mul r0.x, r2.y, c2.w
mad r0.y, -r0.x, c7, r0
mov r0.z, c3.x
dp3 r0.x, v3, v3
cmp r0.y, r0, c7.z, r0.z
texld r0.x, r0.x, s1
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r2.yzw, r0.xxyz, r1.w
mov r0.w, r2.x
mul r2.xyz, r3, r2.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c6.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] CUBE 0
SetTexture 2 [_diffuse] 2D 2
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedhimbllaclicnllcblaamdpjmfiapgmmpabaaaaaafaahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdaagaaaa
eaaaaaaaimabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaadcaaaaamhcaabaaaaaaaaaaapgipcaaaacaaaaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaamgaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaomfbhidpefaaaaaj
pcaabaaaabaaaaaaegbcbaaaafaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
bbaaaaakicaabaaaaaaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpibiaiadl
icabibdhafidibdddbaaaaahecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaa
aaaaaaaadhaaaaakecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaaadaaaaaa
biaaaaaaabeaaaaaaaaaiadpbaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
akaabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaakgakbaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaa
abaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
agaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaabaaaaaakicaabaaaabaaaaaa
egacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaaaaaaaaai
hcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaaabaaaaaadcaaaaam
hcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdpggggggdpggggggdp
aaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..5],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.97000003, 1, 64 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.x, R1, R0;
MAX R0.x, R0, c[6];
POW R2.w, R0.x, c[7].w;
TEX R0, fragment.texcoord[4], texture[0], CUBE;
DP4 R0.z, R0, c[8];
RSQ R1.w, R1.w;
RCP R0.y, R1.w;
MUL R0.y, R0, c[2].w;
MAD R0.y, -R0, c[7], R0.z;
MOV R0.x, c[7].z;
CMP R3.x, R0.y, c[3], R0;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, fragment.texcoord[3], texture[2], CUBE;
TEX R1.w, R0.z, texture[1], 2D;
MUL R0.z, R1.w, R0.w;
MUL R0.w, R0.z, R3.x;
MUL R4.xyz, R0.w, c[4];
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
DP3 R0.w, R0, c[6].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[7].x, R0;
MAX R0.w, R0, c[6].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[6].x;
END
# 45 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c6, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c7, 0.89999998, 0.97000003, 1.00000000, 64.00000000
def c8, 1.00000000, 0.00392157, 0.00001538, 0.00000006
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
dp3 r0.x, r0, r3
max r0.w, r0, c6.x
pow r2, r0.w, c7.w
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s3
dp3 r0.w, r1, c6.yzww
mov r1.w, r2.x
add r2.xyz, r0.w, -r1
mad r3.xyz, r2, c7.x, r1
max r0.x, r0, c6
pow r2, r0.x, r3.x
texld r0, v4, s0
dp4 r0.y, r0, c8
dp3 r2.y, v4, v4
rsq r2.y, r2.y
rcp r0.x, r2.y
mul r0.x, r0, c2.w
mad r0.x, -r0, c7.y, r0.y
mov r0.z, c3.x
cmp r0.y, r0.x, c7.z, r0.z
dp3 r0.x, v3, v3
texld r0.w, v3, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r2.yzw, r0.xxyz, r1.w
mov r0.w, r2.x
mul r2.xyz, r3, r2.yzww
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c6.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [_LightTextureB0] 2D 2
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_diffuse] 2D 3
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedkflakmgphcbmemppngafdcjobdhpkgmkabaaaaaalmahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmagaaaa
eaaaaaaakhabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaomfbhidpefaaaaajpcaabaaaabaaaaaa
egbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaa
aaaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
dbaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadhaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaa
aaaaiadpbaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaaeaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
acaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
dcaaaaamhcaabaaaabaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
cpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaec
bjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaa
pgapbaaaaaaaaaaaagajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
baaaaaakicaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdp
koehobdnaaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaa
pgapbaaaaaaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaa
ggggggdpggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaa
abaaaaaafgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaa
agaabaaaabaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaa
adaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
PARAM c[12] = { program.local[0..8],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.5, 1, 0.25 },
		{ 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R1;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R0;
RCP R1.w, fragment.texcoord[4].w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R0, R2;
MAD R2.xy, fragment.texcoord[4], R1.w, c[6];
TEX R2.x, R2, texture[2], 2D;
MAD R3.xy, fragment.texcoord[4], R1.w, c[5];
MOV R2.w, R2.x;
TEX R2.x, R3, texture[2], 2D;
MAD R3.xy, fragment.texcoord[4], R1.w, c[4];
MOV R2.z, R2.x;
TEX R2.x, R3, texture[2], 2D;
MAD R3.xy, fragment.texcoord[4], R1.w, c[3];
MOV R2.y, R2.x;
TEX R2.x, R3, texture[2], 2D;
MAD R2, -fragment.texcoord[4].z, R1.w, R2;
MOV R3.x, c[10].z;
CMP R2, R2, c[2].x, R3.x;
DP4 R3.y, R2, c[10].w;
MAX R0.w, R0, c[9].x;
POW R3.x, R0.w, c[11].x;
RCP R0.w, fragment.texcoord[3].w;
MAD R2.zw, fragment.texcoord[3].xyxy, R0.w, c[10].y;
TEX R0.w, R2.zwzw, texture[0], 2D;
SLT R2.z, c[9].x, fragment.texcoord[3];
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.w, R2.z, R0;
MAD R2.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.w, R0, R1;
MUL R0.w, R0, R3.y;
MUL R4.xyz, R0.w, c[7];
TEX R2.xyz, R2, texture[3], 2D;
DP3 R0.w, R2, c[9].yzww;
MUL R5.xyz, R4, R3.x;
ADD R3.xyz, R0.w, -R2;
DP3 R0.w, R0, R1;
MAD R0.xyz, R3, c[10].x, R2;
MAX R0.w, R0, c[9].x;
POW R0.w, R0.w, R0.x;
MUL R0.xyz, R0, R5;
MUL R1.xyz, R0.w, R4;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[9].x;
END
# 56 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c9, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c10, 0.89999998, 0.00000000, 1.00000000, 0.50000000
def c11, 0.25000000, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
dcl_texcoord4 v4
rcp r2.w, v4.w
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
dp3 r0.w, v2, v2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r1
dp3 r0.x, r0, r2
max r0.w, r0, c9.x
pow r1, r0.w, c11.y
max r0.z, r0.x, c9.x
mad r4.xy, v4, r2.w, c5
mad r3.xy, v0, c8, c8.zwzw
mov r1.w, r1.x
texld r1.xyz, r3, s3
dp3 r0.y, r1, c9.yzww
add r2.xyz, r0.y, -r1
mad r0.xy, v4, r2.w, c6
texld r0.x, r0, s2
mad r2.xyz, r2, c10.x, r1
pow r3, r0.z, r2.x
mov r0.w, r0.x
texld r0.x, r4, s2
mov r3.y, c2.x
mad r4.xy, v4, r2.w, c4
mov r0.z, r0.x
texld r0.x, r4, s2
mad r4.xy, v4, r2.w, c3
mov r0.y, r0.x
texld r0.x, r4, s2
mad r0, -v4.z, r2.w, r0
cmp r0, r0, c10.z, r3.y
dp4_pp r0.z, r0, c11.x
rcp r2.w, v3.w
mad r4.xy, v3, r2.w, c10.w
dp3 r0.x, v3, v3
texld r0.w, r4, s0
cmp r0.y, -v3.z, c10, c10.z
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
mul r0.xyz, r0.x, c7
mul r4.xyz, r0, r1.w
mov r0.w, r3.x
mul r2.xyz, r2, r4
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c9.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_diffuse] 2D 3
ConstBuffer "$Globals" 176
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedcliipmdadlnmjchmmkelehfncfdljlcdabaaaaaadiajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiaiaaaa
eaaaaaaaagacaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaaoaaaaahhcaabaaaaaaaaaaaegbcbaaaafaaaaaapgbpbaaa
afaaaaaaaaaaaaaidcaabaaaabaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaaaaaaaaaidcaabaaaacaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaadgaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaa
aaaaaaaidcaabaaaacaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadgaaaaafecaabaaaabaaaaaaakaabaaaacaaaaaaaaaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadgaaaaaf
icaabaaaabaaaaaaakaabaaaacaaaaaadbaaaaahpcaabaaaaaaaaaaaegaobaaa
abaaaaaakgakbaaaaaaaaaaadhaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
agiacaaaadaaaaaabiaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaiado
aaaaiadoaaaaiadoaoaaaaahgcaabaaaaaaaaaaaagbbbaaaaeaaaaaapgbpbaaa
aeaaaaaaaaaaaaakgcaabaaaaaaaaaaafgagbaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaaeaaaaaaabaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaa
aaaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaakgakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadcaaaaam
hcaabaaaabaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaa
acaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaapgapbaaa
aaaaaaaaagajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaabaaaaaak
icaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[12] = { program.local[0..8],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.5, 1, 0.25 },
		{ 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MAD R0.xyz, R0.w, R0, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.x;
RCP R2.w, fragment.texcoord[4].w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R1, R3;
MAD R0.xyz, fragment.texcoord[4], R2.w, c[6];
MAD R3.xyz, fragment.texcoord[4], R2.w, c[4];
MAX R1.w, R0, c[9].x;
TEX R0.x, R0, texture[2], SHADOW2D;
MOV R0.w, R0.x;
MAD R0.xyz, fragment.texcoord[4], R2.w, c[5];
TEX R0.x, R0, texture[2], SHADOW2D;
TEX R3.x, R3, texture[2], SHADOW2D;
MOV R0.z, R0.x;
MOV R0.y, R3.x;
MAD R3.xyz, fragment.texcoord[4], R2.w, c[3];
MOV R0.x, c[10].z;
ADD R2.w, R0.x, -c[2].x;
TEX R0.x, R3, texture[2], SHADOW2D;
MAD R0, R0, R2.w, c[2].x;
DP4 R3.x, R0, c[10].w;
POW R2.w, R1.w, c[11].x;
RCP R0.z, fragment.texcoord[3].w;
MAD R0.zw, fragment.texcoord[3].xyxy, R0.z, c[10].y;
TEX R0.w, R0.zwzw, texture[0], 2D;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
SLT R0.z, c[9].x, fragment.texcoord[3];
MUL R0.z, R0, R0.w;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.z, R0, R1.w;
MUL R0.w, R0.z, R3.x;
MUL R4.xyz, R0.w, c[7];
MAD R0.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
DP3 R0.w, R0, c[9].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[10].x, R0;
MAX R0.w, R0, c[9].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[9].x;
END
# 56 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_diffuse_ST]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c9, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c10, 0.89999998, 0.00000000, 1.00000000, 0.50000000
def c11, 0.25000000, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
dcl_texcoord4 v4
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r2
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
rcp r2.w, v4.w
mul r0.xyz, r1.x, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, v2
dp3 r0.x, r1, r0
max r1.w, r0.x, c9.x
pow r0, r1.w, c11.y
dp3 r0.z, r1, r2
mov r1.w, r0.x
mad r0.xy, v0, c8, c8.zwzw
texld r2.xyz, r0, s3
dp3 r0.x, r2, c9.yzww
add r1.xyz, r0.x, -r2
max r0.w, r0.z, c9.x
mad r3.xyz, r1, c10.x, r2
mad r0.xyz, v4, r2.w, c6
mad r1.xyz, v4, r2.w, c4
pow r4, r0.w, r3.x
texld r0.x, r0, s2
mov_pp r0.w, r0.x
mad r0.xyz, v4, r2.w, c5
texld r0.x, r0, s2
texld r1.x, r1, s2
mov_pp r0.z, r0.x
mov_pp r0.y, r1.x
mad r1.xyz, v4, r2.w, c3
mov r0.x, c2
add r2.w, c10.z, -r0.x
texld r0.x, r1, s2
mad r0, r0, r2.w, c2.x
dp4_pp r0.z, r0, c11.x
rcp r1.x, v3.w
mad r1.xy, v3, r1.x, c10.w
dp3 r0.x, v3, v3
texld r0.w, r1, s0
cmp r0.y, -v3.z, c10, c10.z
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
mul r0.xyz, r0.x, c7
mul r1.xyz, r0, r1.w
mov r0.w, r4.x
mul r1.xyz, r3, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c9.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_diffuse] 2D 3
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedegfamafflidggnenajieaeknnlcfebgjabaaaaaabiajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpiahaaaa
eaaaaaaapoabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaiaebaaaaaaadaaaaaa
biaaaaaaabeaaaaaaaaaiadpaoaaaaahocaabaaaaaaaaaaaagbjbaaaafaaaaaa
pgbpbaaaafaaaaaaaaaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaaehaaaaalbcaabaaaabaaaaaaegaabaaaabaaaaaaaghabaaa
adaaaaaaaagabaaaaaaaaaaackaabaaaabaaaaaaaaaaaaaihcaabaaaacaaaaaa
jgahbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaaehaaaaalccaabaaaabaaaaaa
egaabaaaacaaaaaaaghabaaaadaaaaaaaagabaaaaaaaaaaackaabaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
aaaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaaeaaaaaa
ehaaaaalicaabaaaabaaaaaajgafbaaaaaaaaaaaaghabaaaadaaaaaaaagabaaa
aaaaaaaadkaabaaaaaaaaaaaehaaaaalecaabaaaabaaaaaaegaabaaaacaaaaaa
aghabaaaadaaaaaaaagabaaaaaaaaaaackaabaaaacaaaaaadcaaaaakpcaabaaa
aaaaaaaaegaobaaaabaaaaaaagaabaaaaaaaaaaaagiacaaaadaaaaaabiaaaaaa
bbaaaaakbcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaiado
aaaaiadoaaaaiadoaoaaaaahgcaabaaaaaaaaaaaagbbbaaaaeaaaaaapgbpbaaa
aeaaaaaaaaaaaaakgcaabaaaaaaaaaaafgagbaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaaeaaaaaaabaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaa
aaaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaabaaaaaakgakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadcaaaaam
hcaabaaaabaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaa
acaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaapgapbaaa
aaaaaaaaagajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaabaaaaaak
icaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"3.0-!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.25, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
DP3 R2.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.w, R0, R0;
MUL R2.xyz, R0.w, R1;
RSQ R0.w, R1.w;
MAD R1.xyz, R0.w, R0, R2;
DP3 R0.x, R1, R1;
RSQ R0.y, R0.x;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xyz, R0.y, R1;
RSQ R0.w, R0.x;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R1, R3;
ADD R0.xyz, fragment.texcoord[4], c[7].zwww;
TEX R0, R0, texture[0], CUBE;
DP4 R4.w, R0, c[8];
MAX R1.w, R1, c[6].x;
ADD R0.xyz, fragment.texcoord[4], c[7].wzww;
TEX R0, R0, texture[0], CUBE;
DP4 R4.z, R0, c[8];
ADD R3.xyz, fragment.texcoord[4], c[7].wwzw;
TEX R3, R3, texture[0], CUBE;
ADD R0.xyz, fragment.texcoord[4], c[7].z;
TEX R0, R0, texture[0], CUBE;
DP4 R4.x, R0, c[8];
RSQ R2.w, R2.w;
RCP R0.x, R2.w;
DP4 R4.y, R3, c[8];
MUL R0.x, R0, c[2].w;
MAD R0, -R0.x, c[7].y, R4;
MOV R2.w, c[8].x;
CMP R0, R0, c[3].x, R2.w;
DP4 R2.w, R0, c[9].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, R0.z, texture[1], 2D;
MUL R0.w, R0, R2;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
MUL R4.xyz, R0.w, c[4];
DP3 R0.w, R0, c[6].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
POW R1.w, R1.w, c[9].y;
MAD R1.xyz, R3, c[7].x, R0;
MAX R0.w, R0, c[6].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R1.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[6].x;
END
# 54 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_diffuse] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c7, 0.89999998, 0.00781250, -0.00781250, 0.97000003
def c8, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c9, 0.25000000, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
dp3 r0.w, v2, v2
mul r2.xyz, r1.w, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v2
dp3 r0.w, r0, r2
dp3 r0.x, r0, r1
max r0.w, r0, c6.x
pow r2, r0.w, c9.y
max r1.w, r0.x, c6.x
mad r3.xy, v0, c5, c5.zwzw
mov r2.w, r2.x
texld r2.xyz, r3, s2
dp3 r0.y, r2, c6.yzww
add r1.xyz, r0.y, -r2
mad r3.xyz, r1, c7.x, r2
pow r4, r1.w, r3.x
add r0.xyz, v4, c7.yzzw
texld r0, r0, s0
dp4 r5.w, r0, c8
add r0.xyz, v4, c7.zyzw
texld r0, r0, s0
dp4 r5.z, r0, c8
add r1.xyz, v4, c7.zzyw
texld r1, r1, s0
dp4 r5.y, r1, c8
add r0.xyz, v4, c7.y
texld r0, r0, s0
dp3 r1.x, v4, v4
rsq r1.x, r1.x
dp4 r5.x, r0, c8
rcp r0.x, r1.x
mul r0.x, r0, c2.w
mad r0, -r0.x, c7.w, r5
mov r1.x, c3
cmp r1, r0, c8.x, r1.x
dp3 r0.x, v3, v3
dp4_pp r0.y, r1, c9.x
texld r0.x, r0.x, s1
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r1.xyz, r0, r2.w
mov r0.w, r4.x
mul r1.xyz, r3, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c6.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] CUBE 0
SetTexture 2 [_diffuse] 2D 2
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecednkdgajjnbcdhemnnlmdghnkjcmmciddeabaaaaaabiajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpiahaaaa
eaaaaaaapoabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaomfbhidpaaaaaaakocaabaaa
aaaaaaaaagbjbaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaadmaaaaaadmaaaaaadm
efaaaaajpcaabaaaabaaaaaajgahbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabbaaaaakbcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadp
ibiaiadlicabibdhafidibddaaaaaaakocaabaaaaaaaaaaaagbjbaaaafaaaaaa
aceaaaaaaaaaaaaaaaaaaalmaaaaaalmaaaaaadmefaaaaajpcaabaaaacaaaaaa
jgahbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaa
abaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
aaaaaaakocaabaaaaaaaaaaaagbjbaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaalm
aaaaaadmaaaaaalmefaaaaajpcaabaaaacaaaaaajgahbaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaakocaabaaaaaaaaaaa
agbjbaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaadmaaaaaalmaaaaaalmefaaaaaj
pcaabaaaacaaaaaajgahbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
bbaaaaakicaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaiadpibiaiadl
icabibdhafidibdddbaaaaahpcaabaaaaaaaaaaaegaobaaaabaaaaaaagaabaaa
aaaaaaaadhaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaadaaaaaa
biaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakbcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiado
baaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadcaaaaam
hcaabaaaabaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaa
acaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egbcbaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaapgapbaaa
aaaaaaaaagajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaabaaaaaak
icaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdn
aaaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdp
ggggggdpggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaaabaaaaaa
fgaobaaaabaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_diffuse] 2D 3
"3.0-!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 0, 0.30000001, 0.58999997, 0.11 },
		{ 0.89999998, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.25, 64 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
DP3 R2.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.w, R0, R0;
MUL R2.xyz, R0.w, R1;
RSQ R0.w, R1.w;
MAD R1.xyz, R0.w, R0, R2;
DP3 R0.x, R1, R1;
RSQ R0.y, R0.x;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xyz, R0.y, R1;
RSQ R0.w, R0.x;
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R1, R3;
ADD R0.xyz, fragment.texcoord[4], c[7].zwww;
TEX R0, R0, texture[0], CUBE;
DP4 R4.w, R0, c[8];
ADD R0.xyz, fragment.texcoord[4], c[7].wzww;
TEX R0, R0, texture[0], CUBE;
DP4 R4.z, R0, c[8];
ADD R3.xyz, fragment.texcoord[4], c[7].wwzw;
TEX R3, R3, texture[0], CUBE;
ADD R0.xyz, fragment.texcoord[4], c[7].z;
TEX R0, R0, texture[0], CUBE;
DP4 R4.y, R3, c[8];
DP4 R4.x, R0, c[8];
RSQ R2.w, R2.w;
RCP R0.x, R2.w;
MUL R0.x, R0, c[2].w;
MAD R0, -R0.x, c[7].y, R4;
MOV R2.w, c[8].x;
CMP R0, R0, c[3].x, R2.w;
DP4 R3.x, R0, c[9].x;
MAX R1.w, R1, c[6].x;
POW R2.w, R1.w, c[9].y;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, fragment.texcoord[3], texture[2], CUBE;
TEX R1.w, R0.z, texture[1], 2D;
MUL R0.z, R1.w, R0.w;
MUL R0.w, R0.z, R3.x;
MUL R4.xyz, R0.w, c[4];
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
DP3 R0.w, R0, c[6].yzww;
ADD R3.xyz, R0.w, -R0;
DP3 R0.w, R1, R2;
MAD R1.xyz, R3, c[7].x, R0;
MAX R0.w, R0, c[6].x;
POW R0.w, R0.w, R1.x;
MUL R5.xyz, R4, R2.w;
MUL R1.xyz, R1, R5;
MUL R2.xyz, R0.w, R4;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[6].x;
END
# 56 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_diffuse_ST]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_diffuse] 2D 3
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c6, 0.00000000, 0.30000001, 0.58999997, 0.11000000
def c7, 0.89999998, 0.00781250, -0.00781250, 0.97000003
def c8, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c9, 0.25000000, 64.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mad r0.xyz, r0.w, r0, r3
dp3 r1.x, r0, r0
rsq r1.x, r1.x
dp3 r0.w, v2, v2
rsq r0.w, r0.w
mul r0.xyz, r1.x, r0
mul r2.xyz, r0.w, v2
dp3 r0.x, r2, r0
max r0.x, r0, c6
pow r1, r0.x, c9.y
mov r2.w, r1.x
add r0.xyz, v4, c7.yzzw
texld r0, r0, s0
dp4 r4.w, r0, c8
add r0.xyz, v4, c7.zyzw
texld r0, r0, s0
dp4 r4.z, r0, c8
add r1.xyz, v4, c7.zzyw
texld r1, r1, s0
dp4 r4.y, r1, c8
add r0.xyz, v4, c7.y
texld r0, r0, s0
dp3 r1.x, v4, v4
dp4 r4.x, r0, c8
rsq r1.x, r1.x
rcp r0.x, r1.x
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s3
mul r0.x, r0, c2.w
mad r0, -r0.x, c7.w, r4
mov r3.w, c3.x
cmp r0, r0, c8.x, r3.w
dp4_pp r0.y, r0, c9.x
dp3 r1.w, r1, c6.yzww
add r4.xyz, r1.w, -r1
dp3 r1.w, r2, r3
dp3 r0.x, v3, v3
mad r2.xyz, r4, c7.x, r1
max r1.w, r1, c6.x
pow r3, r1.w, r2.x
texld r0.w, v3, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r4.xyz, r0, r2.w
mov r0.w, r3.x
mul r2.xyz, r2, r4
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c6.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_LightTextureB0] 2D 2
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_diffuse] 2D 3
ConstBuffer "$Globals" 112
Vector 80 [_LightColor0]
Vector 96 [_diffuse_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedhhcmcojjknlmempmonkedjfifmojflhjabaaaaaaheajaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfeaiaaaa
eaaaaaaabfacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabjaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaomfbhidpaaaaaaakocaabaaaaaaaaaaa
agbjbaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaadmaaaaaadmaaaaaadmefaaaaaj
pcaabaaaabaaaaaajgahbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
bbaaaaakbcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadpibiaiadl
icabibdhafidibddaaaaaaakocaabaaaaaaaaaaaagbjbaaaafaaaaaaaceaaaaa
aaaaaaaaaaaaaalmaaaaaalmaaaaaadmefaaaaajpcaabaaaacaaaaaajgahbaaa
aaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaaabaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaak
ocaabaaaaaaaaaaaagbjbaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaalmaaaaaadm
aaaaaalmefaaaaajpcaabaaaacaaaaaajgahbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaiadpibiaiadlicabibdhafidibddaaaaaaakocaabaaaaaaaaaaaagbjbaaa
afaaaaaaaceaaaaaaaaaaaaaaaaaaadmaaaaaalmaaaaaalmefaaaaajpcaabaaa
acaaaaaajgahbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaak
icaabaaaabaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdh
afidibdddbaaaaahpcaabaaaaaaaaaaaegaobaaaabaaaaaaagaabaaaaaaaaaaa
dhaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaadaaaaaabiaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakbcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbcbaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadcaaaaamhcaabaaa
abaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegbcbaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiaecbjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahocaabaaaabaaaaaapgapbaaaaaaaaaaa
agajbaaaaaaaaaaadcaaaaaldcaabaaaacaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaacaaaaaa
egaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaabaaaaaakicaabaaa
aaaaaaaaegacbaaaacaaaaaaaceaaaaajkjjjjdodnakbhdpkoehobdnaaaaaaaa
aaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaamhcaabaaaadaaaaaaegacbaaaadaaaaaaaceaaaaaggggggdpggggggdp
ggggggdpaaaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgaobaaa
abaaaaaaagajbaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaabaaaaaa
egacbaaaadaaaaaabjaaaaafhcaabaaaadaaaaaaegacbaaaadaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
}
 }
}
Fallback "Diffuse"
}