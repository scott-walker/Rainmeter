function Initialize()
   
   local FilePath = SKIN:MakePathAbsolute('n5_kanji.txt')
   tFileLines = {}
   for line in io.lines(FilePath) do
      table.insert(tFileLines, line)
   end
   SKIN:Bang('!SetOption', 'MeterUTF8', 'Text', tFileLines[1])
   iTotal = table.maxn(tFileLines)
   
end -- function Initialize

function Update()

   iNewLine = math.random(iTotal)
   sKanji, sKatakana, sHirigana, sDefn = string.match(tFileLines[iNewLine], '(.*)\t(.*)\t(.*)\t(.*)')
   
   SKIN:Bang('!SetOption KanjiText Text \"'..sKanji..'\"')
   SKIN:Bang('!SetOption KatakanaText Text \"'..string.gsub(sKatakana, ",", "\n")..'\"')
   SKIN:Bang('!SetOption HiriganaText Text \"'..string.gsub(sHirigana, ",", "\n")..'\"')
   SKIN:Bang('!SetOption DefinitionText Text \"'..string.gsub(sDefn, ",", "\n")..'\"')
   
   return ''
   
end -- function Update
