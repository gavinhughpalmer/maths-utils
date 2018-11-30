/*
 This class contains useful maths utilities and extentions to the standard Math class
*/
public class MathsUtils {

    @TestVisible private static final String NULL_INPUT_ERROR = 'Input value cannot be null.'

    public class InvalidArgumentException extends Exception {}

    // This implementation was to allow negative exponents
    public static Decimal power(Decimal base, Integer exponent) {
        if (base == null || exponent == null) {
            throw new InvalidArgumentException(NULL_INPUT_ERROR);
        }
        Boolean isNegativeExponent = exponent < 0;
        exponent = isNegativeExponent ? -exponent : exponent;
        base = base.pow(exponent);
        return isNegativeExponent ? 1 / base : base;
    }

    // this ensures 0 has the decimals stripped from the end of a zero
    // eg 0.000 will become 0
    public static Decimal stripTrailingZeros(Decimal fromDecimal) {
        if (fromDecimal == null) {
            throw new InvalidArgumentException(NULL_INPUT_ERROR);
        }
        return fromDecimal == 0 ? 0 : fromDecimal.stripTrailingZeros();
    }
}