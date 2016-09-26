--
-- This is file `unicode-math.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- unicode-math.dtx  (with options: `lua')
-- Copyright 2006-2013   Will Robertson <will.robertson@latex-project.org>
-- Copyright 2010-2013 Philipp Stephani <st_philipp@yahoo.de>
-- Copyright 2012-2013     Khaled Hosny <khaledhosny@eglug.org>
-- 
-- This package is free software and may be redistributed and/or modified under
-- the conditions of the LaTeX Project Public License, version 1.3c or higher
-- (your choice): <http://www.latex-project.org/lppl/>.
-- 
-- This work is "maintained" by Will Robertson.
local err, warn, info, log = luatexbase.provides_module({
  name        = "unicode-math",
  date        = "2012/04/23",
  version     = 0.1,
  description = "Unicode math typesetting for LuaLaTeX",
  author      = "Khaled Hosny, Will Robertson, Philipp Stephani",
  licence     = "LPPL v1.3+"
})
local function set_sscale_dimens(fontdata)
  local mc = fontdata.MathConstants
  if mc then
    fontdata.parameters[10] = mc.ScriptPercentScaleDown or 70
    fontdata.parameters[11] = mc.ScriptScriptPercentScaleDown or 50
  end
end
luatexbase.add_to_callback("luaotfload.patch_font", set_sscale_dimens, "unicode_math.set_sscale_dimens")
local function patch_cambria_domh(fontdata)
  local mc = fontdata.MathConstants
  local mh = 2800 / fontdata.units * fontdata.size
  if fontdata.psname == "CambriaMath" and mc then
    if mc.DisplayOperatorMinHeight < mh then
      mc.DisplayOperatorMinHeight = mh
    end
  end
end
luatexbase.add_to_callback("luaotfload.patch_font", patch_cambria_domh, "cambria.domh")
