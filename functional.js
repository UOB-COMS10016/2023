const currentWeek   = 2;
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

];

const activities = [
["1","(optional)","","","","0","3",],
["2","Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL","Welcome & Introduction","","","3","2",],
["2","Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL","Using GHCi and First Program","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/slides/GHCi-and-prelude.pdf","","5","1",],
["3","Wed 27/09/23<br/>10:00-13:00<br/>MVB2.11/1.15","GET YOUR PC READY","./setup.html","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["0","","","","","0","0",],
["4","Mon 15:00-18:00<br/>MVB2.11/1.15","GHCi and Functions","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01.pdf","","6","2",],
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
["6","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01.pdf","sheet01.pdf",],
["7","https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/content/functional/sheets/sheet01Dyslexic.pdf","sheet01Dyslexic.pdf",],

];

