------------------------------------------------
-- This Source Was Developed By (marlow) @PPFFP.--
--   This Is The Source Channel @PPFFP .   --
--           - ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  -                 --
--        -- https://t.me/PPFFP --         --
------------------------------------------------ 
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack() end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username) end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again') end 
os.execute('lua Smile.lua') end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n') end 
os.execute('lua Smile.lua') end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n') end 
os.execute('lua Smile.lua') end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local TheSmile = io.open("TheSmile", 'w')
TheSmile:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 Smile.lua
done
]])
TheSmile:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ -X kill
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ ./TheSmile
done
]])
Run:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x TheSmile;chmod +x Run;./Run') end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
TheSmile = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheSmile)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=TheSmile,token=Token}
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot'  end end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={Sudo_Id,996435622}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true end end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersAS = Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
if UserId == 996435622 then Status = true elseif UserId == 996435622 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == TheSmile then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true else Status = false end return Status end
function Controller(ChatId,UserId) Status = 0
Developers = Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId) 
DevelopersAS = Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(TheSmile.."Smile:TheBasics:Group"..ChatId,UserId)
TheBasicsQ = Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..ChatId,UserId) 
TheBas = Redis:sismember(TheSmile.."Smile:TheBas:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSmile.."Smile:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSmile.."Smile:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSmile.."Smile:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSmile.."Smile:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(TheSmile.."Smile:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 996435622 then Status = 'مبرمج السورس' elseif UserId == 996435622 then Status = 'مبرمج السورس' elseif UserId == Sudo_Id then Status = 'المطور الاساسي' elseif UserId == TheSmile then Status = 'البوت' elseif DevelopersAS then Status = 'المطور الاساسي' elseif DevelopersQ then Status = 'المطور الاساسي²' elseif Developers then Status = Redis:get(TheSmile.."Smile:Developer:Bot:Reply"..ChatId) or 'المطور' elseif TheBas then Status = Redis:get(TheSmile.."Smile:TheBas:Group:Reply"..ChatId) or 'المالك' elseif TheBasicsQ then Status = Redis:get(TheSmile.."Smile:PresidentQ:Group:Reply"..ChatId) or 'المالك' elseif TheBasics then Status = Redis:get(TheSmile.."Smile:President:Group:Reply"..ChatId) or 'المنشئ الاساسي' elseif Originators then Status = Redis:get(TheSmile.."Smile:Constructor:Group:Reply"..ChatId) or 'المنشئ' elseif Managers then Status = Redis:get(TheSmile.."Smile:Manager:Group:Reply"..ChatId) or 'المدير' elseif Addictive then Status = Redis:get(TheSmile.."Smile:Admin:Group:Reply"..ChatId) or 'الادمن' elseif StatusMember == "chatMemberStatusCreator" then Status = 'مالك المجموعة' elseif StatusMember == "chatMemberStatusAdministrator" then Status = 'ادمن المجموعة' elseif Distinguished then Status = Redis:get(TheSmile.."Smile:Vip:Group:Reply"..ChatId) or 'المميز' elseif Cleaner then Status = Redis:get(TheSmile.."Smile:Cle:Group:Reply"..ChatId) or 'المنظف' else Status = Redis:get(TheSmile.."Smile:Mempar:Group:Reply"..ChatId) or 'العضو' end return Status end 
function Controller_Num(Num) Status = 0 if tonumber(Num) == 1 then Status = 'المطور الاساسي' elseif tonumber(Num) == 100 then Status = 'المطور الاساسي' elseif tonumber(Num) == 2 then Status = 'المطور الاساسي²' elseif tonumber(Num) == 3 then Status = 'المطور' elseif tonumber(Num) == 99 then Status = 'المالك' elseif tonumber(Num) == 44 then Status = 'المالك' elseif tonumber(Num) == 4 then Status = 'المنشئ الاساسي' elseif tonumber(Num) == 5 then Status = 'المنشئ' elseif tonumber(Num) == 6 then Status = 'المدير' elseif tonumber(Num) == 7 then Status = 'الادمن' elseif tonumber(Num) == 88 then Status = 'المنظف' else Status = 'المميز' end return Status end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›' end
if GetMemberStatus.can_delete_messages then delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›' end
if GetMemberStatus.can_invite_users then invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›' end
if GetMemberStatus.can_pin_messages then pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›' end
if GetMemberStatus.can_restrict_members then restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›' end
if GetMemberStatus.can_promote_members then promote = '‹ ✓ ›' else promote = '‹ ✗ ›' end
local reply_markupp = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تغيير معلومات المجموعة : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2},},{{text = 'تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2},},{{text = 'حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2},},{{text = 'دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2},},{{text = 'حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2},},{{text = 'اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2},},}}
LuaTele.editMessageText(ChatId,MsgId,"𖡦: صلاحيات الادمن حالياًً ↫ ⤈", 'md', false, false, reply_markupp) end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then change_info = 1 else change_info = 0 end
if GetMemberStatus.can_delete_messages then delete_messages = 1 else delete_messages = 0 end
if GetMemberStatus.can_invite_users then invite_users = 1 else invite_users = 0 end
if GetMemberStatus.can_pin_messages then pin_messages = 1 else pin_messages = 0 end
if GetMemberStatus.can_restrict_members then restrict_members = 1 else restrict_members = 0 end
if GetMemberStatus.can_promote_members then promote = 1 else promote = 0 end
return{ promote = promote, restrict_members = restrict_members, invite_users = invite_users, pin_messages = pin_messages, delete_messages = delete_messages, change_info = change_info } end
function GetSetieng(ChatId)
if Redis:get(TheSmile.."Smile:lockpin"..ChatId) then lock_pin = "✓" else lock_pin = "✗" end
if Redis:get(TheSmile.."Smile:Lock:tagservr"..ChatId) then lock_tagservr = "✓" else lock_tagservr = "✗" end
if Redis:get(TheSmile.."Smile:Lock:text"..ChatId) then lock_text = "✓" else lock_text = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:AddMempar"..ChatId) == "kick" then lock_add = "✓" else lock_add = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Join"..ChatId) == "kick" then lock_join = "✓" else lock_join = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:edit"..ChatId) then lock_edit = "✓" else lock_edit = "✗ " end
if Redis:get(TheSmile.."Smile:Chek:Welcome"..ChatId) then welcome = "✓" else welcome = "✗ " end
if Redis:hget(TheSmile.."Smile:Spam:Group:User"..ChatId, "Spam:User") == "kick" then flood = "بالطرد "     
elseif Redis:hget(TheSmile.."Smile:Spam:Group:User"..ChatId,"Spam:User") == "keed" then flood = "بالتقيد "     
elseif Redis:hget(TheSmile.."Smile:Spam:Group:User"..ChatId,"Spam:User") == "mute" then flood = "بالكتم "           
elseif Redis:hget(TheSmile.."Smile:Spam:Group:User"..ChatId,"Spam:User") == "del" then flood = "✓" else flood = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Photo"..ChatId) == "del" then lock_photo = "✓" 
elseif Redis:get(TheSmile.."Smile:Lock:Photo"..ChatId) == "ked" then lock_photo = "بالتقيد "   
elseif Redis:get(TheSmile.."Smile:Lock:Photo"..ChatId) == "ktm" then lock_photo = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Photo"..ChatId) == "kick" then lock_photo = "بالطرد " else lock_photo = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Contact"..ChatId) == "del" then lock_phon = "✓" 
elseif Redis:get(TheSmile.."Smile:Lock:Contact"..ChatId) == "ked" then lock_phon = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Contact"..ChatId) == "ktm" then lock_phon = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Contact"..ChatId) == "kick" then lock_phon = "بالطرد " else lock_phon = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Link"..ChatId) == "del" then lock_links = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Link"..ChatId) == "ked" then lock_links = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Link"..ChatId) == "ktm" then lock_links = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Link"..ChatId) == "kick" then lock_links = "بالطرد " else lock_links = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Cmd"..ChatId) == "del" then lock_cmds = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Cmd"..ChatId) == "ked" then lock_cmds = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Cmd"..ChatId) == "ktm" then lock_cmds = "بالكتم "   
elseif Redis:get(TheSmile.."Smile:Lock:Cmd"..ChatId) == "kick" then lock_cmds = "بالطرد " else lock_cmds = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:User:Name"..ChatId) == "del" then lock_user = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:User:Name"..ChatId) == "ked" then lock_user = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:User:Name"..ChatId) == "ktm" then lock_user = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:User:Name"..ChatId) == "kick" then lock_user = "بالطرد " else lock_user = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:hashtak"..ChatId) == "del" then lock_hash = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:hashtak"..ChatId) == "ked" then lock_hash = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:hashtak"..ChatId) == "ktm" then lock_hash = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:hashtak"..ChatId) == "kick" then lock_hash = "بالطرد " else lock_hash = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "del" then lock_muse = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "ked" then lock_muse = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "ktm" then lock_muse = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "kick" then lock_muse = "بالطرد " else lock_muse = "✗ " end 
if Redis:get(TheSmile.."Smile:Lock:Video"..ChatId) == "del" then lock_ved = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Video"..ChatId) == "ked" then lock_ved = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Video"..ChatId) == "ktm" then lock_ved = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Video"..ChatId) == "kick" then lock_ved = "بالطرد " else lock_ved = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Animation"..ChatId) == "del" then lock_gif = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Animation"..ChatId) == "ked" then lock_gif = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Animation"..ChatId) == "ktm" then lock_gif = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Animation"..ChatId) == "kick" then lock_gif = "بالطرد " else lock_gif = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Sticker"..ChatId) == "del" then lock_ste = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Sticker"..ChatId) == "ked" then lock_ste = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Sticker"..ChatId) == "ktm" then lock_ste = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Sticker"..ChatId) == "kick" then lock_ste = "بالطرد " else lock_ste = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:geam"..ChatId) == "del" then lock_geam = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:geam"..ChatId) == "ked" then lock_geam = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:geam"..ChatId) == "ktm" then lock_geam = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:geam"..ChatId) == "kick" then lock_geam = "بالطرد " else lock_geam = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "del" then lock_vico = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "ked" then lock_vico = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "ktm" then lock_vico = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:vico"..ChatId) == "kick" then lock_vico = "بالطرد " else lock_vico = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Keyboard"..ChatId) == "del" then lock_inlin = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Keyboard"..ChatId) == "ked" then lock_inlin = "بالتقيد "
elseif Redis:get(TheSmile.."Smile:Lock:Keyboard"..ChatId) == "ktm" then lock_inlin = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Keyboard"..ChatId) == "kick" then lock_inlin = "بالطرد " else lock_inlin = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:forward"..ChatId) == "del" then lock_fwd = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:forward"..ChatId) == "ked" then lock_fwd = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:forward"..ChatId) == "ktm" then lock_fwd = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:forward"..ChatId) == "kick" then lock_fwd = "بالطرد " else lock_fwd = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Document"..ChatId) == "del" then lock_file = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Document"..ChatId) == "ked" then lock_file = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Document"..ChatId) == "ktm" then lock_file = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Document"..ChatId) == "kick" then lock_file = "بالطرد " else lock_file = "✗ " end    
if Redis:get(TheSmile.."Smile:Lock:Unsupported"..ChatId) == "del" then lock_self = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Unsupported"..ChatId) == "ked" then lock_self = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Unsupported"..ChatId) == "ktm" then lock_self = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Unsupported"..ChatId) == "kick" then lock_self = "بالطرد " else lock_self = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Bot:kick"..ChatId) == "del" then lock_bots = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Bot:kick"..ChatId) == "ked" then lock_bots = "بالتقيد "   
elseif Redis:get(TheSmile.."Smile:Lock:Bot:kick"..ChatId) == "kick" then lock_bots = "بالطرد " else lock_bots = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Markdaun"..ChatId) == "del" then lock_mark = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Markdaun"..ChatId) == "ked" then lock_mark = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Markdaun"..ChatId) == "ktm" then lock_mark = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Markdaun"..ChatId) == "kick" then lock_mark = "بالطرد " else lock_mark = "✗ " end
if Redis:get(TheSmile.."Smile:Lock:Spam"..ChatId) == "del" then lock_spam = "✓"
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..ChatId) == "ked" then lock_spam = "بالتقيد "    
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..ChatId) == "ktm" then lock_spam = "بالكتم "    
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..ChatId) == "kick" then lock_spam = "بالطرد " else lock_spam = "✗ " end        
return{ lock_pin = lock_pin, lock_tagservr = lock_tagservr, lock_text = lock_text, lock_add = lock_add, lock_join = lock_join, lock_edit = lock_edit, flood = flood, lock_photo = lock_photo, lock_phon = lock_phon, lock_links = lock_links, lock_cmds = lock_cmds, lock_mark = lock_mark, lock_user = lock_user, lock_hash = lock_hash, lock_muse = lock_muse, lock_ved = lock_ved, lock_gif = lock_gif, lock_ste = lock_ste, lock_geam = lock_geam, lock_vico = lock_vico, lock_inlin = lock_inlin, lock_fwd = lock_fwd, lock_file = lock_file, lock_self = lock_self, lock_bots = lock_bots, lock_spam = lock_spam } end
function Total_message(Message) local MsgText = ''  
if tonumber(Message) < 100 then MsgText = 'جدا ضعيف' elseif tonumber(Message) < 200 then MsgText = 'ضعيف' elseif tonumber(Message) < 400 then MsgText = 'غير متفاعل' elseif tonumber(Message) < 700 then MsgText = 'متوسط' elseif tonumber(Message) < 1200 then MsgText = 'قمة التفاعل' elseif tonumber(Message) < 2000 then MsgText = 'ملك التفاعل' elseif tonumber(Message) < 3500 then MsgText = 'اسطورة التفاعل' elseif tonumber(Message) < 4000 then MsgText = 'عوف لجواهر' elseif tonumber(Message) < 4500 then MsgText = 'متفاعل نار' elseif tonumber(Message) < 5500 then MsgText = 'يجدح جدح' elseif tonumber(Message) < 7000 then MsgText = 'خيالي' elseif tonumber(Message) < 9500 then MsgText = 'كافر بالتفاعل' elseif tonumber(Message) < 10000000000 then MsgText = 'معلك لربك' end return MsgText end
function Getpermissions(ChatId) local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then web = true else web = false end
if Get_Chat.permissions.can_change_info then info = true else info = false end
if Get_Chat.permissions.can_invite_users then invite = true else invite = false end
if Get_Chat.permissions.can_pin_messages then pin = true else pin = false end
if Get_Chat.permissions.can_send_media_messages then media = true else media = false end
if Get_Chat.permissions.can_send_messages then messges = true else messges = false end
if Get_Chat.permissions.can_send_other_messages then other = true else other = false end
if Get_Chat.permissions.can_send_polls then polls = true else polls = false end
return{ web = web, info = info, invite = invite, pin = pin, media = media, messges = messges, other = other, polls = polls } end
function Get_permissions(ChatId,UserId,MsgId) local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then web = '‹ ✓ ›' else web = '‹ ✗ ›' end
if Get_Chat.permissions.can_change_info then info = '‹ ✓ ›' else info = '‹ ✗ ›' end
if Get_Chat.permissions.can_invite_users then invite = '‹ ✓ ›' else invite = '‹ ✗ ›' end
if Get_Chat.permissions.can_pin_messages then pin = '‹ ✓ ›' else pin = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_media_messages then media = '‹ ✓ ›' else media = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_messages then messges = '‹ ✓ ›' else messges = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_other_messages then other = '‹ ✓ ›' else other = '‹ ✗ ›' end
if Get_Chat.permissions.can_send_polls then polls = '‹ ✓ ›' else polls = '‹ ✗ ›' end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ' ارسال الويب : '..web, data = UserId..'/web'},},{{text = ' تغيير معلومات المجموعة : '..info, data = UserId.. '/info'},},{{text = ' اضافه مستخدمين : '..invite, data = UserId.. '/invite'},},{{text = ' تثبيت الرسائل : '..pin, data = UserId.. '/pin'},},{{text = ' ارسال الميديا : '..media, data = UserId.. '/media'},},{{text = ' ارسال الرسائل : '..messges, data = UserId.. '/messges'},},{{text = ' اضافه البوتات : '..other, data = UserId.. '/other'},},{{text = ' ارسال استفتاء : '..polls, data = UserId.. '/polls'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr'}},}}
LuaTele.editMessageText(ChatId,MsgId,"𖡦: صلاحيات المجموعة ↫ ⤈ ", 'md', false, false, reply_markup) end
function Statusrestricted(ChatId,UserId)
return{ BanAll = Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId) , ktmAll = Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId) , BanGroup = Redis:sismember(TheSmile.."Smile:BanGroup:Group"..ChatId,UserId) , SilentGroup = Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..ChatId,UserId) } end
function Reply_Status(UserId,TextMsg) local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do UserInfo.first_name = Name_User break end
if UserInfo.username then UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')' else UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')' end
return { Lock = '*𖡦: بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..'*', unLock = '*𖡦: بواسطة ↫ *'..UserInfousername..'\n'..TextMsg, lockKtm = '*𖡦: بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالكتم *', lockKid = '*𖡦: بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالتقييد *', lockKick = '*𖡦: بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالطرد *', Reply = '*𖡦: العضو ↫ *'..UserInfousername..'\n*'..TextMsg..'*', Replymarlow = '𖡦: عزيزي ↫ '..UserInfousername..'\n'..TextMsg..'' } end
function StatusCanOrNotCan(ChatId,UserId) Status = nil
DevelopersAS = Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheSmile.."Smile:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSmile.."Smile:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSmile.."Smile:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSmile.."Smile:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSmile.."Smile:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(TheSmile.."Smile:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 996435622 then Status = true elseif UserId == 996435622 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == TheSmile then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true elseif Developers then Status = true elseif TheBasics then Status = true elseif Originators then Status = true elseif Managers then Status = true elseif Addictive then Status = true elseif StatusMember == "chatMemberStatusCreator" then Status = true elseif StatusMember == "chatMemberStatusAdministrator" then Status = true elseif Distinguished then Status = true elseif Cleaner then Status = true else Status = false end return Status end 
function StatusSilent(ChatId,UserId) Status = nil
DevelopersAS = Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
DevelopersQ = Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheSmile.."Smile:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSmile.."Smile:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSmile.."Smile:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSmile.."Smile:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSmile.."Smile:Distinguished:Group"..ChatId,UserId)
Cleaner = Redis:sismember(TheSmile.."Smile:Cleaner:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 996435622 then Status = true elseif UserId == 996435622 then Status = true elseif UserId == Sudo_Id then Status = true elseif UserId == TheSmile then Status = true elseif DevelopersAS then Status = true elseif DevelopersQ then Status = true elseif Developers then Status = true elseif TheBasics then Status = true elseif Originators then Status = true elseif Managers then Status = true elseif Addictive then Status = true elseif StatusMember == "chatMemberStatusCreator" then Status = true else Status = false end return Status end 
function GetInfoBot(msg) local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,TheSmile).status
if GetMemberStatus.can_change_info then change_info = true else change_info = false end
if GetMemberStatus.can_delete_messages then delete_messages = true else delete_messages = false end
if GetMemberStatus.can_invite_users then invite_users = true else invite_users = false end
if GetMemberStatus.can_pin_messages then pin_messages = true else pin_messages = false end
if GetMemberStatus.can_restrict_members then restrict_members = true else restrict_members = false end
if GetMemberStatus.can_promote_members then promote = true else promote = false end
return{ SetAdmin = promote, BanUser = restrict_members, Invite = invite_users, PinMsg = pin_messages, DelMsg = delete_messages, Info = change_info } end
function download(url,name)
if not name then name = url:match('([^/]+)$') end
if string.find(url,'https') then data,res = https.request(url)
elseif string.find(url,'http') then data,res = http.request(url) else
return 'The link format is incorrect.' end
if res ~= 200 then return 'check url , error code : '..res else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name end end
local function Info_Video(x)
local f=io.popen(x)
if f then local s=f:read"*a" f:close()
if s == 'a' then end return s end end
function ChannelJoin(msg) JoinChannel = true
local Channel = Redis:get(TheSmile..'Smile:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then JoinChannel = false end end return JoinChannel end
function File_Bot_Run(msg,data) local msg_chat_id = msg.chat_id local msg_reply_id = msg.reply_to_message_id local msg_user_send_id = msg.sender.user_id local msg_id = msg.id local text = nil
if msg.sender.luatele == "messageSenderChat" then LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) return false end
if msg.date and msg.date < tonumber(os.time() - 15) then print("->> Old Message End <<-") return false end
if data.content.text then text = data.content.text.text end
if tonumber(msg.sender.user_id) == tonumber(TheSmile) then print('This is reply for Bot') return false end
if Statusrestricted(msg.chat_id,msg.sender.user_id).BanAll == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).ktmAll == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).BanGroup == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).SilentGroup == true then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
if tonumber(msg.sender.user_id) == 996435622 then msg.Name_Controller = 'مبرمج السورس' msg.The_Controller = 1
elseif tonumber(msg.sender.user_id) == 996435622 then msg.Name_Controller = 'مبرمج السورس' msg.The_Controller = 1
elseif The_ControllerAll(msg.sender.user_id) == true then msg.The_Controller = 1 msg.Name_Controller = 'المطور الاساسي'
elseif Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",msg.sender.user_id) == true then msg.The_Controller = 100 msg.Name_Controller = 'المطور الاساسي'
elseif Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",msg.sender.user_id) == true then msg.The_Controller = 2 msg.Name_Controller = 'المطور الاساسي²'
elseif Redis:sismember(TheSmile.."Smile:Developers:Groups",msg.sender.user_id) == true then msg.The_Controller = 3 msg.Name_Controller = Redis:get(TheSmile.."Smile:Developer:Bot:Reply"..msg.chat_id) or 'المطور'
elseif Redis:sismember(TheSmile.."Smile:TheBas:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 99 msg.Name_Controller = Redis:get(TheSmile.."Smile:TheBas:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 44 msg.Name_Controller = Redis:get(TheSmile.."Smile:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 4 msg.Name_Controller = Redis:get(TheSmile.."Smile:President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(TheSmile.."Smile:Originators:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 5 msg.Name_Controller = Redis:get(TheSmile.."Smile:Constructor:Group:Reply"..msg.chat_id) or 'المنشئ'
elseif Redis:sismember(TheSmile.."Smile:Managers:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 6 msg.Name_Controller = Redis:get(TheSmile.."Smile:Manager:Group:Reply"..msg.chat_id) or 'المدير'
elseif Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 7 msg.Name_Controller = Redis:get(TheSmile.."Smile:Admin:Group:Reply"..msg.chat_id) or 'الادمن'
elseif Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 8 msg.Name_Controller = Redis:get(TheSmile.."Smile:Vip:Group:Reply"..msg.chat_id) or 'المميز'
elseif Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg.chat_id,msg.sender.user_id) == true then msg.The_Controller = 88 msg.Name_Controller = Redis:get(TheSmile.."Smile:Cle:Group:Reply"..msg.chat_id) or 'المنظف'
elseif tonumber(msg.sender.user_id) == tonumber(TheSmile) then msg.The_Controller = 9 else msg.The_Controller = 10 msg.Name_Controller = Redis:get(TheSmile.."Smile:Mempar:Group:Reply"..msg.chat_id) or 'العضو' end  
if msg.The_Controller == 1 then msg.ControllerBot = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 then msg.DevelopersAS = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 then msg.DevelopersQ = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 then msg.Developers = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 9 then msg.TheBasicsm = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then msg.TheBasics = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then msg.Originators = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then msg.Managers = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then msg.Addictive = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 88 or msg.The_Controller == 9 then msg.Cleaner = true end
if msg.The_Controller == 1 or msg.The_Controller == 100 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 99 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then msg.Distinguished = true end
--
if text and (text:match("عيوره") or text:match("كس") or text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if Redis:get(TheSmile.."Smile:Lock:Fshar"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع الفشار في المجموعة").Replymarlow,"md",true)
return false end end
if text and (text:match("سني") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if Redis:get(TheSmile.."Smile:Lock:Taf"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع التكلم بالطائفيه هنا").Replymarlow,"md",true)
return false end end
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if Redis:get(TheSmile.."Smile:Lock:Kfr"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع الكفر في المجموعة").Replymarlow,"md",true)
return false end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if Redis:get(TheSmile.."Smile:Lock:Farsi"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع التكلم باللغه الفارسيه").Replymarlow,"md",true)
return false end end
if Redis:get(TheSmile.."Smile:Lock:text"..msg_chat_id) and not msg.Addictive then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSmile.."Smile:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Welcome = Redis:get(TheSmile.."Smile:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then UserInfousername = '@'..UserInfo.username else UserInfousername = 'لا يوجد ' end
Welcome = Welcome:gsub('name',UserInfo.first_name) 
Welcome = Welcome:gsub('user',UserInfousername) 
Welcome = Welcome:gsub('NameCh',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md") else
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: اطلق دخول ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n𖡦: نورت الكروب ‹ '..Get_Chat.title..' ›',"md") end end end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender.user_id) == tonumber(TheSmile) then return false end
local floods = Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(TheSmile.."Smile:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: قام بالتكرار في المجموعة وتم طرده").Reply,"md",true) end
if type == "del" then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
if type == "keed" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: قام بالتكرار في المجموعة وتم تقييده").Reply,"md",true)  end
if type == "mute" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: قام بالتكرار في المجموعة وتم كتمه").Reply,"md",true) end end
Redis:setex(TheSmile.."Smile:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(TheSmile.."Smile:Spam:Group:User"..msg_chat_id,"Num:Spam")  end end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(TheSmile.."Smile:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSmile.."Smile:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end end
if msg.forward_info and not msg.TheBasics then -- التوجيه
local Fwd_Group = Redis:get(TheSmile.."Smile:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع توجيه الرسائل هنا").Replymarlow,"md",true)
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Fwd_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is forward')
return false end 
if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  -- الكيبورد
local Keyboard_Group = Redis:get(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Keyboard_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end end
print('This is reply_markup') end 
if msg.content.location and not msg.Distinguished then  -- الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}) end
print('This is location') end 
if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  -- الماركداون
local Markduan_Gtoup = Redis:get(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is textEntityTypeUrl') end 
if msg.content.game and not msg.Distinguished then  -- الالعاب
local Games_Group = Redis:get(TheSmile.."Smile:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Games_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is games') end 
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(TheSmile.."Smile:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true) end end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: التثبيت معطل من قبل المدراء ","md",true) end
print('This is message Pin') end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSmile.."Smile:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false end end
if msg.content.luatele == "messageChatAddMembers" then -- اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(TheSmile.."Smile:Num:Add:Memp"..msg_chat_id..":"..msg.sender.user_id) 
local AddMembrs = Redis:get(TheSmile.."Smile:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(TheSmile.."Smile:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0) end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(TheSmile.."Smile:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) 
if AddMembrs == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0) end end end end 
if msg.content.luatele == "messageContact" and not msg.Distinguished then  -- الجهات
local Contact_Group = Redis:get(TheSmile.."Smile:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Contact_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Contact') end 
if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  -- بصمه الفيديو
local Videonote_Group = Redis:get(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الفيديوهات هنا").Replymarlow,"md",true)
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Videonote_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is video Note') end 
if msg.content.luatele == "messageDocument" and not msg.Distinguished then  -- الملفات
local Document_Group = Redis:get(TheSmile.."Smile:Lock:Document"..msg_chat_id)
if Document_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الملفات هنا").Replymarlow,"md",true)
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Document_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Document') end 
if msg.content.luatele == "messageAudio" and not msg.Distinguished then  -- الملفات الصوتيه
local Audio_Group = Redis:get(TheSmile.."Smile:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الاغاني هنا").Replymarlow,"md",true)
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Audio_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Audio') end 
if msg.content.luatele == "messageVideo" and not msg.Distinguished then  -- الفيديو
local Video_Grouo = Redis:get(TheSmile.."Smile:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الفيديوهات هنا").Replymarlow,"md",true)
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Video_Grouo == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Video') end 
if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  -- البصمات
local Voice_Group = Redis:get(TheSmile.."Smile:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال البصمات هنا").Replymarlow,"md",true)
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Voice_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Voice') end 
if msg.content.luatele == "messageSticker" and not msg.Distinguished then  -- الملصقات
local Sticker_Group = Redis:get(TheSmile.."Smile:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الملصقات هنا").Replymarlow,"md",true)
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Sticker_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Sticker') end 
if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  -- انلاين
local Inlen_Group = Redis:get(TheSmile.."Smile:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Inlen_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is viabot') end
if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  -- المتحركات
local Gif_group = Redis:get(TheSmile.."Smile:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال المتحركات هنا").Replymarlow,"md",true)
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Gif_group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id)
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Animation') end 
if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  -- الصور
local Photo_Group = Redis:get(TheSmile.."Smile:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: ممنوع ارسال الصور هنا").Replymarlow,"md",true)
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Photo_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is Photo delete') end
if msg.content.photo and Redis:get(TheSmile.."Smile:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(TheSmile.."Smile:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا استطيع تغيير صوره المجموعة لاني لست ادمن او ليست لديه الصلاحيه ","md",true) end
Redis:del(TheSmile.."Smile:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغيير صوره المجموعة المجموعة الى ","md",true) end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(TheSmile.."Smile:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif link_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is link ')
return false end end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(TheSmile.."Smile:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif UserName_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is username ') end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(TheSmile.."Smile:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Hashtak_Group == "ked" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Hashtak_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Hashtak_Group == "kick" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end
print('This is hashtak ') end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(TheSmile.."Smile:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif comd_Group == "ked" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif comd_Group == "ktm" then
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif comd_Group == "kick" then return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0) end end
if (Redis:get(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then Filters = 'صوره'
Redis:sadd(TheSmile.."Smile:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then Filters = 'متحركه'
Redis:sadd(TheSmile.."Smile:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then Filters = 'ملصق'
Redis:sadd(TheSmile.."Smile:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, text)  
Redis:sadd(TheSmile.."Smile:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'رسالة' end
Redis:set(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: ارسل تحذير ( "..Filters.." ) عند ارساله","md",true) end end
if text and (Redis:get(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true1') then
local Text_Filter = Redis:get(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(TheSmile.."Smile:Filter:Group:"..Text_Filter..msg_chat_id,text)  end  
Redis:del(TheSmile.."Smile:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
Redis:del(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم اضافة رد التحذير","md",true)  end
if (Redis:get(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then Filters = 'الصوره'
Redis:srem(TheSmile.."Smile:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(TheSmile.."Smile:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then Filters = 'المتحركه'
Redis:srem(TheSmile.."Smile:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(TheSmile.."Smile:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then Filters = 'الملصق'
Redis:srem(TheSmile.."Smile:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(TheSmile.."Smile:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(TheSmile.."Smile:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(TheSmile.."Smile:Filter:Group:"..text..msg_chat_id)  
Filters = 'الرسالة' end
Redis:del(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم الغاء منع ( "..Filters.." )","md",true) end end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then DelFilters = msg.content.photo.sizes[1].photo.id statusfilter = 'الصوره'
elseif msg.content.animation then DelFilters = msg.content.animation.animation.id statusfilter = 'المتحركه'
elseif msg.content.sticker then DelFilters = msg.content.sticker.sticker.id statusfilter = 'الملصق'
elseif text then DelFilters = text statusfilter = 'الرسالة' end
local ReplyFilters = Redis:get(TheSmile.."Smile:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.ControllerBot then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: لقد تم منع ( "..statusfilter.." ) هنا\n𖡦: "..ReplyFilters.."*","md",true)  end end
if text and Redis:get(TheSmile.."Smile:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id) == "true" then
local NewCmmd = Redis:get(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(TheSmile.."Smile:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(TheSmile.."Smile:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم ازالة هذا ↫ ‹ "..text.." ›","md",true) else
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد امر بهذا الاسم","md",true) end
Redis:del(TheSmile.."Smile:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id)
return false end
if text and Redis:get(TheSmile.."Smile:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id) == "true" then
Redis:set(TheSmile.."Smile:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(TheSmile.."Smile:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id)
Redis:set(TheSmile.."Smile:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الامر الجديد","md",true)  end
if text and Redis:get(TheSmile.."Smile:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id) == "true1" then
local NewCmd = Redis:get(TheSmile.."Smile:Command:Reids:Group:New"..msg_chat_id)
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(TheSmile.."Smile:Command:List:Group"..msg_chat_id,text)
Redis:del(TheSmile.."Smile:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الامر باسم ↫ ‹ "..text..' ›',"md",true) end
if Redis:get(TheSmile.."Smile:Set:Link"..msg_chat_id..""..msg.sender.user_id) then
if text and text:match("(https://telegram.me/%S+)") or text and text:match("(https://t.me/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/%S+)") or text:match("(https://t.me/%S+)")   
Redis:set(TheSmile.."Smile:Group:Link"..msg_chat_id,LinkGroup)
Redis:del(TheSmile.."Smile:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرابط بنجاح","md",true)        end end 
if Redis:get(TheSmile.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id) then 
Redis:del(TheSmile.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
Redis:set(TheSmile.."Smile:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ ترحيب المجموعة","md",true) end
if Redis:get(TheSmile.."Smile:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
Redis:set(TheSmile.."Smile:Group:Rules" .. msg_chat_id,text) 
Redis:del(TheSmile.."Smile:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ قوانين المجموعة","md",true)  end  
if Redis:get(TheSmile.."Smile:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(TheSmile.."Smile:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ وصف المجموعة","md",true)  end  
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheSmile.."Smile:Text:Manager"..msg.sender.user_id..":"..msg_chat_id.."")
if Redis:get(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/closerD'},},}}
Redis:del(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  end   
if msg.content.voice_note then  
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Text"..test..msg_chat_id, text)  end  
if msg.content.audio then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  end
if msg.content.document then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  end
if msg.content.animation then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  end
if msg.content.video_note then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  end
if msg.content.video then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
print(idPhoto)
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  end
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ رد المدير الجديد","md",false ,false, false, false, reply_markup) end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd'},},}}
Redis:set(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true1")
Redis:set(TheSmile.."Smile:Text:Manager"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(TheSmile.."Smile:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي الرد سواء كان :
‹ ملف • ملصق • متحركه • صوره
• فيديو • بصمه • ص؛وت • رساله ›
𖡦: يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ‹ `#username` ›  ↬  معرف المستخدم
 ‹ `#msgs` ›  ↬  عدد الرسائل
 ‹ `#name` ›  ↬  اسم المستخدم
 ‹ `#id` ›  ↬  ايدي المستخدم
 ‹ `#stast` ›  ↬  رتبة المستخدم
 ‹ `#edit` ›  ↬  عدد السحكات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج اضغط ↫ ‹ الغاء ›
]],"md",false ,false, false, false, reply_markup) return false end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheSmile.."Smile:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: الكلمة ↫ ‹ '..text..' › تم حذفها',"md",true)  
return false end end
if text and Redis:get(TheSmile.."Smile:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Video"..text)
local document = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:File"..text)
local audio = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(TheSmile.."Smile:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
if UserInfo.username then UserInfousername = '@'..UserInfo.username..'' else UserInfousername = 'لا يوجد' end
local NumMessageEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Text = Text:gsub('#username',UserInfousername)
local Text = Text:gsub('#name',UserInfo.first_name)
local Text = Text:gsub('#id',msg.sender.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Text,"md",true)  end
if video_note then LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note) end
if photo then LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'') end  
if stekr then LuaTele.sendSticker(msg_chat_id, msg.id, stekr) end
if veico then LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md') end
if video then LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md") end
if anemi then LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md') end
if document then LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md') end  
if audio then LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md")  end end
if text and Redis:get(TheSmile.."Smile:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(TheSmile.."Smile:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(TheSmile.."Smile:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(TheSmile.."Smile:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
if UserInfo.username then UserInfousername = '@'..UserInfo.username..'' else UserInfousername = 'لا يوجد' end
local NumMessageEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Texingt = Texingt:gsub('#username',UserInfousername) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Texingt,"md",true)  end
if video_note then LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note) end
if photo then LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'') end  
if stekr then LuaTele.sendSticker(msg_chat_id, msg.id, stekr) end
if veico then LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md') end
if video then LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md") end
if anemi then LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md') end
if document then LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md') end  
if audio then LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md")  end end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheSmile.."Smile:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id)
if Redis:get(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then Redis:del(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  end   
if msg.content.voice_note then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  end   
if msg.content.animation then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile:Add:Rd:Sudo:Text"..test, text)  end  
if msg.content.audio then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  end
if msg.content.document then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  end
if msg.content.video then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  end
if msg.content.video_note then Redis:set(TheSmile.."Smile:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then idPhoto = msg.content.photo.sizes[3].photo.remote.id end
Redis:set(TheSmile.."Smile:Add:Rd:Sudo:Photo"..test, idPhoto) end
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ رد للمطور \n𖡦: ارسل ( "..test.." ) لرؤية الرد","md",true)  
return false end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id, "true1")
Redis:set(TheSmile.."Smile:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:sadd(TheSmile.."Smile:List:Rd:Sudo", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي الرد سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
𖡦: يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 ‹ `#username` › ↬ معرف المستخدم
 ‹ `#msgs` › ↬ عدد الرسائل
 ‹ `#name` › ↬ اسم المستخدم
 ‹ `#id` › ↬ ايدي المستخدم
 ‹ `#stast` › ↬ رتبة المستخدم
 ‹ `#edit` › ↬ عدد السحكات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
]],"md",true) return false end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile:Set:On"..msg.sender.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(TheSmile..'Smile:'..v..text) end
Redis:del(TheSmile.."Smile:Set:On"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheSmile.."Smile:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف الرد من ردود المطور","md",true) end end
if Redis:get(TheSmile.."Smile:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء الاذاعه للمجموعات","md",true)  end 
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(TheSmile.."Smile:PinMsegees:"..v,idPhoto) end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.voice_note.voice.remote.id) end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.video.video.remote.id) end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.animation.animation.remote.id) end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.document.document.remote.id) end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(TheSmile.."Smile:PinMsegees:"..v,msg.content.audio.audio.remote.id) end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true)
Redis:set(TheSmile.."Smile:PinMsegees:"..v,text) end end
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تمت الاذاعه الى *- "..#list.." * مجموعة في البوت ","md",true)      
Redis:del(TheSmile.."Smile:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSmile.."Smile:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء الاذاعه خاص","md",true)  end 
local list = Redis:smembers(TheSmile..'Smile:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'') end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md') end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md") end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md') end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md') end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true) end end
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(TheSmile.."Smile:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSmile.."Smile:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء الاذاعه للمجموعات","md",true)  end 
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id end
for k,v in pairs(list) do LuaTele.sendPhoto(v, 0, idPhoto,'') end
elseif msg.content.sticker then 
for k,v in pairs(list) do LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id) end
elseif msg.content.voice_note then 
for k,v in pairs(list) do LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md') end
elseif msg.content.video then 
for k,v in pairs(list) do LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md") end
elseif msg.content.animation then 
for k,v in pairs(list) do LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md') end
elseif msg.content.document then
for k,v in pairs(list) do LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md') end
elseif msg.content.audio then
for k,v in pairs(list) do LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") end
elseif text then
for k,v in pairs(list) do LuaTele.sendText(v,0,text,"md",true) end end
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تمت الاذاعه الى *- "..#list.." * مجموعة في البوت ","md",true)      
Redis:del(TheSmile.."Smile:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSmile.."Smile:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء الاذاعه بالتوجيه للمجموعات","md",true) end 
if text or msg.content.sticker or msg.content.voice_note or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video_note or msg.content.video or msg.forward_info then 
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم التوجيه الى *- "..#list.." * مجموعة في البوت ","md",true)      
for k,v in pairs(list) do LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false) end   
Redis:del(TheSmile.."Smile:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end return false end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSmile.."Smile:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء الاذاعه بالتوجيه خاص","md",true) end 
if text or msg.content.sticker or msg.content.voice_note or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video_note or msg.content.video or msg.forward_info then 
local list = Redis:smembers(TheSmile.."Smile:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم التوجيه الى *- "..#list.." * مجموعة في البوت ","md",true) 
for k,v in pairs(list) do LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true) end   
Redis:del(TheSmile.."Smile:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end return false end
if text and Redis:get(TheSmile..'Smile:GetOwner:OwnerTheSmile'..msg_chat_id..':'..msg.sender.user_id) then
Redis:set(TheSmile..'Smile:Owner:OwnerTheSmile'..msg_chat_id,text)
Redis:del(TheSmile..'Smile:GetOwner:OwnerTheSmile'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حفظ كليشة المنشئ') end
if text and Redis:get(TheSmile..'Smile:GetTexting:DevTheSmile'..msg_chat_id..':'..msg.sender.user_id) then
Redis:set(TheSmile..'Smile:Texting:DevTheSmile',text)
Redis:del(TheSmile..'Smile:GetTexting:DevTheSmile'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حفظ كليشة المطور') end
if Redis:get(TheSmile.."Smile:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء امر تعين الايدي عام","md",true)  
Redis:del(TheSmile.."Smile:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
return false end 
Redis:del(TheSmile.."Smile:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:Set:Id:Groups"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم تعين الايدي عام',"md",true)  end
if Redis:get(TheSmile.."Smile:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء امر تعين الايدي","md",true)  
Redis:del(TheSmile.."Smile:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
return false end 
Redis:del(TheSmile.."Smile:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم تعين الايدي الجديد',"md",true)  end
-- marlow
if Redis:get(TheSmile.."Smile:Change:CH:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Change:CH:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء امر تغير اسم القناة","md",true)  end 
Redis:del(TheSmile.."Smile:Change:CH:Bot"..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:CH:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: تم تغير اسم القتاة الى ↫ ❨ "..text.." ❩","md",true) end 
--
if Redis:get(TheSmile.."Smile:Change:CHlink:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == '‹ الغاء الامر ›' then   
Redis:del(TheSmile.."Smile:Change:CHlink:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖡦: تم الغاء امر تغير كليشة الاشتراك","md",true)  end 
Redis:del(TheSmile.."Smile:Change:CHlink:Bot"..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:CHlink:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: تم تغير الكليشة الى ↫ ⤈\n ❨ "..text.." ❩","md",true) end 
-- marlow
if Redis:get(TheSmile.."Smile:Change:Name:Bot"..msg.sender.user_id) then 
Redis:del(TheSmile.."Smile:Change:Name:Bot"..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: تم تغير اسم البوت الى ↫ ‹ "..text.." ›","md",true) end 
if Redis:get(TheSmile.."Smile:Change:Start:Bot"..msg.sender.user_id) then  
Redis:del(TheSmile.."Smile:Change:Start:Bot"..msg.sender.user_id) 
Redis:set(TheSmile.."Smile:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: تم تغيير كليشة الترحيب الى ↫ ⤈\n"..text,"md",true) end 
if Redis:get(TheSmile.."Smile:Game:Smile"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Smile"..msg.chat_id) then
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSmile.."Smile:Game:Smile"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - سمايل او سمايلات","md",true) end end 
if Redis:get(TheSmile.."Smile:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Monotonous"..msg.chat_id) then
Redis:del(TheSmile.."Smile:Game:Monotonous"..msg.chat_id)
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - الاسرع او ترتيب","md",true) end end 
if Redis:get(TheSmile.."Smile:Game:Riddles"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Riddles"..msg.chat_id) then
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSmile.."Smile:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - حزوره","md",true) end end
if Redis:get(TheSmile.."Smile:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Meaningof"..msg.chat_id) then
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSmile.."Smile:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - معاني","md",true) end end
if Redis:get(TheSmile.."Smile:Game:Reflection"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Reflection"..msg.chat_id) then
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSmile.."Smile:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - العكس","md",true) end end
if Redis:get(TheSmile.."Smile:Game:Estimate"..msg.chat_id..msg.sender.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً لا يمكنك تخمين عدد اكبر من ال {20} خمن رقم ما بين ال{1 و 20}\n","md",true)  end 
local GETNUM = Redis:get(TheSmile.."Smile:Game:Estimate"..msg.chat_id..msg.sender.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(TheSmile.."Smile:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheSmile.."Smile:Game:Estimate"..msg.chat_id..msg.sender.user_id)
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id,5)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: مبروك فزت ويانه وخمنت الرقم الصحيح\n𖡦: تم اضافة {5} من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(TheSmile.."Smile:SADD:NUM"..msg.chat_id..msg.sender.user_id,1)
if tonumber(Redis:get(TheSmile.."Smile:SADD:NUM"..msg.chat_id..msg.sender.user_id)) >= 3 then
Redis:del(TheSmile.."Smile:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheSmile.."Smile:Game:Estimate"..msg.chat_id..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اوبس لقد خسرت في اللعبه \n𖡦: حظآ اوفر في المره القادمه \n𖡦: كان الرقم الذي تم تخمينه {"..GETNUM.."}","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اوبس تخمينك غلط \n𖡦: ارسل رقم تخمنه مره اخرى ","md",true) end end end end
if Redis:get(TheSmile.."Smile:Game:Difference"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Difference"..msg.chat_id) then 
Redis:del(TheSmile.."Smile:Game:Difference"..msg.chat_id)
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - المختلف","md",true)  
else
Redis:del(TheSmile.."Smile:Game:Difference"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد خسرت حضا اوفر في المره القادمه\n𖡦: اللعب مره اخره وارسل - المختلف","md",true) end end
if Redis:get(TheSmile.."Smile:Game:Example"..msg.chat_id) then
if text == Redis:get(TheSmile.."Smile:Game:Example"..msg.chat_id) then 
Redis:del(TheSmile.."Smile:Game:Example"..msg.chat_id)
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد فزت في اللعبه \n𖡦: اللعب مره اخره وارسل - امثله","md",true)  
else
Redis:del(TheSmile.."Smile:Game:Example"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لقد خسرت حضا اوفر في المره القادمه\n𖡦: اللعب مره اخره وارسل - امثله","md",true) end end
if text then
local NewCmmd = Redis:get(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text) end end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(TheSmile) ~= tonumber(FilesJson.BotId) then return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end botid
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: جاري استرجاع المشتركين والكروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(TheSmile..'Smile:Num:User:Pv',v)  end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(TheSmile.."Smile:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..GroupId,v) end end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(TheSmile.."Smile:Originators:Group"..GroupId,v) end end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(TheSmile.."Smile:Managers:Group"..GroupId,v) end end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(TheSmile.."Smile:Addictive:Group"..GroupId,v) end end
if ListGroup.Cleaner then
for k,v in pairs(ListGroup.Cleaner) do
Redis:sadd(TheSmile.."Smile:Cleaner:Group"..GroupId,v) end end 
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(TheSmile.."Smile:Distinguished:Group"..GroupId,v) end end 
end
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم استرجاع {'..X..'} مجموعة \n𖡦: واسترجاع {'..Y..'} مشترك في البوت') end end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(TheSmile) then 
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه') end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(TheSmile.."Smile:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(TheSmile.."Smile:Originators:Group"..idg,idmsh) end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(TheSmile.."Smile:Managers:Group"..idg,idmder)  end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(TheSmile.."Smile:Addictive:Group"..idg,idmod) end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..idg,idASAS) end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم استرجاع المجموعات من نسخه تشاكي')
else
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: الملف لا يدعم هذا البوت') end end
end
if (Redis:get(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text == 'الغاء' or text == '‹ الغاء الامر ›' then 
Redis:del(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم الغاء حفظ قناة الاشتراك') end
Redis:del(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,TheSmile).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  end
Redis:set(TheSmile..'Smile:Channel:Join',ChannelUser) 
Redis:set(TheSmile..'Smile:ChanneliD:Join',UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true) end end end
if text == 'تفعيل الاشتراك الاجباري' or text == '‹ تفعيل الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:set(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: ارسل الي الان قناة الاشتراك ","md",true)  end
if text == 'تعطيل الاشتراك الاجباري' or text == '‹ تعطيل الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:del(TheSmile..'Smile:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم تعطيل الاشتراك الاجباري","md",true)  end
-- marlow
if text == 'تغير اسم القناة' or text =='تغيير اسم القناة' or text =='‹ تغير اسم القناة ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Change:CH:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي اسم القناة الجديد\n𖡦: للخروج ارسل ↫ ‹ الغاء ›","md",true)  end
--
if text == 'حذف اسم القناة' or text =='مسح اسم القناة' or text =='‹ حذف اسم القناة ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:CH:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف اسم القناة ","md",true)   
end
--
if text == 'تغير كليشة الاشتراك' or text =='تغيير كليشة الاشتراك' or text =='‹ تغير كليشة الاشتراك ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Change:CHlink:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي كليشة الاشتراك الجديده \n𖡦: للخروج ارسل ↫ ‹ الغاء ›","md",true)  end
--
if text == 'حذف كليشة الاشتراك' or text =='مسح كليشة الاشتراك' or text =='‹ حذف كليشة الاشتراك ›' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:CHlink:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف كليشة الاشتراك ","md",true)   
end
-- marlow
if text == 'تغيير الاشتراك الاجباري' or text == '‹ تغيير الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
Redis:set(TheSmile..'Smile:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: ارسل الي الان قناة الاشتراك ","md",true)  end
if text == 'الاشتراك الاجباري' or text == '‹ الاشتراك الاجباري ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Channel = Redis:get(TheSmile..'Smile:Channel:Join')
if Channel then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true) end end
if text == '‹ قناة السورس ›' or text == 'قناه السورس' or text == 'قناة السورس' then
photo = "https://t.me/smilexR/3"
local tt =[[
𖡦: [ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ ](https://t.me/SMILEXB) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Source Channel .', url = "https://t.me/SMILEXB"}},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/SMILEXB&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == '‹ مبرمج السورس ›' or text == 'مبرمج' or text == 'مبرمج السورس' or text == 'مطور السورس' or text == 'المبرمج' then
local tt =[[
𖡦: [مبرمج السورس](https://t.me/PPFFP) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مبرمج السورس .', url = "https://t.me/PPFFP"}},}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/PPFFP&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == '‹ تحديثات السورس ›' or text == 'قناة التحديثات' or text == 'تحديثات السورس' then
local tt =[[
𖡦: [Exp Source](https://t.me/smilexR) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Exp Source .', url = "https://t.me/smilexR"}},}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/SMILEXB&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "‹ اسم البوت ›" then
local NamesBot = (Redis:get(TheSmile.."Smile:Name:Bot") or "لار")
local BotName = {
"اسم البوت الحالي - "..NamesBot,
}
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تعطيل الاذاعة' or text == '‹ تعطيل الاذاعة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:SendBcBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الاذعة *").unLock,"md",true) end
if text == 'تفعيل الاذاعة' or text == '‹ تفعيل الاذاعة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:SendBcBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الاذاعة *").unLock,"md",true) end
if text == 'تعطيل المغادرة' or text == '‹ تعطيل المغادرة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:LeftBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل مغادرة البوت *").unLock,"md",true) end
if text == 'تفعيل المغادرة' or text == '‹ تفعيل المغادرة ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل مغادرة البوت *").unLock,"md",true) end
if (Redis:get(TheSmile.."Smile:AddSudosNew"..msg_chat_id) == 'true') then
Redis:del(TheSmile.."Smile:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم تغيير المطور الاساسي الى ↫ [@"..text:gsub('@','').."]","md",true) end end
if text == 'تغيير المطور الاساسي' or text == '‹ تغيير المطور الاساسي ›' or text == 'تغير المطور الاساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DevIDClose'},},}}
Redis:set(TheSmile.."Smile:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل معرف المطور الاساسي مع @","md",false, false, false, false, reply_markup) end
if text == '‹ جلب النسخة الاحتياطية ›' or text == 'جلب نسخه احتياطيه' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Groups = Redis:smembers(TheSmile..'Smile:ChekBotAdd')  
local UsersBot = Redis:smembers(TheSmile..'Smile:Num:User:Pv')  
local Get_Json = '{"BotId": '..TheSmile..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(TheSmile.."Smile:TheBasics:Group"..v)
local Constructor = Redis:smembers(TheSmile.."Smile:Originators:Group"..v)
local Manager = Redis:smembers(TheSmile.."Smile:Managers:Group"..v)
local Admin = Redis:smembers(TheSmile.."Smile:Addictive:Group"..v)
local Cleaner = Redis:smembers(TheSmile.."Smile:Cleaner:Group"..v)
local Vips = Redis:smembers(TheSmile.."Smile:Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Cleaner ~= 0 then
Get_Json = Get_Json..'"Cleaner":['
for k,v in pairs(Cleaner) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"' end end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"PPFFP"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json','𖡦: يحتوي الملف على ↫ ‹ '..#Groups..' › مجموعة\n𖡦: ويحتوي على ↫ ‹ '..#UsersBot..' › مشترك', 'md') end
if text == 'جلب نسخة الردود' or text == '‹ جلب نسخة الردود ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Get_Json = '{"BotId": '..TheSmile..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(TheSmile..'Smile:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(TheSmile.."Smile:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(TheSmile.."Smile:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(TheSmile.."Smile:Add:Rd:Manager:video_note"..v..ide) end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplysGr.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplysGr.json', '', 'md') end
if text == 'رفع نسخة الردود' and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.taha == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(TheSmile.."Smile:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(TheSmile.."Smile:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') ) end end end end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: تم استرجاع ردود المجموعات* ',"md",true) end end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile..'Smile:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: احصائيات البوت ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: عدد المجموعات ↫ '..(Redis:scard(TheSmile..'Smile:ChekBotAdd') or 0)..'\n𖡦: عدد المشتركين ↫ '..(Redis:scard(TheSmile..'Smile:Num:User:Pv') or 0)..'*',"md",true)  end
if text == 'تفعيل' and msg.Developers then
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheSmile.."Smile:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheSmile..'Smile:Num:Add:Bot') or 0)) and not msg.DevelopersAS then return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد الاعضاء قليل لا يمكن تفعيل المجموعة يجب ان يكوم اكثر من :'..Redis:get(TheSmile..'Smile:Num:Add:Bot'),"md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id, '\n𖡦: المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSmile.."Smile:TheBas:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1 end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},},{{text = '‹ الاوامر ›', data = msg.sender.user_id..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbot'},{text = '‹ تعطيل ›', data =msg.sender.user_id..'/disable'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
marlow = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
marlow = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
Status = 'المنشئ'
elseif (StatusMember == "chatMemberStatusAdministrator") then
Status = 'الادمن'
else
Status = 'العضو'
end
LuaTele.sendText(Sudo_Id,0,'\n𖡦: تم تفعيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: بواسطة ↫ '..marlow..'\n𖡦: موقعه في المجموعة ↫ '..Status..'\n𖡦: ايدي المجموعة ↫ ⤈\n❨ `'..msg_chat_id..'` ❩\n𖡦: رابط المجموعة ↫ ⤈\n❨ '..Info_Chats.invite_link.invite_link..' ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ '..os.date('%I:%M%p')..'\n𖡦: التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md",true) end
Redis:sadd(TheSmile.."Smile:ChekBotAdd",msg_chat_id)
Redis:set(TheSmile.."Smile:Status:BanId"..msg_chat_id,true) ;Redis:set(TheSmile.."Smile:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*𖡦: تم تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md', true, false, false, false, reply_markup) end end 
if text == ('تفعيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusCreator" or text == ('تفعيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusAdministrator" then
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if not Redis:get(TheSmile.."Smile:BotFree") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheSmile.."Smile:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheSmile..'Smile:Num:Add:Bot') or 0)) and not msg.DevelopersAS then return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد الاعضاء قليل لا يمكن تفعيل المجموعة يجب ان يكوم اكثر من :'..Redis:get(TheSmile..'Smile:Num:Add:Bot'),"md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id, '\n𖡦: المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSmile.."Smile:TheBas:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1 end end
end
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
marlow = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
marlow = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
Status = 'المنشئ'
elseif (StatusMember == "chatMemberStatusAdministrator") then
Status = 'الادمن'
else
Status = 'العضو'
end
LuaTele.sendText(Sudo_Id,0,'\n𖡦: تم تفعيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: بواسطة ↫ '..marlow..'\n𖡦: موقعه في المجموعة ↫ '..Status..'\n𖡦: ايدي المجموعة ↫ ⤈\n❨ `'..msg_chat_id..'` ❩\n𖡦: رابط المجموعة ↫ ⤈\n❨ '..Info_Chats.invite_link.invite_link..' ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ '..os.date('%I:%M%p')..'\n𖡦: التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},},{{text = '‹ الاوامر ›', data = msg.sender.user_id..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbot'},{text = '‹ تعطيل ›', data =msg.sender.user_id..'/disable'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
Redis:sadd(TheSmile.."Smile:ChekBotAdd",msg_chat_id)
Redis:set(TheSmile.."Smile:Status:BanId"..msg_chat_id,true) ;Redis:set(TheSmile.."Smile:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*𖡦: تم تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md', true, false, false, false, reply_markup) end end
if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheSmile.."Smile:ChekBotAdd",msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id, '\n𖡦: المجموعة تم تعطيلها بالتأكيد',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
marlow = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
marlow = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(Sudo_Id,0,"𖡦: تم تعطيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: بواسطة ↫ "..marlow.."\n𖡦: اسم المجموعة ↫ "..Get_Chat.title.."\n𖡦: ايدي المجموعة ↫ ⤈ \n❨ `"..msg_chat_id.."` ❩\n𖡦: رابط المجموعة ↫ ⤈\n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ "..os.date("%I:%M%p").."\n𖡦: التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbott'},{text = '‹ تفعيل ›', data =msg.sender.user_id..'/activation'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ??𝖺𝖽𝗂 ›', url = 't.me/SMILEXB'},},}}
Redis:srem(TheSmile.."Smile:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*𖡦: تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md',true, false, false, false, reply_markup) end end
if text == ('تعطيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusCreator" and not msg.Developers or text == ('تعطيل') and LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele == "chatMemberStatusAdministrator" and not msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheSmile.."Smile:ChekBotAdd",msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: المجموعة تم تعطيلها بالتأكيد*',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
marlow = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
marlow = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(Sudo_Id,0,"𖡦: تم تعطيل مجموعة جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: بواسطة ↫ "..marlow.."\n𖡦: اسم المجموعة ↫ "..Get_Chat.title.."\n𖡦: ايدي المجموعة ↫ ⤈ \n❨ `"..msg_chat_id.."` ❩\n𖡦: رابط المجموعة ↫ ⤈\n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ "..os.date("%I:%M%p").."\n𖡦: التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = msg.sender.user_id..'/Yesbott'},{text = '‹ تفعيل ›', data =msg.sender.user_id..'/activation'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
Redis:srem(TheSmile.."Smile:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,'*𖡦: تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*').unLock,'md',true, false, false, false, reply_markup) end end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(TheSmile.."Smile:ChekBotAdd",msg_chat_id) then
Redis:incr(TheSmile..'Smile:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) 
if text == ("ايدي") and msg.reply_to_message_id == 0 or text == ("id") and msg.reply_to_message_id == 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
if not Redis:get(TheSmile.."Smile:Status:Id"..msg_chat_id) then return false end
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
local NumAdd = Redis:get(TheSmile.."Smile:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0
local Texting = {'ملاك وناسيك بكروبنه',"حلقوم واللة ","اطلق صوره","كيكك واللة","لازك بيها غيرها عاد",}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(TheSmile.."Smile:Set:Id:Group"..msg_chat_id)
if Redis:get(TheSmile.."Smile:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,'\n𖡦: '..Description..'\n𖡦: معرفك ↫ '..UserInfousername..'\n𖡦: ايديك ↫ ❨ '..UserId..' ❩\n𖡦: رتبتك ↫ '..RinkBot..'\n𖡦: صورك ↫ ❨ '..TotalPhoto..' ❩\n𖡦: رسائلك ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاتك ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعلك ↫ '..TotalMsgT..'\n𖡦: نقاطك ↫ ❨ '..NumberGames..' ❩', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: معرفك ↫ '..UserInfousername..'\n𖡦: ايديك ↫ ❨ `'..UserId..'` ❩\n𖡦: رتبتك ↫ '..RinkBot..'\n𖡦: رسائلك ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاتك ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعلك ↫ '..TotalMsgT..'\n𖡦: نقاطك ↫ ❨ '..NumberGames..' ❩',"md",true)  end end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: معرفك ↫ '..UserInfousername..'\n𖡦: ايديك ↫ ❨ `'..UserId..'` ❩\n𖡦: رتبتك ↫ '..RinkBot..'\n𖡦: رسائلك ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاتك ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعلك ↫ '..TotalMsgT..'\n𖡦: نقاطك ↫ ❨ '..NumberGames..' ❩',"md",true)  end end
end
if text == ('ايدي') and msg.reply_to_message_id ~= 0 or text == ('كشف') and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender.user_id
local RinkBot = Controller(msg_chat_id,Message_Reply.sender.user_id)
local TotalMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender.user_id) or 0
local TotalEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..Message_Reply.sender.user_id) or 0
local NumberGame = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: معرفه ↫ '..UserInfousername..'\n𖡦: ايديه ↫ ❨ `'..UserId..'` ❩\n𖡦: رتبته ↫ '..RinkBot..'\n𖡦: رسائله ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاته ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعله ↫ '..TotalMsgT..'\n𖡦: نقاطه ↫ ❨ '..NumberGame..' ❩ ' ,"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local UserId = UserId_Info.id
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local NumberGame = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: معرفه ↫ @'..UserName..'\n𖡦: ايديه ↫ ❨ `'..UserId..'` ❩\n𖡦: رتبته ↫ '..RinkBot..'\n𖡦: رسائله ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاته ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعله ↫ '..TotalMsgT..'\n𖡦: نقاطه ↫ ❨ '..NumberGame..' ❩ ' ,"md",true) 
end
if text and text:match('^ايدي (%d+)$') or text and text:match('^كشف (%d+)$') then
local UserId = text:match('^ايدي (%d+)$') or text:match('^كشف (%d+)$')
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
local RinkBot = Controller(msg_chat_id,UserInfo.id)
local TotalMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..UserInfo.id) or 0
local TotalEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..UserInfo.id) or 0
local NumberGame = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..UserInfo.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
marlow = '@'..UserInfo.username..''
else
marlow = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: معرفه ↫ '..marlow..'\n𖡦: ايديه ↫ ❨ `'..UserId..'` ❩\n𖡦: رتبته ↫ '..RinkBot..'\n𖡦: رسائله ↫ ❨ '..TotalMsg..' ❩\n𖡦: سحكاته ↫ ❨ '..TotalEdit..' ❩\n𖡦: تفاعله ↫ '..TotalMsgT..'\n𖡦: نقاطه ↫ ❨ '..NumberGame..' ❩ ' ,"md",true) 
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
local List = {
[[
، 𝚞𝚜𝚎𝚛 : #username .
، 𝚖𝚜𝚐 : #msgs .
، 𝚜𝚝𝚊 : #stast .
، 𝚒𝚍 : #id .
]],
[[
◜𝗨َِS𝗘ِr : #username 🕷 .  
◜𝗠ِsِG : #msgs .
◜𝗦َt : #stast .
◜𝗜ِd : #id 🕸 .
]],
[[
˖ˑ Uຮّꫀ𝚛ꪀᥲꪔ  ࣪ ᥫ᭡ #username
˖ˑ ຮّ𝚝ᥲຮّ𝚝  ࣪ ᥫ᭡  #stast
˖ˑ ᎥĐ ࣪ ᥫ᭡ #id
˖ˑ 𝙶ᥲꪔꫀຮ  ࣪ ᥫ᭡ #game
˖ˑ ꪔຮّ𝙶ຮ  ࣪ ᥫ᭡  #msgs
]],
[[
. 𝗎𝗌𝖾𝗋 › #username . 
. 𝗌𝗍α › #stast . 
. 𝗂𝖽 › #id . 
. 𝗆𝗌𝗀 › #msgs .
]],
[[
∵ ꪊ᥉ꫀɾ  ˛ #username ٫
∵ ᥉ƚꪖ  ˛ #stast ٫
∵ Ꭵᦔ  ˛ #id 🥡٫
∵ ꪑ᥉ᧁ  ˛ #msgs 🥡٫
]],
[[
〝 𝗎𝗦ꫀ : #username .
〝 𝖲𝗍ɑ : #stast  . 
〝 ⁪⁬⁮Μsg : #msgs 📍.
〝 َ𝖨ժ : #id 📍.
]],
[[
∴ 𝗎!𝗌 : #username  .
∴ 𝗌!?? : #stast  .
∴ 𝗂!𝖽 : #id 🩸 .
∴ ??!𝗀 : #msgs 🩸.
]],
[[
˛ USER . #username ˛
˛ STAST . #stast ˛
˛ ID . #id 🥢˛
˛ MSGS . #msgs 🥢˛
]],
[[
: 𝖴ِ᥉ᥱ : #username .
: Sƚِᥲ : #stast .
: Iَժ : #id 📌.
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs 📌.
]],
[[
: 𝚄𝚂𝙴𝚁 ، #username  .
: 𝙼𝚂𝙶 ، #msgs  .
: 𝚂𝚃𝙰 ، #stast  .
: 𝙸𝙳 ، #id  .
]],
[[
◜ 𝗨َِS𝗘ِr #username 🕷 .  
◜ 𝗠ِsِG #msgs   .
◜ 𝗦َ𝗧 #stast  .
◜ 𝗜ِd #id 🕸 .
]],
[[
. USERNAME . #username
. STAST . #stast
. ID . #id
. MSGS . #msgs
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛ 𝗂!𝖽 : #id ⛓️ '.
]],
[[
› Msgs : #msgs .🦇
› ID : #id .
› Stast : #stast .
› UserName : #username .🦇
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(TheSmile.."Smile:Set:Id:Group"..msg.chat_id,Text_Rand)
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  end
if text == 'نبذتي' or text == 'بايو' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذه الميزة للادمنية واعلى فقط',"md",true)  end
local InfoUser = LuaTele.getUserFullInfo(msg.sender.user_id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: نبذتك ↫ ❨ '..Bio..' ❩',"md",true)  end
if text == 'اسمي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذه الميزة للادمنية واعلى فقط',"md",true)  end
local UserInfo = LuaTele.getUser(msg.sender.user_id) 
if UserInfo.first_name then
Name = UserInfo.first_name
else
Name = ''
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: اسمك ↫ ❨ '..Name..' ❩ ',"md",true)  end
if text == 'رتبتي' then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: رتبتك ↫ ❨ '..msg.Name_Controller..' ❩',"md",true)  end
if text == 'ايديي' then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: ايديك ↫ ❨ '..msg.sender.user_id..' ❩',"md",true)  end
if text == 'معرفي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: معرفك ↫ ❨ '..UserInfousername..' ❩',"md",true)  end
if text == 'معلوماتي' or text == 'موقعي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك المجموعة'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'ادمن المجموعة'
else
StatusMemberChat = 'مجرد عضو'
end
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheSmile..'Smile:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalEdit = Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n𖡦: ايديك ↫ '..UserId..
'\n𖡦: معرفك ↫ '..UserInfousername..
'\n𖡦: رتبتك ↫ '..RinkBot..
'\n𖡦: موقعك ↫ '..StatusMemberChat..
'\n𖡦: رسائلك ↫ '..TotalMsg..
'\n𖡦: سحكاتك ↫ '..TotalEdit..
'\n𖡦: تفاعلك ↫ '..TotalMsgT..
'' ,"md",true) 
end
if text == 'فحص البوت' then 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,TheSmile).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: البوت عضو في المجموعة ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,TheSmile).status
if GetMemberStatus.can_change_info then
change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_invite_users then
invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›'
end
if GetMemberStatus.can_promote_members then
promote = '‹ ✓ ›' else promote = '‹ ✗ ›'
end
PermissionsUser = '\n𖡦: صلاحيات البوت ↫ ⤈'..'\n𖡦: تغيير المعلومات ↫ '..change_info..'\n𖡦: تثبيت الرسائل ↫ '..pin_messages..'\n𖡦: اضافة مستخدمين ↫ '..invite_users..'\n𖡦: مسح الرسائل ↫ '..delete_messages..'\n𖡦: حظر المستخدمين ↫ '..restrict_members..'\n𖡦: اضافة المشرفين ↫ '..promote..'\n\n'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^تنظيف (%d+)$') then
local NumMessage = text:match('^تنظيف (%d+)$')
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
if tonumber(NumMessage) > 1000 then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: العدد اكثر من ‹ *1000* › لا تستطيع الحذف',"md",true)  end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
var(deleteMessages)
Message = Message - 1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "𖡦: تم تنظيف ‹ "..NumMessage.. ' › من الرسائل', 'md') end
if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if UserName[1] == "مطور اساسي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖡦: تم تنزيله مطور اساسي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖡦: تم تنزيله مطور اساسي *").Reply,"md",true) end end
if UserName[1] == "مطور ثانوي" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖡦: تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖡦: تم تنزيله مطور ثانوي *").Reply,"md",true) end end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله مطور ").Reply,"md",true) end end
if UserName[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله مالك ").Reply,"md",true) end end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if UserName[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المنشئين ").Reply,"md",true) end end
if UserName[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المدراء ").Reply,"md",true) end end
if UserName[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من الادمنيه ").Reply,"md",true) end end
if UserName[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من منظف ").Reply,"md",true) end end
if UserName[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if TextMsg == 'مطور اساسي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور اساسي").Reply,"md",true) end end
if TextMsg == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور ثانوي").Reply,"md",true) end end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مطور ").Reply,"md",true) end end
if TextMsg == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله مالك ").Reply,"md",true) end end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if TextMsg == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المنشئين ").Reply,"md",true) end end
if TextMsg == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المدراء ").Reply,"md",true) end end
if TextMsg == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من الادمنيه ").Reply,"md",true) end end
if TextMsg == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من منظف ").Reply,"md",true) end end
if TextMsg == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if UserId[1] == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖡦: تم تنزيله مطور اساسي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖡦: تم تنزيله مطور اساسي *").Reply,"md",true) end end
if UserId[1] == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖡦: تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖡦: تم تنزيله مطور ثانوي *").Reply,"md",true) end end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم تنزيله مطور ").Reply,"md",true) end end
if UserId[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if not Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله مالك ").Reply,"md",true) end end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله منشئ اساسي ").Reply,"md",true) end end
if UserId[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المنشئين ").Reply,"md",true) end end
if UserId[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المدراء ").Reply,"md",true) end end
if UserId[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من الادمنيه ").Reply,"md",true) end end
if UserId[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من منظف بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من منظف ").Reply,"md",true) end end
if UserId[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم تنزيله من المميزين ").Reply,"md",true) end end end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if UserName[1] == "مطور اساسي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور اساسي").Reply,"md",true) end end
if UserName[1] == "مطور ثانوي" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور ثانوي").Reply,"md",true) end end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مطور ").Reply,"md",true) end end
if UserName[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه مالك ").Reply,"md",true) end end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if UserName[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if UserName[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if UserName[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if UserName[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه منظف بالتأكيد").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المنظفين").Reply,"md",true) end end
if UserName[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if TextMsg == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور اساسي").Reply,"md",true) end end
if TextMsg == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور ثانوي").Reply,"md",true) end end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مطور ").Reply,"md",true) end end
if TextMsg == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه مالك ").Reply,"md",true) end end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if TextMsg == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if TextMsg == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if TextMsg == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if TextMsg == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه منظف بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المنظفين ").Reply,"md",true) end end
if TextMsg == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if UserId[1] == 'مطور اساسي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersAS:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور اساسي").Reply,"md",true) end end
if UserId[1] == 'مطور ثانوي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور ثانوي").Reply,"md",true) end end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم رفعه مطور ").Reply,"md",true) end end
if UserId[1] == "مالك" then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه مالك ").Reply,"md",true) end end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true) end end
if UserId[1] == "منشئ" then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المنشئين  ").Reply,"md",true) end end
if UserId[1] == "مدير" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المدراء  ").Reply,"md",true) end end
if UserId[1] == "ادمن" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة الادمنية  ").Reply,"md",true) end end
if UserId[1] == "منظف" then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه منظف بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Cleaner:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المنظفين ").Reply,"md",true) end end
if UserId[1] == "مميز" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:SetId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل (الرفع) من قبل المنشئين","md",true) end 
if Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId[2]) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖡦: تم رفعه في قائمة المميزين  ").Reply,"md",true) end end end
if text and text:match("^تغير رد المطور (.*)$") then
local Teext = text:match("^تغير رد المطور (.*)$") 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:set(TheSmile.."Smile:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد المطور الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ الاساسي (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
Redis:set(TheSmile.."Smile:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المنشئ (.*)$") 
Redis:set(TheSmile.."Smile:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغير رد المدير (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المدير (.*)$") 
Redis:set(TheSmile.."Smile:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد المدير الى :"..Teext)
elseif text and text:match("^تغير رد الادمن (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد الادمن (.*)$") 
Redis:set(TheSmile.."Smile:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد الادمن الى :"..Teext)
elseif text and text:match("^تغير رد المميز (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد المميز (.*)$") 
Redis:set(TheSmile.."Smile:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد المميز الى :"..Teext)
elseif text and text:match("^تغير رد العضو (.*)$") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local Teext = text:match("^تغير رد العضو (.*)$") 
Redis:set(TheSmile.."Smile:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغير رد العضو الى :"..Teext)
elseif text == 'حذف رد المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حدف رد المطور")
elseif text == 'حذف رد المنشئ الاساسي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد المنشئ الاساسي ")
elseif text == 'حذف رد المنشئ' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد المنشئ ")
elseif text == 'حذف رد المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد المدير ")
elseif text == 'حذف رد الادمن' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد الادمن ")
elseif text == 'حذف رد المميز' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد المميز")
elseif text == 'حذف رد العضو' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
Redis:del(TheSmile.."Smile:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف رد العضو") end
if text == 'المطورين الاساسين' or text == 'المطورين الاساسيين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersAS:Groups") 
local marlow = Redis:scard(TheSmile.."Smile:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المطورين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين : '..marlow..' ›', data = msg.sender.user_id..'/DevelopersAS'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersQ:Groups") 
local marlow = Redis:scard(TheSmile.."Smile:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين ثانويين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المطورين الثانويين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الثانويين : '..marlow..' ›', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المطورين' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Developers:Groups") 
local marlow = Redis:scard(TheSmile.."Smile:Developers:Groups")  
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة مطورين البوت ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المطورين : '..marlow..' ›', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المالكين' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: لا يوجد مالكين في البوت *","md",true)  end
ListMembers = '\n*𖡦: قائمة المالكين في البوت ↫ ⤈*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المالكين : '..marlow..' ›', data = msg.sender.user_id..'/TheBasicsQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنشئين الاساسيين' or text == 'المنشئين الاساسين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد منشئين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المنشئين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين : '..marlow..' ›', data = msg.sender.user_id..'/TheBasics'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنشئين' then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Originators:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:Originators:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد منشئين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المنشئين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المنشئين : '..marlow..' ›', data = msg.sender.user_id..'/Originators'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المدراء' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Managers:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مدراء حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المدراء في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المدراء : '..marlow..' ›', data = msg.sender.user_id..'/Managers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Addictive:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:Addictive:Group"..msg_chat_id)
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد ادمنيه حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة الادمنيه في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الادمنيه : '..marlow..' ›', data = msg.sender.user_id..'/Addictive'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المنظفين' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Cleaner:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:Cleaner:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مدراء منظفين , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المنظفين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المنظفين : '..marlow..' ›', data = msg.sender.user_id..'/Cleaner'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المميزين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Distinguished:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مميزين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المميزين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المميزين : '..marlow..' ›', data = msg.sender.user_id..'/DelDistinguished'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'قائمة عام' or text == 'قائمة العام' or text == 'قائمه عام' or text == 'قائمه العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
if #Info_Members == 0 then
ListMembers = '*𖡦: لا يوجد محظورين عام حالياً\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*'
else
ListMembers = '*𖡦: قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
end
local Info_Memberss = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Memberss == 0 then
ListMemberss = '*𖡦: لا يوجد مكتومين عام حالياً\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*'
else
ListMemberss = '*𖡦: قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Memberss) do
local User_Info = LuaTele.getUser(v)
if User_Info and User_Info.username and User_Info.username ~= "" then
ListMemberss = ListMemberss.."*"..k.." - *[@"..User_Info.username.."](tg://user?id="..v..")\n"
else
ListMemberss = ListMemberss.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح قائمة العام ›', data = msg.sender.user_id..'/BanAllktm'},},}}
return LuaTele.sendText(msg_chat_id, msg_id,''..ListMembers..'\n'..ListMemberss..'', 'md', false, false, false, false, reply_markup) end
if text == 'المحظورين عام' or text == 'المحظورين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
local marlow = Redis:scard(TheSmile.."Smile:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين عام حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين عام : '..marlow..' ›', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المكتومين عام' or text == 'المكتومين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
local marlow = Redis:scard(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين عام حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين عام : '..marlow..' ›', data = msg.sender.user_id..'/ktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المحظورين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanGroup:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المحظورين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين : '..marlow..' ›', data = msg.sender.user_id..'/BanGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == 'المكتومين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id) 
local marlow = Redis:scard(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المكتومين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين : '..marlow..' ›', data = msg.sender.user_id..'/SilentGroupGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
-- marlow
if text == 'عدد الكروب' or text == 'عدد المجموعه' or text == 'عدد المجموعة' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: المجموعه ↫ ❨ '..Get_Chat.title..' ❩\n𖡦: الايدي ↫ ❨ `'..msg_chat_id..'` ❩\n𖡦: عدد الاعضاء ↫ ❨ *'..Info_Chats.member_count..'* ❩\n𖡦: عدد الادمنيه ↫ ❨ *'..Info_Chats.administrator_count..'* ❩\n𖡦: عدد المقيدين ↫ ❨ *'..Info_Chats.restricted_count..'* ❩\n𖡦: عدد المطرودين ↫ ❨ *'..Info_Chats.banned_count..'* ❩\n𖡦: عدد رسائل المجموعه ↫ ❨ *'..(msg.id/2097152/0.5)..'* ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n',"md",true) end
-- marlow
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if TextMsg == 'اوامر التسليه' then
Redis:set(TheSmile.."Smile:Status:distraction10"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction9"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction8"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction7"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction6"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction5"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction4"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction3"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction2"..msg_chat_id,true) 
Redis:set(TheSmile.."Smile:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل اوامر التسليه *").unLock,"md",true) end
if TextMsg == 'غنيلي' then
Redis:set(TheSmile.."Smile:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر غنيلي *").unLock,"md",true) end
if TextMsg == 'متحركه' then
Redis:set(TheSmile.."Smile:Status:distraction2"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر متحركه *").unLock,"md",true) end
if TextMsg == 'شعر' then
Redis:set(TheSmile.."Smile:Status:distraction3"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر شعر *").unLock,"md",true) end
if TextMsg == 'فلم' then
Redis:set(TheSmile.."Smile:Status:distraction4"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر شعر *").unLock,"md",true) end
if TextMsg == 'صوره' then
Redis:set(TheSmile.."Smile:Status:distraction5"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر صوره *").unLock,"md",true) end
if TextMsg == 'اغنيه' then
Redis:set(TheSmile.."Smile:Status:distraction6"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر اغنيه *").unLock,"md",true) end
if TextMsg == 'انمي' then
Redis:set(TheSmile.."Smile:Status:distraction7"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر انمي *").unLock,"md",true) end
if TextMsg == 'ريمكس' then
Redis:set(TheSmile.."Smile:Status:distraction8"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر ريمكس *").unLock,"md",true) end
if TextMsg == 'ميمز' then
Redis:set(TheSmile.."Smile:Status:distraction9"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر ميمز *").unLock,"md",true) end
if TextMsg == 'مسلسل' then
Redis:set(TheSmile.."Smile:Status:distraction10"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر مسلسل *").unLock,"md",true) end
if TextMsg == 'الرابط' then
Redis:set(TheSmile.."Smile:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الرابط *").unLock,"md",true) end
if TextMsg == 'الترحيب' then
Redis:set(TheSmile.."Smile:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الترحيب* ").unLock,"md",true) end
if TextMsg == 'الايدي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الايدي *").unLock,"md",true) end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الايدي بالصوره* ").unLock,"md",true) end
if TextMsg == 'ردود المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل ردود المدير *").unLock,"md",true) end
if TextMsg == 'ردود المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل ردود المطور *").unLock,"md",true) end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الحظر , الطرد , التقييد *").unLock,"md",true) end
if TextMsg == 'الرفع' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الرفع *").unLock,"md",true) end
if TextMsg == 'الالعاب' then
Redis:set(TheSmile.."Smile:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل الالعاب *").unLock,"md",true) end
if TextMsg == 'اطردني' then
Redis:set(TheSmile.."Smile:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل اطردني *").unLock,"md",true) end
if TextMsg == 'صورتي' then
Redis:set(TheSmile.."Smile:Status:photo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر صورتي *").unLock,"md",true) end
if TextMsg == 'كول' then
Redis:set(TheSmile.."Smile:Status:kool"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل امر كول *").unLock,"md",true) end
if TextMsg == 'جمالي' then
Redis:set(TheSmile.."Smile:Status:gamle"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل جمالي *").unLock,"md",true) end
if TextMsg == 'ردود السورس' then
Redis:set(TheSmile.."Smile:rb:bna"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦:  تم تفعيل ردود السورس ","md",true)
end
if TextMsg == 'نزلني' then
Redis:set(TheSmile.."Smile:Status:remMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل نزلني *").unLock,"md",true) end
if TextMsg == 'البوت الخدمي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل البوت الخدمي *").unLock,"md",true) end
if TextMsg == 'التواصل' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تفعيل التواصل داخل البوت* ").unLock,"md",true) end end
-- marlow
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd0'},},}}
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheSmile.."Smile1:List:Rd:Sudo"..msg.chat_id, text)
return LuaTele.sendText(msg_chat_id,msg_id, '\n𖡦: تم حفظ الكلمة \n𖡦: الان ارسل الرد رقم ↫ ‹ 1 ›', "md", false, false, false, false, reply_markup) end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile1:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text3'..text..msg.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text4'..text..msg.chat_id)
Redis:del(TheSmile.."Smile1:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheSmile.."Smile1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف الرد من ردود المتعدده") end end
if text == "اضف رد متعدد" then    
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerdManagers'},},}}
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الكلمة التي تريد اضافتها", "md", false, false, false, false, reply_markup) end
if text == "حذف رد متعدد" then    
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closedeleterd'},},}}
Redis:set(TheSmile.."Smile1:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لحذفها ", "md", false, false, false, false, reply_markup) end
if text then  
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 1 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 1 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 2 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 2 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 2 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 3 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 3 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 4 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd3" then
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd4')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile1:Add:Rd:Sudo:Text3"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 4 من الردود ›', data = msg.sender.user_id..'/closerdcl'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddel'},},
}}
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 2 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd4" then
Redis:set(TheSmile.."Smile1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd5')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile1:Add:Rd:Sudo:Text4"..test..msg.chat_id, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/delrdmarlowR'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حفظ ‹ 5 › من الردود للكلمة ↫ ‹ '..test..' ›', "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then
local Text = Redis:get(TheSmile.."Smile1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(TheSmile.."Smile1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(TheSmile.."Smile1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
local Text3 = Redis:get(TheSmile.."Smile1:Add:Rd:Sudo:Text3"..text..msg.chat_id)   
local Text4 = Redis:get(TheSmile.."Smile1:Add:Rd:Sudo:Text4"..text..msg.chat_id)   
if Text or Text1 or Text2 or Text3 or Text4 then 
local texting = {
Text,
Text1,
Text2,
Text3,
Text4
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes]) end end
-- marlow
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerd0bot'},},}}
LuaTele.sendText(msg_chat_id,msg_id, '\n𖡦: تم حفظ الكلمة \n𖡦: الان ارسل الرد رقم ↫ ‹ 1 ›', "md", false, false, false, false, reply_markup)
Redis:set(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheSmile.."Smile11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheSmile.."Smile11:List:Rd:Sudo", text)
return false end end
if text and text:match("^(.*)$") then
if Redis:get(TheSmile.."Smile11:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف الرد من ردود المتعدده")
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text'..text)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text1'..text)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text2'..text)
Redis:del(TheSmile.."Smile11:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheSmile.."Smile11:List:Rd:Sudo", text)
return false end end
if text == "اضف رد متعدد عام" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closerdControllerBot'},},}}
Redis:set(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته", "md", false, false, false, false, reply_markup) end
if text == "حذف رد متعدد عام" then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closedeleterdbot'},},}}
Redis:set(TheSmile.."Smile11:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لحذفها ", "md", false, false, false, false, reply_markup) end
if text then  
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile11:Add:Rd:Sudo:Text"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 1 من الردود ›', data = msg.sender.user_id..'/closerdclbot'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddelbot'},},
}}
 LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 1 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 2 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile11:Add:Rd:Sudo:Text1"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ انهاء وحفظ 2 من الردود ›', data = msg.sender.user_id..'/closerdclbot'},},{{text = '‹ الغاء وحذف التخزين ›', data = msg.sender.user_id..'/closerddelbot'},},
}}
 LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حفظ الرد رقم ↫ ‹ 2 ›\n𖡦: الان ارسل الرد رقم ↫ ‹ 3 ›", "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then  
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheSmile.."Smile11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSmile.."Smile11:Add:Rd:Sudo:Text2"..test, text)  end  
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = 'حذف الرد ↫ ‹ '..test..' ›', data = msg.sender.user_id..'/delrdmarlowRbot'},},}}
 LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حفظ ‹ 3 › من الردود للكلمة ↫ ‹ '..test..' ›', "md", false, false, false, false, reply_markup)
return false  
end  
end
if text then
local Text = Redis:get(TheSmile.."Smile11:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(TheSmile.."Smile11:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(TheSmile.."Smile11:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes]) end end
-- marlow
if text == "تنظيف الميديا" or text == "مسح الميديا" then
LuaTele.sendText(msg.chat_id,msg.id,"*⌔︙يتم البحث عن الميديا*","md",true)  
msgid = (msg.id - (1048576*250))
y = 0
r = 1048576
for i=1,250 do
r = r + 1048576
Delmsg = LuaTele.getMessage(msg.chat_id,msgid + r)
if Delmsg and Delmsg.content and Delmsg.content.luatele ~= "messageText" then
LuaTele.deleteMessages(msg.chat_id,{[1]= Delmsg.id}) 
y = y + 1
end
end
if y == 0 then 
t = "*⌔︙لم يتم العثور على ميديا ضمن 250 رساله السابقه*"
else
t = "*⌔︙تم حذف ( "..y.." ) من الميديا *"
end
return LuaTele.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender.user_id,t).Repbn,"md",true)  
end
-- marlow
if text and text:match("^عدد المسح (%d+)$") and msg.Cleaner then
local NumMessage = text:match("^عدد المسح (%d+)$")
if tonumber(NumMessage) > 1000 then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: يجب ان يكون العدد اقل من ‹* 1000 *›',"md",true)  end
if tonumber(NumMessage) < 10 then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: يجب ان يكون العدد اكثر من ‹* 10 *›',"md",true)  end
Redis:set(TheSmile..'Smile:Num:Add:Bot'..msg_chat_id,text:match("عدد المسح (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم تعيين عدد المسح الى ↫ ‹ *'..text:match("عدد المسح (%d+)$")..'* › ',"md",true)  end
--
if text == "عدد المسح" and msg.Cleaner then
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد المسح الحالي ↫ ‹ *'..(Redis:get(TheSmile..'Smile:Num:Add:Bot'..msg_chat_id) or 150)..'* › ',"md",true)  end
-- 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo or msg.content.video_sticker then      
Redis:sadd(TheSmile.."Smile:allM"..msg.chat_id, msg.id)
if Redis:get(TheSmile.."Smile:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(TheSmile.."Smile:allM"..msg.chat_id)  
if gmedia >= tonumber((Redis:get(TheSmile..'Smile:Num:Add:Bot'..msg_chat_id) or 150)) then
local liste = Redis:smembers(TheSmile.."Smile:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "𖡦: تم مسح ‹ "..k.." › من الوسائط تلقائيا\n𖡦: لتعطيل الميزه ارسل ( `تعطيل التلقائي` )"
LuaTele.deleteMessages(msg.chat_id,{[1]= Mesge}) end end
LuaTele.sendText(msg_chat_id,msg_id,t,"md",true) 
Redis:del(TheSmile.."Smile:allM"..msg.chat_id) end end
end
if text == ("امسح") and msg.Cleaner then  
local list = Redis:smembers(TheSmile.."Smile:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "𖡦: تم حذف ‹ "..k.." › من الميديا"
LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(TheSmile.."Smile:allM"..msg.chat_id) end end
if #list == 0 then
t = "𖡦: لا توجد ميديا في المجموعة"
end
 LuaTele.sendText(msg_chat_id,msg_id, t) end
if text == "عدد الميديا" and msg.Cleaner or text == "الميديا" and msg.Cleaner then  
local gmria = Redis:scard(TheSmile.."Smile:allM"..msg.chat_id)  
if gmria == 0 then
LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: عدد الميديا ↫ *‹* "..gmria.." *›","md")
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ امسح ›', data = msg.sender.user_id..'/MsHmarlow'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: عدد الميديا ↫ *‹* "..gmria.." *›","md",false, false ,false, false, reply_markup) end end
if text == "تعطيل المسح التلقائي" and msg.Cleaner or text == "تعطيل التلقائي" and msg.Cleaner then
Redis:del(TheSmile.."Smile:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم تعطيل المسح التلقائي للميديا')
return false end 
if text == "تفعيل المسح التلقائي" and msg.Cleaner or text == "تفعيل التلقائي" and msg.Cleaner then
Redis:set(TheSmile.."Smile:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم تفعيل المسح التلقائي للميديا')
return false end 
if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if TextMsg == 'اوامر التسليه' then
Redis:del(TheSmile.."Smile:Status:distraction10"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction9"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction8"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction7"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction6"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction5"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction4"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction3"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction2"..msg_chat_id,true) 
Redis:del(TheSmile.."Smile:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل اوامر التسليه *").unLock,"md",true) end
if TextMsg == 'غنيلي' then
Redis:del(TheSmile.."Smile:Status:distraction1"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر غنيلي *").unLock,"md",true) end
if TextMsg == 'متحركه' then
Redis:del(TheSmile.."Smile:Status:distraction2"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر متحركه *").unLock,"md",true) end
if TextMsg == 'شعر' then
Redis:del(TheSmile.."Smile:Status:distraction3"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر شعر *").unLock,"md",true) end
if TextMsg == 'فلم' then
Redis:del(TheSmile.."Smile:Status:distraction4"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر شعر *").unLock,"md",true) end
if TextMsg == 'صوره' then
Redis:del(TheSmile.."Smile:Status:distraction5"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر صوره *").unLock,"md",true) end
if TextMsg == 'اغنيه' then
Redis:del(TheSmile.."Smile:Status:distraction6"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر اغنيه *").unLock,"md",true) end
if TextMsg == 'انمي' then
Redis:del(TheSmile.."Smile:Status:distraction7"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر انمي *").unLock,"md",true) end
if TextMsg == 'ريمكس' then
Redis:del(TheSmile.."Smile:Status:distraction8"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر ريمكس *").unLock,"md",true) end
if TextMsg == 'ميمز' then
Redis:del(TheSmile.."Smile:Status:distraction9"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر ميمز *").unLock,"md",true) end
if TextMsg == 'مسلسل' then
Redis:del(TheSmile.."Smile:Status:distraction10"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر مسلسل *").unLock,"md",true) end
if TextMsg == 'الرابط' then
Redis:del(TheSmile.."Smile:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الرابط *").unLock,"md",true) end
if TextMsg == 'الترحيب' then
Redis:del(TheSmile.."Smile:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الترحيب *").unLock,"md",true) end
if TextMsg == 'الايدي' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الايدي *").unLock,"md",true) end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الايدي بالصورة *").unLock,"md",true) end
if TextMsg == 'ردود المدير' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل ردود المدير *").unLock,"md",true) end
if TextMsg == 'ردود المطور' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل ردود المطور *").unLock,"md",true) end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الحظر , الطرد , التقييد *").unLock,"md",true) end
if TextMsg == 'الرفع' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الرفع *").unLock,"md",true) end
if TextMsg == 'الالعاب' then
Redis:del(TheSmile.."Smile:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل الالعاب *").unLock,"md",true) end
if TextMsg == 'اطردني' then
Redis:del(TheSmile.."Smile:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل اطردني *").unLock,"md",true) end
if TextMsg == 'صورتي' then
Redis:del(TheSmile.."Smile:Status:photo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر صورتي *").unLock,"md",true) end
if TextMsg == 'كول' then
Redis:del(TheSmile.."Smile:Status:kool"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل امر كول *").unLock,"md",true) end
if TextMsg == 'جمالي' then
Redis:del(TheSmile.."Smile:Status:gamle"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل جمالي *").unLock,"md",true) end
if TextMsg == 'ردود السورس' then
Redis:del(TheSmile.."Smile:rb:bna"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦:  تم تعطيل ردود السورس","md",true)
end
if TextMsg == 'نزلني' then
Redis:del(TheSmile.."Smile:Status:remMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل نزلني *").unLock,"md",true) end
if TextMsg == 'البوت الخدمي' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل البوت الخدمي *").unLock,"md",true) end
if TextMsg == 'التواصل' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم تعطيل التواصل داخل البوت*").unLock,"md",true) end

end
if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام (%d+)$') then
local UserId = text:match('^الغاء حظر عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام @(%S+)$') then
local UserName = text:match('^الغاء حظر عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء كتمه عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء كتمه عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره من المجموعة ").Reply,"md",true) end end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusSilent(msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  end
if Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه في المجموعة  ").Reply,"md",true) end end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تقييده في المجموعة \n𖡦: لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  end
if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تقييده في المجموعة \n𖡦: لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  end
if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$')}
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId[3]).." › ","md",true)  end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n𖡦: تم تقييده في المجموعة \n𖡦: لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تقييده في المجموعة ").Reply,"md",true)  end
if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم طرده من المجموعة ").Reply,"md",true)  end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم حظره عام من المجموعات ").Reply,"md",true) end end
if text == "الغاء العام" and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) and not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) 
Redis:srem(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text == "الغاء حظر عام" and msg.reply_to_message_id ~= 0 or text == "الغاء الحظر عام" and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if ban and ban.type and ban.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  end
if Redis:sismember(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text == "الغاء الكتم العام" and msg.reply_to_message_id ~= 0 or text == "الغاء الكتم عام" and msg.reply_to_message_id ~= 0 or text == "الغاء كتم عام" and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if ban and ban.type and ban.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم حظره من المجموعة ").Reply,"md",true) end end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusSilent(msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  end
if Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم كتمه في المجموعة  ").Reply,"md",true) end end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً لا تستطيع  ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تقييده في المجموعة ").Reply,"md",true)  end
if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم طرده من المجموعة ").Reply,"md",true)  end
if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:ktmAll:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId) and not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId) 
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) and not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء ( الحظر • الكتم ) العام عنه").Reply,"md",true) end end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم حظره من المجموعة ").Reply,"md",true) end end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره من المجموعة  ").Reply,"md",true) end end
if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusSilent(msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً لا تستطيع كتم ↫ ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  end
if Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم كتمه في المجموعة  ").Reply,"md",true) end end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء كتمه من المجموعة ").Reply,"md",true) end end
if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع تقييد ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم تقييده في المجموعة ").Reply,"md",true)  end
if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء تقييده من المجموعة").Reply,"md",true)  end
if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if not msg.Originators and not Redis:get(TheSmile.."Smile:Status:BanId"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل ( الحظر • الطرد • التقييد ) من قبل المدراء","md",true) end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if StatusCanOrNotCan(msg_chat_id,UserId) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع طرد ↫ ‹ "..Controller(msg_chat_id,UserId).." › ","md",true)  end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم طرده من المجموعة ").Reply,"md",true)  end
if text == 'ادمنيه الكروب' or text == 'ادمنية الكروب' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
listAdmin = '\n*𖡦: قائمة الادمنيه المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '↬ *‹ المالك ›*'
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin.."*"..k.." - @"..UserInfo.username.."* "..Creator.."\n"
else
listAdmin = listAdmin.."*"..k.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n" end end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  end
if text == 'رفع الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSmile.."Smile:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(TheSmile.."Smile:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1 end end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: تم ترقيه ‹ '..y..' › من الادمنيه *',"md",true)  end
if text == 'المالك' or text == 'المنشئ' then
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: ︙عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(itsEssen..'Essen:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: حساب المنشئ محذوف*","md",true)  
return false end 
local photo = LuaTele.getUserProfilePhotos(UserInfo.id)
local InfoUser = LuaTele.getUserFullInfo(UserInfo.id)
local OwnText = Redis:get(TheSmile..'Smile:Owner:OwnerTheSmile'..msg_chat_id)
if not msg.ControllerBot then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local User_Info = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(User_Info.first_name, "[^%s]+" ) do
User_Info.first_name = Name_User
break
end
if User_Info.username then
marlow = '['..User_Info.first_name..'](t.me/'..User_Info.username..')'
else
marlow = '['..User_Info.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(UserInfo.id,0,"𖡦: عزيزي المالك هناك من بحاجه الى مساعده ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الشخص ↫ "..marlow.."\n𖡦: رابط المجموعة ↫ ⤈ \n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ "..os.date("%I:%M%p").."\n𖡦: التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local OwnMarkdown = "["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")"
if OwnText then
if UserInfo.username then
OwnUser = '@'..UserInfo.username
else
OwnUser = 'لا يوجد'
end
OwnText = OwnText:gsub('NameGr',Get_Chat.title) 
OwnText = OwnText:gsub('OwnName',OwnMarkdown) 
OwnText = OwnText:gsub('OwnUser',OwnUser) 
OwnText = OwnText:gsub('OwniD',UserInfo.id) 
OwnText = OwnText:gsub('OwnBio',Bio) 
if photo.total_count > 0 then
keyboardd = {} 
keyboardd.inline_keyboard = {{{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""}},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(OwnText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(OwnText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") end
else
if photo.total_count > 0 then
local TestText = "𖡦: *Owner Name* ↬  ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n𖡦: *Owner User* ↬ @"..UserInfo.username.."\n𖡦: *Owner iD* ↬ "..UserInfo.id..""
keyboardd = {} 
keyboardd.inline_keyboard = {{{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""}},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "❲ Owner Group ❳\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: *Owner Name* :  ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n𖡦: *Owner User* : @"..UserInfo.username.."\n𖡦: *Owner iD* : "..UserInfo.id..""
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") end end end end
end
if text == 'كشف البوتات' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*𖡦: قائمة البوتات ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '↬ *‹ ادمن ›*'
else
Admin = ""
end
listBots = listBots.."*"..k.." - @"..UserInfo.username.."* "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: عدد البوتات التي هي ادمن ‹ "..x.." ›*","md",true)  end
if text == 'المقيدين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n*𖡦: قائمة المقيديين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." - @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n" end end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true) end end
if text == 'تاك للكل' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*𖡦: قائمة الاعضاء ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n" end end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  end
if text == "قفل الفشار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Fshar"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفشار في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الطائفيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Taf"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الطائفيه في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الكفر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Kfr"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكفر في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الفارسيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Farsi"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفارسيه في المجموعة").Lock,"md",true)  
return false end 
if text == "قفل الدردشه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الدردشه").Lock,"md",true)  
return false end 
if text == "قفل الاضافه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل اضافة الاعضاء").Lock,"md",true)  
return false end 
if text == "قفل الدخول" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل دخول الاعضاء").Lock,"md",true)  
return false end 
if text == "قفل البوتات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل البوتات").Lock,"md",true)  
return false end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل البوتات").lockKick,"md",true)  
return false end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(TheSmile.."Smile:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الاشعارات").Lock,"md",true)  
return false end 
if text == "قفل التثبيت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(TheSmile.."Smile:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التثبيت هنا").Lock,"md",true)  
return false end 
if text == "قفل التعديل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل تعديل").Lock,"md",true)  
return false end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:set(TheSmile.."Smile:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل تعديل").Lock,"md",true)  
return false end 
if text == "قفل الكل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:set(TheSmile.."Smile:Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(TheSmile..'Smile:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل جميع الاوامر").Lock,"md",true)  
return false end 


--------------------------------------------------------------------------------------------------------------
if text == "تعطيل الزخرفه" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if Redis:get(TheSmile.."Smile:myzhrfa"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل امر الزخرفه مسبقا\n ✓',"md")
else
Redis:set(TheSmile.."Smile:myzhrfa"..msg.chat_id,"true")
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل الزخرفه \n ✓',"md")
end
end
if text == "تفعيل الزخرفه" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if not Redis:get(TheSmile.."Smile:myzhrfa"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر الزخرفه مسبقا\n ✓',"md")
else
Redis:del(TheSmile.."Smile:myzhrfa"..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر الزخرفه\n ✓',"md")
end
end
if text and text:match("^زخرفه (.*)$") and not Redis:get(TheSmile.."Smile:myzhrfa"..msg.chat_id) then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = io.popen('curl -s "https://apiabs.ml/zrf.php?abs='..URL.escape(TextZhrfa)..'"'):read('*a')
zx = JSON.decode(zh) 
t = "\n⌔︙قائمه الزخرفه \nٴ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  "..v.." \n"
end
return LuaTele.sendText(msg_chat_id,msg_id, t..'*ٴ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ٴ*\n⌔︙→  [‹ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ ›](t.me/SMILEXB) ',"md",true)
end

if text == "تعطيل الابراج" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if Redis:get(TheSmile.."brjj"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل امر الابراج مسبقا\n ✓',"md")
else
Redis:set(TheSmile.."brjj"..msg.chat_id,"true")
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل الابراج \n ✓',"md")
end
end
if text == "تفعيل الابراج" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if not Redis:get(TheSmile.."brjj"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر الابراج مسبقا\n ✓',"md")
else
Redis:del(TheSmile.."brjj"..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر الابراج\n ✓',"md")
end
end
if text and text:match("^برج (.*)$") and not Redis:get(TheSmile.."brjj"..msg.chat_id) then
local Textbrj = text:match("^برج (.*)$")
gk = io.popen('curl -s "https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'"'):read('*a')
br = JSON.decode(gk)
LuaTele.sendText(msg_chat_id,msg_id, br.ok.abs)
end 
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل اوامر النسب مسبقاً\n ✓',"md")
else
Redis:set(TheSmile.."Smile:amrthshesh"..msg.chat_id,"true")
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل اوامر النسب \n ✓',"md")
end
end
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل اوامر النسب مسبقاً\n ✓',"md")
else
Redis:del(TheSmile.."Smile:amrthshesh"..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل اوامر النسب\n ✓',"md")
end
end
if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '⌔︙الان ارسل اسمك واسم الشخص الثاني : مثال ← معتز و روز :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if Redis:get(TheSmile..":"..msg.sender.user_id..":lov_Bots"..msg.chat_id) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnum = num[math.random(#num)]
local tttttt = '⌔︙اليك النتائج الخـاصة :\n\n⌔︙نسبة الحب بيـن : ‹'..text..'› '..sendnum..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":lov_Bots"..msg.chat_id)
end

if text == "نسبه الغباء" or text == "نسبه الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '⌔︙الان ارسل اسم الشخص :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if Redis:get(TheSmile..":"..msg.sender.user_id..":lov_Bottts"..msg.chat_id) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnum = num[math.random(#num)]
local tttttt = '⌔︙اليك النتائج الخـاصة :\n\n⌔︙نسبة الغباء  : ‹'..text..'› '..sendnum..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":lov_Bottts"..msg.chat_id)
end

if text == "نسبه الذكاء" or text == "نسبه الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '⌔︙الان ارسل اسم الشخص :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if Redis:get(TheSmile..":"..msg.sender.user_id..":lov_Botttuus"..msg.chat_id) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnum = num[math.random(#num)]
local tttttt = '⌔︙اليك النتائج الخـاصة :\n\n⌔︙نسبة الذكاء  : ‹'..text..'› '..sendnum..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":lov_Botttuus"..msg.chat_id)
end

if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '⌔︙الان ارسل اسمك واسم الشخص الثاني : مثال ← معتز و روز :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if text and Redis:get(TheSmile..":"..msg.sender.user_id..":krh_Bots"..msg.chat_id) == "sendkrhe" then
num = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnum = num[math.random(#num)]
local tttttt = '⌯ اليك النتائج الخـاصة :\n\n⌯ نسبه الكرة : ‹'..text..'› '..sendnum..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":krh_Bots"..msg.chat_id)
end

if text == "نسبه الرجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '⌔︙الان ارسل اسم الشخص :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if text and text ~="نسبه الرجوله" and Redis:get(TheSmile..":"..msg.sender.user_id..":rjo_Bots"..msg.chat_id) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '⌔︙اليك النتائج الخـاصة :\n\n⌔︙ نسبة الرجوله لـ : ‹'..text..'› '..sendnuj..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":rjo_Bots"..msg.chat_id)
end

if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:amrthshesh"..msg.chat_id) then    
Redis:set(TheSmile..":"..msg.sender.user_id..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '⌔︙الان ارسل اسم الشخص :'
LuaTele.sendText(msg_chat_id,msg_id,hggg) 
return false
end
end
if text and text ~="نسبه الانوثه" and Redis:get(TheSmile..":"..msg.sender.user_id..":ano_Bots"..msg.chat_id) == "sendanoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '⌔︙اليك النتائج الخـاصة :\n\n⌔︙ نسبه الانوثة لـ : ‹'..text..'› '..sendnuj..'%'
LuaTele.sendText(msg_chat_id,msg_id,tttttt) 
Redis:del(TheSmile..":"..msg.sender.user_id..":ano_Bots"..msg.chat_id)
end
if text == "تعطيل معاني الاسماء" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if Redis:get(TheSmile.."Smile:name:k"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل معاني الاسماء مسبقا\n ✓',"md")
else
Redis:set(TheSmile.."Smile:name:k"..msg.chat_id,"true")
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل معاني الاسماء \n ✓',"md")
end
end
if text == "تفعيل معاني الاسماء" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if not Redis:get(TheSmile.."Smile:name:k"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل معاني الاسماء مسبقا\n ✓',"md")
else
Redis:del(TheSmile.."Smile:name:k"..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر معاني الاسماء\n ✓',"md")
end
end
if text and text:match("^معنى اسم (.*)$") and not Redis:get(TheSmile.."Smile:name:k"..msg.chat_id) then 
local TextMean = text:match("^معنى اسم (.*)$")
UrlMean = io.popen('curl -s "https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)..'"'):read('*a')
Mean = JSON.decode(UrlMean) 
LuaTele.sendText(msg_chat_id,msg_id, Mean.ok.abs)
end  
if text == "تعطيل حساب العمر" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if Redis:get(TheSmile.."Smile:calculate"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل امر حساب العمر مسبقا\n ✓',"md")
else
Redis:set(TheSmile.."Smile:calculate"..msg.chat_id,"true")
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تعطيل حساب العمر \n ✓',"md")
end
end
if text == "تفعيل حساب العمر" then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if not Redis:get(TheSmile.."Smile:calculate"..msg.chat_id)  then
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر حساب العمر مسبقا\n ✓',"md")
else
Redis:del(TheSmile.."Smile:calculate"..msg.chat_id)
LuaTele.sendText(msg_chat_id,msg_id, '⌔︙تم تفعيل امر حساب العمر\n ✓',"md")
end
end
if text and text:match("^احسب (.*)$") and not Redis:get(TheSmile.."Smile:calculate"..msg.chat_id) then
local Textage = text:match("^احسب (.*)$")
ge = io.popen('curl -s "https://apiabs.ml/age.php?age='..URL.escape(Textage)..'"'):read('*a')
ag = JSON.decode(ge)
LuaTele.sendText(msg_chat_id,msg_id, ag.ok.abs)
end  
--------------------------------------------------------------------------------------------------------------
if text == 'هاي' or text == 'هيي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*خالتڪك جࢪت وࢪانا 😹💕*',"md",true)  
end
if text == 'سلام عليكم' or text == 'السلام' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وعلڪم السلام 💕*',"md",true)  
end
if text == 'باي' or text == 'سيو' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وين خليڪك ويانۿہ 💘*',"md",true)  
end
if text == 'تحبني' or text == 'تحبيني' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اموت عليڪك يࢪوحي 🥺💘*',"md",true)  
end
if text == 'ها' or text == 'هاا' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وجـ؏ـاا شڪوو 😹💕*',"md",true)  
end
if text == 'هلاو' or text == 'هلا' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ههلا عمࢪيي انࢪت 💕*',"md",true)  
end
if text == 'نعم' or text == 'اي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ايي صحح 😐*',"md",true)  
end
if text == '🙄' or text == '🙄🙄' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*نزل عينڪك حبي 👀💘*',"md",true)  
end
if text == 'وين' or text == 'رايح' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*بـس ابول واجي 😹💘*',"md",true)  
end
if text == '😂' or text == '😂😂' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شۿلضحڪة يࢪبيي 💘😩*',"md",true)  
end
if text == '😹' or text == '😹' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شۿلضحڪة يࢪبيي 💘😩*',"md",true)  
end
if text == 'شونك' or text == 'شلونك' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*بخيࢪ حيليي وانتةة 😩💘*',"md",true)  
end
if text == 'انجب' or text == 'نجب' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*صاࢪ عمࢪيي 💘😩*',"md",true)  
end
if text == 'شبيك' or text == 'اشبيك' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*مابيۿ عمࢪيي 😩💘*',"md",true)  
end
if text == '😭' or text == '😭😭' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*منو وياڪك عمࢪي 🥺*',"md",true)  
end
if text == '🥺' or text == '🥺🥺' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ليش الححلو زعلان .؟ 💝*',"md",true)  
end
if text == '😒' or text == '😒😒' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عدل وجهڪك 😒🙄*',"md",true)  
end
if text == 'احبك' or text == 'حبق' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*موتبيڪك حيلي 😩💘*',"md",true)  
end
if text == 'مح' or text == 'محح' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عسلل يࢪوحي 💕🤤*',"md",true)  
end
if text == 'هلا' or text == 'هلو' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ههلا ڪلبي نوࢪت 💘*',"md",true)  
end
if text == 'فرخ' or text == 'كحبه' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وينة بلا خلي احصࢪة 🤤💘*',"md",true)  
end
if text == 'الحمد الله' or text == 'بخير الحمد الله' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عساا دوم يࢪوحي 🤧*',"md",true)  
end
if text == 'تفف' or text == 'تف' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اوفف عسلل ☺️💘*',"md",true)  
end
if text == 'خاص' or text == 'خ' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*هها شني اخذتها 👀💘*',"md",true)  
end
if text == 'صباح الخير' or text == 'مساء الخير' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وانت ڪل الخيࢪ حيلي ☺️💘*',"md",true)  
end
if text == 'بلش' or text == 'نتعرف' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*انيي بوت عمࢪي شوف لباقين 💕👀*',"md",true)  
end
if text == 'عسل' or text == 'عسلل' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*حلاتڪك حيلي 💝*',"md",true)  
end
if text == 'اه' or text == 'ااه' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عييب منا العالم ولڪك 😉😂*',"md",true)  
end
if text == 'ليش' or text == 'هايلش' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*بڪيفيي 🥳*',"md",true)  
end
if text == 'بوتي' or text == 'بوتيي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'شبيي بوتڪك 🙄😂',"md",true)  
end
if text == 'تعال' or text == 'تع' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ڪول حب 😩💕*',"md",true)  
end
if text == 'مانايم' or text == 'نعسان ' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*مشي ننام شعندڪك ڪاعد 💝👀*',"md",true)  
end
if text == 'منور' or text == 'نورت' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*نوࢪڪك يࢪوحي 🤤💝*',"md",true)  
end
if text == 'ضوجه' or text == 'ضايج' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ليش يڪلبي سولف 🥳💝*',"md",true)  
end
if text == 'ويت' or text == 'ويتت' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شنو هلثقافة يࢪبي 😉😂*',"md",true)  
end
if text == 'خخخ' or text == 'اخخ' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شبيڪك عمࢪيي منو وياك 🙄*',"md",true)  
end
if text == 'شكرا' or text == 'مرسي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*العفوو حيلي 🥳💕*',"md",true)  
end
if text == 'حلوه' or text == 'حلو' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ححلاة ويهڪك هذا 🤤💕*',"md",true)  
end
if text == 'بموت' or text == 'حموتت' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اسم الله عليڪك حيلي 💝*',"md",true)  
end
if text == 'وك' or text == 'كك' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'**',"md",true)  
end
if text == 'طيب' or text == 'تيب' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اوڪك حب 💝.*',"md",true)  
end
if text == '،' or text == '.' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*استغفࢪالله العضيم واتوب اليه 💝*',"md",true)  
end
if text == 'جيت' or text == 'اجيت' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ڪل الهلا ححيلي 🥳💕*',"md",true)  
end
if text == 'كافي' or text == 'كاافي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*تـم ححيلي 🤐*',"md",true)  
end
if text == 'حبيبي' or text == 'حبيبتي' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*هاا يࢪوحح مالتي 😩💘*',"md",true)  
end
if text == 'تمام' or text == 'تمم' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* ࢪبي يتمم عليڪك بالخيࢪ 💕🥳*',"md",true)  
end
if text == 'خلاص' or text == 'خلص' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اني شعليۿہ 🙄💕*',"md",true)  
end
if text == 'حبك' or text == 'احبك' then
if not Redis:get(TheSmile.."Smile:rb:bna"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اموت بيڪك يࢪوحي 🥳💘*',"md",true)  
end
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح اضافة الاعضاء").unLock,"md",true)  
return false end 
if text == "فتح الفشار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Fshar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الفشار في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الطائفيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Taf"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الطائفيه في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الكفر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Kfr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الكفر في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الفارسيه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Farsi"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الفارسيه في المجموعة").unLock,"md",true)  
return false end 
if text == "فتح الدردشه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الدردشه").unLock,"md",true)  
return false end 
if text == "فتح الدخول" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح دخول الاعضاء").unLock,"md",true)  
return false end 
if text == "فتح البوتات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح البوتات").unLock,"md",true)  
return false end 
if text == "فتح البوتات " then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح البوتات").unLock,"md",true)  
return false end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end  
Redis:del(TheSmile.."Smile:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الاشعارات").unLock,"md",true)  
return false end 
if text == "فتح التثبيت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح التثبيت هنا").unLock,"md",true)  
return false end 
if text == "فتح التعديل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح تعديل").unLock,"md",true)  
return false end 
if text == "فتح تعديل الميديا" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح تعديل").unLock,"md",true)  
return false end 
if text == "فتح الكل" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end 
Redis:del(TheSmile.."Smile:Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(TheSmile..'Smile:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*𖡦: تم فتح جميع الاوامر*").unLock,"md",true)  
return false end

if text == "@all" or text == "تاك عام" or text == "all" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then
tags = x + 5
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 5 or x == tags or k == 0 then
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
end
end


if text == "غنيلي" then
if not Redis:get(TheSmile.."Smile:Status:distraction1"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر غنيلي معطل","md",true) end 
Abs = math.random(4,2824); 
local Text ='𖡦: تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Song'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/AudiosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "متحركه" then
if not Redis:get(TheSmile.."Smile:Status:distraction2"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر متحركه معطل","md",true) end 
Abs = math.random(4,1075); 
local Text ='𖡦: تم اختيار المتحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/animation'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == "شعر" then
if not Redis:get(TheSmile.."Smile:Status:distraction3"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر شعر معطل","md",true) end 
Abs = math.random(4,140); 
local Text ='𖡦: تم اختيار الشعر لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/voice'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ميمز" then
if not Redis:get(TheSmile.."Smile:Status:distraction9"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر ميمز معطل","md",true) end 
Abs = math.random(4,1201); 
local Text ='𖡦: تم اختيار الميمز لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Memz'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ريمكس" or text == "ريماكس" then 
if not Redis:get(TheSmile.."Smile:Status:distraction8"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر ريمكس معطل","md",true) end 
Abs = math.random(4,612); 
local Text ='𖡦: تم اختيار ريمكس لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Remix'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "فلم" or text == "فيلم" then 
if not Redis:get(TheSmile.."Smile:Status:distraction4"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر فلم معطل","md",true) end 
Abs = math.random(4,125); 
local Text ='𖡦: تم اختيار الفلم لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Movies'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "انمي" or text == "انميي" then 
if not Redis:get(TheSmile.."Smile:Status:distraction7"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر انمي معطل","md",true) end 
Abs = math.random(4,1002); 
local Text ='𖡦: تم اختيار الانمي لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Anime'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اغنيه" or text == "اغنية" then
if not Redis:get(TheSmile.."Smile:Status:distraction6"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر اغنيه معطل","md",true) end 
Abs = math.random(4,1167); 
local Text ='𖡦: تم اختيار الاغنيه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Mp'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendAudio?chat_id=' .. msg.chat_id .. '&audio=https://t.me/DavidMp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "صوره" or text == "صورة" then
if not Redis:get(TheSmile.."Smile:Status:distraction5"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر صوره معطل","md",true) end 
Abs = math.random(4,1171); 
local Text ='𖡦: تم اختيار الصوره لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Photos'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "مسلسل" then
if not Redis:get(TheSmile.."Smile:Status:distraction10"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: عذراً امر مسلسل معطل","md",true) end 
Abs = math.random(4,54); 
local Text ='𖡦: تم اختيار المسلسل لك'
keyboardd = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = msg.sender.user_id..'/Series'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}
}
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--------------------------------------------------------------------------------------------------------------
if text == "تعطيل all" or text == "تعطيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(TheSmile.."Smile:lockalllll"..msg_chat_id,"off")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦:  تم قفـل @all هنا").Lock,"md",true)  
return false
end
if text == "تفعيل all" or text == "تفعيل @all" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(TheSmile.."Smile:lockalllll"..msg_chat_id,"on")
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦:  تم فتح @all هنا").Lock,"md",true)  
return false
end 
if text == "قفل القنوات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:set(TheSmile.."Smile:Lock:channell"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦:  تم قفـل القنوات").Lock,"md",true)  
return false
end
if text == "فتح القناه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n⌔︙هذا الامر للادمنية واعلى فقط',"md",true)  
end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "⌔︙عذراً لاتستطيع استخدام البوت !\n⌔︙عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup)
end
Redis:del(TheSmile.."Smile:Lock:channell"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦:  تم فتح القنوات").unLock,"md",true)  
return false
end 
if text == "قفل التكرار" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(TheSmile.."Smile:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(TheSmile.."Smile:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(TheSmile.."Smile:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hset(TheSmile.."Smile:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:hdel(TheSmile.."Smile:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح التكرار").unLock,"md",true)  end
if text == "قفل الروابط" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الروابط").Lock,"md",true)  
return false end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الروابط").lockKid,"md",true)  
return false end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الروابط").lockKtm,"md",true)  
return false end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الروابط").lockKick,"md",true)  
return false end 
if text == "فتح الروابط" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الروابط").unLock,"md",true)  
return false end 
if text == "قفل المعرفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المعرفات").Lock,"md",true)  
return false end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المعرفات").lockKid,"md",true)  
return false end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المعرفات").lockKtm,"md",true)  
return false end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المعرفات").lockKick,"md",true)  
return false end 
if text == "فتح المعرفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح المعرفات").unLock,"md",true)  
return false end 
if text == "قفل التاك" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التاك").Lock,"md",true)  
return false end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التاك").lockKid,"md",true)  
return false end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التاك").lockKtm,"md",true)  
return false end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التاك").lockKick,"md",true)  
return false end 
if text == "فتح التاك" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح التاك").unLock,"md",true)  
return false end 
if text == "قفل الشارحه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الشارحه").Lock,"md",true)  
return false end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الشارحه").lockKid,"md",true)  
return false end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الشارحه").lockKtm,"md",true)  
return false end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الشارحه").lockKick,"md",true)  
return false end 
if text == "فتح الشارحه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الشارحه").unLock,"md",true)  
return false end 
if text == "قفل الصور"then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصور").Lock,"md",true)  
return false end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصور").lockKid,"md",true)  
return false end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصور").lockKtm,"md",true)  
return false end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصور").lockKick,"md",true)  
return false end 
if text == "فتح الصور" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الصور").unLock,"md",true)  
return false end 
if text == "قفل الفيديو" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفيديو").Lock,"md",true)  
return false end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفيديو").lockKid,"md",true)  
return false end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفيديو").lockKtm,"md",true)  
return false end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الفيديو").lockKick,"md",true)  
return false end 
if text == "فتح الفيديو" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الفيديو").unLock,"md",true)  
return false end 
if text == "قفل المتحركه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المتحركه").Lock,"md",true)  
return false end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المتحركه").lockKid,"md",true)  
return false end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المتحركه").lockKtm,"md",true)  
return false end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل المتحركه").lockKick,"md",true)  
return false end 
if text == "فتح المتحركه" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح المتحركه").unLock,"md",true)  
return false end 
if text == "قفل الالعاب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الالعاب").Lock,"md",true)  
return false end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الالعاب").lockKid,"md",true)  
return false end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الالعاب").lockKtm,"md",true)  
return false end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الالعاب").lockKick,"md",true)  
return false end 
if text == "فتح الالعاب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الالعاب").unLock,"md",true)  
return false end 
if text == "قفل الاغاني" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الاغاني").Lock,"md",true)  
return false end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الاغاني").lockKid,"md",true)  
return false end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الاغاني").lockKtm,"md",true)  
return false end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الاغاني").lockKick,"md",true)  
return false end 
if text == "فتح الاغاني" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الاغاني").unLock,"md",true)  
return false end 
if text == "قفل الصوت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصوت").Lock,"md",true)  
return false end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصوت").lockKid,"md",true)  
return false end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصوت").lockKtm,"md",true)  
return false end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الصوت").lockKick,"md",true)  
return false end 
if text == "فتح الصوت" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الصوت").unLock,"md",true)  
return false end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكيبورد").Lock,"md",true)  
return false end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكيبورد").lockKid,"md",true)  
return false end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكيبورد").lockKtm,"md",true)  
return false end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكيبورد").lockKick,"md",true)  
return false end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الكيبورد").unLock,"md",true)  
return false end 
if text == "قفل الملصقات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملصقات").Lock,"md",true)  
return false end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملصقات").lockKid,"md",true)  
return false end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملصقات").lockKtm,"md",true)  
return false end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملصقات").lockKick,"md",true)  
return false end 
if text == "فتح الملصقات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الملصقات").unLock,"md",true)  
return false end 
if text == "قفل التوجيه" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التوجيه").Lock,"md",true)  
return false end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التوجيه").lockKid,"md",true)  
return false end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التوجيه").lockKtm,"md",true)  
return false end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل التوجيه").lockKick,"md",true)  
return false end 
if text == "فتح التوجيه" then 
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح التوجيه").unLock,"md",true)  
return false end 
if text == "قفل الملفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملفات").Lock,"md",true)  
return false end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملفات").lockKid,"md",true)  
return false end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملفات").lockKtm,"md",true)  
return false end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الملفات").lockKick,"md",true)  
return false end 
if text == "فتح الملفات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الملفات").unLock,"md",true)  
return false end 
if text == "قفل السيلفي" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل السيلفي").Lock,"md",true)  
return false end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل السيلفي").lockKid,"md",true)  
return false end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل السيلفي").lockKtm,"md",true)  
return false end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل السيلفي").lockKick,"md",true)  
return false end 
if text == "فتح السيلفي" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح السيلفي").unLock,"md",true)  
return false end 
if text == "قفل الماركداون" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الماركداون").Lock,"md",true)  
return false end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الماركداون").lockKid,"md",true)  
return false end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الماركداون").lockKtm,"md",true)  
return false end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الماركداون").lockKick,"md",true)  
return false end 
if text == "فتح الماركداون" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الماركداون").unLock,"md",true)  
return false end 
if text == "قفل الجهات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الجهات").Lock,"md",true)  
return false end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الجهات").lockKid,"md",true)  
return false end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الجهات").lockKtm,"md",true)  
return false end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الجهات").lockKick,"md",true)  
return false end 
if text == "فتح الجهات" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الجهات").unLock,"md",true)  
return false end 
if text == "قفل الكلايش" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكلايش").Lock,"md",true)  
return false end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكلايش").lockKid,"md",true)  
return false end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكلايش").lockKtm,"md",true)  
return false end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الكلايش").lockKick,"md",true)  
return false end 
if text == "فتح الكلايش" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الكلايش").unLock,"md",true)  
return false end 
if text == "قفل الانلاين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الانلاين").Lock,"md",true)  
return false end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الانلاين").lockKid,"md",true)  
return false end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الانلاين").lockKtm,"md",true)  
return false end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم قفل الانلاين").lockKick,"md",true)  
return false end 
if text == "فتح الانلاين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖡦: تم فتح الانلاين").unLock,"md",true)  
return false end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeLINK'},},}}
Redis:setex(TheSmile.."Smile:Set:Link"..msg_chat_id..""..msg.sender.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل رابط المجموعة او رابط قناة المجموعة","md",false, false, false, false, reply_markup)  end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(TheSmile.."Smile:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"⌔︙تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ نص ›', data = msg.sender.user_id..'/LinKTexT' },{ text = '‹ انلاين ›', data = msg.sender.user_id..'/LinKOnla' },
 },
 { 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
 { 
{ text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB' }, 
 },
 }
 }
 return LuaTele.sendText(msg_chat_id,msg_id,'*⌔︙اختر نوع الرابط الذي تريده*',"md",false, false, false, false, reply_markup)
end
-- marlow --
if text == 'غادر' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/Nobot'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/Yesbot'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: هل انت متأكد من مغادرة البوت !',"md",false, false, false, false, reply_markup) end
--
if text == 'نزلني' then
if not Redis:get(TheSmile.."Smile:Status:remMe"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: امر نزلني تم تعطيله من قبل المدراء *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/TkNo'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/TkYes'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: هل انت متأكد من عملية تنزيلك !',"md",false, false, false, false, reply_markup) end
--
if text == 'اطردني' or text == 'طردني' then
if not Redis:get(TheSmile.."Smile:Status:KickMe"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: امر اطردني تم تعطيله من قبل المدراء *","md",true)  end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if StatusCanOrNotCan(msg_chat_id,msg.sender.user_id) and not Distinguished then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا استطيع استخدام الامر على ‹ "..Controller(msg_chat_id,msg.sender.user_id).." › *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/noBanme'},{text = '‹ تأكيد ›', data = msg.sender.user_id..'/Banme'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: هل انت متأكد من عملية طردك !',"md",false, false, false, false, reply_markup) end
-- marlow --
if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeWelcome'},},}}
Redis:setex(TheSmile.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي الترحيب الان".."\n𖡦: تستطيع اضافة مايلي !\n𖡦: دالة عرض الاسم ↫ ‹ `name` ›\n𖡦: دالة عرض المعرف ↫ ‹ `user` ›\n𖡦: دالة عرض اسم المجموعة ↫ ‹ `NameCh` ›","md",false, false, false, false, reply_markup)   
end
if text == "الترحيب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:Status:Welcome"..msg_chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل الترحيب من قبل الادمنيه","md",true) end 
local Welcome = Redis:get(TheSmile.."Smile:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لم يتم تعيين ترحيب للمجموعة","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم ازالة ترحيب المجموعة","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeRules'},},}}
Redis:setex(TheSmile.."Smile:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي القوانين الان","md",false, false, false, false, reply_markup)  end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم ازالة قوانين المجموعة","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(TheSmile.."Smile:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeDescription'},},}}
Redis:setex(TheSmile.."Smile:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي وصف المجموعة الان","md",false, false, false, false, reply_markup)  end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم ازالة وصف المجموعة","md",true)    
end
if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تغيير اسم المجموعة الى ‹ "..NameChat.." ›","md",true)    
end
if text == ("ضع صوره") then  
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Info == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  end
Redis:set(TheSmile.."Smile:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الصوره لوضعها","md",true)    
end
if text == "مسح قائمه المنع" or text == "مسح قائمة المنع" or text == "حذف قائمه المنع" or text == "حذف قائمة المنع" then   
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(TheSmile.."Smile:Filter:Group:"..v..msg_chat_id)  
Redis:srem(TheSmile.."Smile:List:Filter"..msg_chat_id,v)  end  
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#list.." › من الممنوعات *","md",true)   
end
if text == "قائمه المنع" or text == "قائمة المنع" then   
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا توجد ممنوعات هنا *","md",true)   
end  
Filter = '\n*𖡦: قائمة المنع ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(TheSmile.."Smile:Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."- "..ver.." ↫ ( "..Text_Filter.." )*\n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  end  
if text == "منع" then       
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) *',"md",true)  end    
if text == "الغاء منع" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile..'Smile:FilterText'..msg_chat_id..':'..msg.sender.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: ارسل الان ( ملصق ,متحركه ,صوره ,رساله ) *',"md",true)  end
if text == "اضف امر" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: الان ارسل لي الامر القديم","md",true) end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true) end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(TheSmile.."Smile:Command:List:Group"..msg_chat_id) end
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم مسح جميع الاوامر التي تم اضافتها","md",true) end
if text == "الاوامر المضافه" then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:Command:List:Group"..msg_chat_id.."")
Command = "𖡦: قائمه الاوامر المضافه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k.." - ‹ "..v.." › ↫ ‹ "..Commands.." ›\n"
else
Command = Command..""..k.." - ‹ "..v.." › \n" end end
if #list == 0 then
Command = "𖡦: لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true) end
if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم تثبيت الرساله","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true) end
if text == 'الغاء التثبيت' and msg.reply_to_message_id ~= 0 or text == 'الغاء تثبيت' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم الغاء تثبيت الرساله","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinChatMessages?chat_id='..msg.chat_id)
LuaTele.unpinChatMessage(msg_chat_id) end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).PinMsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: تم الغاء تثبيت جميع الرسائل","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinAllChatMessages?chat_id='..msg.chat_id)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break end end
end
if text == "الحمايه" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تعطيل الرابط', data = msg.sender.user_id..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = msg.sender.user_id..'/'.. 'mute_link'},},{{text = 'تعطيل الترحيب', data = msg.sender.user_id..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = msg.sender.user_id..'/'.. 'mute_welcome'},},{{text = 'تعطيل الايدي', data = msg.sender.user_id..'/'.. 'unmute_Id'},{text = 'تفعيل الايدي', data = msg.sender.user_id..'/'.. 'mute_Id'},},{{text = 'تعطيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},},{{text = 'تعطيل ردود المدير', data = msg.sender.user_id..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = msg.sender.user_id..'/'.. 'mute_ryple'},},{{text = 'تعطيل ردود المطور', data = msg.sender.user_id..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = msg.sender.user_id..'/'.. 'mute_ryplesudo'},},{{text = 'تعطيل الرفع', data = msg.sender.user_id..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = msg.sender.user_id..'/'.. 'mute_setadmib'},},{{text = 'تعطيل الطرد', data = msg.sender.user_id..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = msg.sender.user_id..'/'.. 'mute_kickmembars'},},{{text = 'تعطيل الالعاب', data = msg.sender.user_id..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = msg.sender.user_id..'/'.. 'mute_games'},},{{text = 'تعطيل اطردني', data = msg.sender.user_id..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = msg.sender.user_id..'/'.. 'mute_kickme'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, '𖡦: اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, false, false, reply_markup) end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if Redis:get(TheSmile.."Smile:Status:Link"..msg.chat_id) then
Statuslink = '‹ ✓ ›' else Statuslink = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:Welcome"..msg.chat_id) then
StatusWelcome = '‹ ✓ ›' else StatusWelcome = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:Id"..msg.chat_id) then
StatusId = '‹ ✓ ›' else StatusId = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '‹ ✓ ›' else StatusIdPhoto = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:Reply"..msg.chat_id) then
StatusReply = '‹ ✓ ›' else StatusReply = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '‹ ✓ ›' else StatusReplySudo = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:BanId"..msg.chat_id)  then
StatusBanId = '‹ ✓ ›' else StatusBanId = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:SetId"..msg.chat_id) then
StatusSetId = '‹ ✓ ›' else StatusSetId = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
StatusGames = '‹ ✓ ›' else StatusGames = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:KickMe"..msg.chat_id) then
Statuskickme = '‹ ✓ ›' else Statuskickme = '‹ ✗ ›'
end
if Redis:get(TheSmile.."Smile:Status:AddMe"..msg.chat_id) then
StatusAddme = '‹ ✓ ›' else StatusAddme = '‹ ✗ ›'
end
local protectionGroup = '\n*𖡦: اعدادات حمايه المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n𖡦: جلب الرابط ↫ '..Statuslink
..'\n𖡦: جلب الترحيب ↫ '..StatusWelcome
..'\n𖡦: الايدي ↫ '..StatusId
..'\n𖡦: الايدي بالصوره ↫ '..StatusIdPhoto
..'\n𖡦: ردود المدير ↫ '..StatusReply
..'\n𖡦: ردود المطور ↫ '..StatusReplySudo
..'\n𖡦: الرفع ↫ '..StatusSetId
..'\n𖡦: الحظر - الطرد ↫ '..StatusBanId
..'\n𖡦: الالعاب ↫ '..StatusGames
..'\n𖡦: امر اطردني ↫ '..Statuskickme..'*\n\n'
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup) end
if text == "الاعدادات" then    
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Text = "*\n𖡦: اعدادات المجموعة ".."\n𖡦: علامة ال (✓) تعني مقفول".."\n𖡦: علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =msg.sender.user_id..'/'.. 'Status_link'},},{{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =msg.sender.user_id..'/'.. 'Status_spam'},},{{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =msg.sender.user_id..'/'.. 'Status_keypord'},},{{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =msg.sender.user_id..'/'.. 'Status_voice'},},{{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =msg.sender.user_id..'/'.. 'Status_gif'},},{{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =msg.sender.user_id..'/'.. 'Status_files'},},{{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =msg.sender.user_id..'/'.. 'Status_text'},},{{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =msg.sender.user_id..'/'.. 'Status_video'},},{{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =msg.sender.user_id..'/'.. 'Status_photo'},},{{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =msg.sender.user_id..'/'.. 'Status_username'},},{{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =msg.sender.user_id..'/'.. 'Status_tags'},},{{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =msg.sender.user_id..'/'.. 'Status_bots'},},{{text = 'التالي', data =msg.sender.user_id..'/'.. 'NextSeting'}},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup) end  
if text == 'المجموعة' or text == 'المجموعه' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local permissions = '*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: صلاحيات المجموعة ↫ ⤈'..'\n𖡦: تغيير معلومات المجموعة : '..info..'\n𖡦: اضافه مستخدمين : '..invite..'\n𖡦: تثبيت الرسائل : '..pin..'\n𖡦: ارسال الميديا : '..media..'\n𖡦: ارسال الرسائل : '..messges..'\n𖡦: اضافه البوتات : '..other..'\n𖡦: ارسال الويب : '..web..'\n𖡦: ارسال استفتاء : '..polls..'*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
local TextChat = '*\n𖡦: معلومات المجموعة :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n𖡦: عدد الادمنيه : ‹ '..Info_Chats.administrator_count..' ›\n𖡦: عدد المحظورين : ‹ '..Info_Chats.banned_count..' ›\n𖡦: عدد الاعضاء : ‹ '..Info_Chats.member_count..' ›\n𖡦: عدد المقيديين : ‹ '..Info_Chats.restricted_count..' ›\n𖡦: اسم المجموعة : ‹* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true) end
if text == 'صلاحيات المجموعة' or text == 'صلاحيات المجموعه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ' تغيير معلومات المجموعة : '..info, data =msg.sender.user_id..  '/info'},},{{text = ' اضافه مستخدمين : '..invite, data =msg.sender.user_id..  '/invite'},},{{text = ' تثبيت الرسائل : '..pin, data =msg.sender.user_id..  '/pin'},},{{text = ' ارسال الميديا : '..media, data =msg.sender.user_id..  '/media'},},{{text = ' ارسال الرسائل : '..messges, data =msg.sender.user_id..  '/messges'},},{{text = ' اضافه البوتات : '..other, data =msg.sender.user_id..  '/other'},},{{text = ' ارسال الويب : '..web, data = msg.sender.user_id..'/web'},},{{text = ' ارسال استفتاء : '..polls, data =msg.sender.user_id.. '/polls'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. '/delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: صلاحيات المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(TheSmile..'Smile:Originators:Group'..msg_chat_id, Message_Reply.sender.user_id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(TheSmile..'Smile:Managers:Group'..msg_chat_id, Message_Reply.sender.user_id) then
own = "المدراء • " else own = "" end
if Redis:sismember(TheSmile..'Smile:Addictive:Group'..msg_chat_id, Message_Reply.sender.user_id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(TheSmile..'Smile:Cleaner:Group'..msg_chat_id, Message_Reply.sender.user_id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(TheSmile..'Smile:Distinguished:Group'..msg_chat_id, Message_Reply.sender.user_id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(Message_Reply.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id)  then
Rink = 2
elseif Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id)  then
Rink = 3
elseif Redis:sismember(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id)  then
Rink = 4
elseif Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 5
elseif Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 6
elseif Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 7
elseif Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 8
elseif Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 9
elseif Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 10
elseif Redis:sismember(TheSmile.."Smile:TheBas:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 11
elseif Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل المطور الاساسي*","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",Message_Reply.sender.user_id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة*","md",true)  end
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(TheSmile..'Smile:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(TheSmile..'Smile:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "المدراء • " else own = "" end
if Redis:sismember(TheSmile..'Smile:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(TheSmile..'Smile:Cleaner:Group'..msg_chat_id, UserId_Info.id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(TheSmile..'Smile:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id)  then
Rink = 4
elseif Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
elseif Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, UserId_Info.id) then
Rink = 10
elseif Redis:sismember(TheSmile.."Smile:TheBas:Group"..msg_chat_id, UserId_Info.id) then
Rink = 11
elseif Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل المطور الاساسي *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, UserId_Info.id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text and text:match('^تنزيل الكل (%d+)$') then
local UserId = text:match('^تنزيل الكل (%d+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserId_Info = LuaTele.getUser(UserId)
if UserId_Info.luatele == "error" and UserId_Info.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  end
if UserId_Info.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserId_Info and UserId_Info.type and UserId_Info.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام الامر على البوت ","md",true)  end
if Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id) then
d = "المطورين الاساسيين • " else d = "" end
if Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id) then
de = "المطورين الثانويين • " else de = "" end
if Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id) then
dev = "المطورين • " else dev = "" end
if Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
mk = "المالكين • " else mk = "" end
if Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "المنشئين الاساسيين • " else crr = "" end
if Redis:sismember(TheSmile..'Smile:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "المنشئين • " else cr = "" end
if Redis:sismember(TheSmile..'Smile:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "المدراء • " else own = "" end
if Redis:sismember(TheSmile..'Smile:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "الادمنيه • " else mod = "" end
if Redis:sismember(TheSmile..'Smile:Cleaner:Group'..msg_chat_id, UserId_Info.id) then
Cle = "المنظفين • " else Cle = "" end
if Redis:sismember(TheSmile..'Smile:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "المميزين • " else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(TheSmile.."Smile:Developers:Groups",UserId_Info.id)  then
Rink = 4
elseif Redis:sismember(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
elseif Redis:sismember(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, UserId_Info.id) then
Rink = 10
elseif Redis:sismember(TheSmile.."Smile:TheBas:Group"..msg_chat_id, UserId_Info.id) then
Rink = 11
elseif Redis:sismember(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id) then
Rink = 12
else
Rink = 13
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: ليس لديه اي رتبه هنا *","md",true)  end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل المطور الاساسي *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group"..msg_chat_id, UserId_Info.id)
elseif msg.DevelopersAS then
if Rink == 2 or Rink < 2 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.DevelopersQ then
if Rink == 3 or Rink < 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Developers:Groups",UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Developers then
if Rink == 4 or Rink < 4 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.TheBasics then
if Rink == 5 or Rink < 5 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Originators then
if Rink == 6 or Rink < 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Cleaner:Group",UserId_Info.id)
elseif msg.Managers then
if Rink == 7 or Rink < 7 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 8 or Rink < 8 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  end
if Rink == 11 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنك تنزيل مالك المجموعة *","md",true)  end
Redis:srem(TheSmile.."Smile:Distinguished:Group"..msg_chat_id, UserId_Info.id) end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم تنزيله من ↫ ⤈\n ‹ "..d..""..de..""..dev..""..crr..""..cr..""..own..""..mod..""..vip..""..Cle..""..mk.." ›*","md",true)  end
if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..Message_Reply.sender.user_id},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup) end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..UserId_Info.id},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup) end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لست انا من قام برفعه *","md",true)  end
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم تنزيله من المشرفين ").Reply,"md",true)  end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).SetAdmin == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لست انا من قام برفعه *","md",true)  end
if SetAdmin.code == 3 then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم تنزيله من المشرفين ").Reply,"md",true)  end 
if text == 'رسائلي' then
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح رسائلي : '..marlow..' ›', data = msg.sender.user_id..'/MMsgDel'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد رسائلك هنا ↫ ‹ *'..marlow..'* ›',"md",false ,false, false,false,reply_markup)  end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..marlow..' ›', data = msg.sender.user_id..'/MsgDell'},},}}
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد التعديلات هنا ↫ ‹ *'..marlow..'* ›',"md",false, false, false,false, reply_markup)  end
if text == 'مسح جهاتي' then
Redis:del(TheSmile..'Smile:Num:Add:Memp'..msg.chat_id..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عدد جهاتك المضافه هنا ↫ ‹ *'..(Redis:get(TheSmile.."Smile:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0)..'* ›',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).Delmsg == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg_id}) end
if text == 'تعين الايدي عام' or text == 'تغير الايدي عام' or text == 'وضع الايدي عام' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Set:Id:Groups"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل الان النص
𖡦: يمكنك اضافه :
𖡦: `#username` ↫ اسم المستخدم
𖡦: `#msgs` ↫ عدد الرسائل
𖡦: `#photos` ↫ عدد الصور
𖡦: `#id` ↫ ايدي المستخدم
𖡦: `#auto` ↫ نسبة التفاعل
𖡦: `#stast` ↫ رتبة المستخدم 
𖡦: `#edit` ↫ عدد السحكات
𖡦: `#game` ↫ عدد المجوهرات
𖡦: `#AddMem` ↫ عدد الجهات
𖡦: `#Description` ↫ تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Set:Id:Groups")
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: تم ازالة كليشة الايدي العامه',"md",true)  end
if text == 'تعين الايدي' or text == 'تعيين الايدي' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل الان النص
𖡦: يمكنك اضافه :
𖡦: `#username` ↫ اسم المستخدم
𖡦: `#msgs` ↫ عدد الرسائل
𖡦: `#photos` ↫ عدد الصور
𖡦: `#id` ↫ ايدي المستخدم
𖡦: `#auto` ↫ نسبة التفاعل
𖡦: `#stast` ↫ رتبة المستخدم 
𖡦: `#edit` ↫ عدد السحكات
𖡦: `#game` ↫ عدد المجوهرات
𖡦: `#AddMem` ↫ عدد الجهات
𖡦: `#Description` ↫ تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '𖡦: تم ازالة كليشة الايدي ',"md",true)  end
if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الاساسين' or TextMsg == 'المطورين الاساسيين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين اساسيين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:DevelopersAS:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين اساسيين*","md",true) end
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين ثانويين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين الثانويين*","md",true) end
if TextMsg == 'المطورين' then
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if TextMsg == 'المالكين' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مالكين في البوت ","md",true)  end
Redis:del(TheSmile.."Smile:TheBasicsQ:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المالكين *","md",true) end
if TextMsg == 'المنشئين الاساسيين' or TextMsg == 'المنشئين الاساسين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد منشئين اساسيين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المنشؤين الاساسيين *","md",true) end
if TextMsg == 'المنشئين' then
if not msg.TheBasics then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين الاساسيين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد منشئين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المنشئين *","md",true) end
if TextMsg == 'المدراء' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مدراء حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المدراء *","md",true) end
if TextMsg == 'الادمنيه' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد ادمنيه حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من الادمنيه *","md",true) end
if TextMsg == 'المنظفين' then
if not msg.Originators then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمنشئين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Cleaner:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد منظفين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Cleaner:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المنظفين *","md",true) end
if TextMsg == 'المميزين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مميزين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المميزين *","md",true) end
if TextMsg == 'قائمة عام' or TextMsg == 'قائمة العام' or TextMsg == 'قائمه عام' or TextMsg == 'قائمه العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
local Info_Memberss = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Members == 0 and #Info_Memberss == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد ( مكتومين • محظورين ) عام حالياً","md",true)  end
Redis:del(TheSmile.."Smile:BanAll:Groups") 
Redis:del(TheSmile.."Smile:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من محظورين العام*\n*𖡦: تم مسح ‹ "..#Info_Memberss.." › من المكتومين العام *","md",true) end
if TextMsg == 'المحظورين عام' or TextMsg == 'المحظورين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين عام حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true) end
if TextMsg == 'المكتومين عام' or TextMsg == 'المكتومين العام' then
if not msg.Developers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين عام حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المكتومين عام *","md",true) end
if TextMsg == 'المحظورين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المحظورين *","md",true) end
if TextMsg == 'المكتومين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المكتومين *","md",true) end
if TextMsg == 'المقيدين' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..x.." › من المقيديين *","md",true) end
if TextMsg == 'البوتات' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عدد البوتات الموجوده : "..#List_Members.."\n𖡦: تم طرد ‹ "..x.." › بوت من المجموعة *","md",true)  end
if TextMsg == 'المطرودين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1 end end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عدد المطرودين في المجموعة ↫ ‹ "..#List_Members.." ›\n𖡦: تم الغاء الحظر عن ‹ "..x.." › من الاشخاص*","md",true)  end
if TextMsg == 'المحذوفين' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
if GetInfoBot(msg).BanUser == false then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1 end end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم طرد ‹ "..x.." › حساب محذوف *","md",true) end end
-- marlow --
if text == ("عرض الردود") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile1:List:Rd:Sudo"..msg.chat_id)
local RR = Redis:scard(TheSmile.."Smile:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ ردود المدير : '..RR..' ›', data = msg.sender.user_id..'/RRD'},},{{text = '‹ الردود المتعدده : '..R..' ›', data = msg.sender.user_id..'/Rdmarlow'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: اختر نوع الردود لعرضها في المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("مسح الردود") or text == ("حذف الردود") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile1:List:Rd:Sudo"..msg.chat_id)
local RR = Redis:scard(TheSmile.."Smile:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ ردود المدير : '..RR..' ›', data = msg.sender.user_id..'/RD'},},{{text = '‹ الردود المتعدده : '..R..' ›', data = msg.sender.user_id..'/Rdmarlow'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: اختر نوع الردود لحذفها من المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("الردود المتعدده") or text == ("مسح الردود المتعدده") or text == ("حذف الردود المتعدده") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile1:List:Rd:Sudo"..msg.chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/Rdmarlow'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/Rdmarlow'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("ردود المدير") or text == ("مسح ردود المدير") or text == ("حذف ردود المدير") then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RD'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRD'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
-- marlow --
if text == "اضف رد" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',
data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/closeRD'},},}}
Redis:set(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لاضافتها في ردود المدير ","md",false ,false, false, false, reply_markup)  end
if text == "حذف رد" then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/marlowclose'},},}}
Redis:set(TheSmile.."Smile:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لحذفها من ردود المدير","md",false, false, false, false, reply_markup) end
-- marlow --
if text == ("الردود المتعدده العامه") or text == ("مسح الردود المتعدده العامه") or text == ("حذف الردود المتعدده العامه") then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile11:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RSomarlow'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RSomarlow'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("ردود المطور") or text == ("مسح الردود العامه") or text == ("حذف الردود العامه") then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RDs'},{text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRDs'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: من خلال الازرار يمكن عرض وحذف الردود ↫ ⤈", 'md', false, false, false, false, reply_markup) end
--
if text == ("اوامر التسليه") then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local R = Redis:scard(TheSmile.."Smile:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غنيلي ›', data = msg.sender.user_id..'/Song'},},{{text = '‹ شعر ›', data = msg.sender.user_id..'/voice'},{text = '‹ اغنيه ›', data = msg.sender.user_id..'/Mp'},},{{text = '‹ ميمز ›', data = msg.sender.user_id..'/Memz'},{text = '‹ ريمكس ›', data = msg.sender.user_id..'/Remix'},},{{text = '‹ انمي ›', data = msg.sender.user_id..'/Anime'},{text = '‹ صوره ›', data = msg.sender.user_id..'/Photos'},},{{text = '‹ مسلسل ›', data = msg.sender.user_id..'/Series'},{text = '‹ فلم ›', data = msg.sender.user_id..'/Movies'},},{{text = '‹ متحركه ›', data = msg.sender.user_id..'/animation'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: يمكنك اختيار أحد اوامر التسليه ↫ ⤈", 'md', false, false, false, false, reply_markup) end
-- marlow --
if text == "اضف رد للكل" or text == "اضف رد عام" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  end
if text == "حذف رد للكل" or text == "حذف رد عام" or text == "مسح رد عام" or text == "مسح رد للكل" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/marlowcloseSo'},},}}
Redis:set(TheSmile.."Smile:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لحذفها من ردود المطور","md",false, false, false, false, reply_markup) end
if text=="اذاعه خاص" or text=="اذاعة خاص" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه" or text=="اذاعة" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه بالتثبيت" or text=="اذاعة بالتثبيت"then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان 
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=="اذاعه بالتوجيه" or text=="اذاعة بالتوجيه"then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي التوجيه الان\n𖡦: ليتم نشره في المجموعات","md",true)  
return false end
if text=="اذاعه خاص بالتوجيه" or text=="اذاعة خاص بالتوجيه" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي التوجيه الان\n𖡦: ليتم نشره الى المشتركين","md",true)  
return false end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).ktmAll == true then
ktmAll = 'مكتوم عام'
else
ktmAll = 'غير مكتوم عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: معلومات الكشف ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n𖡦: الحظر العام ↫ '..BanAll..'\n𖡦: الكتم العام ↫ '..ktmAll..'\n𖡦: الحظر ↫ '..BanGroup..'\n𖡦: الكتم ↫ '..SilentGroup..'\n𖡦: التقييد ↫ '..Restricted..'*',"md",true)  end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).ktmAll == true then
ktmAll = 'مكتوم عام'
else
ktmAll = 'غير مكتوم عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: معلومات الكشف ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n𖡦: الحظر العام ↫ '..BanAll..'\n𖡦: الكتم العام ↫ '..ktmAll..'\n𖡦: الحظر ↫ '..BanGroup..'\n𖡦: الكتم ↫ '..SilentGroup..'\n𖡦: التقييد ↫ '..Restricted..'*',"md",true)  end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true and msg.DevelopersAS then
BanAll = 'محظور عام ,'
Redis:srem(TheSmile.."Smile:BanAll:Groups",Message_Reply.sender.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).ktmAll == true and msg.DevelopersAS then
ktmAll = 'مكتوم عام ,'
Redis:srem(TheSmile.."Smile:ktmAll:Groups",Message_Reply.sender.user_id) 
else
ktmAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم رفع القيود عنه ↫ ‹ "..BanAll..ktmAll..BanGroup..SilentGroup..Restricted..' ›*',"md",true)  end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if msg.can_be_deleted_for_all_users == false then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.DevelopersAS then
BanAll = 'محظور عام ,'
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).ktmAll == true and msg.DevelopersAS then
ktmAll = 'مكتوم عام ,'
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
else
ktmAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheSmile.."Smile:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheSmile.."Smile:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: تم رفع القيود عنه ↫ ‹ "..BanAll..ktmAll..BanGroup..SilentGroup..Restricted..' ›*',"md",true)  end
-- marlow
if text == 'وضع كليشه المنشئ' or text == 'وضع كليشة المنشئ' or text == 'تغيير كليشة المنشئ' or text == 'تغيير كليشه المنشئ' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember ~= "chatMemberStatusCreator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: هذا الامر لمالك المجموعة فقط !*","md",true)  
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelOwner'},},}}
Redis:set(TheSmile..'Smile:GetOwner:OwnerTheSmile'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي كليشة المنشئ الان\n𖡦: ايضاً يمكنك استخدام ما يلي ↫ ⤈\n𖡦: دالة عرض الاسم ↫ ‹ `OwnName` ›\n𖡦: دالة عرض الايدي ↫ ‹ `OwniD` ›\n𖡦: دالة عرض المعرف ↫ ‹ `OwnUser` ›\n𖡦: دالة عرض البايو ↫ ‹ `OwnBio` ›\n𖡦: دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end end
--
if text == 'مسح كليشة المنشئ' or text == 'حذف كليشة المنشئ' or text == 'مسح كليشه المنشئ' or text == 'حذف كليشه المنشئ' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember ~= "chatMemberStatusCreator") then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: هذا الامر لمالك المجموعة فقط !*","md",true)
else
Redis:del(TheSmile..'Smile:Owner:OwnerTheSmile'..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حذف كليشة المنشئ') end end
--
if text == 'وضع كليشه المطور' or text == 'وضع كليشة المطور' or text == 'تغيير كليشة المطور' or text == 'تغيير كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelDev'},},}}
Redis:set(TheSmile..'Smile:GetTexting:DevTheSmile'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي كليشة المطور الان\n𖡦: ايضاً يمكنك استخدام ما يلي ↫ ⤈\n𖡦: دالة عرض الاسم ↫ ‹ `DevName` ›\n𖡦: دالة عرض الايدي ↫ ‹ `DeviD` ›\n𖡦: دالة عرض المعرف ↫ ‹ `DevUser` ›\n𖡦: دالة عرض البايو ↫ ‹ `DevBio` ›\n𖡦: دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end
--
if text == 'مسح كليشة المطور' or text == 'حذف كليشة المطور' or text == 'مسح كليشه المطور' or text == 'حذف كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile..'Smile:Texting:DevTheSmile')
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حذف كليشة المطور') end
if text == 'المطور' or text == 'مطور البوت' then   
local UserInfo = LuaTele.getUser(Sudo_Id) 
local InfoUser = LuaTele.getUserFullInfo(Sudo_Id)
local DevText = Redis:get(TheSmile..'Smile:Texting:DevTheSmile')
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
marlow = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
marlow = '['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')'
end
LuaTele.sendText(Sudo_Id,0,"𖡦: هناك من بحاجه الى مساعده ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الشخص ↫ "..marlow.."\n𖡦: اسم المجموعه ↫ "..Get_Chat.title.."\n𖡦: ايدي المجموعه ↫ ⤈\n❨ `"..msg_chat_id.."` ❩\n𖡦: رابط المجموعه ↫ ⤈\n❨ "..Info_Chats.invite_link.invite_link.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ "..os.date("%I:%M%p").."\n𖡦: التاريخ ↫ "..os.date("%Y/%m/%d").."","md",true) end
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(Sudo_Id)
local DevMarkdown = "["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")"
if DevText then
if UserSudo then
DevUsre = '@'..UserSudo
else
DevUsre = 'لا يوجد'
end
DevText = DevText:gsub('NameGr',Get_Chat.title) 
DevText = DevText:gsub('DevName',DevMarkdown) 
DevText = DevText:gsub('DevUsre',DevUsre) 
DevText = DevText:gsub('DeviD',Sudo_Id) 
DevText = DevText:gsub('DevBio',Bio) 
if photo.total_count > 0 then
keyboardd = {} 
keyboardd.inline_keyboard = {{{text = UserInfo.first_name, url = "https://t.me/"..UserSudo..""}},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(DevText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(DevText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") end
else
if photo.total_count > 0 then
local TestText = "𖡦: *Dev Name* ↬  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n𖡦: *Dev User* ↬ @"..UserSudo.."\n𖡦: *Dev iD* ↬ "..Sudo_Id..""
keyboardd = {} 
keyboardd.inline_keyboard = {{{text = UserInfo.first_name, url = "https://t.me/"..UserSudo..""}},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "❲ Developer Bot ❳\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: *Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n𖡦: *Dev User* : @"..UserSudo.."\n𖡦: *Dev iD* : "..Sudo_Id.."\n𖡦: *Dev Bio* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") end end
end
if text == "جمالي" or text == 'نسبه جمالي' or text == 'نسبة جمالي' then
if Redis:get(TheSmile.."Smile:Status:gamle"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if msg.Developers then
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي 900% عشان مطور لازم اضبطك*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: لا توجد صوره في حسابك*',"md",true) 
end
else
if photo.total_count > 0 then
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي "..rdbhoto.."% *", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: لا توجد صوره في حسابك*',"md",true)  end end end end
if text and text:match("^كول (.*)$")then
local m = text:match("^كول (.*)$")
if Redis:get(TheSmile.."Smile:Status:kool"..msg.chat_id) then return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true)  end end
if text == "صورتي" then
if Redis:get(TheSmile.."Smile:Status:photo"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if photo.total_count > 0 then return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*𖡦: عدد صورك هو "..photo.total_count.." صوره*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: لا توجد صوره في حسابك*',"md",true) 
end
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: امر صورتي معطل*',"md",true)  end end
if text == "بوت الزخرفه" or text == "اريد بوت زخرفه" or text == "بوت زخرفه" or text == "بوت الزغرفه" or text == "اريد بوت زغرفه" or text == "بوت زغرفه" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ اضغط هنا ›', url = 't.me/zazhbot'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: اضغط للحصول على بوت الزخرفه*',"md",false, false, false, false, reply_markup) end
if text == "بوت كت تويت" or text == "بوت الكت" or text == "بوت كت" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ اضغط هنا ›', url = 't.me/YEWEBOT'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: اضغط للحصول على بوت الكت*',"md",false, false, false, false, reply_markup) end
if text == "اهمس" or text == "بوت همسه" or text == "بوت الهمسه" or text == "همسه" or text == "اريد همسه" or text == "همسولي" or text == "اهمسلي" then return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: @NYrBot *',"md",true)  end
if text == 'رابط الحذف' or text == 'بوت الحذف' or text == 'بوت حذف' or text == 'رابط حذف' then
local tt =[[
𖡦: Deletion link in all social media .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Delete Bot ›', url = "https://t.me/R3J3BOT"}},{{text = '‹ Telegram', url = "https://my.telegram.org/auth?to=delete"},{text = 'Instagram ›', url = "https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}},{{text = '‹ Facebook', url = "https://www.facebook.com/help/deleteaccount"},{text = 'Snapchat ›', url = "https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}},{{text = '‹ 𝖲𝗈??𝗋𝖼𝖾 ѕᴍɪʟᴇ  ›', url = "https://t.me/SMILEXB"}}}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/R3J3BOT&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' or text == 'source' then
photo = "https://t.me//5"
local tt =[[
Welcome To Source
𖡦: [ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ ](https://t.me/SMILEXB) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ Source Channel ›', url = "https://t.me/SMILEXB"}},{{text = '‹ Developer', url = "https://t.me/PPFFP"},{text = 'Tws ѕᴍɪʟᴇ  ›', url = "https://t.me/PPFPBOT"}},{{text = '‹ Exp Source ›', url = "https://t.me/smilexR"}}}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/SMILEXB&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) end
if text == 'الاوامر' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = msg.sender.user_id..'/help1'}, {text = ' اوامر الادمنيه', data = msg.sender.user_id..'/help2'},},{{text = 'اوامر المدراء', data = msg.sender.user_id..'/help3'}, {text = 'اوامر المنشئين', data = msg.sender.user_id..'/help4'},},{{text = 'اوامر المطورين', data = msg.sender.user_id..'/help5'}, {text = 'العاب البوت', data = msg.sender.user_id..'/help6'},},{{text = 'القفل والفتح', data = msg.sender.user_id..'/NoNextSeting'}, {text = 'التفعيل والتعطيل', data = msg.sender.user_id..'/listallAddorrem'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
𖡦: اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: م1 ↫ اوامر الحمايه
𖡦: م2 ↫ اوامر الادمنيه
𖡦: م3 ↫ اوامر المدراء
𖡦: م4 ↫ اوامر المنشئين
𖡦: م5 ↫ اوامر المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]],"md",false, false, false, false, reply_markup)
elseif text == 'مسح الرتب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسين ›', data = msg.sender.user_id..'/TheBasics'},},{{text = '‹ مسح المنشئين ›', data = msg.sender.user_id..'/Originators'},{text = '‹ مسح المدراء ›', data = msg.sender.user_id..'/Managers'},},{{text = '‹ مسح الادمنيه ›', data = msg.sender.user_id..'/Addictive'},{text = '‹ مسح المميزين ›', data = msg.sender.user_id..'/DelDistinguished'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)
-- marlow --
elseif text == 'عرض الرتب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر المالكين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local L = Redis:scard(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
local LL = Redis:scard(TheSmile.."Smile:Originators:Group"..msg_chat_id) 
local LLL = Redis:scard(TheSmile.."Smile:Managers:Group"..msg_chat_id)
local LLLL = Redis:scard(TheSmile.."Smile:Addictive:Group"..msg_chat_id)  
local LLLLL = Redis:scard(TheSmile.."Smile:Distinguished:Group"..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data = msg.sender.user_id..'/TheBasicsmarlow'},},{{text = '‹ المنشئين : '..LL..' ›', data = msg.sender.user_id..'/Originatorsmarlow'},{text = '‹ المدراء : '..LLL..' ›', data = msg.sender.user_id..'/Managersmarlow'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data = msg.sender.user_id..'/Addictivemarlow'},{text = '‹ المميزين : '..LLLLL..' ›', data = msg.sender.user_id..'/DelDistinguishedmarlow'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)
--
elseif text == 'تاك' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local L = Redis:scard(TheSmile.."Smile:TheBasics:Group"..msg_chat_id) 
local LL = Redis:scard(TheSmile.."Smile:Originators:Group"..msg_chat_id) 
local LLL = Redis:scard(TheSmile.."Smile:Managers:Group"..msg_chat_id)
local LLLL = Redis:scard(TheSmile.."Smile:Addictive:Group"..msg_chat_id)  
local LLLLL = Redis:scard(TheSmile.."Smile:Distinguished:Group"..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data = msg.sender.user_id..'/TheBasicsmarlow'},},{{text = '‹ المنشئين : '..LL..' ›', data = msg.sender.user_id..'/Originatorsmarlow'},{text = '‹ المدراء : '..LLL..' ›', data = msg.sender.user_id..'/Managersmarlow'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data = msg.sender.user_id..'/Addictivemarlow'},{text = '‹ المميزين : '..LLLLL..' ›', data = msg.sender.user_id..'/DelDistinguishedmarlow'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'⌔︙اهلا بك يمكنك عمل تاك لي جميع رتب المجموعه',"md",false, false, false, false, reply_markup)
--
elseif text == 'مسح رسائلي' or text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..marlow..' ›', data = msg.sender.user_id..'/MsgDell'},{text = '‹ مسح رسائلي : '..marlow..' ›', data = msg.sender.user_id..'/MMsgDel'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: من خلال الازرار يمكنك مسح رسائلك وسحكاتك',"md",false, false, false, false, reply_markup)
-- marlow --
elseif text == 'م1' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help2'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help3'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help4'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help5'},},{{text = '‹ 𝖲𝗈𝗎𝗋??𝖾 ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '𖡦: الالعاب البوت ', data = IdUser..'/help6'},},{{text = '𖡦: الالعاب الاحترافيه ', data = IdUser..'/degm'}, },{{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'}, },}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦:  عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)end
if text == 'تحديث' or text == 'تحديث السورس' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ تحديث الملفات ›', data = msg.sender.user_id..'/UpdateFi'},{text = '‹ تحديث السورس ›', data = msg.sender.user_id..'/UpdateSo'},},{{text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr'}},}}
return LuaTele.sendText(msg_chat_id, msg_id, "𖡦: اليك ازرار التحديث الخاصة بالسورس ↫ ⤈", 'md', false, false, false, false, reply_markup) end
if text == "تغير اسم البوت" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي الاسم الان ","md",true)  end
if text == "حذف اسم البوت" then 
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف اسم البوت ","md",true)   
end
if text == (Redis:get(TheSmile.."Smile:Name:Bot") or "سمايل") then
local NamesBot = (Redis:get(TheSmile.."Smile:Name:Bot") or "سمايل")
local NameBots = {
"عمر "..NamesBot.. " شتريد ؟",
"وياك القميل "..NamesBot.. "",
}
return LuaTele.sendText(msg_chat_id,msg_id, NameBots[math.random(#NameBots)],"md",true)  end
if text == "بوت" then
local NamesBot = (Redis:get(TheSmile.."Smile:Name:Bot") or "سمايل")
local BotName = {
"اسمي القميل "..NamesBot,
"وياك القميل "..NamesBot.. "",
}
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheSmile..'Smile:Num:User:Pv',v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' ›\n𖡦: تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' ›\n𖡦: لم يتم العثور على وهميين*',"md") end end
if text == 'تنظيف المجموعات' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheSmile)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*𖡦: البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheSmile..'Smile:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheSmile..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(Get_Chat.id) end
else
x = x + 1
local keys = Redis:keys(TheSmile..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(TheSmile..'Smile:ChekBotAdd',v)
LuaTele.leaveChat(v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' › للمجموعات \n𖡦: تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n𖡦: تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' › للمجموعات \n𖡦: لا توجد مجموعات وهميه*',"md") end end
if text == "سمايلات" or text == "سمايل" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","??","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","??","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","??","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","᥀","📍","📓","📗","📂","📅","📪","📫","᥀","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(TheSmile.."Smile:Game:Smile"..msg.chat_id,SM)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true) end end
if text == "كت" or text == "كت تويت" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
local texting = {"اخر افلام شاهدتها", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل ل مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
    "هل انت دي تويت باعت باندا؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حالياً؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة ب وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
"تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت باندا؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب باندا؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حالياً وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل باندا لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي باندا ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام ب اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت ب مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا ف بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md') end end
if text == "الاسرع" or tect == "ترتيب" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(TheSmile.."Smile:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يرتبها ↫ ‹ "..name.." ›","md",true) end end
if text == "حزوره" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(TheSmile.."Smile:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيذنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true) end end
if text == "معاني" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
Redis:del(TheSmile.."Smile:Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(TheSmile.."Smile:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐵")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يدز معنى السمايل ↫ ‹ "..name.." ›","md",true) end end
if text == "العكس" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
Redis:del(TheSmile.."Smile:Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(TheSmile.."Smile:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يدز العكس ↫ ‹ "..name.." ›","md",true) end end
if text == "بات" or text == "محيبس" then   
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '👊', data = '/Mahibes1'}, {text = '👊🏻', data = '/Mahibes2'},},{{text = '👊🏼', data = '/Mahibes3'}, {text = '👊🏽', data = '/Mahibes4'},},{{text = '👊🏾', data = '/Mahibes5'}, {text = '👊🏿', data = '/Mahibes6'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
𖡦: لعبه المحيبس هي لعبة الحظ
𖡦: كل ما عليك هوا الضغط على احدى العضمات
*]],"md",false, false, false, false, reply_markup) end end
if text == "خمن" or text == "تخمين" then   
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(TheSmile.."Smile:Game:Estimate"..msg.chat_id..msg.sender.user_id,Num)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: اهلا بك عزيزي في لعبة التخمين :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n".."𖡦: ملاحظه لديك {3} محاولات فقط فكر قبل ارسال تخمينك \n\n".."𖡦: سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true) end end
if text == "المختلف" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","👩‍🍳","🧚‍♀","🧜‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕓","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(TheSmile.."Smile:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩👩👩👩👩👨‍💻👩👩")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕓","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥??🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يدز الاختلاف ↫ ‹ "..name.." ›","md",true) end end
if text == "امثله" then
if Redis:get(TheSmile.."Smile:Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(TheSmile.."Smile:Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: اسرع واحد يكمل المثل ↫ ‹ "..name.." ›","md",true) end end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: لا استطيع البيع اقل من 1 *","md",true)  end
local NumberGame = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id)
if tonumber(NumberGame) == tonumber(0) then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ليس لديك جواهر من الالعاب \n𖡦: اذا كنت تريد ربح الجواهر \n𖡦: ارسل الالعاب وابدأ اللعب ! ","md",true)  end
if tonumber(NumGame) > tonumber(NumberGame) then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: ليس لديك جواهر بهذا العدد \n𖡦: لزيادة مجوهراتك في اللعبه \n𖡦: ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id,NumGame)  
Redis:incrby(TheSmile.."Smile:Num:Message:User"..msg.chat_id..":"..msg.sender.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم خصم *↫ ❨ "..NumGame.." ❩* من مجوهراتك \n𖡦: وتم اضافة* ↫ ❨ "..(NumGame * 50).." ❩ رساله الى رسالك *","md",true)  end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم اضافه له ❨ "..text:match("^اضف مجوهرات (%d+)$").." ❩ من المجوهرات").Reply,"md",true)  end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not msg.Addictive then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للادمنية واعلى فقط',"md",true)  end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام الامر على البوت ","md",true)  end
Redis:incrby(TheSmile.."Smile:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖡦: تم اضافه له {"..text:match("^اضف رسائل (%d+)$").."} من الرسائل").Reply,"md",true)  end
if text == "مجوهراتي" or text == "نقاطي" then 
local Num = Redis:get(TheSmile.."Smile:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "𖡦: عدد الجواهر التي ربحتها *↫ "..Num.." *","md",true) end end
if text == 'ترتيب الاوامر' then
if not msg.Managers then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمدراء واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تنزيل الكل')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','ردود المدير')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'سح','مسح سحكاتي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','مسح رسائلي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'حذ','حذف رد')
Redis:set(TheSmile.."Smile:Get:Reides:Commands:Group"..msg_chat_id..":"..'#','مسح قائمه العام')

return LuaTele.sendText(msg_chat_id,msg_id,[[*
𖡦: تم ترتيب الاوامر بالشكل التالي ↫ ⤈
𖡦: ايدي - ا .
𖡦: الرابط - ر .
𖡦: غنيلي - غ .
𖡦: رفع مميز - م .
𖡦: اضف رد - رد .
𖡦: رفع ادمن - اد .
𖡦: حذف رد - حذ .
𖡦: رفع مدير - مد .
𖡦: رفع منشى - من .
𖡦: تنزيل الكل - تك .
𖡦: ردود المدير - رر .
𖡦: رفع مطور - مط .
𖡦: مسح رسائلي - رس .
𖡦: مسح المكتومين - ،، .
𖡦: مسح قائمة العام - # .
𖡦: مسح سحكاتي - سح .
𖡦: رفع مطور ثانوي - ثانوي .
𖡦: رفع منشئ الاساسي - اس .
𖡦: تفعيل الايدي بالصوره - تفع .
𖡦: تعطيل الايدي بالصوره - تعط .
*]],"md") end
end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == '‹ تحديث السورس ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
os.execute('rm -rf Smile.lua')
download('curl -s https://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@raw.githubusercontent.com/MMRRTTUU /pp/master/Smile.lua','Smile.lua')
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖡦: تم تحديث السورس* ',"md",true)  end
if text == '‹ تحديث الملفات ›' then
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
LuaTele.sendText(msg_chat_id,msg_id, "*𖡦: تم تحديث الملفات*","md",true)
dofile('Smile.lua')  end
if text == '/start' or text == '‹ رجوع ›' then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
if not msg.DevelopersAS then
if not Redis:get(TheSmile.."Smile:Start:Bot") then
local CmdStart = '𖡦: مرحبا انا بوت اسمي ‹ '..(Redis:get(TheSmile.."Smile:Name:Bot") or "سمايل")..' ›\n𖡦: اختصاصي التسليه وحماية المجموعات\n𖡦: من المخربين والتفليش والسبام والخ\n𖡦: فقط قم برفعي ادمن في مجموعتك\n𖡦: وارسل كلمة ↫ ‹ تفعيل ›'
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ المطور ›', url = "t.me/"..UserSudo..""},},{{text = '‹ قناة السورس ›', url = 't.me/SMILEXB'},{text = '‹ لتنصيب بوت ›', url = 't.me/PPFFP'},},{{text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ المطور ›', url = "t.me/"..UserSudo..""},},{{text = '‹ قناة السورس ›', url = 't.me/SMILEXB'},{text = '‹ لتنصيب بوت ›', url = 't.me/PPFFP'},},{{text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(TheSmile.."Smile:Start:Bot"),"md",false, false, false, false, reply_markup) end
else
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹  السورس  ›',type = 'text'},{text = '‹  اسم البوت  ›', type = 'text'},},{{text = '‹  المطورين  ›',type = 'text'},{text = '‹  الاحصائيات  ›',type = 'text'},},{{text = '‹  الاذاعة  ›',type = 'text'},{text = '‹  العام  ›', type = 'text'},},{{text = '‹  الاشتراك الاجباري  ›',type = 'text'},{text = '‹  التفعيل والتعطيل  ›',type = 'text'},},{{text = '‹  ردود الخاص  ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: اهلاً بك عزيزي ‹ المطور ›\n𖡦: اليك الازرار الخاصة بسورس سمايل', 'md', false, false, false, false, reply_markup) end end
if text == '‹  ردود الخاص  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ ردود الخاص ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ جلب رد الخاص ›',type = 'text'},},{{text = '‹ حذف رد الخاص ›',type = 'text'},{text = '‹ تغيير رد الخاص ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  السورس  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ السورس ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ تحديث الملفات ›',type = 'text'},{text = '‹ تحديث السورس ›', type = 'text'},},{{text = '‹ مبرمج السورس ›', type = 'text'},},{{text = '‹ تحديثات السورس ›',type = 'text'},{text = '‹ قناة السورس ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  اسم البوت  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ اسم البوت ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{
{text = '‹ اسم البوت ›', type = 'text'},},{{text = '‹ حذف الاسم ›',type = 'text'},{text = '‹ تغيير الاسم ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاذاعة  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ الاذاعة ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ اذاعة للمجموعات ›',type = 'text'},{text = '‹ اذاعة للخاص ›', type = 'text'},},{{text = '‹ اذاعة بالتثبيت ›', type = 'text'},},{{text = '‹ اذاعة توجيه للمجموعات ›',type = 'text'},{text = '‹ اذاعة توجيه للخاص ›',type = 'text'},},{{text = '‹ الغاء الامر ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  العام  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ العام ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف رد عام ›',type = 'text'},{text = '‹ اضف رد عام ›', type = 'text'},},{{text = '‹ حذف ردود العام ›',type = 'text'},{text = '‹ ردود العام ›',type = 'text'},},{{text = '‹ حذف المكتومين عام ›',type = 'text'},{text = '‹ المكتومين عام ›',type = 'text'},},{{text = '‹ حذف المحظورين عام ›',type = 'text'},{text = '‹ المحظورين عام ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  المطورين  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ المطورين ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف الاساسيين ›',type = 'text'},{text = '‹ الاساسيين ›', type = 'text'},},{{text = '‹ حذف الثانويين ›',type = 'text'},{text = '‹ الثانويين ›', type = 'text'},},{{text = '‹ حذف المطورين ›',type = 'text'},{text = '‹ المطورين ›',type = 'text'},},{{text = '‹ تغيير المطور الاساسي ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاحصائيات  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ الاحصائيات ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ الاحصائيات ›',type = 'text'},},{{text = '‹ تنظيف المجموعات ›',type = 'text'},{text = '‹ تنظيف المشتركين ›',type = 'text'},},{{text = '‹ جلب النسخة الاحتياطية ›',type = 'text'},},{{text = '‹ جلب نسخة الردود ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  الاشتراك الاجباري  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ الاشتراك الاجباري ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ حذف كليشة الاشتراك ›',type = 'text'},{text = '‹ تغير كليشة الاشتراك ›',type = 'text'},},{{text = '‹ الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ تعطيل الاشتراك الاجباري ›',type = 'text'},{text = '‹ تفعيل الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ تغيير الاشتراك الاجباري ›',type = 'text'},},{{text = '‹ حذف اسم القناة ›',type = 'text'},{text = '‹ تغير اسم القناة ›',type = 'text'},},{{text = '‹ الغاء الامر ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
if text == '‹  التفعيل والتعطيل  ›' and msg.DevelopersAS then
Redis:sadd(TheSmile..'Smile:Num:User:Pv',msg.sender.user_id)  
local marlow = '𖡦: اهلا بك في قسم ‹ التفعيل والتعطيل ›\n𖡦: اضغط على الامر الذي تريد تنفيذه'
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true, data = {{{text = '‹ تعطيل التواصل ›',type = 'text'},{text = '‹ تفعيل التواصل ›', type = 'text'},},{{text = '‹ تعطيل الاذاعة ›',type = 'text'},{text = '‹ تفعيل الاذاعة ›',type = 'text'},},{{text = '‹ تعطيل المغادرة ›',type = 'text'},{text = '‹ تفعيل المغادرة ›',type = 'text'},},{{text = '‹ تعطيل البوت الخدمي ›',type = 'text'},{text = '‹ تفعيل البوت الخدمي ›',type = 'text'},},{{text = '‹ رجوع ›',type = 'text'},},}}
return LuaTele.sendText(msg_chat_id,msg_id, marlow, 'md', false, false, false, false, reply_markup) end
-- marlow --
if text == '‹ تنظيف المشتركين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheSmile..'Smile:Num:User:Pv',v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' ›\n𖡦: تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' ›\n𖡦: لم يتم العثور على وهميين*',"md") end end
if text == '‹ تنظيف المجموعات ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheSmile)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*𖡦: البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheSmile..'Smile:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheSmile..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(Get_Chat.id) end
else
x = x + 1
local keys = Redis:keys(TheSmile..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(TheSmile..'Smile:ChekBotAdd',v)
LuaTele.leaveChat(v) end end
if x ~= 0 then return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' › للمجموعات \n𖡦: تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n𖡦: تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: العدد الكلي ‹ '..#list..' › للمجموعات \n𖡦: لا توجد مجموعات وهميه*',"md") end end
if text == '‹ جلب رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
if not Redis:get(TheSmile.."Smile:Start:Bot") then
local CmdStart = '𖡦: مرحبا انا بوت اسمي ‹ '..(Redis:get(TheSmile.."Smile:Name:Bot") or "سمايل")..' ›\n𖡦: اختصاصي التسليه وحماية المجموعات \n𖡦: من المخربين والتفليش والسبام والخ\n𖡦: فقط قم برفعي ادمن في مجموعتك\n𖡦: وارسل كلمة ↫ ‹ تفعيل ›'
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(TheSmile.."Smile:Start:Bot"),"md",false, false, false, false, reply_markup) end end
if text == '‹ تغيير رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Change:Start:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي كليشة Start الان ","md",true)  end
if text == '‹ حذف رد الخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف كليشة Start ","md",true)   
end
if text == '‹ تغيير الاسم ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي الاسم الان ","md",true)  end
if text == '‹ حذف الاسم ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile..'Smile:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='‹ الاحصائيات ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
LuaTele.sendText(msg_chat_id,msg_id,'*𖡦: احصائيات البوت ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: عدد المجموعات ↫ '..(Redis:scard(TheSmile..'Smile:ChekBotAdd') or 0)..'\n𖡦: عدد المشتركين ↫ '..(Redis:scard(TheSmile..'Smile:Num:User:Pv') or 0)..'*',"md",true)  end
if text == '‹ تغيير كليشة المطور ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/DelDev'},},}}
Redis:set(TheSmile..'Smile:GetTexting:DevTheSmile'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي كليشة المطور الان\n𖡦: ايضاً يمكنك استخدام ما يلي ↫ ⤈\n𖡦: دالة عرض الاسم ↫ ‹ `DevName` ›\n𖡦: دالة عرض الايدي ↫ ‹ `DeviD` ›\n𖡦: دالة عرض المعرف ↫ ‹ `DevUser` ›\n𖡦: دالة عرض البايو ↫ ‹ `DevBio` ›\n𖡦: دالة عرض اسم المجموعة ↫ ‹ `NameGr` ›","md",false, false, false, false, reply_markup) end
if text == '‹ حذف كليشة المطور ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile..'Smile:Texting:DevTheSmile')
return LuaTele.sendText(msg_chat_id,msg_id,'𖡦: تم حذف كليشة المطور') end
if text == '‹ اضف رد عام ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  end
if text == '‹ حذف رد عام ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الغاء ›', data = msg.sender.user_id..'/marlowcloseSo'},},}}
Redis:set(TheSmile.."Smile:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل الان الكلمه لحذفها من ردود المطور","md",false, false, false, false, reply_markup) 
end
if text=='‹ اذاعة للخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
 ✓
]],"md",true)  
return false end
if text=='‹ اذاعة للمجموعات ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
✓
]],"md",true)  
return false end
if text=="‹ اذاعة بالتثبيت ›" and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
𖡦: ارسل لي سواء كان :
‹ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه • صوت • رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: للخروج ارسل ↫ ‹ الغاء ›
✓
]],"md",true)  
return false end
if text=="‹ اذاعة توجيه للمجموعات ›" and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي التوجيه الان\n𖡦: ليتم نشره في المجموعات","md",true)  
return false end
if text=='‹ اذاعة توجيه للخاص ›' and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:setex(TheSmile.."Smile:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖡦: ارسل لي التوجيه الان\n𖡦: ليتم نشره الى المشتركين","md",true)  
return false end
if text == ("‹ ردود العام ›") and msg.DevelopersAS then 

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:List:Rd:Sudo")
text = "\n𖡦: قائمة ردود المطور ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه ??"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." - ‹ "..v.." › ↫ ‹"..db.."›\n"
end
if #list == 0 then
text = "𖡦: عذراً لا توجد ردود للمطور"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  end
if text == ("‹ حذف ردود العام ›") and msg.DevelopersAS then 
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local list = Redis:smembers(TheSmile.."Smile:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:vico"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Text"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Photo"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Video"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:File"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Audio"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:video_note"..v)
Redis:del(TheSmile.."Smile:List:Rd:Sudo") end
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم حذف ردود المطور","md",true)  end
if text == '‹ حذف المطورين ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف الاساسيين ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين اساسيين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:DevelopersAS:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف الثانويين ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين ثانويين حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true) end
if text == '‹ حذف المحظورين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين عام حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true) end
if text == '‹ حذف المكتومين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين عام حالياً , ","md",true)  end
Redis:del(TheSmile.."Smile:ktmAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖡦: تم مسح ‹ "..#Info_Members.." › من المكتومين عام *","md",true) end
if text == '‹ تعطيل البوت الخدمي ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل البوت الخدمي ","md",true) end
if text == '‹ تعطيل التواصل ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:del(TheSmile.."Smile:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تعطيل التواصل داخل البوت ","md",true) end
if text == '‹ تفعيل البوت الخدمي ›' and msg.DevelopersAS then

if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تفعيل البوت الخدمي ","md",true) end
if text == '‹ تفعيل التواصل ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
Redis:set(TheSmile.."Smile:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: تم تفعيل التواصل داخل البوت ","md",true) end
if text == '‹ المحظورين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:BanAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد محظورين عام حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المحظورين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المحظورين عام ›', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ المكتومين عام ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:ktmAll:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مكتومين عام حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المكتومين عام ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المكتومين عام ›', data = msg.sender.user_id..'/ktmAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ المطورين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:Developers:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة مطورين البوت ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح المطورين ›', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ الاساسيين ›' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersAS:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين اساسيين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المطورين الاساسيين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسيين ›', data = msg.sender.user_id..'/DevelopersAS'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text == '‹ الثانويين ›' and msg.DevelopersAS then
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local Info_Members = Redis:smembers(TheSmile.."Smile:DevelopersQ:Groups") 
if #Info_Members == 0 then return LuaTele.sendText(msg_chat_id,msg_id,"𖡦: لا يوجد مطورين ثانويين حالياً , ","md",true)  end
ListMembers = '\n*𖡦: قائمة المطورين الثانويين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الثانويين ›', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup) end
if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع حظر ↫ ‹ "..Controller(msg_chat_id,UserId_Info.id).." › ","md",true)  end
if Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام (%d+)$') then
local UserId = text:match('^الغاء حظر عام (%d+)$')
if not msg.DevelopersQ then return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطورين الثانويين واعلى فقط',"md",true)  end
if ChannelJoin(msg) == false then
local Get_Chat = LuaTele.getChat(Redis:get(TheSmile..'Smile:ChanneliD:Join'))
local NcH = (Redis:get(TheSmile.."Smile:CH:Bot") or Get_Chat.title)
local NcHlink = (Redis:get(TheSmile.."Smile:CHlink:Bot") or "𖡦: عذراً لاتستطيع استخدام البوت !\n𖡦: عليك الاشتراك في القناة اولاً :")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = NcH, url = 't.me/'..Redis:get(TheSmile..'Smile:Channel:Join')},},}}
return LuaTele.sendText(msg.chat_id,msg.id,NcHlink,"md",false, false, false, false, reply_markup) end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره عام من المجموعات بالتأكيد").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖡦: تم الغاء حظره عام من المجموعات").Reply,"md",true) end end
if text and text:match('^الغاء حظر عام @(%S+)$') then
local UserName = text:match('^الغاء حظر عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذراً لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء حظره عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي²' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖡦: عذرا لا تستطيع كتم عام ‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  end
if Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم كتمه عام من المجموعات ").Reply,"md",true) end end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.DevelopersAS then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖡦: هذا الامر للمطور الاساسي واعلى فقط',"md",true)  end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا يوجد حساب بهذا المعرف ","md",true)  end
if UserId_Info.type.is_channel == true then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then return LuaTele.sendText(msg_chat_id,msg_id,"\n𖡦: عذرا لا تستطيع استخدام معرف البوت ","md",true)  end
if not Redis:sismember(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) then return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheSmile.."Smile:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖡦: تم الغاء كتمه عام من المجموعات  ").Reply,"md",true) end end
if not msg.DevelopersAS then
if Redis:get(TheSmile.."Smile:TwaslBot") and not Redis:sismember(TheSmile.."Smile:BaN:In:Tuasl",msg.sender.user_id) then
local ListGet = {Sudo_Id,msg.sender.user_id}
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(TheSmile.."Smile:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'𖡦: قام بارسال الملصق').Reply,"md",true)  end
return LuaTele.sendText(IdUser,msg_id,'𖡦: تم ارسال رسالتك الى المطور',"md",true)  end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(TheSmile.."Smile:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(TheSmile..'Smile:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖡦: تم حظره من تواصل البوت ').Reply,"md",true)  end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(TheSmile..'Smile:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖡦: تم الغاء حظره من تواصل البوت ').Reply,"md",true)  end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖡦: قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true) end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖡦: تم ارسال رسالتك اليه ').Reply,"md",true) end end end 
end --UserBot
end -- File_Bot_Run


function CallBackLua(data) --- هذا الكالباك بي الابديت
--var(data) 
if data and data.luatele and data.luatele == "updateNewInlineCallbackQuery" then
local Text = LuaTele.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(TheSmile..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('𖡦: الھمسة ليست لك .')..'&show_alert=true') end end
end
if data and data.luatele and data.luatele == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = LuaTele.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = '‹ همسة سرية الى ( [@'..username[2]..'] ) هو فقط من يستيطع رؤيتها .', parse_mode = 'Markdown'} 
local reply_markup = {inline_keyboard={{{text = '‹ عرض الھمسة ›', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}} 
local resuult = {{type = 'article', id = idnum, title = 'هذه الھمسة سرية الى ( @'..username[2]..' )', input_message_content = input_message_content, reply_markup = reply_markup}} 
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(TheSmile..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(TheSmile..'hmsabots'..idnum..data.sender_user_id,username[1]) end end
end
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(TheSmile.."Smile:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(TheSmile..'*'..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i]) end
return LuaTele.sendText(Sudo_Id,0,'\n𖡦: تم طرد البوت من مجموعة ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: اسم المجموعة ↫ '..Get_Chat.title..'\n𖡦: ايدي المجموعة ↫ ⤈\n❨ `-100'..data.supergroup.id..'` ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n𖡦: الوقت ↫ '..os.date('%I:%M%p')..'\n𖡦: التاريخ ↫ '..os.date('%Y/%m/%d')..'',"md") end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end
elseif text then
if text == Redis:get(TheSmile.."Smile:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSmile.."Smile:PinMsegees:"..msg.chat_id) end end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSmile.."Smile:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{[1]= data.message.id}) end end 
File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender.user_id == TheSmile then
print('This is Edit for Bot')
return false end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(TheSmile..'Smile:Num:Message:Edit'..data.chat_id..Message_Edit.sender.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(TheSmile.."Smile:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{[1]= data.message_id}) end end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

--
if Text and Text:match('(%d+)/UpdateSo') then
local UserId = Text:match('(%d+)/UpdateSo')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'UpdateBack'},},}}
os.execute('rm -rf Smile.lua')
download('curl -s https://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@raw.githubusercontent.com/MMRRTTUU /pp/master/Smile.lua','Smile.lua')
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
return LuaTele.editMessageText(ChatId,Msg_id, '*𖡦: تم تحديث السورس*', 'md',true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/UpdateFi') then
local UserId = Text:match('(%d+)/UpdateFi')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'UpdateBack'},},}}
print("\27[31;47m\n        ( تم تحديث الملفات )        \n\27[0;34;49m\n") 
LuaTele.editMessageText(ChatId,Msg_id, '*𖡦: تم تحديث ملفات البوت*', 'md',true, false, reply_markup)
dofile('Smile.lua')  end end
--
if Text and Text:match('(%d+)/UpdateBack') then
local UserId = Text:match('(%d+)/UpdateBack')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',data = {{{text = '‹ تحديث الملفات ›', data = UserId..'/'.. 'UpdateFi'},{text = '‹ تحديث السورس ›', data = UserId..'/'.. 'UpdateSo'},},{{text='‹ اخفاء الاوامر ›',data=UserId..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id, '𖡦: اليك ازرار التحديث الخاصة بالسورس ↫ ⤈', 'md',true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/BanAllktm') then
local UserId = Text:match('(%d+)/BanAllktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:BanAll:Groups") 
Redis:del(TheSmile.."Smile:ktmAll:Groups") 
return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح قائمة العام", 'md', true) end end
--
if Text and Text:match('(%d+)/MsHmarlow') then
local UserId = Text:match('(%d+)/MsHmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local list = Redis:smembers(TheSmile.."Smile:allM"..data.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "𖡦: تم حذف ‹ "..k.." › من الميديا"
LuaTele.deleteMessages(data.chat_id,{[1]= Message})
Redis:del(TheSmile.."Smile:allM"..data.chat_id) end end
if #list == 0 then
t = "𖡦: لا توجد ميديا في المجموعة"
end
return LuaTele.editMessageText(ChatId,Msg_id,t,"md",true) end end
-- marlow
if Text and Text:match('(%d+)/Song') then
local UserId = Text:match('(%d+)/Song')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction1"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر غنيلي معطل",true) end 
Abs = math.random(4,2824); 
local Text ='𖡦: تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Song'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/AudiosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/animation') then
local UserId = Text:match('(%d+)/animation')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction2"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر متحركه معطل",true) end 
Abs = math.random(4,1075); 
local Text ='𖡦: تم اختيار المتحركه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'animation'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. ChatId .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/voice') then
local UserId = Text:match('(%d+)/voice')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction3"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر شعر معطل",true) end 
Abs = math.random(4,140); 
local Text ='𖡦: تم اختيار الشعر لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'voice'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Memz') then
local UserId = Text:match('(%d+)/Memz')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction4"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر ميمز معطل",true) end 
Abs = math.random(4,1201); 
local Text ='𖡦: تم اختيار الميمز لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Memz'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/MemzDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Remix') then
local UserId = Text:match('(%d+)/Remix')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction5"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر ريمكس معطل",true) end 
Abs = math.random(4,612); 
local Text ='𖡦: تم اختيار الريمكس لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Remix'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/RemixDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Movies') then
local UserId = Text:match('(%d+)/Movies')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction6"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر فلم معطل",true) end 
Abs = math.random(4,125); 
local Text ='𖡦: تم اختيار الفلم لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Movies'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Anime') then
local UserId = Text:match('(%d+)/Anime')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction7"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر انمي معطل",true) end 
Abs = math.random(4,1002); 
local Text ='𖡦: تم اختيار الانمي لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Anime'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Mp') then
local UserId = Text:match('(%d+)/Mp')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction8"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر اغنيه معطل",true) end 
Abs = math.random(4,1167); 
local Text ='𖡦: تم اختيار الاغنيه لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Mp'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendAudio?chat_id=' .. ChatId .. '&audio=https://t.me/DavidMp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Photos') then
local UserId = Text:match('(%d+)/Photos')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction9"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر صوره معطل",true) end 
Abs = math.random(4,1171); 
local Text ='𖡦: تم اختيار الصوره لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Photos'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
 https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end
