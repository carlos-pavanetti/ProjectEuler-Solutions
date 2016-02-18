module ProjectEuler.Problem33 where

type RepeatingDigitsFraction a = (a,a,a)
type Fraction a = (a, a)

answer33 = (numerator, denominator)
    where
        numerator = foldr ((*) . fst) 1 twoDigitsCuriosFractions
        denominator = foldr ((*). snd) 1 twoDigitsCuriosFractions

twoDigitsCuriosFractions :: [Fraction Integer]
twoDigitsCuriosFractions =
    concatMap curiousFraction [(a,b,c) | a <- [1..9], b <- [1..9], c <- [1..9]]

curiousFraction :: (Integral a, Ord a) =>
                      RepeatingDigitsFraction a -> [Fraction a]
curiousFraction (a, b, c)
    | a == b || b == c || a == c = []
    | ab_c == a * bc = [(ab, bc) | ab < bc]
    | ab_c == a * cb = [(ab, cb) | ab < cb]
    | ab_c == b * ac = [(ab, ac) | ab < ac]
    | ab_c == b * ca = [(ab, ca) | ab < ca]
    | otherwise = []
    where
        ab_c = (10 * a + b) * c
        ab = 10 * a + b

        ac = 10 * a + c
        bc = 10 * b + c
        ca = 10 * c + a
        cb = 10 * c + b
