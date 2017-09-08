#! /usr/bin/env stack
{- stack
    script
        --resolver lts-9.0
-}

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}

class C a b where
    f :: b -> a -> b

instance {-# INCOHERENT #-} (Foldable m, C a b) => C (m a) b where
    f = foldl f

instance {-# INCOHERENT #-} (Monoid a) => C a a where
    f = mappend

main :: IO ()
main = do
    print $ f "a" "b"