--
elseif Text and Text:match('(%d+)/Series') then
local UserId = Text:match('(%d+)/Series')
if tonumber(IdUser) == tonumber(UserId) then
if not Redis:get(TheSmile.."Smile:Status:distraction10"..data.chat_id) then return LuaTele.answerCallbackQuery(data.id,"𖡦: عذراً امر مسلسل معطل",true) end 
Abs = math.random(4,54); 
local Text ='𖡦: تم اختيار المسلسل لك'
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مره اخرى ›', callback_data = IdUser..'/'.. 'Series'}},{{text='‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›',url="t.me/SMILEXB"}}}
local msg_id = Msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. ChatId .. '&photo=https://t.me/SeriesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_prsjeview=true&reply_markup="..JSON.encode(keyboard)) end end
-- marlow
if Text and Text:match('(%d+)/closerdControllerBot') then
local UserId = Text:match('(%d+)/closerdControllerBot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DelDev') then
local UserId = Text:match('(%d+)/DelDev')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile..'Smile:GetTexting:DevTheSmile'..data.chat_id..':'..data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DelOwner') then
local UserId = Text:match('(%d+)/DelOwner')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile..'Smile:GetOwner:OwnerTheSmile'..data.chat_id..':'..data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerdControllerBot') then
local UserId = Text:match('(%d+)/closerdControllerBot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd0bot') then
local UserId = Text:match('(%d+)/closerd0bot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text1'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text2'..test)
Redis:del(TheSmile.."Smile11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerdclbot') then
local UserId = Text:match('(%d+)/closerdclbot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم انهاء وحفظ الردود',"md",true) end end
--
if Text and Text:match('(%d+)/closerddelbot') then
local UserId = Text:match('(%d+)/closerddelbot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text1'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text2'..test)
Redis:del(TheSmile.."Smile11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء وحذف التخزين',"md",true) end end
--
if Text and Text:match('(%d+)/delrdmarlowRbot') then
local UserId = Text:match('(%d+)/delrdmarlowRbot')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile11:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text1'..test)
Redis:del(TheSmile..'Smile11:Add:Rd:Sudo:Text2'..test)
Redis:del(TheSmile.."Smile11:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile11:List:Rd:Sudo", test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
--
if Text and Text:match('(%d+)/closedeleterdbot') then
local UserId = Text:match('(%d+)/closedeleterdbot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile11:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
---- marlow
if Text and Text:match('(%d+)/closerdManagers') then
local UserId = Text:match('(%d+)/closerdManagers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd0') then
local UserId = Text:match('(%d+)/closerd0')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text3'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text4'..test..data.chat_id)
Redis:del(TheSmile.."Smile1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerdcl') then
local UserId = Text:match('(%d+)/closerdcl')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم انهاء وحفظ الردود',"md",true) end end
--
if Text and Text:match('(%d+)/closerddel') then
local UserId = Text:match('(%d+)/closerddel')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text3'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text4'..test..data.chat_id)
Redis:del(TheSmile.."Smile1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء وحذف التخزين',"md",true) end end
--
if Text and Text:match('(%d+)/delrdmarlowR') then
local UserId = Text:match('(%d+)/delrdmarlowR')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile1:Text:Sudo:Bot"..data.sender_user_id..":"..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text1'..test..data.chat_id)
Redis:del(TheSmile..'Smile1:Add:Rd:Sudo:Text2'..test..data.chat_id)
Redis:del(TheSmile.."Smile1:Set:Rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id, test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
--
if Text and Text:match('(%d+)/closedeleterd') then
local UserId = Text:match('(%d+)/closedeleterd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile1:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
-- marlow
if Text and Text:match('(%d+)/closeRules') then
local UserId = Text:match('(%d+)/closeRules')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Rules:" .. data.chat_id .. ":" .. data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeDescription') then
local UserId = Text:match('(%d+)/closeDescription')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Description:" .. data.chat_id .. ":" .. data.sender_user_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeWelcome') then
local UserId = Text:match('(%d+)/closeWelcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Tshake:Welcome:Group" .. data.chat_id .. "" .. data.sender_user_id)  
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closeLINK') then
local UserId = Text:match('(%d+)/closeLINK')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Link"..data.chat_id..""..data.sender_user_id) 
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
-- marlow
if Text and Text:match('(%d+)/closeRD') then
local UserId = Text:match('(%d+)/closeRD')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/closerd') then
local UserId = Text:match('(%d+)/closerd')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile:Text:Manager"..data.sender_user_id..":"..data.chat_id.."")
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Gif"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Vico"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..test..data.chat_id)     
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Text"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Photo"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Video"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:File"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Audio"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:video_note"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile:List:Manager"..data.chat_id.."", test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء حفظ الرد',"md",true) end end
--
if Text and Text:match('(%d+)/closerD') then
local UserId = Text:match('(%d+)/closerD')
if tonumber(IdUser) == tonumber(UserId) then
local test = Redis:get(TheSmile.."Smile:Text:Manager"..data.sender_user_id..":"..data.chat_id.."")
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Gif"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Vico"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..test..data.chat_id)     
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Text"..test..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Photo"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Video"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:File"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Audio"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:video_note"..test..data.chat_id)
Redis:del(TheSmile.."Smile:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
Redis:srem(TheSmile.."Smile:List:Manager"..data.chat_id.."", test)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: الكلمة ↫ ‹ '..test..' › تم حذفها',"md",true) end end
-- marlow --
if Text and Text:match('(%d+)/TkYes') then
local UserId = Text:match('(%d+)/TkYes')
if tonumber(IdUser) == tonumber(UserId) then 
if The_ControllerAll(IdUser) == true then
Rink = 1
elseif Redis:sismember(TheSmile.."Smile:DevelopersAS:Groups",IdUser)  then
Rink = 2
elseif Redis:sismember(TheSmile.."Smile:DevelopersQ:Groups",IdUser)  then
Rink = 3
elseif Redis:sismember(TheSmile.."Smile:Developers:Groups",IdUser)  then
Rink = 4
elseif Redis:sismember(TheSmile.."Smile:TheBasics:Group"..data.chat_id, IdUser) then
Rink = 5
elseif Redis:sismember(TheSmile.."Smile:Originators:Group"..data.chat_id, IdUser) then
Rink = 6
elseif Redis:sismember(TheSmile.."Smile:Managers:Group"..data.chat_id, IdUser) then
Rink = 7
elseif Redis:sismember(TheSmile.."Smile:Addictive:Group"..data.chat_id, IdUser) then
Rink = 8
elseif Redis:sismember(TheSmile.."Smile:Distinguished:Group"..data.chat_id, IdUser) then
Rink = 9
elseif Redis:sismember(TheSmile.."Smile:Cleaner:Group"..data.chat_id, IdUser) then
Rink = 10
else
Rink = 11
end
if Rink == 11 then return LuaTele.editMessageText(ChatId,Msg_id,"\n*𖡦: ليس لديك رتب عزيزي *","md",true)  end
if Rink <= 1  then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عذراً لا استطيع تنزيل المطور الاساسي","md",true) 
else
Redis:srem(TheSmile.."Smile:DevelopersAS:Groups", IdUser)
Redis:srem(TheSmile.."Smile:DevelopersQ:Groups", IdUser)
Redis:srem(TheSmile.."Smile:Developers:Groups", IdUser)
Redis:srem(TheSmile.."Smile:TheBasics:Group"..data.chat_id, IdUser)
Redis:srem(TheSmile.."Smile:Originators:Group"..data.chat_id, IdUser)
Redis:srem(TheSmile.."Smile:Managers:Group"..data.chat_id, IdUser)
Redis:srem(TheSmile.."Smile:Addictive:Group"..data.chat_id, IdUser)
Redis:srem(TheSmile.."Smile:Distinguished:Group"..data.chat_id, IdUser)
Redis:srem(TheSmile.."Smile:Cleaner:Group"..data.chat_id, IdUser)
return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم تنزيلك من جميع الرتب ","md",true)  end end
end
--
if Text and Text:match('(%d+)/TkNo') then
local UserId = Text:match('(%d+)/TkNo')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '𖡦: تم الغاء عملية تنزيل رتبتك', 'md',true) end end
-- marlow --
if Text and Text:match('(%d+)/Yesbot') then
local UserId = Text:match('(%d+)/Yesbot')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheSmile.."Smile:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(data.chat_id)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(data.chat_id,TheSmile)
if statusMem.status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
LuaTele.editMessageText(ChatId,Msg_id,"*𖡦: تمت مغادرة المجموعة*","md",true)
Redis:srem(TheSmile..'Smile:ChekBotAdd',data.chat_id)
local keys = Redis:keys(TheSmile..'*'..data.chat_id)
for i = 1, #keys do
Redis:del(keys[i]) end
LuaTele.leaveChat(data.chat_id) end
else
x = x + 1
local keys = Redis:keys(TheSmile..'*'..v)
for i = 1, #keys do
Redis:del(keys[i]) end
Redis:srem(TheSmile..'Smile:ChekBotAdd',v)
LuaTele.leaveChat(v) end end end end
--
if Text and Text:match('(%d+)/Yesbott') then
local UserId = Text:match('(%d+)/Yesbott')
if tonumber(IdUser) == tonumber(UserId) then 
LuaTele.sendText(ChatId,Msg_id,"*𖡦: تمت مغادرة المجموعة*","md",true)  
local Left_Bot = LuaTele.leaveChat(data.chat_id) end end
--
if Text and Text:match('(%d+)/Nobot') then
local UserId = Text:match('(%d+)/Nobot')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '𖡦: تم الغاء عملية مغادرة البوت', 'md',true) end end
-- marlow --
if Text and Text:match('(%d+)/Banme') then
local UserId = Text:match('(%d+)/Banme')
if tonumber(IdUser) == tonumber(UserId) then 
local StatusMember = LuaTele.getChatMember(data.chat_id,data.sender_user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false end
if KickMe == true then return LuaTele.editMessageText(ChatId,Msg_id,"*𖡦: عذرا لا استطيع طرد ادمنيه ومنشئين المجموعة*","md",true)    
end
LuaTele.setChatMemberStatus(data.chat_id,data.sender_user_id,'banned',0)
return LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(data.sender_user_id,"𖡦: تم طردك من المجموعة بنائآ على طلبك").Reply,"md",true) end end
--
if Text and Text:match('(%d+)/noBanme') then
local UserId = Text:match('(%d+)/noBanme')
if tonumber(IdUser) == tonumber(UserId) then 
return LuaTele.editMessageText(ChatId,Msg_id, '𖡦: تم الغاء عملية طردك من المجموعة', 'md',true) end end
-- marlow --
if Text and Text:match('(%d+)/RRDs') then
local UserId = Text:match('(%d+)/RRDs')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheSmile.."Smile:List:Rd:Sudo")
marlow = "\n𖡦: قائمة ردود المطور ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
marlow = marlow..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
marlow = "𖡦: عذراً لا توجد ردود للمطور"
end
return LuaTele.editMessageText(ChatId,Msg_id,marlow,"md",true) end end
--
if Text and Text:match('(%d+)/RDs') then
local UserId = Text:match('(%d+)/RDs')
if tonumber(IdUser) == tonumber(UserId) then
local Rds = Redis:scard(TheSmile.."Smile:List:Rd:Sudo")
local list = Redis:smembers(TheSmile.."Smile:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:vico"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Text"..v)   
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Photo"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Video"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:File"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:Audio"..v)
Redis:del(TheSmile.."Smile:Add:Rd:Sudo:video_note"..v)
Redis:del(TheSmile.."Smile:List:Rd:Sudo") end
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم حذف ‹ '..Rds..' › من ردود المطور',"md",true) end end
--
if Text and Text:match('(%d+)/RSomarlow') then
local UserId = Text:match('(%d+)/RSomarlow')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheSmile.."Smile11:List:Rd:Sudo")
marlow = "\n𖡦: قائمة الردود المتعدده العامه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
marlow = marlow..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
marlow = "𖡦: لا توجد ردود متعدده عامه"
end
return LuaTele.editMessageText(ChatId,Msg_id,marlow,"md",true) end end
--
if Text and Text:match('(%d+)/RSomarlow') then
local UserId = Text:match('(%d+)/RSomarlow')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheSmile.."Smile11:List:Rd:Sudo")
local list = Redis:smembers(TheSmile.."Smile11:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(TheSmile.."Smile11:Add:Rd:Sudo:Text"..v) 
Redis:del(TheSmile.."Smile11:Add:Rd:Sudo:Text1"..v) 
Redis:del(TheSmile.."Smile11:Add:Rd:Sudo:Text2"..v)   
Redis:del(TheSmile.."Smile11:List:Rd:Sudo") end
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم حذف ‹ '..R..' › من ردود المتعدده العامه',"md",true) end end
--
if Text and Text:match('(%d+)/marlowcloseSo') then
local UserId = Text:match('(%d+)/marlowcloseSo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:On"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
--
if Text and Text:match('(%d+)/DevIDClose') then
local UserId = Text:match('(%d+)/DevIDClose')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:AddSudosNew"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
-- marlow --
if Text and Text:match('(%d+)/Rdmarlow') then
local UserId = Text:match('(%d+)/Rdmarlow')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id)
marlow = "\n𖡦: قائمة الردود المتعدده ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
marlow = marlow..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
marlow = "𖡦: لا توجد ردود متعدده"
end
return LuaTele.editMessageText(ChatId,Msg_id,marlow,"md",true) end end
--
if Text and Text:match('(%d+)/Rdmarlow') then
local UserId = Text:match('(%d+)/Rdmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id)
local list = Redis:smembers(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id)
for k,v in pairs(list) do  
Redis:del(TheSmile.."Smile1:Add:Rd:Sudo:Text"..v..data.chat_id) 
Redis:del(TheSmile.."Smile1:Add:Rd:Sudo:Text1"..v..data.chat_id) 
Redis:del(TheSmile.."Smile1:Add:Rd:Sudo:Text2"..v..data.chat_id) 
Redis:del(TheSmile.."Smile1:List:Rd:Sudo"..data.chat_id) end
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم حذف ‹ '..R..' › من ردود المتعدده',"md",true) end end
--
if Text and Text:match('(%d+)/RRD') then
local UserId = Text:match('(%d+)/RRD')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheSmile.."Smile:List:Manager"..data.chat_id.."")
marlow = "𖡦: قائمة ردود المدير ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheSmile.."Smile:Add:Rd:Manager:Gif"..v..data.chat_id) then
db = "متحركه 🎭"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Vico"..v..data.chat_id) then
db = "بصمه 📢"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..v..data.chat_id) then
db = "ملصق 🃏"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Text"..v..data.chat_id) then
db = "رساله ✉"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Photo"..v..data.chat_id) then
db = "صوره 🎇"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Video"..v..data.chat_id) then
db = "فيديو 📹"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:File"..v..data.chat_id) then
db = "ملف 📁"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:Audio"..v..data.chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(TheSmile.."Smile:Add:Rd:Manager:video_note"..v..data.chat_id) then
db = "فيديو نوت 🎥"
end
marlow = marlow..""..k.." - ‹ `"..v.."` › ↫ ‹"..db.."›\n"
end
if #list == 0 then
marlow = "𖡦: عذرا لا يوجد ردود للمدير في المجموعة"
end
LuaTele.editMessageText(ChatId,Msg_id,marlow, 'md', true) end end
--
if Text and Text:match('(%d+)/RD') then
local UserId = Text:match('(%d+)/RD')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheSmile.."Smile:List:Manager"..data.chat_id.."")
local list = Redis:smembers(TheSmile.."Smile:List:Manager"..data.chat_id.."")
for k,v in pairs(list) do
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Gif"..v..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Vico"..v..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Stekrs"..v..data.chat_id)     
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Text"..v..data.chat_id)   
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Photo"..v..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Video"..v..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:File"..v..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:video_note"..v..data.chat_id)
Redis:del(TheSmile.."Smile:Add:Rd:Manager:Audio"..v..data.chat_id)
Redis:del(TheSmile.."Smile:List:Manager"..data.chat_id) end
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم حذف ‹ '..R..' › من ردود المدير',"md",true)  end 
end
--
if Text and Text:match('(%d+)/marlowclose') then
local UserId = Text:match('(%d+)/marlowclose')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Set:Manager:rd"..data.sender_user_id..":"..data.chat_id)
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: تم الغاء الامر',"md",true) end end
-- marlow --
if Text and Text:match('(%d+)/activation') then
local UserId = Text:match('(%d+)/activation')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Chat = LuaTele.getChat(data.chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(data.chat_id)
if Redis:sismember(TheSmile.."Smile:ChekBotAdd",data.chat_id) then return LuaTele.editMessageText(ChatId,Msg_id, '\n𖡦: المجموعة تم تفعيلها بالتأكيد' ,"md",true)  
else
local Info_Members = LuaTele.getSupergroupMembers(data.chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSmile.."Smile:TheBas:Group"..data.chat_id,v.member_id.user_id) 
x = x + 1 end end
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رفع الادمنيه ›', data = UserId..'/'.. 'addAdmins@'..data.chat_id},{text = '‹ تفعيل الحمايه ›', data = UserId..'/'.. 'LockAllGroup@'..data.chat_id},},{{text = '‹ الاوامر ›', data = UserId..'/'.. 'helpall'},},{{text = '‹ غادر ›', data = UserId..'/'..'Yesbot'},{text = '‹ تعطيل ›', data = UserId..'/'..'disable'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
Redis:sadd(TheSmile.."Smile:ChekBotAdd",data.chat_id)
Redis:set(TheSmile.."Smile:Status:Id"..data.chat_id,true) ;Redis:set(TheSmile.."Smile:Status:Reply"..data.chat_id,true) ;Redis:set(TheSmile.."Smile:Status:ReplySudo"..data.chat_id,true) ;Redis:set(TheSmile.."Smile:Status:BanId"..data.chat_id,true) ;Redis:set(TheSmile.."Smile:Status:SetId"..data.chat_id,true) 
return LuaTele.sendText(ChatId,Msg_id,'*𖡦: تم اعادة تفعيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*','md', true, false, false, false, reply_markup) end end 
end
--
if Text and Text:match('(%d+)/disable') then
local UserId = Text:match('(%d+)/disable')
if tonumber(IdUser) == tonumber(UserId) then
local Get_Chat = LuaTele.getChat(data.chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(data.chat_id)
if not Redis:sismember(TheSmile.."Smile:ChekBotAdd",data.chat_id) then return LuaTele.editMessageText(ChatId,Msg_id, '\n𖡦: المجموعة تم تعطيلها بالتأكيد',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ غادر ›', data = UserId..'/'..'Yesbot'},{text = '‹ تفعيل ›', data = UserId..'/'..'activation'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
Redis:srem(TheSmile.."Smile:ChekBotAdd",data.chat_id)
return LuaTele.sendText(ChatId,Msg_id,'*𖡦: تم تعطيل المجموعة ↫ ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*','md',true, false, false, false, reply_markup) end end
end
-- Lar Bot end --

if Text and Text:match('(%d+)/LinKTexT') then
local UserId = Text:match('(%d+)/LinKTexT')
if tonumber(IdUser) == tonumber(UserId) then 
local Get_Chat = LuaTele.getChat(data.chat_id) 
local GetLink = Redis:get(TheSmile.."Smile:Group:Link"..data.chat_id) 
if GetLink then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠ❨ '..GetLink..' ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title, url=GetLink}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local LinkGroup = json:decode(https.request('https://api.telegram.org/bot'..Token..'/exportChatInviteLink?chat_id='..data.chat_id))
if LinkGroup.ok == true then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠ❨ '..LinkGroup.result..' ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title,url=LinkGroup.result}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end


if Text and Text:match('(%d+)/LinKOnla') then
local UserId = Text:match('(%d+)/LinKOnla')
if tonumber(IdUser) == tonumber(UserId) then 
local Get_Chat = LuaTele.getChat(data.chat_id) 
local GetLink = Redis:get(TheSmile.."Smile:Group:Link"..data.chat_id) 
if GetLink then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ❨ ['..Get_Chat.title.. ']('..GetLink..') ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title, url=GetLink}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local LinkGroup = json:decode(https.request('https://api.telegram.org/bot'..Token..'/exportChatInviteLink?chat_id='..data.chat_id))
if LinkGroup.ok == true then
local Text = '⌔︙Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ❨ ['..Get_Chat.title.. ']('..LinkGroup.result..') ❩ '
keyboard = {} 
keyboard.inline_keyboard = {{{text= Get_Chat.title,url= LinkGroup.result}}}
local msg_id = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&message_id='..msg_id..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end


