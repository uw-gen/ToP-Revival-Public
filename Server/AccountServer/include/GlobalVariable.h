#pragma once

#ifndef _GLOBALVARIABLE_H_
#define _GLOBALVARIABLE_H_


//#include "BillThread.h"

#include "tlsindex.h"
#include "TomService.h"
#include "BillService.h"
#include "databasectrl.h"

#include "i18n.h"							//Add by lark.li 20080307

// Add by lark.li 20080730 begin
#include "pi_Alloc.h"
#include "pi_Memory.h"
// End

//#define _RELOGIN_MODE_					//新的倒计时重复登陆模式

inline std::string g_strCfgFile = "AccountServer.cfg";

inline CBillService	g_BillService;
inline CTomService		g_TomService;
inline dbc::TLSIndex	g_TlsIndex;
inline CDataBaseCtrl	g_MainDBHandle;
inline DWORD			g_MainThreadID;
inline HWND			g_hMainWnd = NULL;
//extern BillThread g_BillThread;

#define WM_USER_LOG		WM_USER+100
#define WM_USER_LOG_MAP	WM_USER+101


struct sUserLog
{
	bool bLogin;		//true:login  false:logout
	int nUserID;
	std::string strUserName;
	std::string strPassport;
	std::string strLoginIP;
};



#endif