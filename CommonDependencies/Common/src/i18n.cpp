#include ".\i18n.h"
#include <string>

using std::string;

const char* ConvertResString(const char* str)
{
	string key(str);

	if( '#' == *key.begin() && '#' == *key.rbegin())
	{
		string temp = key.substr(1, key.size() - 2);
		return g_ResourceBundleManage.LoadResString(temp.c_str());
	}

	return str;
}
