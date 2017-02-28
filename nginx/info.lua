function getCount(key)
        local res= ngx.location.capture("/c/get",{args = { key = key } })
        if res.status == 200 then
                local result=string.gsub(res.body,"$[-]?%d+","")
                local count= tonumber(result)
                if count==nil then
                        return 0;
                else
                        return count;
                end
        else
                return "b"
        end
end
uid=tonumber(ngx.var.arg_uid);
local result="{";
if uid==nil then
        result=result.."code:-1}"
else
        result=result..'\"code\":0,';
        result=result..'\"feed\":'..getCount("1_uf_count_"..uid)..",";
	result=result..'\"sys\":'..getCount("7_unread_sys_count_"..uid)..",";
	result=result..'\"like\":'..getCount("7_unread_like_count_"..uid)..",";
	result=result..'\"inbox\":'..getCount("7_unread_inbox_count_"..uid)..",";
	result=result..'\"comment\":'..getCount("7_unread_comment_count_"..uid);
        result=result.."}";
end
callback=ngx.var.arg_callback;
if callback~=nil then
	result=callback.."("..result..")";
end
ngx.print(result);
