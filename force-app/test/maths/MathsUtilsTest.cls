@IsTest
private class MathsUtilsTest {
    
    @IsTest
    private static void powerTestNegativeExponent() {
        System.assertEquals(
            MathsUtils.power(2, -1),
            1/2,
            '2 to the power of -1 should be a half'
        );
    }
    
    @IsTest
    private static void powerTestPositiveExponent() {
        System.assertEquals(
            MathsUtils.power(2, 2),
            4,
            '2 to the power of 2 should be 4'
        );
    }
    
    @IsTest
    private static void powerTestZeroExponent() {
        System.assertEquals(
            MathsUtils.power(2, 0),
            1,
            'Any number raised to a zero power should be 1'
        );
    }
    
    @IsTest
    private static void powerTestZeroBase() {
        System.assertEquals(
            MathsUtils.power(0, 4),
            0,
            'Zero raised to a power should always be zero'
        );
    }
    
    @IsTest
    private static void powerTestNullInput() {
        try {
            MathsUtils.power(0, null);
            System.assert(false, 'An exception should be thrown for a null input');
        } catch (MathsUtils.InvalidInputException exceptionToValidate) {
            System.assertEquals(
                MathsUtils.NULL_INPUT_ERROR,
                exceptionToValidate.getMessage(),
                'The error should specify that the input was null'
            );
        } catch (Exception invalidException) {
            System.assert(false, 'A more specific error should be thrown ' + invalidException.getMessage());
        }
    }

    @IsTest
    private static void stripTrailingZerosTest() {
        Decimal trailingZeros = 0.000;
        System.assertEquals(
            '0',
            String.valueOf(MathsUtils.stripTrailingZeros(trailingZeros)),
            'The zeros after a the decimal on zero should be removed'
        );
    }
    
    @IsTest
    private static void stripTrailingZerosTestNullInput() {
        try {
            MathsUtils.stripTrailingZeros(null);
            System.assert(false, 'An exception should be thrown for a null input');
        } catch (MathsUtils.InvalidInputException exceptionToValidate) {
            System.assertEquals(
                MathsUtils.NULL_INPUT_ERROR,
                exceptionToValidate.getMessage(),
                'The error should specify that the input was null'
            );
        } catch (Exception invalidException) {
            System.assert(false, 'A more specific error should be thrown ' + invalidException.getMessage());
        }
    }
}
