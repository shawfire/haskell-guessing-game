
import System.Random

max_guesses = 3

tooLow :: Int -> Int -> IO ()
tooLow secret_number guesses = do
  if (guesses >= max_guesses)
    then putStrLn $ "\nToo low... You Loose after " ++ (show (guesses)) ++ " attempts :(\n"
    else do
      putStrLn "Too low... Try higher."
      game secret_number $ guesses

tooHigh :: Int -> Int -> IO ()
tooHigh secret_number guesses = do
  if (guesses >= max_guesses)
    then putStrLn $ "\nToo high... You Loose after " ++ (show (guesses)) ++ " attempts :(\n"
    else do
      putStrLn "Too high... Try lower."
      game secret_number $ guesses

game :: Int -> Int -> IO ()
game secret_number guesses = do
  putStr "\nEnter your guess between 1 and 10 ? "
  guess <- readLn
  case compare guess secret_number
    of  GT -> tooHigh secret_number $ guesses+1
        LT -> tooLow secret_number $ guesses+1
        EQ -> putStrLn $ "\nYou win! :) after " ++ (show (guesses+1)) ++ " guess" ++ plural ++ ".\n"
        where plural = if guesses > 1 then "es" else ""

main :: IO ()
main = do
  putStrLn "\nLet's play the number guessing game"
  secret_number <- randomRIO (1,10)
  game secret_number 0
