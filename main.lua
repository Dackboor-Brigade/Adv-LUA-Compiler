-- Setting up core memory.
local _original=io.read("a*")
local _refactor=""
local _safesymbol={["\""]=true,[")"]=true,["}"]=true,["]"]=true}

-- 
local I=0
while I<string.len(_original) do
  I=I+1
  
  -- Removing comments.
  if string.sub(_original,I,I+3)=="--[[" then I=I+3
    repeat I=I+1 until string.sub(_original,I,I+1)=="]]" or I>string.len(_original) I=I+3
  elseif string.sub(_original,I,I+1)=="--" then I=I+1
    repeat I=I+1 until string.sub(_original,I,I)=="\n" or I>string.len(_original)
  
  -- Removing empty lines.
  elseif string.sub(_original,I,I+1)=="\n\n" or string.sub(_original,I,I)=="\n" and I==string.len(_original) then 
  
  -- Collapsing all lines.
  elseif string.sub(_original,I,I)=="\n" and (_safesymbol[string.sub(_original,I-1,I-1)] or _safesymbol[string.sub(_original,I+1,I+1)]) then
  elseif string.sub(_original,I,I)=="\n" and not(_safesymbol[string.sub(_original,I-1,I-1)] or _safesymbol[string.sub(_original,I+1,I+1)]) then _refactor=_refactor.." "

  else _refactor=_refactor..string.sub(_original,I,I)end
end

-- 
print("₩".._refactor.."₩")
