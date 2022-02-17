Shader "Hidden/Hardsurface Pro Front Transparent" {
SubShader { 
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[20];
DP4 R0.y, R1, c[19];
DP4 R0.x, R1, c[18];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[21];
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[22].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[22].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[22].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[5].y, R2, R3;
MUL result.texcoord[2], R0, c[22].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 57 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c21.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c22.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c19
dp4 r0.y, r1, c18
dp4 r0.x, r1, c17
mul r1.xyz, r0.w, c20
add r0.xyz, r2, r0
add o5.xyz, r0, r1
mov r0.w, c22.x
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c21.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
mov r1, c8
dp4 r4.x, c13, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c21.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c21.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r4
dp3 o6.y, r2, r3
mul o3, r0, c21.w
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednpegjlhoonanefemkcgjnjapddfoicfpabaaaaaahmakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaiaaaaeaaaabaacmacaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
aaaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagaabaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaallcaabaaa
abaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaa
egaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaa
bkaabaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaacaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaa
ckiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaagaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahbccabaaaagaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaagaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[15].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[15].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[15].w;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c15.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c13.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c13.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c13.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c13.w
mad o4.xy, v3, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 112 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedimbejcnjaaoipdjpollanpeoljcedjegabaaaaaabeahaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefchiafaaaaeaaaabaa
foabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaa
aeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaal
lcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaa
egambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
abaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaa
abaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
abaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[21];
DP4 R0.y, R1, c[20];
DP4 R0.x, R1, c[19];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[22];
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[23].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[23].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[23].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[23].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[5].y, R2, R3;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
END
# 62 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c23.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c24.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c21
dp4 r0.y, r1, c20
dp4 r0.x, r1, c19
mul r1.xyz, r0.w, c22
add r0.xyz, r2, r0
add o5.xyz, r0, r1
mov r0.w, c24.x
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c23.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mov r1, c8
dp4 r4.x, c15, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c23.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c23.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c23.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c24.y
mul r1.y, r1, c13.x
dp3 o4.y, r2, r4
dp3 o6.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
mad o7.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o7.zw, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedcgpockknneaeapijpcidonngbjmmhkndabaaaaaacmalaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
eiajaaaaeaaaabaafcacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadpccabaaa
ahaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaadcaaaaallcaabaaaacaaaaaaegiicaaa
acaaaaaaaoaaaaaakgakbaiaebaaaaaaabaaaaaaegaibaaaacaaaaaadgaaaaaf
icaabaaaadaaaaaaakaabaaaacaaaaaadiaaaaahhcaabaaaaeaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaeaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaafaaaaaaakiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaafaaaaaaakiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaafaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
adaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaafaaaaaabaaaaaahecaabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaafaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaadaaaaaa
pgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaagbcaabaaaafaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
afaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaafaaaaaabkiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaafaaaaaa
baaaaaahecaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaafaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaadaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaag
bcaabaaaadaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
ckiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaackiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
adaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
cccabaaaagaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaa
dgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaa
jgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaacaaaaaa
bkaabaaaacaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaacaaaaaaakaabaaa
acaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahbccabaaa
agaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaagaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
ahaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaahaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 16 [unity_Scale]
Vector 17 [unity_LightmapST]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[16].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP4 R1.w, vertex.position, c[4];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[16].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[16].w;
DP3 R0.y, R1, c[7];
DP4 R1.z, vertex.position, c[3];
DP3 R0.w, -R2, c[7];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R2.xyz, R1.xyww, c[0].y;
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[16].w;
MOV R0.x, R2;
MUL R0.y, R2, c[14].x;
ADD result.texcoord[4].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[4].zw, R1;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 36 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c15.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp4 r1.w, v0, c3
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c15.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c15.w
dp3 r0.y, r1, c6
dp4 r1.z, v0, c2
dp3 r0.w, -r2, c6
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c17.y
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c15.w
mov r0.x, r2
mul r0.y, r2, c13.x
mad o5.xy, r2.z, c14.zwzw, r0
mov o0, r1
mov o5.zw, r1
mad o4.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 176 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecediicnkiocglmapokpgllbkcdbheoaehioabaaaaaameahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaiaebaaaaaaabaaaaaaegaibaaaacaaaaaadcaaaaallcaabaaaabaaaaaa
egiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaabaaaaaaegambaaaabaaaaaa
dgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaa
bkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
acaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaackiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadcaaaaal
dccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaa
aaaaaaaaalaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[29];
MOV R1.w, c[0].x;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[30].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[30].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[30].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[5].y, R2, R3;
MUL result.texcoord[2], R0, c[30].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 88 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c29.w
dp4 r0.x, v0, c5
add r1, -r0.x, c15
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c30.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c27
dp4 r3.y, r0, c26
dp4 r3.x, r0, c25
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c28
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add o5.xyz, r0, r1
mov r1.w, c30.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
mad r3.xyz, r0, c29.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
mov r1, c8
dp4 r4.x, c13, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c29.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c29.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r4
dp3 o6.y, r2, r3
mul o3, r0, c29.w
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmdhjahikjnanhoabocdenikdfjeggmphabaaaaaammanaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcaaamaaaaeaaaabaaaaadaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
aaaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagaabaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaallcaabaaa
abaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaa
egaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaa
bkaabaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaacaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaa
ckiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaagaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaai
bcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaa
aeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaa
agaabaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaa
dcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaagaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[32] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[31].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[30];
MOV R1.w, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[31].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[31].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[31].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[31].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[5].y, R2, R3;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
END
# 93 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c32, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c31.w
dp4 r0.x, v0, c5
add r1, -r0.x, c17
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c16
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c18
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c19
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c26
dp4 r2.y, r4, c25
dp4 r2.x, r4, c24
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c21
mad r1.xyz, r0.x, c20, r1
mad r0.xyz, r0.z, c22, r1
mad r1.xyz, r0.w, c23, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c29
dp4 r3.y, r0, c28
dp4 r3.x, r0, c27
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c30
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add o5.xyz, r0, r1
mov r1.w, c32.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
mad r3.xyz, r0, c31.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mov r1, c8
dp4 r4.x, c15, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c31.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c31.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c31.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c32.z
mul r1.y, r1, c13.x
dp3 o4.y, r2, r4
dp3 o6.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
mad o7.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o7.zw, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjimpooogeheidkjpohacbkbhlipdeehpabaaaaaahmaoaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaneaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
jiamaaaaeaaaabaacgadaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadpccabaaa
ahaaaaaagiaaaaacaiaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagaabaia
ebaaaaaaabaaaaaaegacbaaaacaaaaaadcaaaaallcaabaaaacaaaaaaegiicaaa
acaaaaaaaoaaaaaakgakbaiaebaaaaaaabaaaaaaegaibaaaacaaaaaadgaaaaaf
icaabaaaadaaaaaaakaabaaaacaaaaaadiaaaaahhcaabaaaaeaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaeaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaa
egacbaaaaeaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaafaaaaaaakiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaafaaaaaaakiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaafaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
adaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaafaaaaaabaaaaaahecaabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaafaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaadaaaaaa
pgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaagbcaabaaaafaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
afaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaafaaaaaabkiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaadaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaafaaaaaa
baaaaaahecaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaafaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaadaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaag
bcaabaaaadaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
ckiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaackiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
adaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
cccabaaaagaaaaaaegacbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaadaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaaadaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaadaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
adaaaaaaegaibaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaadaaaaaaegadbaaaadaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaa
jgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaacaaaaaa
bkaabaaaacaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaacaaaaaaakaabaaa
acaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
aeaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aeaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaakhcaabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaeaaaaaaaaaaaaajpcaabaaaafaaaaaafgafbaia
ebaaaaaaaeaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaagaaaaaa
fgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaaaaaaaaajpcaabaaaahaaaaaaagaabaiaebaaaaaa
aeaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaakgakbaia
ebaaaaaaaeaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaagaaaaaa
egaobaaaahaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaa
acaaaaaaegaobaaaaeaaaaaakgakbaaaacaaaaaaegaobaaaagaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaa
afaaaaaaeeaaaaafpcaabaaaafaaaaaaegaobaaaaeaaaaaadcaaaaanpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaeaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaaeaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaafaaaaaadeaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaaeaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgafbaaaacaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaaeaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaacaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaacaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
acaaaaaaegacbaaaacaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbccabaaaagaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaahaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaahaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
"3.0-!!ARBfp1.0
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R3.zw, c[10].xyyw;
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[10].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[10].y;
POW R0.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R2.x, R0.w, c[7], R1;
MUL R0.xyz, R2.x, R0;
DP3_SAT R1.x, R0, c[11];
MUL R1.y, R1.x, R1.x;
MAD R1.x, -R0.w, c[2], R3.z;
MAD R1.x, R1, c[3].w, R1.y;
ADD R2.y, -R1, c[10];
MIN R1.w, R1.x, c[10].y;
MAD R1.xyz, R0, c[3], -R0;
MUL R2.y, R2, c[9].x;
MAD R3.xyz, R2.y, R1, R0;
MOV_SAT R0.x, R2;
ADD R0.x, -R0, c[10].y;
DP3 R2.x, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.xyz, R0.x, c[3];
ADD R0.z, -R1.w, c[10].y;
ABS R0.y, fragment.texcoord[3].z;
MUL R0.y, R0, R0.z;
MAX R2.w, fragment.texcoord[3].z, R0.y;
RSQ R2.x, R2.x;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R2.x, fragment.texcoord[5], R0;
DP3 R0.x, R0, R0;
MUL R2.xyz, R1, fragment.texcoord[4];
MOV R0.y, c[5].x;
MAD R4.x, R0.w, c[7], R0.y;
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R3.w, c[4].x;
MAX R0.x, R0, c[10].z;
POW R3.w, R0.x, R0.y;
MOV R0, c[1];
MUL R3.w, R3, R4.x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, c[0];
MUL R0.xyz, R0, R3.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R2.w, R0;
MAD R0.xyz, R0, c[10].x, R2;
ADD result.color.xyz, R0, R3;
MAD result.color.w, R3, R0, R1;
END
# 60 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
"ps_3_0
dcl_cube s0
def c10, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c11, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c10.z
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r3.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r3.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r1.y, r0, c11
mad_pp r2.x, -r1.y, r1.y, c10.y
mov_pp r1.x, c10.y
mov_pp_sat r0.w, r0
mul_pp r1.z, r1.y, r1.y
mad_pp r1.x, -r3, c2, r1
mad_pp r1.x, r1, c3.w, r1.z
min_pp r1.w, r1.x, c10.y
add_pp r1.z, -r1.w, c10.y
abs_pp r1.x, v3.z
mul_pp r2.w, r1.x, r1.z
mad_pp r1.xyz, r0, c3, -r0
mul_pp r2.x, r2, c9
mad_pp r2.xyz, r2.x, r1, r0
dp3_pp r1.x, v5, v5
max_pp r2.w, v3.z, r2
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v5, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r0.w, c3
mul_pp r3.z, c11.w, r0.y
max_pp r3.y, r0.x, c10.w
pow_pp r0, r3.y, r3.z
mov_pp r0.y, c5.x
mad_pp r3.x, r3, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r3.x
mul_pp r0.xyz, c1, r0
mul_pp r3.xyz, r0, r0.w
mul_pp r0.xyz, r1, c0
mad_pp r0.xyz, r0, r2.w, r3
mul_pp r1.xyz, r1, v4
mad_pp r0.xyz, r0, c10.x, r1
mov_pp r2.w, c0
mul_pp r1.x, c1.w, r2.w
add_pp oC0.xyz, r0, r2
mad_pp oC0.w, r0, r1.x, r1
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 112
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Shininess]
Float 84 [_Gloss]
Float 88 [_Reflection]
Float 92 [_FrezPow]
Float 96 [_FrezFalloff]
Float 100 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedcclbnhggnmejphikelcibhfomomcnnmeabaaaaaabmaiaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoeagaaaaeaaaaaaaljabaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacafaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegbcbaaaagaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaadkbabaaa
adaaaaaadgaaaaafbcaabaaaacaaaaaackbabaaaabaaaaaadgaaaaafccaabaaa
acaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaacaaaaaackbabaaaadaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagajbaaaacaaaaaafgafbaiaebaaaaaaaaaaaaaaagajbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaa
egacbaaaacaaaaaaefaaaaajpcaabaaaacaaaaaajgahbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaaakaabaiambaaaaaa
abaaaaaaabeaaaaaaaaaiadpcpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaagaaaaaa
bjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaalmcaabaaaaaaaaaaa
fgafbaaaaaaaaaaapgipcaaaaaaaaaaaafaaaaaakgigcaaaaaaaaaaaafaaaaaa
dcaaaaalccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
egiocaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaadgcaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
adaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaabacaaaakecaabaaa
aaaaaaaaegacbaaaacaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
diaaaaahicaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaak
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaabkiacaaaaaaaaaaa
agaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdcaaaaajiccabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckbabaiaibaaaaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckbabaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaadaaaaaaegiccaaa
aaaaaaaaabaaaaaadcaaaaajlcaabaaaaaaaaaaaegaibaaaaeaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egambaaaaaaaaaaadcaaaaajlcaabaaaaaaaaaaaegaibaaaadaaaaaaegbibaaa
afaaaaaaegambaaaaaaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaaeaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaah
hccabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"3.0-!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R1.x, -R0.w, c[6].y;
POW R1.w, R1.x, c[4].x;
MOV R0.w, c[2].x;
MAD R0.w, R1, c[3].x, R0;
MUL R0.xyz, R0.w, R0;
DP3_SAT R1.x, R0, c[7];
MUL R2.x, R1, R1;
ADD R1.x, -R2, c[6].y;
MUL R2.z, R1.x, c[5].x;
MAD R1.xyz, R0, c[1], -R0;
MAD R0.xyz, R2.z, R1, R0;
MOV R2.y, c[6];
MAD R1.x, -R1.w, c[0], R2.y;
MOV_SAT R1.y, R0.w;
MAD R0.w, R1.x, c[1], R2.x;
ADD R2.x, -R1.y, c[6].y;
TEX R1, fragment.texcoord[3], texture[1], 2D;
MUL R2.xyz, R2.x, c[1];
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, R2;
MAD result.color.xyz, R1, c[6].z, R0;
MIN result.color.w, R0, c[6].y;
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Shininess]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c7, 2.00000000, 1.00000000, 6.00000000, 8.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xy
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c7.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c2.x
add_pp r0.y, c7, -r0
mul_pp r1.w, r0.y, c7.z
add_pp r2.x, -r0, c7.y
pow_pp r0, r2.x, c5.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c3.x
mad_pp r0.w, r1, c4.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r2.w, r0, c8
mad_pp r2.x, -r2.w, r2.w, c7.y
mad_pp r1.xyz, r0, c1, -r0
mul_pp r2.x, r2, c6
mad_pp r2.xyz, r2.x, r1, r0
mov_pp_sat r0.x, r0.w
add_pp r1.x, -r0, c7.y
mov_pp r0.y, c7
mad_pp r0.y, -r1.w, c0.x, r0
mul_pp r0.z, r2.w, r2.w
mad_pp r1.w, r0.y, c1, r0.z
texld r0, v3, s1
mul_pp r1.xyz, r1.x, c1
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1
mad_pp oC0.xyz, r0, c7.w, r2
min_pp oC0.w, r1, c7.y
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 128
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 88 [_Reflection]
Float 92 [_FrezPow]
Float 96 [_FrezFalloff]
Float 100 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefieceddcmhabpaofjdgffbibbpomocidacdjciabaaaaaaneafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcmmaeaaaaeaaaaaaaddabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaad
dcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaafaaaaaackiacaaaaaaaaaaaafaaaaaadcaaaaalbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagijcaaaaaaaaaaaaeaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaabacaaaak
icaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdn
aaaaaaaadcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
dkaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaa
akaabaaaaaaaaaaadkaabaaaabaaaaaaddaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaibcaabaaaaaaaaaaadkaabaaaacaaaaaa
bkiacaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
aeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaagaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"3.0-!!ARBfp1.0
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[10].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[10].y;
POW R2.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R3.x, R2.w, c[7], R1;
MUL R1.xyz, R3.x, R0;
DP3_SAT R0.x, R1, c[11];
MUL R0.y, R0.x, R0.x;
MOV R0.zw, c[10].xyyw;
MAD R0.x, -R2.w, c[2], R0.z;
MAD R0.x, R0, c[3].w, R0.y;
ADD R2.x, -R0.y, c[10].y;
MIN R1.w, R0.x, c[10].y;
MAD R0.xyz, R1, c[3], -R1;
MUL R2.x, R2, c[9];
MAD R2.xyz, R2.x, R0, R1;
DP3 R1.y, fragment.texcoord[5], fragment.texcoord[5];
ABS R0.x, fragment.texcoord[3].z;
ADD R0.y, -R1.w, c[10];
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R3;
MAX R3.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[10].y;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[5], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R2.w, R2, c[7].x, R0.y;
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R1.xyz, R1.x, c[3];
MUL R0.y, R0.w, c[4].x;
MAX R0.x, R0, c[10].z;
POW R3.x, R0.x, R0.y;
MOV R0, c[1];
MUL R2.w, R3.x, R2;
MUL R0.xyz, R0, c[0];
MUL R3.xyz, R0, R2.w;
MUL R0.xyz, R1, c[0];
MAD R0.xyz, R0, R3.w, R3;
TXP R3.x, fragment.texcoord[6], texture[1], 2D;
MUL R0.w, R0, c[0];
MUL R0.w, R2, R0;
MUL R0.xyz, R3.x, R0;
MUL R1.xyz, R1, fragment.texcoord[4];
MAD R0.xyz, R0, c[10].x, R1;
ADD result.color.xyz, R0, R2;
MAD result.color.w, R3.x, R0, R1;
END
# 63 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
Float 9 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c10, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c11, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c10.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c10, -r0
mul_pp r1.w, r0.y, c10.z
add_pp r2.x, -r0, c10.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r3.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r3.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r1.y, r0, c11
mad_pp r2.x, -r1.y, r1.y, c10.y
mov_pp r1.x, c10.y
mov_pp_sat r0.w, r0
mul_pp r1.z, r1.y, r1.y
mad_pp r1.x, -r3, c2, r1
mad_pp r1.x, r1, c3.w, r1.z
min_pp r1.w, r1.x, c10.y
add_pp r1.z, -r1.w, c10.y
abs_pp r1.x, v3.z
mul_pp r2.w, r1.x, r1.z
mad_pp r1.xyz, r0, c3, -r0
mul_pp r2.x, r2, c9
mad_pp r2.xyz, r2.x, r1, r0
dp3_pp r1.x, v5, v5
max_pp r2.w, v3.z, r2
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v5, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c10.y
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r0.w, c3
mul_pp r3.z, c11.w, r0.y
max_pp r3.y, r0.x, c10.w
pow_pp r0, r3.y, r3.z
mov_pp r0.y, c5.x
mad_pp r3.x, r3, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r3.x
mul_pp r0.xyz, c1, r0
mul_pp r3.xyz, r0, r0.w
mul_pp r0.xyz, r1, c0
mad_pp r0.xyz, r0, r2.w, r3
texldp r3.x, v6, s1
mov_pp r2.w, c0
mul_pp r2.w, c1, r2
mul_pp r0.w, r0, r2
mul_pp r0.xyz, r3.x, r0
mul_pp r1.xyz, r1, v4
mad_pp r0.xyz, r0, c10.x, r1
add_pp oC0.xyz, r0, r2
mad_pp oC0.w, r3.x, r0, r1
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Shininess]
Float 148 [_Gloss]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
Float 164 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpbegdcjcolpcpgagbhnimmhjlgdceiepabaaaaaaliaiaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcgiahaaaaeaaaaaaankabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagcbaaaadlcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegbcbaaaagaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaadkbabaaa
adaaaaaadgaaaaafbcaabaaaacaaaaaackbabaaaabaaaaaadgaaaaafccaabaaa
acaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaacaaaaaackbabaaaadaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagajbaaaacaaaaaafgafbaiaebaaaaaaaaaaaaaaagajbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaa
egacbaaaacaaaaaaefaaaaajpcaabaaaacaaaaaajgahbaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaaakaabaiambaaaaaa
abaaaaaaabeaaaaaaaaaiadpcpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaa
bjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaalmcaabaaaaaaaaaaa
fgafbaaaaaaaaaaapgipcaaaaaaaaaaaajaaaaaakgigcaaaaaaaaaaaajaaaaaa
dcaaaaalccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
egiocaaaaaaaaaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaadgcaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaincaabaaa
aaaaaaaaagaabaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaabacaaaakicaabaaa
acaaaaaaegacbaaaacaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
diaaaaahbcaabaaaadaaaaaadkaabaaaacaaaaaadkaabaaaacaaaaaadcaaaaak
icaabaaaacaaaaaadkaabaiaebaaaaaaacaaaaaadkaabaaaacaaaaaaabeaaaaa
aaaaiadpdiaaaaaiicaabaaaacaaaaaadkaabaaaacaaaaaabkiacaaaaaaaaaaa
akaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaabkaabaaa
aaaaaaaaakaabaaaadaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaadaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaibcaabaaaadaaaaaaakaabaaaadaaaaaackbabaia
ibaaaaaaaeaaaaaadeaaaaahbcaabaaaadaaaaaaakaabaaaadaaaaaackbabaaa
aeaaaaaadiaaaaaiocaabaaaadaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaaagbjbaaaafaaaaaa
dcaaaaajhcaabaaaabaaaaaajgahbaaaadaaaaaaagaabaaaadaaaaaaegacbaaa
abaaaaaaaoaaaaahdcaabaaaadaaaaaaegbabaaaahaaaaaapgbpbaaaahaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaaaaaaaahccaabaaaadaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaa
dcaaaaajiccabaaaaaaaaaaadkaabaaaabaaaaaaakaabaaaadaaaaaabkaabaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaadaaaaaa
igadbaaaaaaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaa
aaaaaaaaaiaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"3.0-!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[6].y;
POW R0.w, R0.w, c[4].x;
MOV R1.x, c[2];
MAD R1.w, R0, c[3].x, R1.x;
MUL R0.xyz, R1.w, R0;
DP3_SAT R1.x, R0, c[7];
MUL R2.w, R1.x, R1.x;
ADD R2.x, -R2.w, c[6].y;
MAD R1.xyz, R0, c[1], -R0;
MUL R2.x, R2, c[5];
MAD R2.xyz, R2.x, R1, R0;
MOV R0.x, c[6].y;
MAD R0.z, -R0.w, c[0].x, R0.x;
MOV_SAT R0.y, R1.w;
ADD R0.x, -R0.y, c[6].y;
MAD R1.w, R0.z, c[1], R2;
MUL R1.xyz, R0.x, c[1];
TEX R0, fragment.texcoord[3], texture[2], 2D;
MUL R3.xyz, R0.w, R0;
TXP R4.x, fragment.texcoord[4], texture[1], 2D;
MUL R0.xyz, R0, R4.x;
MUL R3.xyz, R3, c[6].z;
MUL R0.xyz, R0, c[6].x;
MUL R4.xyz, R3, R4.x;
MIN R0.xyz, R3, R0;
MAX R0.xyz, R0, R4;
MAD result.color.xyz, R1, R0, R2;
MIN result.color.w, R1, c[6].y;
END
# 43 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Shininess]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c7, 2.00000000, 8.00000000, 1.00000000, 6.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xy
dcl_texcoord4 v4
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c7.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c2.x
add_pp r0.y, c7.z, -r0
mul_pp r1.w, r0.y, c7
add_pp r2.x, -r0, c7.z
pow_pp r0, r2.x, c5.x
mov_pp r0.y, c3.x
mad_pp r0.y, r0.x, c4.x, r0
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.y, r1
dp3_pp_sat r0.z, r1, c8
mad_pp r0.w, -r0.z, r0.z, c7.z
mov_pp_sat r0.y, r0
mad_pp r2.xyz, r1, c1, -r1
mul_pp r0.w, r0, c6.x
mad_pp r2.xyz, r0.w, r2, r1
mul_pp r0.w, r0.z, r0.z
mov_pp r0.z, c7
add_pp r0.y, -r0, c7.z
mad_pp r0.x, -r0, c0, r0.z
mad_pp r1.w, r0.x, c1, r0
mul_pp r1.xyz, r0.y, c1
texld r0, v3, s2
mul_pp r3.xyz, r0.w, r0
texldp r4.x, v4, s1
mul_pp r0.xyz, r0, r4.x
mul_pp r3.xyz, r3, c7.y
mul_pp r0.xyz, r0, c7.x
mul_pp r4.xyz, r3, r4.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r4
mad_pp oC0.xyz, r1, r0, r2
min_pp oC0.w, r1, c7.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 192
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
Float 164 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeacdmlhhlkjdejdpjfhfoclaoanjeldhabaaaaaaoaagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaafaaaa
eaaaaaaahaabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
abaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaacaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaacaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaacaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalicaabaaaabaaaaaadkaabaaa
aaaaaaaadkiacaaaaaaaaaaaajaaaaaackiacaaaaaaaaaaaajaaaaaadcaaaaal
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaa
abeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadgcaaaaficaabaaaabaaaaaadkaabaaaabaaaaaaaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
acaaaaaapgapbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadcaaaaalhcaabaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaaegacbaiaebaaaaaa
abaaaaaabacaaaakicaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaadkiacaaa
aaaaaaaaaiaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaaddaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaa
dkaabaaaacaaaaaabkiacaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[19].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[18];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c18.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c17, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c18.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c18.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c18.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcmiaacjopknikgpbbjgbhneinchkodjpabaaaaaaoaajaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcbeaiaaaaeaaaabaaafacaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaadaaaaaaaoaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadgaaaaaficaabaaaacaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaadaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaa
egaobaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaa
ckiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[15].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[15].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[4].y, R2, R3;
MUL result.texcoord[2], R0, c[15].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c15.x
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c14.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
mov r1, c8
dp4 r4.x, c13, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
mul o3, r0, c14.w
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmdollcehaagjphoaifbpfiofdjnbhnhgabaaaaaafaaiaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjmagaaaaeaaaabaakhabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaallcaabaaaabaaaaaa
egiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaa
dgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaa
bkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
acaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaackiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[19].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[18];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c18.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c17, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp4 r0.w, v0, c7
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c18.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c18.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c18.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.w, r0, c15
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedaolncipbhpildfeogipklhnmbomcblmcabaaaaaaoaajaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcbeaiaaaaeaaaabaaafacaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaadaaaaaaaoaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadgaaaaaficaabaaaacaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaadaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaa
egaobaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaa
ckiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[19].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[18];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r1.w, c19.x
mov r1.xyz, c16
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c18.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c17, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mad r0.xyz, r4, c18.w, -v0
dp3 o4.y, r2, r0
dp3 o4.z, v2, r0
dp3 o4.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o1, r1, c18.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o2, r1, c18.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o5.y, r2, r3
mul o3, r1, c18.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcmiaacjopknikgpbbjgbhneinchkodjpabaaaaaaoaajaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcbeaiaaaaeaaaabaaafacaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaadaaaaaaaoaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadgaaaaaficaabaaaacaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaadaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaa
egaobaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaa
ckiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[18];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.w, c19.x
mov r0.xyz, c16
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mov r1, c8
dp4 r4.x, c17, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1, r0, c18.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2, r0, c18.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r4
dp3 o5.y, r2, r3
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddnhdaeomlfokhkacceffeanoajmmdnkfabaaaaaaleajaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcoiahaaaaeaaaabaapkabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaaddccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaa
abaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaadaaaaaaaoaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadgaaaaaficaabaaaacaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaeaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aeaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaa
aeaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaadaaaaaaaoaaaaaa
baaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaa
egaobaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaa
ckiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaa
aeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaafaaaaaa
egacbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egaabaaaaaaaaaaadcaaaaakdccabaaaagaaaaaaegiacaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"3.0-!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R1.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.x, R0, c[10];
MOV R0.zw, c[9];
MUL R1.y, R0.x, R0.x;
MAD R0.y, -R1.w, c[2].x, R0.z;
MAD R0.y, R0, c[3].w, R1;
MIN R1.y, R0, c[9].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MOV_SAT R1.x, R1;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[9];
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R2.x, R0.z, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R2.y, R1.y;
MAD R0.xyz, R2.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
ADD R1.x, -R1, c[9].z;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R0.w, c[4].x;
MAX R0.x, R0, c[9];
POW R0.w, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
MUL R1.xyz, R1, c[0];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MAD R0.xyz, R1, R2.x, R0;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 58 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r2.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r2.x, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
mul_pp r0.w, r0, r2.x
mul_pp r2.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
dp3 r0.x, v5, v5
mad_pp r1.xyz, r1, r1.w, r2
texld r0.x, r0.x, s1
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Shininess]
Float 148 [_Gloss]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedndechmfnoglbjakdlcciimpllepbkepfabaaaaaapiahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaagaaaaeaaaaaaalaabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaal
fcaabaaaaaaaaaaaagaabaaaaaaaaaaapgipcaaaaaaaaaaaajaaaaaakgijcaaa
aaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaabacaaaakicaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaa
bkaabaaaaaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpbaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaiaibaaaaaaabaaaaaadeaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaa
aaaaaaeddiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaa
bjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaabaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaa
aiaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaa
aaaaaaaaacaaaaaadiaaaaahncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
"3.0-!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 53 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
"ps_3_0
dcl_cube s0
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r1.w, r0
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 112
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Shininess]
Float 84 [_Gloss]
Float 88 [_Reflection]
Float 92 [_FrezPow]
Float 96 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaholfhndhfheeceiikpaljeigjjbfegbabaaaaaabaahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpaafaaaa
eaaaaaaahmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaa
aaaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaal
fcaabaaaaaaaaaaaagaabaaaaaaaaaaapgipcaaaaaaaaaaaafaaaaaakgijcaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaabacaaaakicaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaa
bkaabaaaaaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckbabaiaibaaaaaaaeaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaafaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaaakiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaa
aaaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
abaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
ncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaaaaaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"3.0-!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 0, 0.5, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].z, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9];
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
POW R0.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R0.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.y, R0, c[10];
MOV_SAT R1.x, R1;
MUL R0.z, R0.y, R0.y;
MOV R0.x, c[9].w;
MAD R0.y, -R0.w, c[2].x, R0.x;
MAD R0.y, R0, c[3].w, R0.z;
MIN R1.y, R0, c[9].w;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.z, -R1.y, c[9].w;
ABS R1.y, R0.z;
MUL R1.y, R1, R1.z;
MAX R1.w, R0.z, R1.y;
RSQ R2.x, R2.x;
MAD R0.xyz, R2.x, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MOV R2.x, c[5];
ADD R1.x, -R1, c[9].w;
MUL R1.xyz, R1.x, c[3];
MUL R1.xyz, R1, c[0];
MUL R0.y, R0, R0.z;
MOV R0.x, c[10].w;
MUL R0.z, R0.x, c[4].x;
MAD R0.w, R0, c[7].x, R2.x;
MAX R0.x, R0.y, c[9];
POW R2.x, R0.x, R0.z;
MOV R0.xyz, c[1];
MUL R0.w, R2.x, R0;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, R1, R1.w, R0;
RCP R0.w, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.w, c[9].y;
TEX R0.w, R1, texture[1], 2D;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
SLT R1.x, c[9], fragment.texcoord[5].z;
TEX R1.w, R1.z, texture[2], 2D;
MUL R0.w, R1.x, R0;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].z;
MOV result.color.w, c[9].x;
END
# 65 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c9, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c10, 6.00000000, 0.21997070, 0.70703125, 0.07098389
def c11, 128.00000000, 0, 0, 0
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.w, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c10.x
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r1.w, r0.x
mov_pp r0.y, c6.x
mad_pp r0.w, r1, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10.yzww
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r1.w, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r2.x, r0.z, r1
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
max_pp r2.y, r0.x, c9.x
mul_pp r2.z, c11.x, r0.y
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r1.w, r1, c7.x, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r1
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r2.x, r0
rcp r0.w, v5.w
mad r2.xy, v5, r0.w, c9.z
dp3 r0.x, v5, v5
texld r0.w, r2, s1
cmp r0.y, -v5.z, c9.x, c9
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.w
mov_pp oC0.w, c9.x
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Shininess]
Float 148 [_Gloss]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefieceddnplnceikmobkljmkoamangacinmaadgabaaaaaanaaiaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjiahaaaaeaaaaaaaogabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaad
mcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
dgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
bcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaa
acaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaalfcaabaaa
aaaaaaaaagaabaaaaaaaaaaapgipcaaaaaaaaaaaajaaaaaakgijcaaaaaaaaaaa
ajaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
bacaaaakicaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpbaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaiaibaaaaaaabaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaaaaaaaaed
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaadkaabaaaaaaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaabaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaajhcaabaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaa
acaaaaaadiaaaaahncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaa
aaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaa
ckbabaaaagaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
apaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"3.0-!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R1.x, R1.w, c[7], R1;
MUL R0.xyz, R1.x, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.z, R0.x, R0.x;
MAD R0.y, -R1.w, c[2].x, R2.x;
MAD R0.y, R0, c[3].w, R0.z;
MIN R0.w, R0.y, c[9].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MOV_SAT R1.x, R1;
MUL R0.xyz, R0.x, fragment.texcoord[3];
ADD R1.y, -R0.w, c[9].z;
ABS R0.w, R0.z;
MUL R0.w, R0, R1.y;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
MAX R0.w, R0.z, R0;
RSQ R1.y, R1.y;
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
ADD R1.x, -R1, c[9].z;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
DP3 R1.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
TEX R1.w, R1.x, texture[1], 2D;
MUL R0.w, R1, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 60 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
texldl r1.xyz, r1, s0
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.w, r2.x, c7.x, r0.y
mul_pp r0.xyz, r0.w, r1
dp3_pp_sat r0.y, r0, c10
mov_pp_sat r0.w, r0
mul_pp r0.z, r0.y, r0.y
mov_pp r0.x, c9.y
mad_pp r0.y, -r2.x, c2.x, r0.x
mad_pp r0.y, r0, c3.w, r0.z
min_pp r1.x, r0.y, c9.y
dp3_pp r0.x, v3, v3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
add_pp r1.y, -r1.x, c9
abs_pp r1.x, r0.z
mul_pp r1.x, r1, r1.y
max_pp r1.w, r0.z, r1.x
dp3_pp r1.y, v4, v4
rsq_pp r1.x, r1.y
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r1.xyz, r1, r1.w, r0
dp3 r0.x, v5, v5
texld r0.w, v5, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
mul_pp r0.xyz, r0.x, r1
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Shininess]
Float 148 [_Gloss]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedopeblejibpiedaagepkmaaheonjillcbabaaaaaadiaiaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaahaaaaeaaaaaaamaabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaad
mcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
dgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
bcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaa
acaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaalfcaabaaa
aaaaaaaaagaabaaaaaaaaaaapgipcaaaaaaaaaaaajaaaaaakgijcaaaaaaaaaaa
ajaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
bacaaaakicaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpbaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaiaibaaaaaaabaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaackaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaaaaaaaaed
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaadkaabaaaaaaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaabaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaajhcaabaaaacaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaa
acaaaaaadiaaaaahncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
efaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaagaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaa
acaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"3.0-!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 0, 2, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[9].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.w, R0.x;
TEX R0.xyz, R1, texture[0], CUBE;
ADD R0.w, -R0, c[9].z;
DP3 R1.y, fragment.texcoord[4], fragment.texcoord[4];
POW R1.w, R0.w, c[8].x;
MOV R1.x, c[6];
MAD R0.w, R1, c[7].x, R1.x;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.x, R0, c[10];
MOV R2.xy, c[9].zwzw;
MUL R0.y, R0.x, R0.x;
MAD R0.x, -R1.w, c[2], R2;
MAD R0.x, R0, c[3].w, R0.y;
MIN R0.x, R0, c[9].z;
ADD R0.y, -R0.x, c[9].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.y, R0.x, R0;
MOV_SAT R0.x, R0.w;
MAX R0.w, fragment.texcoord[3].z, R0.y;
ADD R1.x, -R0, c[9].z;
RSQ R1.y, R1.y;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R1.y, fragment.texcoord[4], R0;
DP3 R0.x, R0, R0;
MOV R0.y, c[5].x;
MAD R1.w, R1, c[7].x, R0.y;
MUL R1.xyz, R1.x, c[3];
RSQ R0.x, R0.x;
MUL R0.x, R0, R0.z;
MUL R0.y, R2, c[4].x;
MAX R0.x, R0, c[9];
POW R2.x, R0.x, R0.y;
MOV R0.xyz, c[1];
MUL R1.w, R2.x, R1;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.w;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].y;
MOV result.color.w, c[9].x;
END
# 55 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_EdgeAlpha]
Vector 3 [_Color]
Float 4 [_Shininess]
Float 5 [_Gloss]
Float 6 [_Reflection]
Float 7 [_FrezPow]
Float 8 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c9, 2.00000000, 1.00000000, 6.00000000, 0.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 128.00000000
dcl_texcoord0 v0.xyzw
dcl_texcoord1 v1.xyzw
dcl_texcoord2 v2.xyzw
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
mov_pp r0.y, v1.z
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov r1.x, v0.w
mov r1.z, v2.w
mov r1.y, v1.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c9.x, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
mov_pp r0.y, c4.x
add_pp r0.y, c9, -r0
mul_pp r1.w, r0.y, c9.z
add_pp r2.x, -r0, c9.y
pow_pp r0, r2.x, c8.x
mov_pp r2.x, r0
mov_pp r0.y, c6.x
mad_pp r0.x, r2, c7, r0.y
texldl r1.xyz, r1, s0
mul_pp r1.xyz, r0.x, r1
dp3_pp_sat r0.z, r1, c10
mov_pp_sat r0.w, r0.x
mov_pp r0.y, c9
dp3_pp r1.x, v4, v4
mul_pp r0.z, r0, r0
mad_pp r0.y, -r2.x, c2.x, r0
mad_pp r0.y, r0, c3.w, r0.z
min_pp r0.y, r0, c9
add_pp r0.z, -r0.y, c9.y
abs_pp r0.y, v3.z
mul_pp r0.y, r0, r0.z
max_pp r1.w, v3.z, r0.y
rsq_pp r1.x, r1.x
mov_pp r0.xyz, v3
mad_pp r0.xyz, r1.x, v4, r0
dp3_pp r0.x, r0, r0
add_pp r0.w, -r0, c9.y
mul_pp r1.xyz, r0.w, c3
mov_pp r0.y, c4.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r2.z, c10.w, r0.y
max_pp r2.y, r0.x, c9.w
pow_pp r0, r2.y, r2.z
mov_pp r0.y, c5.x
mad_pp r2.x, r2, c7, r0.y
mov_pp r0.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
mul_pp r1.xyz, r1, c0
mad_pp r0.xyz, r1, r1.w, r0
texld r0.w, v5, s1
mul_pp r0.xyz, r0.w, r0
mul_pp oC0.xyz, r0, c9.x
mov_pp oC0.w, c9
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Shininess]
Float 148 [_Gloss]
Float 152 [_Reflection]
Float 156 [_FrezPow]
Float 160 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeionblffpkbkgccmkhemfgjdphlchmceabaaaaaajaahaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfiagaaaaeaaaaaaajgabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaaddcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaakaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaal
fcaabaaaaaaaaaaaagaabaaaaaaaaaaapgipcaaaaaaaaaaaajaaaaaakgijcaaa
aaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaabacaaaakicaabaaaaaaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaa
bkaabaaaaaaaaaaadkaabaaaaaaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckbabaiaibaaaaaaaeaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaafaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaibcaabaaa
abaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaaaaaaaaeddiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaa
aaaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
abaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
ncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaagaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
}
 }
}
SubShader { 
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[21];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[4].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[22].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[22].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[22].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[22].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 54 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c21.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.x
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c20
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c22.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c21.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c21.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c21.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c21.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedlplokiiekfiglfchjiaopngoanbiaoodabaaaaaaaeakaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcfaaiaaaaeaaaabaabeacaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaa
aaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
bkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedcaabkcipegdpcjoimifdlcalbglhbbnhabaaaaaaoiaoaaaaaeaaaaaa
daaaaaaabaafaaaagianaaaadaaoaaaaebgpgodjniaeaaaaniaeaaaaaaacpopp
giaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaacgaaahaaadaaaaaaaaaa
acaaaaaaaeaaakaaaaaaaaaaacaaamaaadaaaoaaaaaaaaaaacaabaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjaabaaaaacaaaaahiaabaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaae
aaaaahiaaaaaoeiabfaappkaaaaaoejbafaaaaadabaaahiaaaaaffibapaaoeka
aeaaaaaeaaaaaliaaoaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabaaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaaoaaaaka
abaaaaacadaaaciaapaaaakaabaaaaacadaaaeiabaaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiabfaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiaaoaaffkaabaaaaacadaaaciaapaaffkaabaaaaac
adaaaeiabaaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoa
abaaoeiabfaappkaabaaaaacabaaabiaaoaakkkaabaaaaacabaaaciaapaakkka
abaaaaacabaaaeiabaaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
acaaapoaaaaaoeiabfaappkaabaaaaacaaaaapiaacaaoekaafaaaaadabaaahia
aaaaffiabcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappia
aaaaoeiaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
bfaappkaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabgaaaakaajaaaaadabaaabiaadaaoekaaaaaoeiaajaaaaadabaaacia
aeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaadadaaacia
ahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeaeaaahoaajaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefcfaaiaaaaeaaaabaabeacaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
aaaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaa
adaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaa
egaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaa
bkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
adaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaa
beaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaa
ckiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[15].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[15].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[15].w;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
"vs_2_0
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c15.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c13.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c13.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c13.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c13.w
mad oT3.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 96 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjnnjhmcohcjjemninbcammdadcballfkabaaaaaabeahaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefchiafaaaaeaaaabaa
foabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaa
aeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaal
lcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaa
egambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
abaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaa
abaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
abaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
agaaaaaaogikcaaaaaaaaaaaagaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 96 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedhoaamncnfobaacckhmeoiddmpdkbbalhabaaaaaagaakaaaaaeaaaaaa
daaaaaaahiadaaaapiaiaaaamaajaaaaebgpgodjeaadaaaaeaadaaaaaaacpopp
nmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaagaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaahiaacaaoekaafaaaaad
abaaahiaaaaaffiaalaaoekaaeaaaaaeaaaaaliaakaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiaamaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
anaaoekaaeaaaaaeaaaaahiaaaaaoeiaaoaappkaaaaaoejbafaaaaadabaaahia
aaaaffibaiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaibabaakeiaaeaaaaae
aaaaaliaajaakekaaaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaac
acaaahiaabaaoejaafaaaaadadaaahiaacaamjiaacaancjaaeaaaaaeacaaahia
acaamjjaacaanciaadaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaac
adaaabiaahaaaakaabaaaaacadaaaciaaiaaaakaabaaaaacadaaaeiaajaaaaka
aiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeia
aiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiaaoaappka
abaaaaacabaaaiiaaaaaffiaabaaaaacadaaabiaahaaffkaabaaaaacadaaacia
aiaaffkaabaaaaacadaaaeiaajaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeia
aiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeia
afaaaaadabaaapoaabaaoeiaaoaappkaabaaaaacabaaabiaahaakkkaabaaaaac
abaaaciaaiaakkkaabaaaaacabaaaeiaajaakkkaaiaaaaadaaaaaciaacaaoeia
abaaoeiaaiaaaaadaaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoeja
abaaoeiaafaaaaadacaaapoaaaaaoeiaaoaappkaaeaaaaaeadaaadoaaeaaoeja
abaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapia
adaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefchiafaaaa
eaaaabaafoabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
dccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaia
ebaaaaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaa
dgaaaaagbcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaf
icaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaa
pgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaabaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[4].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[23].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[23].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[23].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[23].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[3].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[14].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
END
# 60 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
"vs_2_0
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r1.xyz, v2, c23.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c22
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c15, r0
mov r0, c9
dp4 r1.y, c15, r0
dp4 r1.x, c15, r3
mov r0.xyz, c12
mov r0.w, c24.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c23.w, -v0
dp3 oT3.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c23.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c23.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c23.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT3.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c24.y
dp3 oT3.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c13.x
mad oT5.xy, r2.z, c14.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedphgnppbkknicopedaebocflhncebkkclabaaaaaaleakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcoiaiaaaaeaaaabaadkacaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
aaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaaj
hcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaa
abaaaaaaegaibaaaacaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaa
aoaaaaaakgakbaiaebaaaaaaabaaaaaaegambaaaabaaaaaadgaaaaaficaabaaa
acaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaag
bcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaa
bkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaa
acaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaa
acaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaa
egaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
abaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedceefkkdgohijipdhiilopmfncjijifipabaaaaaaoeapaaaaaeaaaaaa
daaaaaaafmafaaaaemaoaaaabeapaaaaebgpgodjceafaaaaceafaaaaaaacpopp
leaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaabaacgaaahaaaeaaaaaaaaaa
acaaaaaaaeaaalaaaaaaaaaaacaaamaaadaaapaaaaaaaaaaacaabaaaafaabcaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaiadpaaaaaadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjaabaaaaacaaaaahiaabaaoekaafaaaaadabaaahiaaaaaffia
bdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
beaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaae
aaaaahiaaaaaoeiabgaappkaaaaaoejbafaaaaadabaaahiaaaaaffibbaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabbaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaapaaaaka
abaaaaacadaaaciabaaaaakaabaaaaacadaaaeiabbaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiabgaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiaapaaffkaabaaaaacadaaaciabaaaffkaabaaaaac
adaaaeiabbaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoa
abaaoeiabgaappkaabaaaaacabaaabiaapaakkkaabaaaaacabaaaciabaaakkka
abaaaaacabaaaeiabbaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
acaaapoaaaaaoeiabgaappkaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
bgaappkaafaaaaadabaaahiaaaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabhaaaakaajaaaaadabaaabiaaeaaoekaaaaaoeiaajaaaaadabaaacia
afaaoekaaaaaoeiaajaaaaadabaaaeiaagaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaahaaoekaacaaoeiaajaaaaadadaaacia
aiaaoekaacaaoeiaajaaaaadadaaaeiaajaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeaeaaahoaakaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
aoaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaad
abaaaiiaabaaaaiabhaaffkaafaaaaadabaaafiaaaaapeiabhaaffkaacaaaaad
afaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiappppaaaafdeieefc
oiaiaaaaeaaaabaadkacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaa
fgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaaabaaaaaaegaibaaa
acaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaia
ebaaaaaaabaaaaaaegambaaaabaaaaaadgaaaaaficaabaaaacaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaeaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaa
akiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaacaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaa
pgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaacmaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
agaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 16 [unity_Scale]
Vector 17 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[16].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP4 R1.w, vertex.position, c[4];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[16].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[16].w;
DP3 R0.y, R1, c[7];
DP4 R1.z, vertex.position, c[3];
DP3 R0.w, -R2, c[7];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R2.xyz, R1.xyww, c[0].y;
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[16].w;
MOV R0.x, R2;
MUL R0.y, R2, c[14].x;
ADD result.texcoord[4].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[4].zw, R1;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 36 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c15.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp4 r1.w, v0, c3
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c15.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c15.w
dp3 r0.y, r1, c6
dp4 r1.z, v0, c2
dp3 r0.w, -r2, c6
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c17.y
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c15.w
mov r0.x, r2
mul r0.y, r2, c13.x
mad oT4.xy, r2.z, c14.zwzw, r0
mov oPos, r1
mov oT4.zw, r1
mad oT3.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 160 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedeleedijmoalhkcpccehgfknpeoodppcgabaaaaaameahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcbaagaaaaeaaaabaaieabaaaafjaaaaae
egiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaiaebaaaaaaabaaaaaaegaibaaaacaaaaaadcaaaaallcaabaaaabaaaaaa
egiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaabaaaaaaegambaaaabaaaaaa
dgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaa
bkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
acaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaackiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
acaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadcaaaaal
dccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 160 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbjiepaddkajobobdnlamifpaimfjpdmdabaaaaaahealaaaaaeaaaaaa
daaaaaaanmadaaaapeajaaaalmakaaaaebgpgodjkeadaaaakeadaaaaaaacpopp
eaadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaakaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaadaaaiaaaaaaaaaaacaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaahiaacaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaae
aaaaahiaaaaaoeiaapaappkaaaaaoejbafaaaaadabaaahiaaaaaffibajaaoeka
aeaaaaaeaaaaaliaaiaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaakaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoeja
afaaaaadadaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaancia
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaaiaaaaka
abaaaaacadaaaciaajaaaakaabaaaaacadaaaeiaakaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiaapaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiaaiaaffkaabaaaaacadaaaciaajaaffkaabaaaaac
adaaaeiaakaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoa
abaaoeiaapaappkaabaaaaacabaaabiaaiaakkkaabaaaaacabaaaciaajaakkka
abaaaaacabaaaeiaakaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
acaaapoaaaaaoeiaapaappkaaeaaaaaeadaaadoaaeaaoejaabaaoekaabaaooka
afaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
ahaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaad
abaaaiiaabaaaaiabaaaaakaafaaaaadabaaafiaaaaapeiabaaaaakaacaaaaad
aeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiappppaaaafdeieefc
baagaaaaeaaaabaaieabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaaddccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaa
fgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaaabaaaaaaegaibaaa
acaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaia
ebaaaaaaabaaaaaaegambaaaabaaaaaadgaaaaaficaabaaaacaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaeaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaa
akiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaacaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaa
pgipcaaaacaaaaaabeaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
adamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
"!!ARBvp1.0
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[4].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[30].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[30].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[30].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[30].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 85 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
"vs_2_0
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c29.w
dp4 r0.x, v0, c5
add r1, -r0.x, c15
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c30.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c27
dp4 r3.y, r0, c26
dp4 r3.x, r0, c25
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c28
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c30.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c29.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c29.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c29.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c29.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbgaghlbclichlimfjoeecobelgjocfckabaaaaaafeanaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefckaalaaaaeaaaabaaoiacaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaa
aaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
bkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbgmjadiklfflallmhklpceajloahelkfabaaaaaadabeaaaaaeaaaaaa
daaaaaaaaiahaaaalabcaaaahibdaaaaebgpgodjnaagaaaanaagaaaaaaacpopp
gaagaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaa
abaacgaaahaaalaaaaaaaaaaacaaaaaaaeaabcaaaaaaaaaaacaaamaaajaabgaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjaabaaaaacaaaaahiaabaaoekaafaaaaadabaaahiaaaaaffia
blaaoekaaeaaaaaeaaaaaliabkaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bmaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabnaaoekaaeaaaaae
aaaaahiaaaaaoeiaboaappkaaaaaoejbafaaaaadabaaahiaaaaaffibbhaaoeka
aeaaaaaeaaaaaliabgaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabiaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiabgaaaaka
abaaaaacadaaaciabhaaaakaabaaaaacadaaaeiabiaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiaboaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiabgaaffkaabaaaaacadaaaciabhaaffkaabaaaaac
adaaaeiabiaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoa
abaaoeiaboaappkaabaaaaacabaaabiabgaakkkaabaaaaacabaaaciabhaakkka
abaaaaacabaaaeiabiaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
acaaapoaaaaaoeiaboaappkaabaaaaacaaaaapiaacaaoekaafaaaaadabaaahia
aaaaffiablaaoekaaeaaaaaeabaaahiabkaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabmaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappia
aaaaoeiaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
bhaaoekaaeaaaaaeaaaaahiabgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
biaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibafaaoekaacaaaaadacaaapiaaaaaaaibadaaoeka
acaaaaadaaaaapiaaaaaffibaeaaoekaafaaaaadadaaahiaacaaoejaboaappka
afaaaaadaeaaahiaadaaffiabhaaoekaaeaaaaaeadaaaliabgaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiabiaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaabia
bpaaaakaaeaaaaaeaaaaapiaaaaaoeiaagaaoekaaeaaaaiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiabpaaffkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiabpaaaakaajaaaaadabaaabiaalaaoekaadaaoeia
ajaaaaadabaaaciaamaaoekaadaaoeiaajaaaaadabaaaeiaanaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaaoaaoekaacaaoeia
ajaaaaadaeaaaciaapaaoekaacaaoeiaajaaaaadaeaaaeiabaaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabbaaoeka
aaaappiaabaaoeiaacaaaaadaeaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefckaalaaaaeaaaabaaoiacaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacagaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
acaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaf
icaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaa
pgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaa
dgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaag
bcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaa
ckiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaa
adaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
fgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaa
aeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaia
ebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaa
kgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaa
adaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaan
pcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
"!!ARBvp1.0
PARAM c[32] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[31].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[4].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[31].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[31].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[31].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[31].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[3].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[14].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
END
# 91 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
"vs_2_0
def c32, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r3.xyz, v2, c31.w
dp4 r0.x, v0, c5
add r1, -r0.x, c17
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c16
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c18
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c19
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c21
mad r1.xyz, r0.x, c20, r1
mad r0.xyz, r0.z, c22, r1
mad r1.xyz, r0.w, c23, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c29
dp4 r3.y, r0, c28
dp4 r3.x, r0, c27
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c30
dp4 r2.z, r4, c26
dp4 r2.y, r4, c25
dp4 r2.x, r4, c24
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c15, r0
mov r0, c9
dp4 r1.y, c15, r0
dp4 r1.x, c15, r3
mov r0.xyz, c12
mov r0.w, c32.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c31.w, -v0
dp3 oT3.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c31.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c31.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c31.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT3.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c32.z
dp3 oT3.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c13.x
mad oT5.xy, r2.z, c14.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedegmoecembmiihdmpmddddabegiehakkhabaaaaaaaeaoaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdiamaaaaeaaaabaaaoadaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
aaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaaj
hcaabaaaacaaaaaafgafbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaa
abaaaaaaegaibaaaacaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaaacaaaaaa
aoaaaaaakgakbaiaebaaaaaaabaaaaaaegambaaaabaaaaaadgaaaaaficaabaaa
acaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaaakiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaeaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaeaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaaficaabaaaacaaaaaabkaabaaaabaaaaaadgaaaaag
bcaabaaaaeaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaa
bkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaabkiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaa
acaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaa
acaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaackiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaackiacaaaacaaaaaaaoaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaipccabaaaadaaaaaa
egaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
acaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaa
fgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaa
adaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedamohdkfaoekapjgacpmbdifmlackffgmabaaaaaacmbfaaaaaeaaaaaa
daaaaaaafeahaaaajebdaaaafmbeaaaaebgpgodjbmahaaaabmahaaaaaaacpopp
kmagaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaabaaacaaaiaaaeaaaaaaaaaa
abaacgaaahaaamaaaaaaaaaaacaaaaaaaeaabdaaaaaaaaaaacaaamaaajaabhaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafcaaaapkaaaaaiadpaaaaaaaaaaaaaadp
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjaabaaaaacaaaaahiaabaaoekaafaaaaadabaaahiaaaaaffia
bmaaoekaaeaaaaaeaaaaaliablaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bnaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaboaaoekaaeaaaaae
aaaaahiaaaaaoeiabpaappkaaaaaoejbafaaaaadabaaahiaaaaaffibbiaaoeka
aeaaaaaeaaaaaliabhaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabjaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiabhaaaaka
abaaaaacadaaaciabiaaaakaabaaaaacadaaaeiabjaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadaaaaapoaabaaoeiabpaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiabhaaffkaabaaaaacadaaaciabiaaffkaabaaaaac
adaaaeiabjaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoa
abaaoeiabpaappkaabaaaaacabaaabiabhaakkkaabaaaaacabaaaciabiaakkka
abaaaaacabaaaeiabjaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
acaaapoaaaaaoeiabpaappkaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahia
aaaaffiabmaaoekaaeaaaaaeabaaahiablaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabnaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaboaaoekaaaaappia
aaaaoeiaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
biaaoekaaeaaaaaeaaaaahiabhaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
bjaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabkaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibagaaoekaacaaaaadacaaapiaaaaaaaibaeaaoeka
acaaaaadaaaaapiaaaaaffibafaaoekaafaaaaadadaaahiaacaaoejabpaappka
afaaaaadaeaaahiaadaaffiabiaaoekaaeaaaaaeadaaaliabhaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiabjaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaabia
caaaaakaaeaaaaaeaaaaapiaaaaaoeiaahaaoekaaeaaaaiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiacaaaffkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaajaaoekaaeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiacaaaaakaajaaaaadabaaabiaamaaoekaadaaoeia
ajaaaaadabaaaciaanaaoekaadaaoeiaajaaaaadabaaaeiaaoaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaapaaoekaacaaoeia
ajaaaaadaeaaaciabaaaoekaacaaoeiaajaaaaadaeaaaeiabbaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabcaaoeka
aaaappiaabaaoeiaacaaaaadaeaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabeaaoekaaeaaaaaeaaaaapiabdaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabfaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaia
caaakkkaafaaaaadabaaafiaaaaapeiacaaakkkaacaaaaadafaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacafaaamoaaaaaoeiappppaaaafdeieefcdiamaaaaeaaaabaa
aoadaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaafgafbaiaebaaaaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaiaebaaaaaaabaaaaaaegaibaaaacaaaaaadcaaaaal
lcaabaaaabaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaabaaaaaa
egambaaaabaaaaaadgaaaaaficaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
adaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaaeaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaeaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaeaaaaaaakiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaaipccabaaa
abaaaaaaegaobaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaa
acaaaaaabkaabaaaabaaaaaadgaaaaagbcaabaaaaeaaaaaabkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaeaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaeaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaa
egacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaagbcaabaaaacaaaaaackiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaacaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
acaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
acaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaacaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaa
acaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaa
adaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaaj
pcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaacaaaaaa
aaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaa
aeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaa
egaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
abaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaa
ahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
aiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
"!!ARBfp1.0
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[7].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[7].y;
POW R0.z, R0.x, c[5].x;
MOV R0.y, c[3].x;
MAD R0.x, R0.z, c[4], R0.y;
MOV R0.y, c[7];
MAD R0.y, -R0.z, c[1].x, R0;
TEX R1.xyz, R2, texture[0], CUBE;
MUL R1.xyz, R1, R0.x;
DP3_SAT R0.w, R1, c[8];
MUL R0.w, R0, R0;
ADD R0.z, -R0.w, c[7].y;
MAD R0.y, R0, c[2].w, R0.w;
MIN R0.w, R0.y, c[7].y;
MAD R2.xyz, R1, c[2], -R1;
MUL R0.z, R0, c[6].x;
MAD R2.xyz, R0.z, R2, R1;
MOV_SAT R0.x, R0;
ADD R0.z, -R0.x, c[7].y;
MUL R1.xyz, R0.z, c[2];
ADD R0.y, -R0.w, c[7];
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R1.w, fragment.texcoord[3].z, R0.x;
MUL R0.xyz, R1, c[0];
MUL R1.xyz, R1, fragment.texcoord[4];
MUL R0.xyz, R1.w, R0;
MAD R0.xyz, R0, c[7].x, R1;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 43 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
"ps_2_0
dcl_cube s0
def c7, 2.00000000, 1.00000000, 0, 0
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c7.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r3.x, c3
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.w, r0.x, c5.x
mov_pp r0.x, r1.w
mad_pp r1.x, r0, c4, r3
mul_pp r4.xyz, r2, r1.x
dp3_pp_sat r2.x, r4, c8
mul_pp r3.x, r2, r2
mad_pp r0.x, -r0, c1, r0.y
mad_pp r0.x, r0, c2.w, r3
min_pp r0.x, r0, c7.y
mad_pp r2.x, -r2, r2, c7.y
mad_pp r3.xyz, r4, c2, -r4
mul_pp r2.x, r2, c6
mad_pp r2.xyz, r2.x, r3, r4
mov_pp_sat r3.x, r1
add_pp r3.x, -r3, c7.y
add_pp r1.x, -r0, c7.y
abs_pp r4.x, t3.z
mul_pp r1.x, r4, r1
mul_pp r3.xyz, r3.x, c2
mul_pp r4.xyz, r3, c0
max_pp r1.x, t3.z, r1
mov_pp r0.w, r0.x
mul_pp r3.xyz, r3, t4
mul_pp r1.xyz, r1.x, r4
mad_pp r1.xyz, r1, c7.x, r3
add_pp r0.xyz, r1, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
Float 92 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhiopbejddcjllkfeggnbgdckhlclabhpabaaaaaageagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaeaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeafaaaa
eaaaaaaafbabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaa
aaaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadecbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaaakiacaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaincaabaaa
aaaaaaaaagaabaaaaaaaaaaaagijcaaaaaaaaaaaaeaaaaaabacaaaakicaabaaa
abaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
diaaaaahbcaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaak
icaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaa
afaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaabkaabaaa
aaaaaaaaakaabaaaacaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaacaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaaakaabaaaacaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaackbabaaaaeaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagbjbaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaajhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaaaaaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
Float 92 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedicieblcdgfgkjhejeccjiglgkifahoanabaaaaaaiiajaaaaaeaaaaaa
daaaaaaafaadaaaajmaiaaaafeajaaaaebgpgodjbiadaaaabiadaaaaaaacpppp
niacaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaadaaadaaabaaaaaaaaaaaaacppppfbaaaaaf
aeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdobpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaajiaaaiapkaabaaaaac
aaaaabiaaaaapplaabaaaaacaaaaaciaabaapplaabaaaaacaaaaaeiaacaappla
abaaaaacabaacbiaaaaakklaabaaaaacabaacciaabaakklaabaaaaacabaaceia
acaakklaaiaaaaadaaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappibaaaaoeiaceaaaaacacaachia
aaaaoeiaaiaaaaadacaaciiaacaaoeiaabaaoeiaecaaaaadaaaacpiaacaaoeia
aaaioekacdaaaaacaaaaciiaacaappiaacaaaaadaaaaciiaaaaappibaeaaaaka
caaaaaadabaacbiaaaaappiaadaakkkaabaaaaacaaaaaiiaaeaaaakaaeaaaaae
aaaaciiaabaaaaiaabaaaakbaaaappiaaeaaaaaeabaacbiaabaaaaiaadaaffka
adaaaakaafaaaaadaaaachiaaaaaoeiaabaaaaiaabaaaaacabaadbiaabaaaaia
acaaaaadabaacbiaabaaaaibaeaaaakaafaaaaadabaachiaabaaaaiaacaaoeka
aiaaaaadabaadiiaaaaaoeiaaeaablkaafaaaaadacaacbiaabaappiaabaappia
aeaaaaaeabaaciiaabaappiaabaappibaeaaaakaafaaaaadabaaciiaabaappia
adaappkaaeaaaaaeaaaaciiaacaappkaaaaappiaacaaaaiaakaaaaadacaaciia
aaaappiaaeaaaakaacaaaaadaaaaciiaacaappibaeaaaakacdaaaaacadaaciia
adaakklaafaaaaadaaaaciiaaaaappiaadaappiaalaaaaadadaacbiaadaakkla
aaaappiaacaaaaadaaaaciiaadaaaaiaadaaaaiaafaaaaadadaachiaabaaoeia
aaaaoekaafaaaaadabaachiaabaaoeiaaeaaoelaaeaaaaaeabaachiaadaaoeia
aaaappiaabaaoeiaaeaaaaaeadaachiaaaaaoeiaacaaoekaaaaaoeibaeaaaaae
aaaachiaabaappiaadaaoeiaaaaaoeiaacaaaaadacaachiaaaaaoeiaabaaoeia
abaaaaacaaaicpiaacaaoeiappppaaaafdeieefceeafaaaaeaaaaaaafbabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadecbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadpdcaaaaalbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaincaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaaaaaaaaaeaaaaaabacaaaakicaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaai
icaabaaaabaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaaafaaaaaadcaaaaak
ccaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaabkaabaaaaaaaaaaaakaabaaa
acaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaibcaabaaaacaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
akaabaaaacaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackbabaaaaeaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaigadbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agbjbaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaafgafbaaa
aaaaaaaaigadbaaaaaaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaeaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R2.x, fragment.texcoord[0].z;
MOV R2.y, fragment.texcoord[1].z;
MOV R2.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R2, R0;
MUL R1.xyz, R2, R0.w;
MAD R0.xyz, -R1, c[6].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
DP3 R1.w, R3, R2;
ABS R1.w, R1;
ADD R1.w, -R1, c[6].y;
POW R1.w, R1.w, c[4].x;
MOV R2.x, c[2];
MAD R2.w, R1, c[3].x, R2.x;
TEX R1.xyz, R3, texture[0], CUBE;
TEX R0, fragment.texcoord[3], texture[1], 2D;
MUL R1.xyz, R2.w, R1;
DP3_SAT R2.x, R1, c[7];
MUL R3.x, R2, R2;
ADD R3.y, -R3.x, c[6];
MAD R2.xyz, R1, c[1], -R1;
MUL R3.y, R3, c[5].x;
MAD R2.xyz, R3.y, R2, R1;
MOV R1.x, c[6].y;
MAD R1.z, -R1.w, c[0].x, R1.x;
MOV_SAT R1.y, R2.w;
MAD R1.w, R1.z, c[1], R3.x;
ADD R1.x, -R1.y, c[6].y;
MUL R1.xyz, R1.x, c[1];
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[6].z, R2;
MIN result.color.w, R1, c[6].y;
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 0.21997070, 0.70703125, 0.07098389
def c7, 8.00000000, 1.00000000, 0, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xy
texld r4, t3, s1
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.w, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r1.w, c3, r0
mul_pp r5.xyz, r0.x, r2
mov_pp_sat r0.x, r0
mad_pp r1.x, -r1.w, c0, r0.y
add_pp r0.x, -r0, c7.y
mov r2.x, c6.y
mov r2.z, c6.w
mov r2.y, c6.z
dp3_pp_sat r2.x, r5, r2
mad_pp r3.x, -r2, r2, c7.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c1.w, r2
min_pp r0.w, r1.x, c7.y
mad_pp r6.xyz, r5, c1, -r5
mul_pp r3.x, r3, c5
mad_pp r3.xyz, r3.x, r6, r5
mul_pp r0.xyz, r0.x, c1
mul_pp r1.xyz, r4.w, r4
mul_pp r0.xyz, r1, r0
mad_pp r0.xyz, r0, c7.x, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
Float 92 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkiidceipnpfeccaicffkebnnpbghjdhpabaaaaaaneafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcmmaeaaaaeaaaaaaaddabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaad
dcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaafaaaaaaakiacaaaaaaaaaaaafaaaaaadcaaaaalbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagijcaaaaaaaaaaaaeaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaabacaaaak
icaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdn
aaaaaaaadcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
dkaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaa
akaabaaaaaaaaaaadkaabaaaabaaaaaaddaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaibcaabaaaaaaaaaaadkaabaaaacaaaaaa
dkiacaaaaaaaaaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
aeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaagaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 112
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
Float 92 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedoebbelklkbebkkmacmcfmaecbllcpfdaabaaaaaalmaiaaaaaeaaaaaa
daaaaaaabeadaaaaoiahaaaaiiaiaaaaebgpgodjnmacaaaanmacaaaaaaacpppp
keacaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaadaaaaaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaiadp
hdgijbdnpepndedpkoehgbdofbaaaaafaeaaapkaaaaaaaebaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaadlabpaaaaacaaaaaajiaaaiapka
bpaaaaacaaaaaajaabaiapkaabaaaaacaaaaabiaaaaapplaabaaaaacaaaaacia
abaapplaabaaaaacaaaaaeiaacaapplaabaaaaacabaacbiaaaaakklaabaaaaac
abaacciaabaakklaabaaaaacabaaceiaacaakklaaiaaaaadaaaaaiiaaaaaoeia
abaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeia
aaaappibaaaaoeiaceaaaaacacaachiaaaaaoeiaaiaaaaadacaaciiaacaaoeia
abaaoeiaecaaaaadaaaacpiaacaaoeiaaaaioekaecaaaaadabaacpiaadaaoela
abaioekacdaaaaacaaaaciiaacaappiaacaaaaadaaaaciiaaaaappibadaaaaka
caaaaaadacaacbiaaaaappiaacaakkkaaeaaaaaeaaaaciiaacaaaaiaacaaffka
acaaaakaabaaaaacadaaaiiaadaaaakaaeaaaaaeacaacbiaacaaaaiaaaaaaakb
adaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaadiiaaaaappia
acaaaaadaaaaciiaaaaappibadaaaakaafaaaaadacaacoiaaaaappiaabaablka
aeaaaaaeadaachiaaaaaoeiaabaaoekaaaaaoeibaiaaaaadaaaadiiaaaaaoeia
adaablkaaeaaaaaeadaaciiaaaaappiaaaaappibadaaaakaafaaaaadaaaaciia
aaaappiaaaaappiaaeaaaaaeaaaaciiaabaappkaacaaaaiaaaaappiaakaaaaad
aeaaciiaaaaappiaadaaaakaafaaaaadaaaaciiaadaappiaacaappkaaeaaaaae
aaaachiaaaaappiaadaaoeiaaaaaoeiaafaaaaadaaaaciiaabaappiaaeaaaaka
afaaaaadabaachiaabaaoeiaaaaappiaaeaaaaaeaeaachiaacaabliaabaaoeia
aaaaoeiaabaaaaacaaaicpiaaeaaoeiappppaaaafdeieefcmmaeaaaaeaaaaaaa
ddabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaa
abaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaa
dgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaa
ckbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
dkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
aaaaaaaaafaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
ccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaaakiacaaa
aaaaaaaaafaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaa
aeaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
aeaaaaaaegacbaiaebaaaaaaabaaaaaabacaaaakicaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadcaaaaakicaabaaa
acaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaaakaabaaaaaaaaaaadkaabaaa
abaaaaaaddaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaibcaabaaaaaaaaaaadkaabaaaacaaaaaadkiacaaaaaaaaaaaafaaaaaa
dcaaaaajhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaaeaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1.x, fragment.texcoord[5], texture[1], 2D;
MOV R1.y, fragment.texcoord[0].z;
MOV R1.z, fragment.texcoord[1];
MOV R1.w, fragment.texcoord[2].z;
MOV R2.x, fragment.texcoord[0].w;
MOV R2.z, fragment.texcoord[2].w;
MOV R2.y, fragment.texcoord[1].w;
DP3 R0.x, R1.yzww, R2;
MUL R0.xyz, R1.yzww, R0.x;
MAD R0.xyz, -R0, c[7].x, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R0.w, R2, R1.yzww;
ABS R0.w, R0;
ADD R0.w, -R0, c[7].y;
POW R0.w, R0.w, c[5].x;
MOV R1.y, c[3].x;
MAD R1.y, R0.w, c[4].x, R1;
TEX R0.xyz, R2, texture[0], CUBE;
MUL R2.xyz, R0, R1.y;
DP3_SAT R0.y, R2, c[8];
MUL R0.y, R0, R0;
ADD R1.z, -R0.y, c[7].y;
MOV R0.x, c[7].y;
MAD R0.x, -R0.w, c[1], R0;
MAD R0.x, R0, c[2].w, R0.y;
MIN R0.w, R0.x, c[7].y;
MAD R0.xyz, R2, c[2], -R2;
MUL R1.z, R1, c[6].x;
MAD R2.xyz, R1.z, R0, R2;
MOV_SAT R0.z, R1.y;
ADD R0.y, -R0.w, c[7];
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R1.y, fragment.texcoord[3].z, R0.x;
ADD R0.y, -R0.z, c[7];
MUL R0.xyz, R0.y, c[2];
MUL R1.w, R1.y, R1.x;
MUL R1.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.texcoord[4];
MUL R1.xyz, R1.w, R1;
MAD R0.xyz, R1, c[7].x, R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, R0;
END
# 45 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
Float 6 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c7, 2.00000000, 1.00000000, 0, 0
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
dcl t5
texldp r3, t5, s1
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c7.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c7.y
mov_pp r4.x, c3
mov_pp r0.y, c7
texld r2, r1, s0
pow_pp r1.w, r0.x, c5.x
mov_pp r0.x, r1.w
mad_pp r1.x, r0, c4, r4
mul_pp r5.xyz, r2, r1.x
dp3_pp_sat r2.x, r5, c8
mul_pp r4.x, r2, r2
mad_pp r0.x, -r0, c1, r0.y
mad_pp r0.x, r0, c2.w, r4
min_pp r0.x, r0, c7.y
mad_pp r2.x, -r2, r2, c7.y
mad_pp r4.xyz, r5, c2, -r5
mul_pp r2.x, r2, c6
mad_pp r5.xyz, r2.x, r4, r5
add_pp r4.x, -r0, c7.y
abs_pp r2.x, t3.z
mul_pp r2.x, r2, r4
mov_pp_sat r4.x, r1
max_pp r1.x, t3.z, r2
add_pp r2.x, -r4, c7.y
mul_pp r1.x, r1, r3
mul_pp r2.xyz, r2.x, c2
mul_pp r3.xyz, r2, c0
mov_pp r0.w, r0.x
mul_pp r2.xyz, r2, t4
mul_pp r1.xyz, r1.x, r3
mad_pp r1.xyz, r1, c7.x, r2
add_pp r0.xyz, r1, r5
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
Float 156 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeoeamlmhpcgmedlbohjglbcclkpbfdjpabaaaaaaoeagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaeaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckmafaaaaeaaaaaaaglabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadecbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaa
aaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaincaabaaa
aaaaaaaaagaabaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaabacaaaakicaabaaa
abaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
diaaaaahbcaabaaaacaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaak
icaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaa
ajaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaabkaabaaa
aaaaaaaaakaabaaaacaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaacaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaaakaabaaaacaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaackbabaaaaeaaaaaaaoaaaaahdcaabaaa
acaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaa
egaabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahccaabaaa
aaaaaaaafgafbaaaaaaaaaaaagaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagbjbaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaaegacbaiaebaaaaaaabaaaaaa
dcaaaaajhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaaaaaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
Float 156 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedacjngaboblfcdldelgoibemmleedidikabaaaaaagaakaaaaaeaaaaaa
daaaaaaakiadaaaafmajaaaacmakaaaaebgpgodjhaadaaaahaadaaaaaaacpppp
cmadaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaaaaaaaaaaaaacpppp
fbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdobpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaapla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkaabaaaaacaaaaabia
aaaapplaabaaaaacaaaaaciaabaapplaabaaaaacaaaaaeiaacaapplaabaaaaac
abaacbiaaaaakklaabaaaaacabaacciaabaakklaabaaaaacabaaceiaacaakkla
aiaaaaadaaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaabaaoeiaaaaappibaaaaoeiaceaaaaacacaachiaaaaaoeia
aiaaaaadacaaciiaacaaoeiaabaaoeiaagaaaaacaaaaabiaafaapplaafaaaaad
aaaaadiaaaaaaaiaafaaoelaecaaaaadabaacpiaacaaoeiaabaioekaecaaaaad
aaaacpiaaaaaoeiaaaaioekacdaaaaacabaaciiaacaappiaacaaaaadabaaciia
abaappibaeaaaakacaaaaaadaaaacciaabaappiaadaakkkaabaaaaacabaaaiia
aeaaaakaaeaaaaaeabaaciiaaaaaffiaabaaaakbabaappiaaeaaaaaeaaaaccia
aaaaffiaadaaffkaadaaaakaafaaaaadabaachiaaaaaffiaabaaoeiaabaaaaac
aaaadciaaaaaffiaacaaaaadaaaacciaaaaaffibaeaaaakaafaaaaadaaaacoia
aaaaffiaacaablkaaiaaaaadacaadbiaabaaoeiaaeaablkaafaaaaadacaaccia
acaaaaiaacaaaaiaaeaaaaaeacaacbiaacaaaaiaacaaaaibaeaaaakaafaaaaad
acaacbiaacaaaaiaadaappkaaeaaaaaeabaaciiaacaappkaabaappiaacaaffia
akaaaaadadaaciiaabaappiaaeaaaakaacaaaaadabaaciiaadaappibaeaaaaka
cdaaaaacacaacciaadaakklaafaaaaadabaaciiaabaappiaacaaffiaalaaaaad
acaacciaadaakklaabaappiaafaaaaadabaaciiaaaaaaaiaacaaffiaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadacaacoiaaaaaoeiaaaaablkaafaaaaad
aaaachiaaaaabliaaeaaoelaaeaaaaaeaaaachiaacaabliaabaappiaaaaaoeia
aeaaaaaeacaacoiaabaabliaacaablkaabaablibaeaaaaaeabaachiaacaaaaia
acaabliaabaaoeiaacaaaaadadaachiaaaaaoeiaabaaoeiaabaaaaacaaaicpia
adaaoeiappppaaaafdeieefckmafaaaaeaaaaaaaglabaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaadecbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
lcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdcaaaaalbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaincaabaaaaaaaaaaaagaabaaa
aaaaaaaaagijcaaaaaaaaaaaaiaaaaaabacaaaakicaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaa
acaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaai
icaabaaaabaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaaajaaaaaadcaaaaak
ccaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaabkaabaaaaaaaaaaaakaabaaa
acaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaibcaabaaaacaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
akaabaaaacaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackbabaaaaeaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaa
agaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahccaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaigadbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agbjbaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaafgafbaaa
aaaaaaaaigadbaaaaaaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaaiaaaaaaegacbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaeaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TXP R4.x, fragment.texcoord[4], texture[1], 2D;
MOV R2.x, fragment.texcoord[0].z;
MOV R2.y, fragment.texcoord[1].z;
MOV R2.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R2, R0;
MUL R1.xyz, R2, R0.w;
MAD R0.xyz, -R1, c[6].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
DP3 R1.w, R3, R2;
ABS R1.w, R1;
ADD R1.w, -R1, c[6].y;
POW R1.w, R1.w, c[4].x;
MOV R2.x, c[2];
MAD R2.w, R1, c[3].x, R2.x;
TEX R1.xyz, R3, texture[0], CUBE;
TEX R0, fragment.texcoord[3], texture[2], 2D;
MUL R1.xyz, R2.w, R1;
DP3_SAT R2.x, R1, c[7];
MUL R3.x, R2, R2;
ADD R3.y, -R3.x, c[6];
MAD R2.xyz, R1, c[1], -R1;
MUL R3.y, R3, c[5].x;
MAD R2.xyz, R3.y, R2, R1;
MOV R1.x, c[6].y;
MAD R1.z, -R1.w, c[0].x, R1.x;
MAD R1.w, R1.z, c[1], R3.x;
MUL R3.xyz, R0.w, R0;
MUL R0.xyz, R0, R4.x;
MOV_SAT R1.y, R2.w;
MUL R3.xyz, R3, c[6].z;
ADD R1.x, -R1.y, c[6].y;
MUL R0.xyz, R0, c[6].x;
MUL R1.xyz, R1.x, c[1];
MUL R4.xyz, R3, R4.x;
MIN R0.xyz, R3, R0;
MAX R0.xyz, R0, R4;
MAD result.color.xyz, R1, R0, R2;
MIN result.color.w, R1, c[6].y;
END
# 43 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EdgeAlpha]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 2.00000000, 8.00000000, 1.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xy
dcl t4
texldp r5, t4, s1
texld r4, t3, s2
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.z
mov_pp r0.z, c6
texld r2, r1, s0
pow_pp r1.w, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r1.w, c3, r0
mul_pp r6.xyz, r0.x, r2
dp3_pp_sat r2.x, r6, c7
mad_pp r3.x, -r2, r2, c6.z
mov_pp_sat r0.x, r0
mad_pp r1.x, -r1.w, c0, r0.z
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c1.w, r2
min_pp r0.w, r1.x, c6.z
mul_pp r1.xyz, r4.w, r4
mul_pp r2.xyz, r4, r5.x
mul_pp r1.xyz, r1, c6.y
add_pp r0.x, -r0, c6.z
mul_pp r4.xyz, r1, r5.x
mul_pp r2.xyz, r2, c6.x
min_pp r1.xyz, r1, r2
mad_pp r7.xyz, r6, c1, -r6
mul_pp r3.x, r3, c5
mad_pp r3.xyz, r3.x, r7, r6
max_pp r1.xyz, r1, r4
mul_pp r0.xyz, r0.x, c1
mad_pp r0.xyz, r0, r1, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
Float 156 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0
eefiecedebhhejkmblhdpaalmgdjdlamjjmahdhcabaaaaaaoaagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaafaaaa
eaaaaaaahaabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaa
abaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaadkbabaaaadaaaaaa
dgaaaaafbcaabaaaacaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaacaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaacaaaaaackbabaaaadaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalicaabaaaabaaaaaadkaabaaa
aaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaal
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaa
abeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadgcaaaaficaabaaaabaaaaaadkaabaaaabaaaaaaaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
acaaaaaapgapbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadcaaaaalhcaabaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaaegacbaiaebaaaaaa
abaaaaaabacaaaakicaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaadkiacaaa
aaaaaaaaaiaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaaddaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaa
dkaabaaaacaaaaaadkiacaaaaaaaaaaaajaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 176
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
Float 156 [_Metalics]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedglhbafpmdjjmojppndjpmhonegggodkiabaaaaaagaakaaaaaeaaaaaa
daaaaaaakmadaaaaheajaaaacmakaaaaebgpgodjheadaaaaheadaaaaaaacpppp
diadaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaahaaadaaaaaaaaaaaaaaaaacppppfbaaaaafadaaapka
aaaaiadphdgijbdnpepndedpkoehgbdofbaaaaafaeaaapkaaaaaaaebaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaadlabpaaaaacaaaaaaia
aeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkabpaaaaac
aaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappia
aeaaoelaabaaaaacabaaabiaaaaapplaabaaaaacabaaaciaabaapplaabaaaaac
abaaaeiaacaapplaabaaaaacacaacbiaaaaakklaabaaaaacacaacciaabaakkla
abaaaaacacaaceiaacaakklaaiaaaaadabaaaiiaabaaoeiaacaaoeiaacaaaaad
abaaaiiaabaappiaabaappiaaeaaaaaeabaaahiaacaaoeiaabaappibabaaoeia
ceaaaaacadaachiaabaaoeiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaadaaoelaacaioekaecaaaaadaeaacpiaadaaoeiaabaioekaacaaaaad
acaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaacaappiaafaaaaad
abaaciiaabaappiaaeaaaakaafaaaaadabaachiaabaaoeiaabaappiaakaaaaad
afaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaiaabaaoeiaalaaaaad
abaachiaafaaoeiaaaaaoeiaaiaaaaadabaaciiaadaaoeiaacaaoeiacdaaaaac
abaaciiaabaappiaacaaaaadabaaciiaabaappibadaaaakacaaaaaadaeaaciia
abaappiaacaakkkaaeaaaaaeabaaciiaaeaappiaacaaffkaacaaaakaabaaaaac
aaaaabiaadaaaakaaeaaaaaeaeaaciiaaeaappiaaaaaaakbaaaaaaiaafaaaaad
aaaachiaabaappiaaeaaoeiaabaaaaacabaadiiaabaappiaacaaaaadaaaaciia
abaappibadaaaakaafaaaaadacaachiaaaaappiaabaaoekaaeaaaaaeadaachia
aaaaoeiaabaaoekaaaaaoeibaiaaaaadaaaadiiaaaaaoeiaadaablkaaeaaaaae
abaaciiaaaaappiaaaaappibadaaaakaafaaaaadaaaaciiaaaaappiaaaaappia
aeaaaaaeaaaaciiaabaappkaaeaappiaaaaappiaakaaaaadaeaaciiaaaaappia
adaaaakaafaaaaadaaaaciiaabaappiaacaappkaaeaaaaaeaaaachiaaaaappia
adaaoeiaaaaaoeiaaeaaaaaeaeaachiaacaaoeiaabaaoeiaaaaaoeiaabaaaaac
aaaicpiaaeaaoeiappppaaaafdeieefcmaafaaaaeaaaaaaahaabaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaaeaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaah
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafbcaabaaa
abaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaadkbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaaacaaaaaa
ckbabaaaabaaaaaadgaaaaafccaabaaaacaaaaaackbabaaaacaaaaaadgaaaaaf
ecaabaaaacaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegacbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalicaabaaaabaaaaaadkaabaaaaaaaaaaabkiacaaaaaaaaaaa
ajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgcaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaaaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaacaaaaaapgapbaaaabaaaaaa
egiccaaaaaaaaaaaaiaaaaaadcaaaaalhcaabaaaadaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaaiaaaaaaegacbaiaebaaaaaaabaaaaaabacaaaakicaabaaa
abaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaa
dcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaakicaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaadkaabaaa
aaaaaaaadkaabaaaabaaaaaaddaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaadkaabaaaacaaaaaadkiacaaa
aaaaaaaaajaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_2_0
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbmejagdnknldkdkokgoagefihnmciakbabaaaaaagiajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedihmhhoafoeecddgldclnokadhiikgcleabaaaaaamianaaaaaeaaaaaa
daaaaaaaimaeaaaaeiamaaaabaanaaaaebgpgodjfeaeaaaafeaeaaaaaaacpopp
paadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaamaaajaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjaabaaaaacaaaaahiaafaaoekaafaaaaadabaaahiaaaaaffiabaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabcaaoekaaeaaaaaeaaaaahia
aaaaoeiabdaappkaaaaaoejbafaaaaadabaaahiaaaaaffibamaaoekaaeaaaaae
aaaaaliaalaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaanaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaalaaaakaabaaaaac
adaaaciaamaaaakaabaaaaacadaaaeiaanaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadaaaaapoaabaaoeiabdaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaalaaffkaabaaaaacadaaaciaamaaffkaabaaaaacadaaaeia
anaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoaabaaoeia
bdaappkaabaaaaacabaaabiaalaakkkaabaaaaacabaaaciaamaakkkaabaaaaac
abaaaeiaanaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadacaaapoa
aaaaoeiabdaappkaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabdaappkaaaaaoejbaiaaaaadadaaaboaabaaoeja
aaaaoeiaaiaaaaadadaaacoaacaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[15].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[15].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[3].y, R2, R1;
MUL result.texcoord[2], R0, c[15].w;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c15.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT3.y, r2, r1
mul oT2, r0, c14.w
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedfnkobdjgbcelhgeedgmogjfcocphhkncabaaaaaaniahaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdmagaaaaeaaaabaa
ipabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
acaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaf
icaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaa
pgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaa
dgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaa
acaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaag
bcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaa
ckiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaa
adaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedeajdbhamdohglggnnlfkmdmjjamaphnaabaaaaaaimalaaaaaeaaaaaa
daaaaaaaoaadaaaaceakaaaaomakaaaaebgpgodjkiadaaaakiadaaaaaaacpopp
eeadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjaabaaaaacaaaaahiaabaaoekaafaaaaadabaaahiaaaaaffiaalaaoeka
aeaaaaaeaaaaaliaakaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaamaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaanaaoekaaeaaaaaeaaaaahia
aaaaoeiaaoaappkaaaaaoejbafaaaaadabaaahiaaaaaffibaiaaoekaaeaaaaae
aaaaaliaahaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaajaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaahaaaakaabaaaaac
adaaaciaaiaaaakaabaaaaacadaaaeiaajaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadaaaaapoaabaaoeiaaoaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaahaaffkaabaaaaacadaaaciaaiaaffkaabaaaaacadaaaeia
ajaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoaabaaoeia
aoaappkaabaaaaacabaaabiaahaakkkaabaaaaacabaaaciaaiaakkkaabaaaaac
abaaaeiaajaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadacaaapoa
aaaaoeiaaoaappkaabaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffia
alaaoekaaeaaaaaeabaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeia
aiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcdmagaaaaeaaaabaaipabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaal
lcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaa
egambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaacaaaaaa
aoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
abaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaaficaabaaa
abaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
abaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].w, R0, c[16];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_2_0
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.w, r0, c15
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedniopmemeonndlgdfpmbaegdnnikojdbnabaaaaaagiajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedmgmkjnahglknhcekbnefmdmpnanifdkoabaaaaaamianaaaaaeaaaaaa
daaaaaaaimaeaaaaeiamaaaabaanaaaaebgpgodjfeaeaaaafeaeaaaaaaacpopp
paadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaamaaajaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjaabaaaaacaaaaahiaafaaoekaafaaaaadabaaahiaaaaaffiabaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabcaaoekaaeaaaaaeaaaaahia
aaaaoeiabdaappkaaaaaoejbafaaaaadabaaahiaaaaaffibamaaoekaaeaaaaae
aaaaaliaalaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaanaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaalaaaakaabaaaaac
adaaaciaamaaaakaabaaaaacadaaaeiaanaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadaaaaapoaabaaoeiabdaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaalaaffkaabaaaaacadaaaciaamaaffkaabaaaaacadaaaeia
anaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoaabaaoeia
bdaappkaabaaaaacabaaabiaalaakkkaabaaaaacabaaaciaamaakkkaabaaaaac
abaaaeiaanaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadacaaapoa
aaaaoeiabdaappkaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabdaappkaaaaaoejbaiaaaaadadaaaboaabaaoeja
aaaaoeiaaiaaaaadadaaacoaacaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoeka
aeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeaeaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_2_0
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r1, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedbmejagdnknldkdkokgoagefihnmciakbabaaaaaagiajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedihmhhoafoeecddgldclnokadhiikgcleabaaaaaamianaaaaaeaaaaaa
daaaaaaaimaeaaaaeiamaaaabaanaaaaebgpgodjfeaeaaaafeaeaaaaaaacpopp
paadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaamaaajaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjaabaaaaacaaaaahiaafaaoekaafaaaaadabaaahiaaaaaffiabaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabcaaoekaaeaaaaaeaaaaahia
aaaaoeiabdaappkaaaaaoejbafaaaaadabaaahiaaaaaffibamaaoekaaeaaaaae
aaaaaliaalaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaanaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaalaaaakaabaaaaac
adaaaciaamaaaakaabaaaaacadaaaeiaanaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadaaaaapoaabaaoeiabdaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaalaaffkaabaaaaacadaaaciaamaaffkaabaaaaacadaaaeia
anaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoaabaaoeia
bdaappkaabaaaaacabaaabiaalaakkkaabaaaaacabaaaciaamaakkkaabaaaaac
abaaaeiaanaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadacaaapoa
aaaaoeiabdaappkaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabdaappkaaaaaoejbaiaaaaadadaaaboaabaaoeja
aaaaoeiaaiaaaaadadaaacoaacaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcleahaaaaeaaaabaaonabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[18];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[17];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[19].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0], R0, c[19].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R1;
DP3 result.texcoord[3].x, vertex.attrib[14], R1;
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 42 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_2_0
def c19, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c17, r0
mov r0, c9
dp4 r1.y, c17, r0
dp4 r1.x, c17, r3
mov r0.xyz, c16
mov r0.w, c19.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c18.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT0, r0, c18.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT1, r0, c18.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT2, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT3.y, r2, r1
dp3 oT3.z, v2, r1
dp3 oT3.x, v1, r1
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedfllinefmhlpaoohmcgjeblghpigihdieabaaaaaadmajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefciiahaaaaeaaaabaaocabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaaddccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaaafaaaaaaegiacaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedbbamcnfdjflagefonbkhjfcehcbbogebabaaaaaaiianaaaaaeaaaaaa
daaaaaaahiaeaaaaaiamaaaanaamaaaaebgpgodjeaaeaaaaeaaeaaaaaaacpopp
nmadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaamaaajaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjaabaaaaacaaaaahiaafaaoekaafaaaaadabaaahiaaaaaffiabaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabcaaoekaaeaaaaaeaaaaahia
aaaaoeiabdaappkaaaaaoejbafaaaaadabaaahiaaaaaffibamaaoekaaeaaaaae
aaaaaliaalaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaanaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaalaaaakaabaaaaac
adaaaciaamaaaakaabaaaaacadaaaeiaanaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadaaaaapoaabaaoeiabdaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaalaaffkaabaaaaacadaaaciaamaaffkaabaaaaacadaaaeia
anaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadabaaapoaabaaoeia
bdaappkaabaaaaacabaaabiaalaakkkaabaaaaacabaaaciaamaakkkaabaaaaac
abaaaeiaanaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadacaaapoa
aaaaoeiabdaappkaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahiaaaaaffia
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappiaaaaaoeia
aiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaacaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
abaaadiaaaaaffiaacaaoekaaeaaaaaeaaaaadiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaadiaadaaoekaaaaakkiaaaaaoeiaaeaaaaaeaeaaadoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapia
ahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefciiahaaaa
eaaaabaaocabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaaddccabaaaafaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
adaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaf
icaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaabaaaaaaegaobaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaa
dgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaag
bcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaa
ckiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaa
aoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaa
adaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaak
dccabaaaafaaaaaaegiacaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaabaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.y, R0.x, c[5].x;
MOV R0.z, c[3].x;
MAD R0.x, R0.y, c[4], R0.z;
MOV R0.z, c[6];
MAD R0.y, -R0, c[1].x, R0.z;
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
TEX R0.w, R0.w, texture[1], 2D;
MUL R1.xyz, R1, R0.x;
DP3_SAT R1.x, R1, c[7];
MUL R1.x, R1, R1;
MAD R0.y, R0, c[2].w, R1.x;
MIN R0.z, R0.y, c[6];
DP3 R0.y, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.y, R0.y;
MUL R1.x, R0.y, fragment.texcoord[3].z;
MOV_SAT R0.x, R0;
ADD R0.y, -R0.x, c[6].z;
ABS R0.x, R1;
ADD R0.z, -R0, c[6];
MUL R1.y, R0.x, R0.z;
MUL R0.xyz, R0.y, c[2];
MUL R2.xyz, R0, c[0];
MAX R1.x, R1, R1.y;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 43 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r3.xyz, -r1, c6.x, r2
dp3 r1.x, r3, r3
rsq r1.x, r1.x
mul r1.xyz, r1.x, r3
dp3_pp r0.x, r1, r0
dp3 r2.x, t4, t4
mov r3.xy, r2.x
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r2, r1, s0
texld r3, r3, s1
pow_pp r1.w, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.w, c4, r0
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.w, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
dp3_pp r2.x, t3, t3
rsq_pp r2.x, r2.x
mul_pp r0.z, r2.x, t3
min_pp r1.x, r1, c6.y
abs_pp r2.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r1.xyz, r2.x, c2
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpmgakhdlodcdbamjgaofjekbnabdfnilabaaaaaadeagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbeafaaaa
eaaaaaaaefabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
mcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
dgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
bcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaa
acaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaa
dgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaadkiacaaaaaaaaaaaaiaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
ddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpbaaaaaah
bcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
ckbabaaaaeaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ibaaaaaaabaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhcickfompkokgajoljaejalcolikedagabaaaaaaimajaaaaaeaaaaaa
daaaaaaaieadaaaakaaiaaaafiajaaaaebgpgodjemadaaaaemadaaaaaaacpppp
aiadaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaaaaaaaaaaaaacpppp
fbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdofbaaaaafafaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaji
abaiapkaabaaaaacaaaaabiaaaaapplaabaaaaacaaaaaciaabaapplaabaaaaac
aaaaaeiaacaapplaabaaaaacabaacbiaaaaakklaabaaaaacabaacciaabaakkla
abaaaaacabaaceiaacaakklaaiaaaaadaaaaaiiaaaaaoeiaabaaoeiaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappibaaaaoeia
ceaaaaacacaachiaaaaaoeiaaiaaaaadacaaciiaacaaoeiaabaaoeiaaiaaaaad
aaaaadiaaeaaoelaaeaaoelaecaaaaadabaacpiaacaaoeiaabaioekaecaaaaad
aaaacpiaaaaaoeiaaaaioekacdaaaaacabaaciiaacaappiaacaaaaadabaaciia
abaappibaeaaaakacaaaaaadaaaacciaabaappiaadaakkkaaeaaaaaeabaaciia
aaaaffiaadaaffkaadaaaakaabaaaaacacaaabiaaeaaaakaaeaaaaaeaaaaccia
aaaaffiaabaaaakbacaaaaiaafaaaaadabaachiaabaappiaabaaoeiaabaaaaac
abaadiiaabaappiaacaaaaadabaaciiaabaappibaeaaaakaafaaaaadacaachia
abaappiaacaaoekaafaaaaadacaachiaacaaoeiaaaaaoekaaiaaaaadacaadiia
abaaoeiaaeaablkaafaaaaadacaaciiaacaappiaacaappiaaeaaaaaeacaaciia
acaappkaaaaaffiaacaappiaacaaaaadaaaaaciaacaappiaaeaaaakbacaaaaad
acaaaiiaacaappibaeaaaakaaiaaaaadaaaaceiaadaaoelaadaaoelaahaaaaac
aaaaceiaaaaakkiaafaaaaadaaaaceiaaaaakkiaadaakklacdaaaaacaaaaciia
aaaakkiaafaaaaadaaaaciiaacaappiaaaaappiafiaaaaaeacaaciiaaaaaffia
afaaaakaaaaappiaalaaaaadabaacbiaaaaakkiaacaappiaafaaaaadacaaciia
aaaaaaiaabaaaaiaacaaaaadacaaciiaacaappiaacaappiaafaaaaadaaaachia
acaappiaacaaoeiaabaaaaacaaaaciiaafaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcbeafaaaaeaaaaaaaefabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaa
dgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
dkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaia
mbaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
ajaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaa
ajaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaahaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
bacaaaakbcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpbaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackbabaaaaeaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaiaibaaaaaaabaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.z, R0.x, c[5].x;
MOV R0.y, c[3].x;
MAD R0.x, R0.z, c[4], R0.y;
MOV R0.y, c[6].z;
MAD R0.y, -R0.z, c[1].x, R0;
MOV_SAT R0.z, R0.x;
ADD R0.z, -R0, c[6];
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
MUL R1.xyz, R1, R0.x;
DP3_SAT R0.w, R1, c[7];
MUL R1.xyz, R0.z, c[2];
MUL R0.w, R0, R0;
MAD R0.y, R0, c[2].w, R0.w;
MIN R0.x, R0.y, c[6].z;
ADD R0.y, -R0.x, c[6].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MUL R1.xyz, R1, c[0];
MAX R0.x, fragment.texcoord[3].z, R0;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].y;
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
"ps_2_0
dcl_cube s0
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r1.xyz, r1.x, r2
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r2, r1, s0
pow_pp r1.w, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.w, c4, r0
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.w, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
min_pp r1.x, r1, c6.y
add_pp r0.x, -r1, c6.y
abs_pp r1.x, t3.z
mul_pp r0.x, r1, r0
mul_pp r2.xyz, r2.x, c2
mul_pp r1.xyz, r2, c0
max_pp r0.x, t3.z, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefieceddpaajiggkmlboganfallmndbiknibfmfabaaaaaagiafaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaeaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcgaaeaaaaeaaaaaaabiabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fkaaaaadaagabaaaaaaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadecbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
dgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
bcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaa
acaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaaaaaaaaaafaaaaaaakiacaaaaaaaaaaaafaaaaaadcaaaaalbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaa
dgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagijcaaaaaaaaaaaaeaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaadkiacaaaaaaaaaaaaeaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
ddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaaaaeaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Cube] CUBE 0
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 48 [_EdgeAlpha]
Vector 64 [_Color]
Float 80 [_Reflection]
Float 84 [_FrezPow]
Float 88 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhmfpeecapmjpkekekonkelimbnhbmidcabaaaaaaeiaiaaaaaeaaaaaa
daaaaaaaamadaaaaheahaaaabeaiaaaaebgpgodjneacaaaaneacaaaaaaacpppp
jeacaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaadaaadaaabaaaaaaaaaaaaacppppfbaaaaaf
aeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdofbaaaaafafaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajiaaaiapkaabaaaaacaaaaabiaaaaapplaabaaaaacaaaaaciaabaappla
abaaaaacaaaaaeiaacaapplaabaaaaacabaacbiaaaaakklaabaaaaacabaaccia
abaakklaabaaaaacabaaceiaacaakklaaiaaaaadaaaaaiiaaaaaoeiaabaaoeia
acaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappib
aaaaoeiaceaaaaacacaachiaaaaaoeiaaiaaaaadacaaciiaacaaoeiaabaaoeia
ecaaaaadaaaacpiaacaaoeiaaaaioekacdaaaaacaaaaciiaacaappiaacaaaaad
aaaaciiaaaaappibaeaaaakacaaaaaadabaacbiaaaaappiaadaakkkaaeaaaaae
aaaaciiaabaaaaiaadaaffkaadaaaakaabaaaaacacaaabiaaeaaaakaaeaaaaae
abaacbiaabaaaaiaabaaaakbacaaaaiaafaaaaadaaaachiaaaaappiaaaaaoeia
abaaaaacaaaadiiaaaaappiaacaaaaadaaaaciiaaaaappibaeaaaakaafaaaaad
abaacoiaaaaappiaacaablkaafaaaaadabaacoiaabaaoeiaaaaablkaaiaaaaad
aaaadbiaaaaaoeiaaeaablkaafaaaaadaaaacbiaaaaaaaiaaaaaaaiaaeaaaaae
aaaacbiaacaappkaabaaaaiaaaaaaaiaacaaaaadaaaaaciaaaaaaaibaeaaaaka
acaaaaadaaaaabiaaaaaaaiaaeaaaakbcdaaaaacaaaaceiaadaakklaafaaaaad
aaaacciaaaaaffiaaaaakkiafiaaaaaeaaaacbiaaaaaaaiaafaaaakaaaaaffia
alaaaaadabaacbiaadaakklaaaaaaaiaacaaaaadaaaacbiaabaaaaiaabaaaaia
afaaaaadaaaachiaaaaaaaiaabaabliaabaaaaacaaaaciiaafaaaakaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcgaaeaaaaeaaaaaaabiabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadecbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaa
dgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
dkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaia
mbaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
afaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaaakiacaaaaaaaaaaa
afaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaadaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaaaeaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
bacaaaakbcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaia
ibaaaaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaaa
aeaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaeaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1, 0.5 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
RCP R1.w, fragment.texcoord[4].w;
MAD R3.xy, fragment.texcoord[4], R1.w, c[6].w;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV R1.y, fragment.texcoord[1].z;
MOV R1.z, fragment.texcoord[2];
MOV R1.x, fragment.texcoord[0].z;
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R1, R0;
MUL R2.xyz, R1, R0.w;
MAD R0.xyz, -R2, c[6].y, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R1.x, R2, R1;
ABS R1.x, R1;
ADD R1.x, -R1, c[6].z;
POW R1.y, R1.x, c[5].x;
MOV R1.z, c[3].x;
MAD R1.x, R1.y, c[4], R1.z;
MOV result.color.w, c[6].x;
TEX R0.xyz, R2, texture[0], CUBE;
TEX R0.w, R3, texture[1], 2D;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.xyz, R0, R1.x;
DP3_SAT R0.y, R0, c[7];
MOV R0.x, c[6].z;
MAD R0.x, -R1.y, c[1], R0;
MUL R0.y, R0, R0;
MAD R0.y, R0.x, c[2].w, R0;
MIN R0.y, R0, c[6].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
SLT R1.y, c[6].x, fragment.texcoord[4].z;
MUL R0.w, R1.y, R0;
ADD R0.z, -R0.y, c[6];
MUL R0.x, R0, fragment.texcoord[3].z;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV_SAT R1.x, R1;
ADD R0.z, -R1.x, c[6];
MAX R1.x, R0, R0.y;
MUL R0.xyz, R0.z, c[2];
MUL R2.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 49 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c6, 2.00000000, 1.00000000, 0.00000000, 0.50000000
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4
mov_pp r0.y, t1.z
mov_pp r0.z, t2
mov_pp r0.x, t0.z
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r1.x, r0, r2
mul r1.xyz, r0, r1.x
mad r2.xyz, -r1, c6.x, r2
dp3 r1.x, r2, r2
rsq r1.x, r1.x
mul r3.xyz, r1.x, r2
dp3_pp r0.x, r3, r0
rcp r1.x, t4.w
mad r4.xy, t4, r1.x, c6.w
dp3 r2.x, t4, t4
mov r2.xy, r2.x
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
mov_pp r0.y, c6
mov_pp r0.w, c6.z
texld r1, r3, s0
texld r2, r2, s2
texld r4, r4, s1
pow_pp r3.w, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r3.w, c4, r0
mul_pp r1.xyz, r1, r0.x
dp3_pp_sat r1.x, r1, c7
mad_pp r3.x, -r3.w, c1, r0.y
mul_pp r1.x, r1, r1
mad_pp r1.x, r3, c2.w, r1
dp3_pp r3.x, t3, t3
rsq_pp r3.x, r3.x
mul_pp r0.z, r3.x, t3
min_pp r1.x, r1, c6.y
abs_pp r3.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r3, r1
mov_pp_sat r0.x, r0
add_pp r3.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r3.xyz, r3.x, c2
cmp r1.x, -t4.z, c6.z, c6.y
mul_pp r1.x, r1, r4.w
mul_pp r1.x, r1, r2
mul_pp r2.xyz, r3, c0
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlkalpceghgahgaokkponandeghelckljabaaaaaaciahaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaiagaaaa
eaaaaaaaicabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
pcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaa
dkiacaaaaaaaaaaaaiaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaaddaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpbaaaaaahbcaabaaa
abaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackbabaaa
aeaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaiaibaaaaaa
abaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaak
dcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadbaaaaahbcaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaa
afaaaaaaabaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaahbcaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaabaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
acaaaaaafgafbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaacaaaaaaapaaaaahbcaabaaa
aaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedojoldkkdkkfiklfjdahepocepedbibakabaaaaaaoeakaaaaaeaaaaaa
daaaaaaaoiadaaaapiajaaaalaakaaaaebgpgodjlaadaaaalaadaaaaaaacpppp
giadaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaaaaaaaaaa
aaacppppfbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdofbaaaaaf
afaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaabaaaaacaaaaabiaaaaappla
abaaaaacaaaaaciaabaapplaabaaaaacaaaaaeiaacaapplaabaaaaacabaacbia
aaaakklaabaaaaacabaacciaabaakklaabaaaaacabaaceiaacaakklaaiaaaaad
aaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
aaaaahiaabaaoeiaaaaappibaaaaoeiaceaaaaacacaachiaaaaaoeiaaiaaaaad
acaaciiaacaaoeiaabaaoeiaagaaaaacaaaaabiaaeaapplaaeaaaaaeaaaaadia
aeaaoelaaaaaaaiaafaaaakaaiaaaaadabaaadiaaeaaoelaaeaaoelaecaaaaad
adaacpiaacaaoeiaacaioekaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekacdaaaaacadaaciiaacaappiaacaaaaadadaaciia
adaappibaeaaaakacaaaaaadaaaacbiaadaappiaadaakkkaaeaaaaaeadaaciia
aaaaaaiaadaaffkaadaaaakaabaaaaacacaaabiaaeaaaakaaeaaaaaeaaaacbia
aaaaaaiaabaaaakbacaaaaiaafaaaaadacaachiaadaappiaadaaoeiaabaaaaac
adaadiiaadaappiaacaaaaadacaaciiaadaappibaeaaaakaafaaaaadabaacoia
acaappiaacaablkaafaaaaadabaacoiaabaaoeiaaaaablkaaiaaaaadaaaadcia
acaaoeiaaeaablkaafaaaaadaaaacciaaaaaffiaaaaaffiaaeaaaaaeaaaacbia
acaappkaaaaaaaiaaaaaffiaacaaaaadaaaaaciaaaaaaaiaaeaaaakbacaaaaad
aaaaabiaaaaaaaibaeaaaakaaiaaaaadaaaaceiaadaaoelaadaaoelaahaaaaac
aaaaceiaaaaakkiaafaaaaadaaaaceiaaaaakkiaadaakklacdaaaaacacaacbia
aaaakkiaafaaaaadaaaacbiaaaaaaaiaacaaaaiafiaaaaaeaaaacbiaaaaaffia
afaaffkaaaaaaaiaalaaaaadacaacbiaaaaakkiaaaaaaaiaafaaaaadaaaacbia
aaaappiaabaaaaiafiaaaaaeaaaacbiaaeaakklbafaaffkaaaaaaaiaafaaaaad
aaaacbiaaaaaaaiaacaaaaiaacaaaaadaaaacbiaaaaaaaiaaaaaaaiaafaaaaad
aaaachiaaaaaaaiaabaabliaabaaaaacaaaaaiiaafaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcaiagaaaaeaaaaaaaicabaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaa
dgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
dkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaackbabaaa
adaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaia
mbaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
ajaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaa
ajaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaa
aaaaaaaaahaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
bacaaaakbcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpbaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackbabaaaaeaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaiaibaaaaaaabaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
abaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaabaaaaaadkaabaaa
abaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaacaaaaaafgafbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaacaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.w, fragment.texcoord[4], texture[2], CUBE;
MOV R1.y, fragment.texcoord[1].z;
MOV R1.z, fragment.texcoord[2];
MOV R1.x, fragment.texcoord[0].z;
MOV R0.x, fragment.texcoord[0].w;
MOV R0.z, fragment.texcoord[2].w;
MOV R0.y, fragment.texcoord[1].w;
DP3 R0.w, R1, R0;
MUL R2.xyz, R1, R0.w;
MAD R0.xyz, -R2, c[6].y, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R1.x, R2, R1;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
ABS R1.x, R1;
ADD R1.x, -R1, c[6].z;
POW R1.y, R1.x, c[5].x;
MOV R1.z, c[3].x;
MAD R1.x, R1.y, c[4], R1.z;
MOV result.color.w, c[6].x;
TEX R0.xyz, R2, texture[0], CUBE;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.xyz, R0, R1.x;
DP3_SAT R0.y, R0, c[7];
MOV R0.x, c[6].z;
MAD R0.x, -R1.y, c[1], R0;
MUL R0.y, R0, R0;
MAD R0.y, R0.x, c[2].w, R0;
MIN R0.y, R0, c[6].z;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
ADD R0.z, -R0.y, c[6];
MUL R0.x, R0, fragment.texcoord[3].z;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV_SAT R1.x, R1;
ADD R0.z, -R1.x, c[6];
MAX R1.x, R0, R0.y;
MUL R0.xyz, R0.z, c[2];
MUL R2.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].y;
END
# 45 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xyz
mov_pp r2.x, t0.z
mov_pp r2.y, t1.z
mov_pp r2.z, t2
mov r1.x, t0.w
mov r1.z, t2.w
mov r1.y, t1.w
dp3 r0.x, r2, r1
mul r0.xyz, r2, r0.x
mad r3.xyz, -r0, c6.x, r1
dp3 r0.x, r3, r3
rsq r1.x, r0.x
mul r3.xyz, r1.x, r3
dp3 r0.x, t4, t4
mov r0.xy, r0.x
texld r4, r0, s1
texld r0, t4, s2
texld r1, r3, s0
dp3_pp r0.x, r3, r2
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r2.w, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r2.w, c4, r0
mov_pp r0.y, c6
mul_pp r1.xyz, r1, r0.x
dp3_pp_sat r1.x, r1, c7
mad_pp r2.x, -r2.w, c1, r0.y
mul_pp r1.x, r1, r1
mad_pp r1.x, r2, c2.w, r1
dp3_pp r2.x, t3, t3
rsq_pp r2.x, r2.x
mul_pp r0.z, r2.x, t3
min_pp r1.x, r1, c6.y
abs_pp r2.x, r0.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
mov_pp_sat r0.x, r0
add_pp r2.x, -r0, c6.y
max_pp r0.x, r0.z, r1
mul_pp r2.xyz, r2.x, c2
mul r1.x, r4, r0.w
mul_pp r2.xyz, r2, c0
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c6.x
mov_pp r0.w, c6.z
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgghnkckidckohjbmffdolinjnbljcchiabaaaaaajaagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefchaafaaaa
eaaaaaaafmabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaaf
bcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaa
abaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaa
dgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
aaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaa
dkiacaaaaaaaaaaaaiaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaaddaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaibcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpbaaaaaahbcaabaaa
abaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackbabaaa
aeaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaiaibaaaaaa
abaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedemcllppdodabchfakjfakiejbikcffcjabaaaaaabiakaaaaaeaaaaaa
daaaaaaaleadaaaacmajaaaaoeajaaaaebgpgodjhmadaaaahmadaaaaaaacpppp
deadaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaaaaaaaaaa
aaacppppfbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdofbaaaaaf
afaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaabaaaaacaaaaabiaaaaappla
abaaaaacaaaaaciaabaapplaabaaaaacaaaaaeiaacaapplaabaaaaacabaacbia
aaaakklaabaaaaacabaacciaabaakklaabaaaaacabaaceiaacaakklaaiaaaaad
aaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
aaaaahiaabaaoeiaaaaappibaaaaoeiaceaaaaacacaachiaaaaaoeiaaiaaaaad
acaaciiaacaaoeiaabaaoeiaaiaaaaadaaaaadiaaeaaoelaaeaaoelaecaaaaad
abaacpiaacaaoeiaacaioekaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
adaaapiaaeaaoelaaaaioekacdaaaaacabaaciiaacaappiaacaaaaadabaaciia
abaappibaeaaaakacaaaaaadaaaacciaabaappiaadaakkkaaeaaaaaeabaaciia
aaaaffiaadaaffkaadaaaakaabaaaaacacaaabiaaeaaaakaaeaaaaaeaaaaccia
aaaaffiaabaaaakbacaaaaiaafaaaaadabaachiaabaappiaabaaoeiaabaaaaac
abaadiiaabaappiaacaaaaadabaaciiaabaappibaeaaaakaafaaaaadacaachia
abaappiaacaaoekaafaaaaadacaachiaacaaoeiaaaaaoekaaiaaaaadacaadiia
abaaoeiaaeaablkaafaaaaadacaaciiaacaappiaacaappiaaeaaaaaeacaaciia
acaappkaaaaaffiaacaappiaacaaaaadaaaaaciaacaappiaaeaaaakbacaaaaad
acaaaiiaacaappibaeaaaakaaiaaaaadaaaaceiaadaaoelaadaaoelaahaaaaac
aaaaceiaaaaakkiaafaaaaadaaaaceiaaaaakkiaadaakklacdaaaaacaaaaciia
aaaakkiaafaaaaadaaaaciiaacaappiaaaaappiafiaaaaaeacaaciiaaaaaffia
afaaaakaaaaappiaalaaaaadabaacbiaaaaakkiaacaappiaafaaaaadacaaciia
aaaaaaiaadaappiaafaaaaadacaaciiaabaaaaiaacaappiaacaaaaadacaaciia
acaappiaacaappiaafaaaaadaaaachiaacaappiaacaaoeiaabaaaaacaaaaciia
afaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefchaafaaaaeaaaaaaa
fmabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadmcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadgaaaaafbcaabaaa
aaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaa
dgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaa
ckbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaaf
ecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaai
bcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaa
aaaaaaaaaiaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaaddaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaibcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpbaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackbabaaaaeaaaaaa
diaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaiaibaaaaaaabaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaagaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaaapaaaaah
bcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.y, fragment.texcoord[1].z;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R1.x, fragment.texcoord[0].w;
MOV R1.z, fragment.texcoord[2].w;
MOV R1.y, fragment.texcoord[1].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].y, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
DP3 R0.x, R2, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].z;
POW R0.y, R0.x, c[5].x;
MOV R0.z, c[3].x;
MAD R0.x, R0.y, c[4], R0.z;
MOV R0.z, c[6];
MAD R0.y, -R0, c[1].x, R0.z;
MOV result.color.w, c[6].x;
TEX R1.xyz, R2, texture[0], CUBE;
TEX R0.w, fragment.texcoord[4], texture[1], 2D;
MUL R1.xyz, R1, R0.x;
DP3_SAT R1.x, R1, c[7];
MUL R1.x, R1, R1;
MAD R0.y, R0, c[2].w, R1.x;
MOV_SAT R0.x, R0;
ADD R0.z, -R0.x, c[6];
MUL R1.xyz, R0.z, c[2];
MIN R0.y, R0, c[6].z;
ADD R0.y, -R0, c[6].z;
ABS R0.x, fragment.texcoord[3].z;
MUL R0.x, R0, R0.y;
MAX R0.x, fragment.texcoord[3].z, R0;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].y;
END
# 39 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_EdgeAlpha]
Vector 2 [_Color]
Float 3 [_Reflection]
Float 4 [_FrezPow]
Float 5 [_FrezFalloff]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c6, 2.00000000, 1.00000000, 0.00000000, 0
def c7, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0.xyzw
dcl t1.xyzw
dcl t2.xyzw
dcl t3.xyz
dcl t4.xy
mov_pp r1.x, t0.z
mov_pp r1.y, t1.z
mov_pp r1.z, t2
mov r2.x, t0.w
mov r2.z, t2.w
mov r2.y, t1.w
dp3 r0.x, r1, r2
mul r0.xyz, r1, r0.x
mad r2.xyz, -r0, c6.x, r2
dp3 r0.x, r2, r2
rsq r0.x, r0.x
mul r3.xyz, r0.x, r2
texld r0, t4, s1
texld r2, r3, s0
dp3_pp r0.x, r3, r1
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r1.w, r0.x, c5.x
mov_pp r0.x, c3
mad_pp r0.x, r1.w, c4, r0
mov_pp r0.y, c6
mul_pp r2.xyz, r2, r0.x
dp3_pp_sat r2.x, r2, c7
mad_pp r1.x, -r1.w, c1, r0.y
mul_pp r2.x, r2, r2
mad_pp r1.x, r1, c2.w, r2
min_pp r1.x, r1, c6.y
mov_pp_sat r0.x, r0
abs_pp r2.x, t3.z
add_pp r1.x, -r1, c6.y
mul_pp r1.x, r2, r1
add_pp r2.x, -r0, c6.y
max_pp r0.x, t3.z, r1
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r2.x, c2
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.x
mov_pp r0.w, c6.z
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedokfamknolgppmenlkhkoplnfioflajhiabaaaaaammafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaeaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckmaeaaaa
eaaaaaaaclabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
mcbabaaaacaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadecbabaaaaeaaaaaa
gcbaaaaddcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
dgaaaaafbcaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
bcaabaaaabaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaabaaaaaackbabaaa
acaaaaaadgaaaaafecaabaaaabaaaaaackbabaaaadaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegacbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaaaaaaaaibcaabaaaaaaaaaaadkaabaiambaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaaaaaaaaaajaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalbcaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaa
dgcaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabacaaaakbcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaadkiacaaaaaaaaaaaaiaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
ddaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaiaibaaaaaaaeaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaafaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_EdgeAlpha]
Vector 128 [_Color]
Float 144 [_Reflection]
Float 148 [_FrezPow]
Float 152 [_FrezFalloff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedafhpbafighnjdpijoemdikfjdjeaakghabaaaaaaoiaiaaaaaeaaaaaa
daaaaaaaeiadaaaapmahaaaaleaiaaaaebgpgodjbaadaaaabaadaaaaaaacpppp
mmacaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaaaaaaaaaaaaacpppp
fbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdofbaaaaafafaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaji
abaiapkaabaaaaacaaaaabiaaaaapplaabaaaaacaaaaaciaabaapplaabaaaaac
aaaaaeiaacaapplaabaaaaacabaacbiaaaaakklaabaaaaacabaacciaabaakkla
abaaaaacabaaceiaacaakklaaiaaaaadaaaaaiiaaaaaoeiaabaaoeiaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappibaaaaoeia
ceaaaaacacaachiaaaaaoeiaaiaaaaadacaaciiaacaaoeiaabaaoeiaecaaaaad
aaaacpiaacaaoeiaabaioekaecaaaaadabaacpiaaeaaoelaaaaioekacdaaaaac
aaaaciiaacaappiaacaaaaadaaaaciiaaaaappibaeaaaakacaaaaaadabaacbia
aaaappiaadaakkkaaeaaaaaeaaaaciiaabaaaaiaadaaffkaadaaaakaabaaaaac
acaaabiaaeaaaakaaeaaaaaeabaacbiaabaaaaiaabaaaakbacaaaaiaafaaaaad
aaaachiaaaaappiaaaaaoeiaabaaaaacaaaadiiaaaaappiaacaaaaadaaaaciia
aaaappibaeaaaakaafaaaaadacaachiaaaaappiaacaaoekaafaaaaadacaachia
acaaoeiaaaaaoekaaiaaaaadacaadiiaaaaaoeiaaeaablkaafaaaaadacaaciia
acaappiaacaappiaaeaaaaaeacaaciiaacaappkaabaaaaiaacaappiaacaaaaad
aaaaabiaacaappibaeaaaakaacaaaaadacaaaiiaacaappiaaeaaaakbcdaaaaac
aaaacciaadaakklaafaaaaadaaaacbiaaaaaaaiaaaaaffiafiaaaaaeacaaciia
acaappiaafaaaakaaaaaaaiaalaaaaadaaaacbiaadaakklaacaappiaafaaaaad
acaaciiaabaappiaaaaaaaiaacaaaaadacaaciiaacaappiaacaappiaafaaaaad
aaaachiaacaappiaacaaoeiaabaaaaacaaaaciiaafaaaakaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefckmaeaaaaeaaaaaaaclabaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaadecbabaaaaeaaaaaagcbaaaaddcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaadgaaaaafbcaabaaaaaaaaaaadkbabaaa
abaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaadkbabaaaadaaaaaadgaaaaafbcaabaaaabaaaaaackbabaaaabaaaaaa
dgaaaaafccaabaaaabaaaaaackbabaaaacaaaaaadgaaaaafecaabaaaabaaaaaa
ckbabaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaa
dkaabaiambaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
aaaaaaaaajaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
ccaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaakiacaaa
aaaaaaaaajaaaaaadcaaaaalbcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaadgcaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaaaaaaaaaaagijcaaaaaaaaaaa
aiaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaabacaaaakbcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckbabaiaibaaaaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckbabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaafaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaa
pgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaeaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaadadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}