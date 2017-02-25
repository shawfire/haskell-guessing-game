
import System.Random

tooLow :: Int -> Int -> IO ()
tooLow secret_number guesses = do
  putStrLn "Too low... :("
  game secret_number $ guesses

tooHigh :: Int -> Int -> IO ()
tooHigh secret_number guesses = do
  putStrLn "Too high... :("
  game secret_number $ guesses

game :: Int -> Int -> IO ()
game secret_number guesses = do
  putStr "Enter your guess between 1 and 10 ? "
  guess <- readLn
  case compare guess secret_number
    of  GT -> tooHigh secret_number $ guesses+1
        LT -> tooLow secret_number $ guesses+1
        EQ -> putStrLn $ "You win! after " ++ (show (guesses+1)) ++ " guesses."

main :: IO ()
main = do
  putStrLn "Let's play the number guessing game"
  secret_number <- randomRIO (1,10)
  game secret_number 0
