{-# LANGUAGE OverloadedStrings, RecordWildCards, ScopedTypeVariables #-} 
module Main where
import System.Environment
import System.Random
import Control.Monad.State
import Options.Applicative
import Control.Applicative
import Data.Text (Text)
import qualified Data.Text as T 
import qualified Data.Text.IO as T 

options :: Parser (Int, String, [FilePath])
options = (,,)
    <$> option auto (
           short  'n' 
        <> metavar "ROWS"
        <> help "Output n rows. Default is to output the number of rows in the shortest file."
        <> value 0)
    <*> strOption (
           short 'F'
        <> metavar "DELIMITER"
        <> help "Output field delimiter. Default: one space character"
        <> value " "
        )
    <*> many1 (
          strArgument ( metavar "FILE" <> help "File or process substitution with content to randomize. Can give 1 or more inputs."))


many1 :: Parser a -> Parser [a]
many1 p = (:) <$> p <*> (many p)

opts = info (helper <*> options) 
            (header "randlists" <> fullDesc
            <> progDesc "Generates random lists"
            <> footer "https://github.com/danchoi/randlists")

getRandomElem :: [Text] -> State StdGen Text
getRandomElem xs = do
  gen <- get 
  let (idx, gen') = randomR (0, length xs - 1) gen 
  put gen' 
  return (xs !! idx)

getRandomElems :: [[Text]] -> State StdGen [Text]
getRandomElems xxs = mapM getRandomElem xxs
  
main = do
  (n', d, files) <- execParser opts
  xxs :: [[Text]] <- mapM (\file -> T.lines `fmap` T.readFile file) files
  let n = if n' < 1
          then minimum $ map length xxs
          else n'
  g <- getStdGen 
  let r :: [[Text]]
      r = evalState (replicateM n $ getRandomElems xxs) g
  mapM (T.putStrLn . T.intercalate (T.pack d)) r

