function Initialize()
   
   local FilePath = SKIN:MakePathAbsolute('N5-vocab-list-10.csv')
   tFileLines = {}
   for line in io.lines(FilePath) do
      table.insert(tFileLines, line)
   end
   SKIN:Bang('!SetOption', 'MeterUTF8', 'Text', tFileLines[1])
   iTotal = table.maxn(tFileLines)
   
end -- function Initialize

function Update()

   iNewLine = math.random(iTotal)
   sKanji, sKana, sDefn = string.match(tFileLines[iNewLine], '([^,]*),([^,]*),([^,]*),.*')
   
   SKIN:Bang('!SetOption KanjiText Text \"'..sKanji..'\"')
   SKIN:Bang('!SetOption KanaText Text \"'..sKana..'\"')
   SKIN:Bang('!SetOption DefinitionText Text \"'..sDefn..'\"')
   
   return ''
   
end -- function Update
