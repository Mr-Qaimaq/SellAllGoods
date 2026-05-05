local s=71
local function e(e)
print("[SellAllGoods] "..e)
end
local function o(e)
local a={}
local t=e:GetEntitiesCount()
for t=0,t-1 do
local e=e:GetEntity(t)
if e and e:IsValid()then
local o=e:GetCountAvailableRecipesToExecute()
table.insert(a,{index=t,recipeVM=e,available=o})
end
end
return a
end
local function h()
local t=FindFirstOf("WBP_CraftTrade_Sell_Screen_C")
if not t or not t:IsValid()then
e("Sell screen not open")
return
end
ExecuteInGameThread(function()
local a=t.uw_Details
if not a or not a:IsValid()then
e("Details panel not found")
return
end
local t=t.uw_RecipeList
if not t or not t:IsValid()then
e("RecipeList widget not found")
return
end
local t=t.ListVM
if not t or not t:IsValid()then
e("RecipeListVM not found")
return
end
local i=o(t)
local n=#i
local t=0
local o=0
for i,a in ipairs(i)do
if a.available>0 then
t=t+1
o=o+a.available
end
end
e("Item categories: "..tostring(n)..
" | Sellable categories: "..tostring(t)..
" | Total sellable items: "..tostring(o))
if t==0 then
e("Nothing to sell.")
return
end
local t=FindAllOf("WBP_CraftTrade_RecipeListEntity_Sell_C")
if not t then
e("No entry widgets found")
return
end
local o={}
for t,e in ipairs(t)do
if e:IsValid()then
local t=e.ListItemVM
if t and t:IsValid()then
o[t:GetFullName()]=e
end
end
end
local n=0
for i,t in ipairs(i)do
if t.available<=0 then goto continue end
e("Item #"..tostring(t.index+1).." has "..tostring(t.available).." sellable")
local o=o[t.recipeVM:GetFullName()]
if not o or not o:IsValid()then
e("Item #"..tostring(t.index+1).." entry widget not found, skipping")
goto continue
end
o:BndEvt__WBP_Craft_RecipeListEntity_Sell_uw_Button_K2Node_ComponentBoundEvent_10_OnClicked__DelegateSignature()
local o=a.uw_AmountSelector
if o and o:IsValid()then
for e=1,t.available-1 do
o:BndEvt__WBP_Craft_AmountSelector_uw_ButtonIncrease_K2Node_ComponentBoundEvent_3_OnPressed__DelegateSignature()
end
end
a:BndEvt__WBP_Trade_Details_Buy_uw_ButtonCraft_K2Node_ComponentBoundEvent_3_OnClick__DelegateSignature()
n=n+1
e("Item #"..tostring(t.index+1).." sold x"..tostring(t.available))
::continue::
end
e("Done. Sold "..tostring(n).." item type(s).")
end)
end
RegisterKeyBind(s,function()
h()
end)
e("Mod loaded. Press G while sell screen is open to sell all.")