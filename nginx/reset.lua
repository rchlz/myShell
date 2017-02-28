function delete(key)
        local res= ngx.location.capture("/c/delete",{args = { key = key } })
        if res.status == 200 then
                return 0;
        else
                return -1;
        end
end
uid=tonumber(ngx.var.arg_uid);
local result="{";
if uid==nil then
        result=result.."code:-1}"
else
        result=result..'\"code\":0,';
        result=result..'\"feed\":'..delete("1_uf_count_"..uid)..",";
	result=result..'\"sys\":'..delete("7_unread_sys_count_"..uid)..",";
	result=result..'\"like\":'..delete("7_unread_like_count_"..uid)..",";
	result=result..'\"inbox\":'..delete("7_unread_letter_count_"..uid)..",";
	result=result..'\"comment\":'..delete("7_unread_comment_count_"..uid);
        result=result.."}";
end
callback=ngx.var.arg_callback;
if callback~=nil then
	result=callback.."("..result..")";
end
ngx.print(result);
