import strutils, os

proc untaint( tainted : seq[TaintedString] ) : seq[string] =
  result.newSeq(tainted.len.Natural)
  for i, str in tainted:
    result[i] = str.string

proc argsProcessing(args : seq[string]) : void =
  var longString = ""

  for i, arg in args:
    for j in 0 .. i:
      longString.add(arg)
      longString.add(" ")

type direction = enum
  north, east, south, west

proc printTheDirection(dir : direction) =
  echo format("the direction is $1, the next direction is $2.", $dir, $dir.succ)

proc printTheDirection(dirs : set[direction]) =
  echo "printing a direction set"
  for dir in dirs:
    echo "contains: ", dir
  
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

argsProcessing(commandLineParams().untaint)

printTheDirection(north)
printTheDirection(south)
printTheDirection({east, west})

# echo segfault()
