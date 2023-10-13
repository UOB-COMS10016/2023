const currentWeek   = 4;
const activityNum   = 8;
const columnNum     = 4;
const title         = "FUNCTIONAL PROGRAMMING";
const headerOn      = 1;
const header1       = "EXERCISES";
const header2       = "LECTURES";
const header3       = "COURSEWORK";
const inactColour   = "#999999";
const titleColour   = "#777777";
const titleBColour  = "#BBBBBB";
const bkgColour     = "#CCCCCC";
const embossColour  = "#AAAAAA";
const fontSizePix   = 11;
const extendCatNum1 = -1;
const extendCatNum2 = -1;

var categories = [
["0","","#CCCCCC","0","","",],
["1","Extra Materials","#DDDDDD","0","","Materials",],
["2","Lecture","#CCCFFF","0","","Materials",],
["3","Setup Lab:","#EEEEDD","0","","",],
["4","Worksheet","#EEEEDD","1","","Materials",],
["5","History","#EEEEDD","0","","Materials",],
["6","Notes ft.<br>Extra Examples<br>+ Explanations","#94e5bf","0","","Notes",],

];

const activities = [
["1","(optional)","","","","0","3",],
["2","Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL","Welcome & Introduction","","","3","2",],
["2","Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL","Using GHCi & First Program","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/GHCi-and-prelude.pdf","","5","1",],
["3","Wed 27/09/23<br/>10:00-13:00<br/>MVB2.11/1.15","GET YOUR PC READY","./setup.html","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["2","Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL","Functions & Basic Types","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/Functions-and-Basic-Types.pdf","","6","1",],
["2","Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL","Polymorphism & Currying","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/Polymorphism-and-currying.pdf","","7","1",],
["4","Mon 15:00-18:00<br/>MVB2.11/1.15","GHCi and Functions","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01.pdf","","8","5",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["5","(optional)","History of Haskell","","","13","2",],
["2","Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL","Data types & Type classess","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/datatypes.pdf","","15","1",],
["2","Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL","Pattern matching & Card game","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/card-game.pdf","","16","2",],
["4","Mon 15:00-18:00<br/>MVB2.11/1.15","Types, Type Classes, and Branching","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet02.pdf","","18","5",],
["0","","","","","0","0",],
["6","in your own time","","","","23","8",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["2","Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL","Recursion","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/recursion.pdf","","31","1",],
["2","Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL","Evaluation","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/evaluation.pdf","","32","1",],
["4","Mon 15:00-18:00<br/>MVB2.11/1.15","ADTs and Pattern Matching","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet03.pdf","","33","2",],
["0","","","","","0","0",],
["6","in your own time","","","","35","1",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],

];

const files = [
["0","https://web.microsoftstream.com/video/17f0fbf7-461c-4cf1-937f-21e8407a137e","Guest seminar VOD: Haskell in the Datacentre",],
["1","https://mengwangoxf.github.io/Papers/NSR15.pdf","Paper: How functional programming mattered",],
["2","https://bristolpl.github.io/","Bristol PL Research Group",],
["3","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/COMS10016_intro.pdf","COMS10016_intro.pdf",],
["4","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/intro-FP.pdf","intro-FP.pdf",],
["5","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/GHCi-and-prelude.pdf","GHCi-and-prelude.pdf",],
["6","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/Functions-and-Basic-Types.pdf","Functions-and-Basic-Types.pdf",],
["7","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/Polymorphism-and-currying.pdf","Polymorphism-and-currying.pdf",],
["8","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01.pdf","sheet01.pdf",],
["9","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01Dyslexic.pdf","sheet01Dyslexic.pdf",],
["10","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/answer01.pdf","answer01.pdf",],
["11","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/answer01Dyslexic.pdf","answer01Dyslexic.pdf",],
["12","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/code01.hs","code01.hs",],
["13","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/HistoryOfHaskell.pdf","History of Haskell",],
["14","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/HowFPMattered.pdf","How Functional Programming Mattered",],
["15","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/datatypes.pdf","datatypes.pdf",],
["16","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/card-game.pdf","card-game.pdf",],
["17","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/code/card.hs","card.hs",],
["18","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet02.pdf","sheet02.pdf",],
["19","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet02Dyslexic.pdf","sheet02Dyslexic.pdf",],
["20","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/answer02.pdf","answer02.pdf",],
["21","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/answer02Dyslexic.pdf","answer02Dyslexic.pdf",],
["22","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/code02.hs","code02.hs",],
["23","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/Types.pdf","Types",],
["24","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/HaskellPoDs.pdf","Haskell PoDs",],
["25","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/DataConstructors.pdf","Data Constructors",],
["26","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/Tuples.pdf","Tuples",],
["27","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/Branching.pdf","Branching",],
["28","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/Guards.pdf","Guards",],
["29","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/TypeClasses.pdf","Type Classes",],
["30","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/FunctionRecipe.pdf","Recipe for writing functions",],
["31","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/recursion.pdf","recursion.pdf",],
["32","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/evaluation.pdf","evaluation.pdf",],
["33","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet03.pdf","sheet03.pdf",],
["34","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet03Dyslexic.pdf","sheet03Dyslexic.pdf",],
["35","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/notes/PatternMatching.pdf","Pattern Matching",],

];

