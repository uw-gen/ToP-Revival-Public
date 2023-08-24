
/*//\\//\\//\\//\\//\\//\\//\\//\\////\\//\\//\\//\\//\\//\\//\\//\\////\\//\\//\\//\\
  CaLua Script Binding Utility
  By Justin Reynen, 2003

  Main File

  The only reason you'd need to touch this header, is if you've changed the structure
  member alignment of your compiler.

  There's no significance to the fact that I used __cdecl as the function type passed
  to CLU_RegisterFunction, it could just as easily have been __stdcall.
  
//\\//\\//\\//\\//\\//\\//\\//\\////\\//\\//\\//\\//\\//\\//\\//\\////\\//\\//\\//\\*/


#ifndef __CALUA_MAIN_H
#define __CALUA_MAIN_H

#ifdef __cplusplus
extern "C"{
#endif

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#define __STRUCTURE_MEMBER_ALIGNMENT 8

#define CLU_CAST(x) (void (__cdecl *)(void))(x)

#define CLU_CDECL		0
#define CLU_STDCALL		1


__declspec(dllexport) int			CLU_Init();
__declspec(dllexport) int			CLU_Shutdown();
__declspec(dllexport) int			CLU_ShutdownState(int state);
__declspec(dllexport) int			CLU_LoadState(int state);
__declspec(dllexport) int			CLU_LoadScript(char* filename);
__declspec(dllexport) int			CLU_RegisterStructure(char* name, char* desc);
__declspec(dllexport) int			CLU_RegisterFunction(char* name, char* ret, char* args, int convention, void (__cdecl *func)(void));

__declspec(dllexport) void*		CLU_CallScriptFunction(char* funcName, char* retArgs, char* args, ...);

__declspec(dllexport) void		CLU_DllFree(void* memptr);

__declspec(dllexport) lua_State*  CLU_GetVirtualMachine();
__declspec(dllexport) int			CLU_GetCurrentState();

#ifdef __cplusplus
}
#endif

#endif