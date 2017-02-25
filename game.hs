
import System.Random

tooLow secret_number = do
  print "Too low... :("
  game secret_number

tooHigh secret_number = do
  print "Too high... :("
  game secret_number

game :: Int -> IO ()
game secret_number = do
  print "Enter your guess between 1 and 10 ? "
  guess <- readLn
  case compare guess secret_number
    of  GT -> tooHigh secret_number
        LT -> tooLow secret_number
        EQ -> print "You win!"

main :: IO ()
main = do
  putStrLn "Let's play the number guessing game"
  secret_number <- randomRIO (1,10)
  putStrLn ("My secret random number is: "++show secret_number)
  game secret_number
