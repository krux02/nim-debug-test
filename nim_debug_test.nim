import strutils, os

proc argsProcessing() : void =
  let taintedArgs = commandLineParams()
  var args = newSeq[string](taintedArgs.len.Natural)
  for i, arg in taintedArgs:
    args[i] = arg.string

  for i in 0 .. < args.len:
    args[i].add(" ")
    args[i].add($i)

  var longString = ""

  for i, arg in args:
    for j in 0 .. i:
      longString.add(arg)
  

proc foobar(a:string) : string =
  var letters = 0
  var digits  = 0
  var other = 0

  for c in a:
    if c.isAlpha: letters += 1
    if c.isDigit: digits += 1
    if not c.isAlphaNumeric: other += 1

  "$1 - $2 - $3".format(letters, digits, other)


  
proc segfault() : string =
  result.add("123")
  
echo foobar("hallo Welt 123")

argsProcessing()

echo segfault()
