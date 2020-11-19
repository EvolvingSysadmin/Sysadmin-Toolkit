##### CLEAN DATA USING REGEX #####

# https://www.reddit.com/r/PowerShell/comments/f0sy6y/cleaning_data/

$cleanData = $data -replace "(\n|\r)+","`n" -replace "(\n|\r){2,}","`n" -replace "^(\n|\r)+",""