-- Lar Banme --
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(TheSmile.."Smile:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '*𖡦: الف مبروك حظك حلو اليوم\n𖡦: فزت ويانه وطلعت المحيبس بل عظمه رقم ‹ '..NumMahibes..' ›*'
else
MahibesText = '*𖡦: للاسف لقد خسرت المحيبس بالعظمه رقم ‹ '..NumMahibes..' ›\n𖡦: جرب حضك ويانه مره اخره*'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊🏻'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊🏼' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊🏽'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊🏾'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊🏿'
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Mahibes1..'', data = '/*'}, {text = ''..Mahibes2..'', data = '/*'},},{{text = ''..Mahibes3..'', data = '/*'}, {text = ''..Mahibes4..'', data = '/*'},},{{text = ''..Mahibes5..'', data = '/*'}, {text = ''..Mahibes6..'', data = '/*'},},{{text = 'اللعب مره اخرى', data = '/MahibesAgane'},},}}
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup) end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '👊', data = '/Mahibes1'}, {text = '👊🏻', data = '/Mahibes2'},},{{text = '👊🏼', data = '/Mahibes3'}, {text = '👊🏽', data = '/Mahibes4'},},{{text = '👊🏾', data = '/Mahibes5'}, {text = '👊🏿', data = '/Mahibes6'},},}}
local TextMahibesAgane = [[*
𖡦: لعبه المحيبس هي لعبة الحظ
𖡦: كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup) end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اوامر الحمايه الخاصه بالمجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: قفل • فتح + الامر ↫ ‹ بالتقيد • بالطرد • بالكتم ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: الروابط
𖡦: المعرف
𖡦: التاك
𖡦: الشارحه
𖡦: التعديل
𖡦: التثبيت
𖡦: المتحركه
𖡦: الملفات
𖡦: الصور
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: الماركداون
𖡦: البوتات
𖡦: التكرار
𖡦: الكلايش
𖡦: السيلفي
𖡦: الملصقات
𖡦: الفيديو
𖡦: الكفر
𖡦: الفشار
𖡦: الطائفيه
𖡦: الانلاين
𖡦: الدردشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: التوجيه
𖡦: الاغاني
𖡦: الصوت
𖡦: الجهات
𖡦: الاشعارات
𖡦: القنوات
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/degm') then
local UserId = Text:match('(%d+)/degm')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'المربعات', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'كورسايرس', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'ليتل بلاند', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'أستروكات', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'كأس العالم', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'با', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'بريكستاكر', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'تحميلالفان', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'الجاذبية نينجا21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'تحميلالفان', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'الرسامت تيمز', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'صن شاين سوليتير', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'عقوبة مطلق النار2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'الرسامت تيمز', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'جروفيسكي', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'سبيس ترافلر', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'سكوداهوكي1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'سمارتوبشارك', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'}},
{
{text = '- اخفاء الامر ', data =IdUser..'/'.. 'delAmr'}
},
}
}
local TextHelp = [[*
• مرحبا بك في الالعاب الاحترافيه الخاص بسورس سمايل 
• اختر اللعبه ثم اختار المحادثة التي تريد اللعب بها
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اوامر ادمنية ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: رفع • تنزيل ↫ مميز
𖡦: تاك للكل • عدد الكروب
𖡦: كتم • حظر • طرد • تقيد
𖡦: الغاء كتم • الغاء حظر • الغاء تقيد
𖡦: منع • الغاء منع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: عرض القوائم ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: المكتومين
𖡦: المميزين
𖡦: قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تثبيت • الغاء تثبيت
𖡦: الرابط • الاعدادات
𖡦: الترحيب • القوانين
𖡦: تفعيل • تعطيل ↫ الترحيب
𖡦: تفعيل • تعطيل ↫ الرابط
𖡦: جهاتي • ايدي • رسائلي
𖡦: سحكاتي • مجوهراتي
𖡦: كشف البوتات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
??: وضع • ضع الاوامر التاليه ↫ ⤈
𖡦: اسم • رابط • صوره
𖡦: قوانين • وصف • ترحيب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: حذف • مسح الاوامر التاليه ↫ ⤈
𖡦: قائمه المنع • المحظورين
𖡦: المميزين • المكتومين • القوانين
𖡦: المطرودين • البوتات • الصوره • الرابط
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: رفع • تنزيل ↫ ادمن
᥀️︙رفع • كشف ↫ القيود
𖡦: تنزيل الكل ↫ ‹ بالرد • بالمعرف ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تغيير رد الرتب في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تغير رد + اسم الرتبه والنص
𖡦: المطور • المنشئ الاساسي
𖡦: المنشئ • المدير • الادمن
𖡦: المميز • العضو
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تفعيل • تعطيل الاوامر التاليه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: الايدي • الايدي بالصوره
𖡦: ردود المطور • ردود المدير
𖡦: اطردني • الالعاب • الالعاب الاحترافيه • الرفع
𖡦: الحظر • الرابط •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تفعيل • تعطيل الاوامر التاليه ↫ ⤈
𖡦:  اوامر النسب
𖡦الابراج
𖡦حساب العمر
𖡦معاني الاسماء
𖡦نسبه الحب
𖡦نسبه الكره
𖡦نسبه الانوثه
𖡦نسبه الذكاء
⌔نسبه الرجوله
⌔نسبه الغباء
𖡦: الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تعين • مسح ↫الايدي
𖡦: رفع الادمنيه • مسح الادمنيه
𖡦: ردود المدير • مسح ردود المدير
𖡦: اضف • حذف + رد
𖡦: تنظيف + عدد
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اوامر المنشئ الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: رفع • تنزيل ↫ منشئ
𖡦: المنشئين • مسح المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: اوامر المنشئ المجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: رفع • تنزيل ↫ مدير
𖡦: المدراء • مسح المدراء
𖡦: اضف رسائل ↫ ‹ بالرد • بالايدي ›
𖡦: اضف مجوهرات ↫ ‹ بالرد • بالايدي ›
𖡦: اضف • حذف + الامر
𖡦: الاوامر المضافه • مسح الاوامر المضافه
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'العاب البوت', data = IdUser..'/help6'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: حظر عام • الغاء العام
𖡦: رفع • تنزيل ↫ مطور
𖡦: قائمه العام • مسح قائمه العام
𖡦: المطورين • مسح المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: اضف • حذف ↫ رد للكل
𖡦: وضع • حذف ↫ كليشة المطور
𖡦: مسح ردود المطور • ردود المطور
𖡦: تحديث •  تحديث السورس
𖡦: تعين عدد الاعضاء + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تفعيل • تعطيل الاوامر التاليه ↫ ⤈
𖡦: البوت الخدمي • المغادرة • الاذاعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: اوامر المطور في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: تفعيل • تعطيل • الاحصائيات
𖡦: رفع • تنزيل ↫ منشئ اساسي
𖡦: مسح الاساسين • المنشئين الاساسين
𖡦: غادر • غادر + الايدي
𖡦: اذاعه • اذاعه بالتوجيه • اذاعه بالتثبيت
𖡦: اذاعه خاص • اذاعه خاص بالتوجيه 
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'},},{{text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall'},},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: قائمه الالعاب البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: لعبة المختلف ↫ المختلف
𖡦: لعبة الامثله ↫ امثله
𖡦: لعبة العكس ↫ العكس
𖡦: لعبة الحزوره ↫ حزوره
𖡦: لعبة المعاني ↫ معاني
𖡦: لعبة البات ↫ بات
𖡦: لعبة التخمين ↫ خمن
𖡦: لعبه الاسرع ↫ الاسرع
𖡦: لعبة السمايلات ↫ سمايلات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: مجوهراتي ↫ لعرض عدد الارباح
𖡦: بيع مجوهراتي + العدد ↫ لبيع المجوهرات كل مجوهره مقابل ‹ 50 › رساله
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اوامر الحمايه', data = IdUser..'/help1'}, {text = 'اوامر الادمنيه', data = IdUser..'/help2'},},{{text = 'اوامر المدراء', data = IdUser..'/help3'}, {text = 'اوامر المنشئين', data = IdUser..'/help4'},},{{text = 'اوامر المطورين', data = IdUser..'/help5'}, {text = 'العاب البوت', data = IdUser..'/help6'},},{{text = 'القفل والفتح', data = IdUser..'/NoNextSeting'}, {text = 'التفعيل والتعطيل', data = IdUser..'/listallAddorrem'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
local TextHelp = [[*
𖡦: اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𖡦: م1 ↫ اوامر الحمايه
𖡦: م2 ↫ اوامر الادمنيه
𖡦: م3 ↫ اوامر المدراء
𖡦: م4 ↫ اوامر المنشئين
𖡦: م5 ↫ اوامر المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الروابط").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكلايش").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكيبورد").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاغاني").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المتحركات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملفات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الدردشه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الفيديو").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصور").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المعرفات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التاك").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل البوتات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التوجيه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصوت").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملصقات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الجهات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الدخول").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاضافه").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل بصمه الفيديو").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التثبيت").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاشعارات").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الماركدون").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التعديل").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الالعاب").Lock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSmile.."Smile:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التكرار").Lock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الروابط").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكلايش").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكيبورد").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاغاني").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المتحركات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملفات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الفيديو").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصور").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المعرفات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التاك").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التوجيه").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصوت").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملصقات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الجهات").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل بصمه الفيديو").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الماركدون").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الالعاب").lockKid, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSmile.."Smile:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التكرار").lockKid, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الروابط").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكلايش").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكيبورد").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاغاني").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المتحركات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملفات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الفيديو").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصور").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المعرفات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التاك").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التوجيه").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصوت").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملصقات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الجهات").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الماركدون").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الالعاب").lockKtm, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSmile.."Smile:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التكرار").lockKtm, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الروابط").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكلايش").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الكيبورد").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الاغاني").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المتحركات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملفات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الفيديو").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصور").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل المعرفات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التاك").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التوجيه").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الصوت").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الملصقات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الجهات").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل بصمه الفيديو").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الماركدون").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل الالعاب").lockKick, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSmile.."Smile:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم قفل التكرار").lockKick, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر ردود المدير").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر ردود المطور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر ردود المدير").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر ردود المطور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSmile.."Smile:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele ~= "chatMemberStatusCreator" then
Redis:sadd(TheSmile.."Smile:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1 end end
end
LuaTele.answerCallbackQuery(data.id, "𖡦: تم ترقية ‹ "..y.." › ادمنيه  ", true) end end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(TheSmile.."Smile:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(TheSmile..'Smile:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "𖡦: تم قفل جميع الاوامر بنجاح  ", true) end end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
LuaTele.answerCallbackQuery(data.id, "𖡦: تم مغادره البوت من المجموعة", true)
LuaTele.leaveChat(UserId) end


if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id) end end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✗ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✓ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✗ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✓ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✗ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✓ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✗ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✓ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✗ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✓ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote}) end end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✗ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
LuaTele.answerCallbackQuery(data.id, "𖡦: تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✓ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1}) end end
end
if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin) end
Get_permissions(ChatId,IdUser,Msg_id) end end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},},{{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},},{{text = 'تعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'تفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},},{{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},},{{text = 'تعطيل ردود المدير', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = IdUser..'/'.. 'mute_ryple'},},{{text = 'تعطيل ردود المطور', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = IdUser..'/'.. 'mute_ryplesudo'},},{{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},},{{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},},{{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},},{{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id,'𖡦: اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, reply_markup) end end
-- marlow
if Text and Text:match('(%d+)/MMsgDel') then
local UserId = Text:match('(%d+)/MMsgDel')
if tonumber(IdUser) == tonumber(UserId) then
local MMsgDel = (Redis:get(TheSmile..'Smile:Num:Message:User'..data.chat_id..':'..UserId) or 0)
Redis:del(TheSmile..'Smile:Num:Message:User'..data.chat_id..':'..UserId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg'},},}}
LuaTele.editMessageText(ChatId,Msg_id,'*𖡦: تم مسح جميع رسائلك ↫ *‹ *'..MMsgDel..'* ›', 'md', false, false, reply_markup) end end
if Text and Text:match('(%d+)/MsgDell') then
local UserId = Text:match('(%d+)/MsgDell')
if tonumber(IdUser) == tonumber(UserId) then
local MsgDell = (Redis:get(TheSmile..'Smile:Num:Message:Edit'..data.chat_id..UserId) or 0)
Redis:del(TheSmile..'Smile:Num:Message:Edit'..data.chat_id..UserId)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg'},},}}
LuaTele.editMessageText(ChatId,Msg_id,'*𖡦: تم مسح جميع سحكاتك ↫ *‹ *'..MsgDell..'* ›', 'md', false, false, reply_markup) end end
-- marlow
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖡦: اعدادات المجموعة ".."\n𖡦: علامة ال (✓) تعني مقفول".."\n𖡦: علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},},{{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},},{{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},},{{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},},{{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},},{{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},},{{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},},{{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},},{{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},},{{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},},{{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},},{{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},},{{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},},{{text = '‹ رجوع ›', data =IdUser..'/'.. 'NoNextSeting'}},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖡦: اعدادات المجموعة ".."\n𖡦: علامة ال (✓) تعني مقفول".."\n𖡦: علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},},{{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},},{{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},},{{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},},{{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},},{{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},},{{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},},{{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},},{{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},},{{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},},{{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},},{{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},},{{text = 'التالي', data =IdUser..'/'.. 'NextSeting'}},{{text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- marlow
if Text and Text:match('(%d+)/TheBasicsmarlow') then
local UserId = Text:match('(%d+)/TheBasicsmarlow')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAmarlow'},},}}
local Info_Members = Redis:smembers(TheSmile.."Smile:TheBasics:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: لا يوجد منشئين اساسيين حالياً , ","md",true, false, reply_markup)  end
ListMembers = '\n*𖡦: قائمة المنشئين الاساسيين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md", true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/Originatorsmarlow') then
local UserId = Text:match('(%d+)/Originatorsmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAmarlow'},},}}
local Info_Members = Redis:smembers(TheSmile.."Smile:Originators:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: لا يوجد منشئين حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*𖡦: قائمة منشئين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/Managersmarlow') then
local UserId = Text:match('(%d+)/Managersmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAmarlow'},},}}
local Info_Members = Redis:smembers(TheSmile.."Smile:Managers:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: لا يوجد مدراء حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*𖡦: قائمة مدراء في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/Addictivemarlow') then
local UserId = Text:match('(%d+)/Addictivemarlow')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAmarlow'},},}}
local Info_Members = Redis:smembers(TheSmile.."Smile:Addictive:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: لا يوجد ادمنيه حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*𖡦: قائمة الادمنية في بالمجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/DelDistinguishedmarlow') then
local UserId = Text:match('(%d+)/DelDistinguishedmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAmarlow'},},}}
local Info_Members = Redis:smembers(TheSmile.."Smile:Distinguished:Group"..data.chat_id) 
if #Info_Members == 0 then return LuaTele.editMessageText(ChatId,Msg_id,"𖡦: لا يوجد مميزين حالياً , ","md",true, false, reply_markup) end
ListMembers = '\n*𖡦: قائمة المميزين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n" end end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup) end end
--
if Text and Text:match('(%d+)/RgoAmarlow') then
local UserId = Text:match('(%d+)/RgoAmarlow')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖡦: هلا بك في قسم رتب المجموعة*"
local L = Redis:scard(TheSmile.."Smile:TheBasics:Group"..data.chat_id) 
local LL = Redis:scard(TheSmile.."Smile:Originators:Group"..data.chat_id) 
local LLL = Redis:scard(TheSmile.."Smile:Managers:Group"..data.chat_id)
local LLLL = Redis:scard(TheSmile.."Smile:Addictive:Group"..data.chat_id)  
local LLLLL = Redis:scard(TheSmile.."Smile:Distinguished:Group"..data.chat_id)
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ الاساسيين : '..L..' ›', data =IdUser..'/'.. 'TheBasicsmarlow'},},{{text = '‹ المنشئين : '..LL..' ›', data =IdUser..'/'.. 'Originatorsmarlow'},{text = '‹ المدراء : '..LLL..' ›', data =IdUser..'/'.. 'Managersmarlow'},},{{text = '‹ الادمنيه : '..LLLL..' ›', data =IdUser..'/'.. 'Addictivemarlow'},{text = '‹ المميزين : '..LLLLL..' ›', data =IdUser..'/'.. 'DelDistinguishedmarlow'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
return LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', true, false, reply_markup) end end 
--
if Text and Text:match('(%d+)/RgoA') then
local UserId = Text:match('(%d+)/RgoA')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖡦: هلا بك في قسم رتب المجموعة*"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح الاساسين ›', data =IdUser..'/'.. 'TheBasics'},},{{text = '‹ مسح المنشئين ›', data =IdUser..'/'.. 'Originators'},{text = '‹ مسح المدراء ›', data =IdUser..'/'.. 'Managers'},},{{text = '‹ مسح الادمنيه ›', data =IdUser..'/'.. 'Addictive'},{text = '‹ مسح المميزين ›', data =IdUser..'/'.. 'DelDistinguished'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- marlow
if Text and Text:match('(%d+)/Rgg') then
local UserId = Text:match('(%d+)/Rgg')
if tonumber(IdUser) == tonumber(UserId) then
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:Edit'..data.chat_id..UserId) or 0)
local marlow = (Redis:get(TheSmile..'Smile:Num:Message:User'..data.chat_id..':'..UserId) or 0)
local Text = "\n𖡦: من خلال الازرار يمكنك مسح رسائلك وسحكاتك"
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ مسح سحكاتي : '..marlow..' ›', data =IdUser..'/'.. 'MsgDell'},{text = '‹ مسح رسائلي : '..marlow..' ›', data =IdUser..'/'.. 'MMsgDel'},},{{text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr'}},{{text = '‹ ѕᴏᴜʀᴄᴇ ѕᴍɪʟᴇ  ›', url = 't.me/SMILEXB'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup) end end 
-- marlow
if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then return LuaTele.deleteMessages(ChatId,{[1]= Msg_id}) end end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},},{{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},},{{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},},{{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},},{{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},},{{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},},{{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},},{{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},},{{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},},{{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},},{{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},},{{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},},{{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},},{{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},},{{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},},{{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},},{{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},},{{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},},{{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},},{{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},},{{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},},{{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},},{{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},},{{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},},{{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},},{{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},},{{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},},{{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},},{{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},},{{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},},{{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},},{{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},},{{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},},{{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},},{{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},},{{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},},{{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},},{{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},},{{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},},{{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},},{{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},},{{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},},{{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},},{{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},},{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup) end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الروابط").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الكلايش").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الكيبورد").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الاغاني").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح المتحركات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الملفات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الدردشه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الفيديو").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الصور").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح المعرفات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح التاك").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح البوتات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح التوجيه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الصوت").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الملصقات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الجهات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الدخول").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الاضافه").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح التثبيت").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الاشعارات").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الماركدون").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح التعديل").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح الالعاب").unLock, 'md', true, false, reply_markup) end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(TheSmile.."Smile:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖡦: تم فتح التكرار").unLock, 'md', true, false, reply_markup) end end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح مطورين البوت", 'md', false) end
elseif Text and Text:match('(%d+)/DevelopersAS') then
local UserId = Text:match('(%d+)/DevelopersAS')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:DevelopersAS:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المطورين الاساسيين", 'md', false) end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المطورين الثانويين", 'md', false) end
elseif Text and Text:match('(%d+)/TheBasicsQ') then
local UserId = Text:match('(%d+)/TheBasicsQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:TheBasicsQ:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"*𖡦: تم مسح المالكين بالمجموعة *", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:TheBasics:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المنشئين الاساسيين", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Originators:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المنشئين بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Managers:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المدراء بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Addictive:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح ادمنيه المجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المميزين بالمجموعة", 'md', false, false, reply_markup) end
elseif Text and Text:match('(%d+)/Cleaner') then
local UserId = Text:match('(%d+)/Cleaner')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:Cleaner:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المنظفين بالمجموعة", 'md', false) end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المحظورين عام", 'md', false) end
elseif Text and Text:match('(%d+)/ktmAll') then
local UserId = Text:match('(%d+)/ktmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:ktmAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المكتومين عام", 'md', false) end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المحظورين بالمجموعة", 'md', false) end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSmile.."Smile:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖡦: تم مسح المكتومين بالمجموعة", 'md', false) end end
 end end


luatele.run(CallBackLua)
 




