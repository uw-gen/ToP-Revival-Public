--for i=1,2,1 do
--GP_DBCONNECT_CPP_00003 = GetResString("GP_DBCONNECT_CPP_00003")
--LG("Test", "GP_DBCONNECT_CPP_00003",GP_DBCONNECT_CPP_00003..i)
--end

function GetOnlineCount( year , month , day , dayofweek , timehour , timemin , loginnumber, playnumber )

	local a = loginnumber
	local b = playnumber

	LG("test" , a , b )

	return 1 , a , b

end

