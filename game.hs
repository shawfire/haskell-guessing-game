
import System.Random

main :: IO ()
main = do
  putStrLn "Let's play the number guessing game"
  number <- randomRIO (1,10) :: IO Int
  putStrLn ("My secret random number is: "++show number)
