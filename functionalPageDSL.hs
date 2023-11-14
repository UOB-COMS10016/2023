{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns, RecordWildCards #-}
{-# LANGUAGE ImportQualifiedPost #-}

module Main where

import Data.List (nub, sortOn)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
import Text.Printf ( printf )

main :: IO ()
main = putStr $ pageToJS functionalPage config

config :: Config
config =
  MkConfig
    { currentWeek = 8,
      activityNum = 8,
      columnNum = 4,
      title = "FUNCTIONAL PROGRAMMING",
      headerOn = True,
      header1 = "EXERCISES",
      header2 = "LECTURES",
      header3 = "COURSEWORK",
      inactColour = "#999999",
      titleColour = "#777777",
      titleBColour = "#BBBBBB",
      bkgColour = "#CCCCCC",
      embossColour = "#AAAAAA",
      fontSizePix = 11
    }


functionalPage :: Page -- a.k.a. [Week], a.k.a [[GridEntry]]
functionalPage =
  [ -- Week 1
    [  Entry
        { title = ""
        , spec = ExtraMaterials
        , materials =
            [ external "Guest seminar VOD: Haskell in the Datacentre" "https://web.microsoftstream.com/video/17f0fbf7-461c-4cf1-937f-21e8407a137e"
            , external "Paper: How functional programming mattered" "https://mengwangoxf.github.io/Papers/NSR15.pdf"
            , external "Bristol PL Research Group" "https://bristolpl.github.io/"
            ]
        }
    , Entry
        { title = "Welcome & Introduction"
        , spec = Lecture
            { firstOrSecond = First
            , slidesFile' = Nothing 
            , lectureRecording = Nothing -- ["https://mediasite.bris.ac.uk/Mediasite/Play/18e6ea68ad654e9aaafc9f34805f2c831d"]
            }
        , materials =
            [ slide "COMS10016_intro.pdf"
            , slide "intro-FP.pdf"
            ]
        }
    , Entry
        { title = "Using GHCi & First Program"
        , spec = Lecture
            { firstOrSecond = Second
            , slidesFile' = Just (BB "GHCi-and-prelude.pdf")
            , lectureRecording = Nothing -- ["https://mediasite.bris.ac.uk/Mediasite/Play/18e6ea68ad654e9aaafc9f34805f2c831d"]
            }
        , materials =
            [ slide "GHCi-and-prelude.pdf"
            ]
        }
    , Entry
        { title = "GET YOUR PC READY"
        , spec = SetupLab{setupLink = "./setup.html"}
        , materials = []
        }
    ]
    -- Week 2
  , [ 
      Entry
        { title = "Functions & Basic Types"
        , spec = Lecture
            { firstOrSecond = First
            , slidesFile' = Just (BB "Functions-and-Basic-Types.pdf") 
            , lectureRecording = Nothing -- ["https://mediasite.bris.ac.uk/Mediasite/Play/18e6ea68ad654e9aaafc9f34805f2c831d"]
            }
        , materials =
            [ slide "Functions-and-Basic-Types.pdf"
            ]
        }
    , Entry
        { title = "Polymorphism & Currying"
        , spec = Lecture
            { firstOrSecond = Second
            , slidesFile' = Just (BB "Polymorphism-and-currying.pdf")
            , lectureRecording = Nothing -- ["https://mediasite.bris.ac.uk/Mediasite/Play/18e6ea68ad654e9aaafc9f34805f2c831d"]
            }
        , materials =
            [ slide "Polymorphism-and-currying.pdf"
            ]
        }
    , Entry
        { title = "GHCi and Functions"
        , spec = Worksheet "sheet01.pdf"
        , materials = concat
            [ sheets 1
            , answers 1
            ]
        }
    ]
  --   -- Week 3
    , [ Entry
          { title = "History of Haskell"
          , spec = History
          , materials =
              [ note "History of Haskell" "HistoryOfHaskell.pdf"
              , note "How Functional Programming Mattered" "HowFPMattered.pdf"
              ]
          }
      , Entry
          { title = "Data types & Type classess"
          , spec = Lecture
              { firstOrSecond = First
              , slidesFile' = Just (BB "datatypes.pdf") 
              , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/6b919533801c484a85eabc42a4fb00811d"
              }
          , materials =
              [ slide "datatypes.pdf"
              ]
          }
      , Entry
          { title = "Pattern matching & Card game"
          , spec = Lecture
              { firstOrSecond = Second
              , slidesFile' = Just (BB "card-game.pdf")
              , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/837fc7dcb31f4cf3883e09656e4a1a7c1d"
              }
          , materials =
              [ slide "card-game.pdf"
              , code "card.hs"
              ]
          }
      , Entry
          { title = ""
          , spec = NotesExtra
          , materials = map (uncurry note)
              [ ("Types", "Types.pdf")
              , ("Haskell PoDs", "HaskellPoDs.pdf")
              , ("Data Constructors", "DataConstructors.pdf")
              , ("Tuples", "Tuples.pdf")
              -- , ("Function Composition", "FunctionComposition.pdf")
              , ("Branching", "Branching.pdf")
              , ("Guards", "Guards.pdf")
              -- , ("Laziness", "Laziness.pdf")
              , ("Type Classes", "TypeClasses.pdf")
              , ("Recipe for writing functions", "FunctionRecipe.pdf")
              ]
          }
      , Entry
          { title = "Types, Type Classes, and Branching"
          , spec = Worksheet "sheet02.pdf"
          , materials = sheets 2 ++ answers 2
          }
      ]

    -- Week 4
    , [ Entry
          { title = "Recursion I"
          , spec = Lecture
              { firstOrSecond = First
              , slidesFile' = Just (BB "recursion1.pdf") 
              , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/a278ef2cf905455ab298fd11701a14101d"
              }
          , materials =
              [ slide "recursion1.pdf"
              ]
          }
      , Entry
          { title = "Recursion II: Lists"
          , spec = Lecture
              { firstOrSecond = Second
              , slidesFile' = Just (BB "recursion2.pdf")
              , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/8cfe56ca3375406a80c5f3ed9ad6f1381d"
              }
          , materials =
              [ slide "recursion2.pdf"
              ]
          }
      , Entry
          { title = ""
          , spec = NotesExtra
          , materials = map (uncurry note)
              [ ("Pattern Matching", "PatternMatching.pdf")
              ]
          }
      ,  Entry
          { title = "ADTs and Pattern Matching"
          , spec = Worksheet "sheet03.pdf"
          , materials = sheets 3 ++ answers 3
          }
      , Entry
          { title = "Power to the People"
          , spec = Coursework
              { instructions = "CW1/CW1-Instrs.pdf"
              , submissionLink = "https://www.ole.bris.ac.uk/webapps/assignment/uploadAssignment?content_id=_8307455_1&course_id=_257219_1"
              , deadline = "12:00 Thurs 09/11/23"
              }
          , materials = map (coursework "CW1")
              [ "CW1-Instrs.pdf"
              , "CW1-InstrsDyslexic.pdf"
              , "CW1-PowerToThePeople.zip"
              , "PowerTest.hs"
              ]
          }
      ]
    -- Week 5
    , [ Entry
          { title = "Lists & List Comprehensions"
          , spec = Lecture
              { firstOrSecond = First
              , slidesFile' = Just (BB "list-comp.pdf") 
              , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/6b795e3925a94303abbe44b1d5964f521d"
              }
          , materials =
              [ slide "list-comp.pdf"
              , code "list.hs"
              ]
          }
        , Entry
            { title = "Evaluation"
            , spec = Lecture
                { firstOrSecond = Second
                , slidesFile' = Just (BB "evaluation.pdf") 
                , lectureRecording = Just "https://mediasite.bris.ac.uk/Mediasite/Play/9f89d107dd6c412c8f768a88660e83071d"
                }
            , materials =
                [ slide "evaluation.pdf"
                ]
            }
      , Entry
          { title = ""
          , spec = NotesExtra
          , materials = map (uncurry note)
              [ ("Lists", "Lists.pdf")
              , ("Maybe", "Maybe.pdf")
              ]
          }
      , Entry
          { title = "Recursive Pattern Matching"
          , spec = Worksheet "sheet04.pdf"
          , materials = sheets 4 ++ answers 4
          }
      , Entry
          { title = "Structural Inductive Proofs"
          , spec = WorksheetBonus "sheetBonus1.pdf"
          , materials = sheetsBonus 1 ++ [note "Structural Inductive Proofs" "StructuralInductiveProofs.pdf"] ++ answersBonus 1
          }
      ]

    -- Reading week
    , [    ]

    -- Week 7
    , [ Entry
          { title = "Higher Order Functions I"
          , spec = Lecture
              { firstOrSecond = First
              , slidesFile' = Just (BB "week7.pdf")
              , lectureRecording = Nothing
              }
          , materials =
              [ code "HObp.hs"
              , slide "week7.pdf"
              , code "HO.hs"
              , code "MinuteSheetQR.png"
              ]
          }
        , Entry
            { title = "Higher Order Functions II"
            , spec = Lecture
                { firstOrSecond = Second
                , slidesFile' = Just (BB "week7.pdf")
                , lectureRecording = Nothing
                }
            , materials =
                [ code "HObp.hs"
                , slide "week7.pdf"
                , code "HO.hs"
                , code "MinuteSheetQR.png"
                ]
            }
      , Entry
          { title = ""
          , spec = NotesExtra
          , materials = map (uncurry note)
              [ ("HO Functions", "HigherOrderFunctions.pdf")
              , ("Map", "Map.pdf")
              , ("Prelude Functions Cheatsheet", "PreludeFunctionsCheatsheet.pdf")
              ]
          }
      , Entry
          { title = "List Comprehensions, Property Tests, and Evaluation"
          , spec = Worksheet "sheet05.pdf"
          , materials = sheets 5 ++ answers 5
          }
      , Entry
          { title = "Sudoku"
          , spec = FormativePractical "Sudoku/SudokuInstrs.pdf"
          , materials = map (coursework "Sudoku")
              [ "SudokuInstrs.pdf"
              , "SudokuInstrsDyslexic.pdf"
              , "Sudoku.hs"
              , "hard.txt"
              ]
          }
      ]
    -- Week 8
    , [ Entry
          { title = "Folds I"
          , spec = Lecture
              { firstOrSecond = First
              , slidesFile' = Just (BB "week7.pdf")
              , lectureRecording = Nothing
              }
          , materials =
              [ code "FoldsBP.hs"
              , slide "week7.pdf"
              , code "Folds.hs"
              , code "MinuteSheetQR.png"
              , code "Recap.hs"
              ]
          }
        , Entry
            { title = "Folds II"
            , spec = Lecture
                { firstOrSecond = Second
                , slidesFile' = Just (BB "week7.pdf")
                , lectureRecording = Nothing
                }
            , materials =
                [ code "FoldsBP.hs"
                , slide "week7.pdf"
                , code "Folds.hs"
                , code "MinuteSheetQR.png"
                ]
            }
      , Entry
          { title = "Binary Trees with Alex Kavvos"
          , spec = LectureExtra
              { videoLink = "https://mediasite.bris.ac.uk/Mediasite/Play/b3fcbbfaf52a4ea0a850d131b088c8ac1d"
              }
          , materials = []
          }
      , Entry
          { title = ""
          , spec = NotesExtra
          , materials =
              [ note "Folds" "Folds.pdf"
              , note "How to Design \"Co\"-Programs" "copro.pdf"
              , external "Design Patterns as Higher-Order Datatype-Generic Programs" "https://www.cs.ox.ac.uk/jeremy.gibbons/publications/hodgp-journal.pdf"
              ]
          }
      , Entry
          { title = "HO Functions"
          , spec = Worksheet "sheet06.pdf"
          , materials = sheets 6 -- ++ answers 6
          }
      -- , Entry -- TODO CW or can i put monoids?
      --     { title = "Simplify"
      --     , spec = Coursework
      --         { instructions = "CW2/CW2-Instrs.pdf"
      --         , submissionLink = "https://www.ole.bris.ac.uk/webapps/assignment/uploadAssignment?content_id=_8307456_1&course_id=_257219_1"
      --         , deadline = "12:00 Thurs 30/11/23<br/>(submit at least 1 hour early)"
      --         }
      --     , materials = map (coursework "CW2")
      --         [ "CW2-Instrs.pdf"
      --         , "CW2-Simplify.zip" ]
      --     }
      ]
  -- -- week 9
  --   , [ Entry
  --         { title = "IO and QuickCheck Generators"
  --         , spec = Lectures
  --             { slidesFile = BB "week9.pdf"
  --             , revisionVideos =
  --                 [ "https://mediasite.bris.ac.uk/Mediasite/Play/a18e66283df649239452b70e7794cffc1d" 
  --                 , "https://mediasite.bris.ac.uk/Mediasite/Play/f48f5649eea243049ed5852b9de08c941d"
  --                 ]
  --             }
  --         , materials = [code "ExampleIO.hs"]
  --         }
  --     , Entry
  --         { title = ""
  --         , spec = NotesExtra
  --         , materials = map (uncurry note)
  --             [ ("Intro to IO", "Intro-to-IO.pdf") ]
  --         }
  --     , Entry
  --         { title = "IO and Properties of Trees"
  --         , spec = Worksheet "sheet07.pdf"
  --         , materials = sheets 7 ++ answers 7
  --         }
  --     , Entry -- we do want this to go up, Sam promised it last week
  --         { title = "Monoids"
  --         , spec = WorksheetBonus "sheetBonus2.pdf"
  --         , materials = sheetsBonus 2 ++ [note "Monoids notes" "Monoids.pdf"] ++ answersBonus 2
  --         }
  --     ]
  --   -- Week 10
  --   , [ Entry
  --         { title = "Functors and Applicatives"
  --         , spec = Lectures
  --             { slidesFile = External "https://quizizz.com/admin/presentation/619be26fa9afb8001d4e68fa"
  --             , revisionVideos =
  --                 [ "https://mediasite.bris.ac.uk/Mediasite/Play/64071d2d5e274e2e938715454a7488521d"
  --                 , "https://mediasite.bris.ac.uk/Mediasite/Play/2bc2d5f933834dc2b1d12eb1820f11651d"
  --                 ]
  --             }
  --         , materials =
  --             [ code "Functors-Livecode.hs"
  --             , code "Functor2021.hs"
  --             , code "ApplicativeLive2022.hs"
  --             ]
  --         }
  --     , Entry
  --         { title = "Mock Test"
  --         , spec = MockTest{ test = noteLink "COMS10016-Mock.pdf" }
  --         , materials = map (uncurry note)
  --             [ ("COMS10016-Mock.pdf", "COMS10016-Mock.pdf")
  --             , ("COMS10016-Mock-Answer.txt", "COMS10016-Mock-Answer.txt")
  --             ]
  --         }
  --     , Entry
  --         { title = "Functors and Applicatives"
  --         , spec = Worksheet "sheet08.pdf"
  --         , materials = sheets 8 ++ answers 8
  --         }
  --     , Entry
  --         { title = "Maps, Tries, Sets, and Perfect Trees"
  --         , spec = WorksheetBonus "sheetBonus3.pdf"
  --         , materials = sheetsBonus 3 ++ answersBonus 3
  --         }
  --     ]

  --   -- Week 11
  --   , [ Entry
  --         { title = "Monads"
  --         , spec = Lectures
  --             { slidesFile = External "https://quizizz.com/admin/presentation/61a1077bf56186001dc1301e"
  --             , revisionVideos = ["https://mediasite.bris.ac.uk/Mediasite/Play/284bff6ffeaa4d13907d7773a8ad0f501d"]
  --             }
  --         , materials = [ code "Monads.hs" ]
  --         }
  --     , Entry
  --         { title = "Embedding"
  --         , spec = Lectures
  --             { slidesFile = External "https://docs.google.com/presentation/d/1_VBk9BFqwWpJZxg4sPm-TMPbHTUxos8sSBwyC8aC3KU"
  --             , revisionVideos = ["https://mediasite.bris.ac.uk/Mediasite/Play/80396178d0094388982b5b4dde092e331d"]
  --             }
  --         , materials =
  --             [ code "EmbeddingPartI.hs"
  --             , external "Part II video" "https://web.microsoftstream.com/video/85b52444-fbe7-4f67-a7e2-b9083f2690a6"
  --             , external "Folding Domain Specific Languages: Deep and Shallow" "https://dl.acm.org/doi/10.1145/2628136.2628138"
  --             , external "CircuitFlow" "https://arxiv.org/abs/2111.12420"
  --             , external "Bristol Quidditch Club" "https://www.bristolsu.org.uk/groups/bristol-quidditch-club-00bf"
  --             ]
  --         }
  --     , Entry
  --         { title = "Monads"
  --         , spec = Worksheet "sheet09.pdf"
  --         , materials = sheets 9 ++ answers 9
  --         }
  --     , Entry
  --         { title = "Sheet of Death"
  --         , spec = WorksheetBonus "sheetBonus4.pdf"
  --         , materials = sheetsBonus 4 ++ answersBonus 4
  --         }
  --     ]

    -- Spare couple weeks of lectures, to make sure site doesn't break
    , []
    , []
  ]



---------------------------------------------------------------------
-- Specifying Categories for Entry types
---------------------------------------------------------------------

entryToCategory :: GridEntry -> Category
entryToCategory (Entry _ details materials) = case details of
  SetupLab{} -> simpleCat "Setup Lab:" "#EEEEDD"
  Lectures{..} -> MkCat
        { title = "Lectures"
        , colour = "#CCCFFF"
        , counter = False
        , slidesLinkName = ""
        , materialLinkName = if not (null materials)
                             then "Materials"
                             else ""
        }
  Lecture{..} -> MkCat
      { title = "Lecture"
      , colour = "#CCCFFF"
      , counter = False
      , slidesLinkName = case lectureRecording of
          Just _ -> "Lecture Recording"
          _ -> ""
      , materialLinkName = if not (null materials)
                            then "Materials"
                            else ""
      }
  LectureExtra{..} -> MkCat
        { title = "Bonus Lecture"
        , colour = "#D8CCFF"
        , counter = False
        , slidesLinkName = ""
        , materialLinkName = if not (null materials)
                             then "Materials"
                             else ""
        }
  ExtraMaterials -> MkCat
        { title = "Extra Materials"
        , colour = "#DDDDDD"
        , counter = False
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }
  Worksheet{} -> MkCat
        { title = "Worksheet"
        , colour = "#EEEEDD"
        , counter = True
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }
  WorksheetBonus{} -> MkCat
        { title = "Bonus Worksheet"
        , colour = "#FCC981"
        , counter = True
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }
  NotesExtra -> MkCat
        { title = "Notes ft.<br>Extra Examples<br>+ Explanations"
        , colour = "#94e5bf"
        , counter = False
        , slidesLinkName = ""
        , materialLinkName = "Notes"
        }
  History -> MkCat
        { title = "History"
        , colour = "#EEEEDD"
        , counter = False
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }
  Coursework{submissionLink} -> MkCat
        { title = "Coursework"
        , colour = "#EEEEDD"
        , counter = True
        , slidesLinkName = if not (null submissionLink)
                           then "SUBMIT HERE (Blackboard)"
                           else ""
        , materialLinkName = "Materials"
        }
  FormativePractical{} -> MkCat
        { title = "Formative Practical"
        , colour = "#EEEEDD"
        , counter = True
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }
  MockTest{test} -> MkCat
        { title = "Mock Test"
        , colour = "#EEEEDD"
        , counter = True
        , slidesLinkName = ""
        , materialLinkName = "Materials"
        }

  _ -> blankCategory

isLectureCategory :: EntrySpec -> Bool
isLectureCategory x = case x of
  Lectures{} -> True
  Lecture{} -> True
  NotesExtra{} -> True
  LectureExtra{} -> True
  _ -> False

isCourseworkCategory :: EntrySpec -> Bool
isCourseworkCategory x = case x of
  Worksheet{} -> True
  WorksheetBonus{} -> True
  SetupLab{} -> True
  Coursework{} -> True
  FormativePractical{} -> True
  _ -> False

blankCategory :: Category
blankCategory = MkCat
  { title = "",
    colour = "#CCCCCC",
    counter = False,
    slidesLinkName = "",
    materialLinkName = ""
  }

---------------------------------------------------------------------
-- Specifying Entry to Activity transformation 
---------------------------------------------------------------------

entryToActivity :: CategoryDict -> GridEntry -> Activity
entryToActivity catDict entry@(Entry {title, spec, materials})
  = MkActivity
      { categoryNum = catDict M.! entryToCategory entry -- Slightly unsafe
      , dateTime = case spec of
          ExtraMaterials -> "(optional)"
          History -> "(optional)"
          SetupLab{} -> "Wed 27/09/23<br/>10:00-13:00<br/>MVB2.11/1.15"
          Worksheet{} -> "Mon 15:00-18:00<br/>MVB2.11/1.15"
          WorksheetBonus{} -> "(optional)"
          Lectures{} -> "Mon 11:00-11:50<br/>Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL"
          Lecture{firstOrSecond} -> case firstOrSecond of
            First  -> "Mon 11:00-11:50<br/>PHYS BLDG 1.11 TYNDALL"
            Second -> "Thurs 16:00-16:50<br/>PHYS BLDG 1.11 TYNDALL"
          LectureExtra{} -> "(optional)"
          NotesExtra -> "in your own time"
          Coursework{..} -> "Deadline: " ++ deadline
          FormativePractical{} -> ""
          MockTest{} -> "in your own time"
          _ -> ""
      , title = case spec of
          Lectures{slidesFile, revisionVideos}
            -> titleWithSlidesAndVideos title (Just slidesFile) revisionVideos
          -- Lecture{slidesFile', revisionVideo}
          --   -> titleWithSlidesAndVideos title slidesFile' revisionVideo
          _ -> title
      , activityURL = case spec of
          SetupLab{setupLink}  -> setupLink
          Worksheet{file} -> sheetLink file
          WorksheetBonus{file} -> sheetLink file
          Coursework{instructions} -> courseworkLink instructions
          FormativePractical{file} -> courseworkLink file
          LectureExtra{videoLink}  -> videoLink
          Lecture{slidesFile'}  -> maybeSlidesPathToURL slidesFile'
          MockTest{test} -> test
          _ -> ""
      , slidesURL = case spec of
          Coursework{submissionLink} -> submissionLink
          Lecture{lectureRecording} -> case lectureRecording of
            Just revVid -> revVid
            _ -> ""
          _ -> ""
      , materialStart = 0
      , materialRange = length materials
      }

titleWithSlidesAndVideos :: String -> Maybe SlidesPath -> [URL] -> [Char]
titleWithSlidesAndVideos title slidesFile revisionVideos
  = (case slidesFile of
      Nothing     -> title
      Just slides -> href title (slidesPathToUrl slides))
    ++ revisionVidLinks revisionVideos

href :: String -> URL -> String
href text link = printf "<a href='%s' target='_blank'>%s</a>" link text

revisionVidLinks :: [URL] -> String
revisionVidLinks vids
  =  zipWith f [1..] vids
  |> concat
  where
    f :: Int -> URL -> String
    f i link = "<br/>(" ++ href ("Revision Video " ++ show i) link ++ ")"

---------------------------------------------------------------------
-- Types API
---------------------------------------------------------------------

data GridEntry = Entry
  { title     :: String
  , spec      :: EntrySpec
  , materials :: [Material]
  } deriving (Show, Eq)

data EntrySpec
  = ExtraMaterials
  | Lectures  { slidesFile :: SlidesPath
              , revisionVideos :: [URL]
              }
  | Lecture { firstOrSecond :: FirstOrSecond
            , slidesFile' :: Maybe SlidesPath
            , lectureRecording :: Maybe URL
            }
  | LectureExtra { videoLink :: String }
  | SetupLab  { setupLink :: URL }
  | Worksheet { file :: String }
  | WorksheetBonus { file :: String }
  | History
  | NotesExtra
  | Coursework { instructions :: String
               , submissionLink :: URL
               , deadline :: String
               }
  | FormativePractical { file :: String }
  | MockTest { test :: URL }
  | Blank
  deriving (Show, Eq)

data FirstOrSecond = First | Second deriving (Show, Eq, Ord)

data SlidesPath = BB FilePath | External URL
  deriving (Show, Eq)

data Material = MkMaterial
  { name :: String
  , link :: URL
  } deriving (Show, Eq, Ord)

data Category = MkCat
  { title :: String,
    colour :: Colour,
    counter :: Bool,
    slidesLinkName :: String,
    materialLinkName :: String
  } deriving (Show, Eq, Ord)

data Config = MkConfig
  { currentWeek  :: Int    -- current week [releases content fully visible up to this week]
  , activityNum  :: Int    -- number of activities per week (empty slots possible)
  , columnNum    :: Int    -- desired columns per week (yet autofitted to max 2 rows per week)
  , title        :: String -- content title (different to unitName since multiple content streams maybe in one unit)
  , headerOn     :: Bool   -- table column headers on(=1) or off(=0) min of 4 columns needed to render
  , header1      :: String -- leftmost 1x column header
  , header2      :: String -- middle 2x column header
  , header3      :: String -- rest of the columns header
  , inactColour  :: Colour -- font colour for inactive content
  , titleColour  :: Colour -- table title colour
  , titleBColour :: Colour -- table title background colour
  , bkgColour    :: Colour -- table border background colour
  , embossColour :: Colour -- table border emboss colour
  , fontSizePix  :: Int    -- font size in pixels
    --    extendCatNum1 :: Int     -- number of one category that has no border to above cell (e.g. for multi-week coursework)
    --    extendCatNum2 :: Int     -- number of one category that has no border to above cell (e.g. for multi-week empty)
  } deriving (Show)
-- extendCatNum1 and extendCatNum2 should ideally be generated

-- Type synonyms
type CategoryDict = Map Category Int
type Page = [Week]
type Week = [GridEntry]
type URL = String
type Colour = String

-- Utility types for compiling to Javascript 

data Activity = MkActivity
  { categoryNum :: Int,
    dateTime :: String,
    title :: String,
    activityURL :: String,
    slidesURL :: String,
    materialStart :: Int,
    materialRange :: Int
  } deriving (Show, Eq, Ord)

data ActivitiesMaterials = MkAM ![Activity] ![Material]
  deriving (Show, Eq, Ord)

instance Semigroup ActivitiesMaterials where
  (MkAM a1s m1s) <> (MkAM a2s m2s) = MkAM (a1s ++ a2s') (m1s ++ m2s)
    where
      a2s' = map (adjustIndex (length m1s)) a2s
      adjustIndex n activity@(MkActivity{materialRange, materialStart})
        | materialRange > 0 = activity{ materialStart = materialStart + n }
        | otherwise         = activity -- If no materials, don't increment start. Makes diffs cleaner

instance Monoid ActivitiesMaterials where
  mempty = MkAM [] []


---------------------------------------------------------------------
-- Smart constructors
---------------------------------------------------------------------

-- Materials

note :: String -> String -> Material
note name file = MkMaterial name (noteLink file)

code :: String -> Material
code file = MkMaterial file (codeLink file)

slide :: String -> Material
slide file = MkMaterial file (slideLink file)

coursework :: String -> String -> Material
coursework cwDir file = MkMaterial file (courseworkLink (cwDir ++ "/" ++ file))

external :: String -> URL -> Material
external = MkMaterial

sheet :: String -> Material
sheet file = MkMaterial file (sheetLink file)

sheets :: Int -> [Material]
sheets i = map sheet
  [ printf "sheet%02d.pdf" i
  , printf "sheet%02dDyslexic.pdf" i
  ]

answers :: Int -> [Material]
answers i = map sheet
  [ printf "answer%02d.pdf" i
  , printf "answer%02dDyslexic.pdf" i
  , printf "code%02d.hs" i
  ]

sheetsBonus :: Int -> [Material]
sheetsBonus i = map sheet
  [ printf "sheetBonus%01d.pdf" i
  , printf "sheetBonus%01dDyslexic.pdf" i
  ]

answersBonus :: Int -> [Material]
answersBonus i = map sheet
  [ printf "answerBonus%01d.pdf" i
  , printf "answerBonus%01dDyslexic.pdf" i
  ]

-- Link construction

bbRootDir :: URL
bbRootDir = "https://www.ole.bris.ac.uk/bbcswebdav/courses/COMS10016_2023_TB-1/"

comingSoonPage :: URL
comingSoonPage = "" -- funcRootDir ++ "coming-soon.html"

funcRootDir :: URL
funcRootDir = bbRootDir ++ "content/functional/"

dir :: String -> String -> URL
dir folder path = funcRootDir ++ folder ++ "/" ++ path

sheetLink :: String -> URL
sheetLink = dir "sheets"

noteLink :: String -> URL
noteLink = dir "notes"

slideLink :: String -> URL
slideLink = dir "slides"

maybeSlidesPathToURL :: Maybe SlidesPath -> URL
maybeSlidesPathToURL = maybe comingSoonPage slidesPathToUrl

slidesPathToUrl :: SlidesPath -> URL
slidesPathToUrl slidesFile
  = case slidesFile of
      BB path -> slideLink path
      External url -> url

codeLink :: String -> URL
codeLink = dir "code"

courseworkLink :: String -> URL
courseworkLink = dir "coursework"

-- Grid entries

blankEntry :: GridEntry
blankEntry = Entry "" Blank []

-- Categories

simpleCat :: String -> Colour -> Category
simpleCat title colour = MkCat
  { title = title
  , colour = colour
  , counter = False
  , slidesLinkName = ""
  , materialLinkName = ""
  }


---------------------------------------------------------------------
-- Compilation machinery
---------------------------------------------------------------------

genCategoryDict :: Page -> CategoryDict
genCategoryDict page =
  concat page
    |> map entryToCategory
    |> nub
    |> (`zip` [1 ..])
    |> M.fromList
    |> M.insert blankCategory 0


genActivitiesAndMaterials
  :: Page
  -> CategoryDict
  -> Config
  -> ActivitiesMaterials
genActivitiesAndMaterials page catDict config
  =  map genPerWeek page
  |> mconcat
  where
    genPerWeek :: Week -> ActivitiesMaterials
    genPerWeek gridEntries =
      [e1, e2, e3, e4, e5, e6, e7, e8]
        |> map genPerEntry
        |> mconcat
      where
        ([e1, e5], [e2, e3, e6, e7], [e4, e8]) = (pad 2 exercises, pad 4 lectures, pad 2 coursework)
        (exercises, lectures, coursework) = foldr splitIntoSections ([], [], []) gridEntries

        splitIntoSections entry@(Entry {spec}) (ex, lecs, cws)
          | isLectureCategory spec = (ex, entry : lecs, cws)
          | isCourseworkCategory spec = (ex, lecs, entry : cws)
          | otherwise = (entry : ex, lecs, cws)



        pad :: Int -> [GridEntry] -> [GridEntry]
        pad n xs = take n $ xs ++ repeat blankEntry

    genPerEntry :: GridEntry -> ActivitiesMaterials
    genPerEntry entry = MkAM [entryToActivity catDict entry] (materials entry)

pageToJS :: Page -> Config -> String
pageToJS page config = unlines
  [ configToJS config
  , categoriesToJS catDict
  , activitiesToJS activities
  , materialsToJS materials
  ]
  where
    catDict = genCategoryDict page
    MkAM activities materials
      = genActivitiesAndMaterials page catDict config


configToJS :: Config -> String
configToJS MkConfig{..} =
  [ ("currentWeek  ", show currentWeek  )
  , ("activityNum  ", show activityNum  )
  , ("columnNum    ", show columnNum    )
  , ("title        ", show title        )
  , ("headerOn     ", if headerOn then "1" else "0" )
  , ("header1      ", show header1      )
  , ("header2      ", show header2      )
  , ("header3      ", show header3      )
  , ("inactColour  ", show inactColour  )
  , ("titleColour  ", show titleColour  )
  , ("titleBColour ", show titleBColour )
  , ("bkgColour    ", show bkgColour    )
  , ("embossColour ", show embossColour )
  , ("fontSizePix  ", show fontSizePix  )
  , ("extendCatNum1", "-1")
  , ("extendCatNum2", "-1")
  ]
  |> map (\(name,val) -> "const " ++ name ++ " = " ++ val ++ ";")
  |> unlines

categoriesToJS :: CategoryDict -> String
categoriesToJS catDict
  = unlines
  [ "var categories = ["
  , M.toList catDict
    |> sortOn snd
    |> map (\(MkCat{..}, index) -> listToJSArray [show index, title, colour, if counter then "1" else "0", slidesLinkName, materialLinkName])
    |> unlines
  , "];"
  ]


listToJSArray :: [String] -> String
listToJSArray xs = "[" ++ foldr f "" xs ++ "],"
  where
    f listItem acc = show listItem ++ "," ++ acc

activitiesToJS :: [Activity] -> String
activitiesToJS activities
  = unlines
  [ "const activities = ["
  , activities
    |> map (\MkActivity{..} -> listToJSArray
               [show categoryNum, dateTime, title, activityURL, slidesURL, show materialStart, show materialRange])
    |> unlines
  , "];"
  ]

materialsToJS :: [Material] -> String
materialsToJS materials
  = unlines
  [ "const files = ["
  , zipWith materialToJS [0..] materials
    |> unlines
  , "];"
  ]

materialToJS :: Int -> Material -> String
materialToJS index MkMaterial{..}
  = listToJSArray [show index, link, name]


---------------------------------------------------------------------
-- Utility Functions
---------------------------------------------------------------------

infixl 0 |>

(|>) :: a -> (a -> b) -> b
x |> f = f x
