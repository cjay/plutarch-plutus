module Plutarch.PairSpec (spec) where

import Plutarch.Prelude
import Plutarch.Test

spec :: Spec
spec = runTrailSpec $ do
  describe "pair" . pgoldenSpec $ do
    "eq" @\ do
      "true"
        @| pcon @(PPair PInteger PString) (PPair 42 "Hello")
          #== pcon (PPair 42 "Hello")
          @-> passert
      "false" @\ do
        "fst"
          @| pcon @(PPair PInteger PString) (PPair 42 "Hello")
            #== pcon (PPair 24 "Hello")
          @-> passertNot
        "snd"
          @| pcon @(PPair PInteger PString) (PPair 42 "Hello")
            #== pcon (PPair 42 "World")
          @-> passertNot
        "both"
          @| pcon @(PPair PInteger PString) (PPair 42 "Hello")
            #== pcon (PPair 24 "World")
          @-> passertNot
