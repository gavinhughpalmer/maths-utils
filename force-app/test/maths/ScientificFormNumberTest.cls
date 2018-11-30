@IsTest
private class ScientificFormNumberTest {

    @IsTest
    private static void constructorTestNullInput() {
        try {
            ScientificFormNumber testNumber = new ScientificFormNumber(null);
            System.assert(
                false,
                'An exception should have been thrown for a null input into the constructor'
            );
        } catch (ScientificFormNumber.InvalidInputException exceptionToHandle) {
            System.assertEquals(
                ScientificFormNumber.NULL_ARGUMENT_ERROR,
                exceptionToHandle.getMessage(),
                'The error message thrown should be for the null constructor'
            );
        } catch (Exception invalidException) {
            System.assert(
                false,
                'An more specific exception should have been thrown error is ' + invalidException.getMessage()
            );
        }
    }

    @IsTest
    private static void rebalanceTestGreaterThan10PositiveNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(15.5);
        System.assertEquals(
            '1.55' + ScientificFormNumber.SEPARATOR + '1',
            testNumber.toString(),
            'A balanced scientific form should have a number below 10 and greater than 1 as the coefficient and an integer exponent'
        );
    }

    @IsTest
    private static void rebalanceTestGreaterThan10NegativeNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(-335.2);
        System.assertEquals(
            '-3.352' + ScientificFormNumber.SEPARATOR + '2',
            testNumber.toString(),
            'A balanced scientific form should have a number below 10 and greater than 1 as the coefficient and an integer exponent'
        );
    }

    @IsTest
    private static void rebalanceTestLessThan1PositiveNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0.005);
        System.assertEquals(
            '5' + ScientificFormNumber.SEPARATOR + '-3',
            testNumber.toString(),
            'A balanced scientific form should have a number below 10 and greater than 1 as the coefficient and an integer exponent'
        );
    }

    @IsTest
    private static void rebalanceTestLessThan1NegativeNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(-0.000004532);
        System.assertEquals(
            '-4.532' + ScientificFormNumber.SEPARATOR + '-6',
            testNumber.toString(),
            'A balanced scientific form should have a number below 10 and greater than 1 as the coefficient and an integer exponent'
        );
    }

    @IsTest
    private static void rebalanceTest0() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0);
        System.assertEquals(
            '0' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'A 0 input should have a 0 value'
        );
    }

    @IsTest
    private static void powerTestPositiveNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(68339.0325);
        testNumber.power(5);
        System.assertEquals(
            '1.4905416989234642441541080708789' + ScientificFormNumber.SEPARATOR + '24',
            testNumber.toString(),
            'The power should raise the number in scientific notation'
        );
    }

    @IsTest
    private static void powerTestNegativeNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(-2.6);
        testNumber.power(23);
        System.assertEquals(
            '-3.50257144982200575261531309080576' + ScientificFormNumber.SEPARATOR + '9',
            testNumber.toString(),
            'The power should raise the number in scientific notation'
        );
    }

    @IsTest
    private static void powerTestNegativePower() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0.0124);
        testNumber.power(-11);
        System.assertEquals(
            '9.38342664432977108460477687194495' + ScientificFormNumber.SEPARATOR + '20',
            testNumber.toString(),
            'The power should raise the number in scientific notation'
        );
    }

    @IsTest
    private static void powerTestNullInput() {
        ScientificFormNumber testNumber = new ScientificFormNumber(12124);
        try {
            testNumber.power(null);
            System.assert(
                false,
                'An exception should have been thrown for a null input into the power method'
            );
        } catch (ScientificFormNumber.InvalidInputException exceptionToHandle) {
            System.assertEquals(
                ScientificFormNumber.NULL_ARGUMENT_ERROR,
                exceptionToHandle.getMessage(),
                'The error message thrown should be for the null power input'
            );
        } catch (Exception invalidException) {
            System.assert(
                false,
                'An more specific exception should have been thrown error is ' + invalidException.getMessage()
            );
        }
    }

    @IsTest
    private static void powerTest0Initial() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0);
        testNumber.power(80);
        System.assertEquals(
            '0' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'An initial value of 0 should result in a zero result'
        );
    }

    @IsTest
    private static void powerTest0Power() {
        ScientificFormNumber testNumber = new ScientificFormNumber(9453.23);
        testNumber.power(0);
        System.assertEquals(
            '1' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'The power should raise the number in scientific notation'
        );
    }

    @IsTest
    private static void multiplyTestPositiveNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(1.245);
        testNumber.multiply(new ScientificFormNumber(2.45));
        System.assertEquals(
            '3.05025' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'The multiple of a positive number should be positive'
        );
    }

    @IsTest
    private static void multiplyTestNegativeNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(3.256);
        testNumber.multiply(new ScientificFormNumber(-53.74));
        System.assertEquals(
            '-1.7497744' + ScientificFormNumber.SEPARATOR + '2',
            testNumber.toString(),
            'The multiple of a negative number should be negative'
        );
    }

    @IsTest
    private static void multiplyTestNullInput() {
        ScientificFormNumber testNumber = new ScientificFormNumber(12124);
        try {
            testNumber.multiply(null);
            System.assert(
                false,
                'An exception should have been thrown for a null input into the multiply method'
            );
        } catch (ScientificFormNumber.InvalidInputException exceptionToHandle) {
            System.assertEquals(
                ScientificFormNumber.NULL_ARGUMENT_ERROR,
                exceptionToHandle.getMessage(),
                'The error message thrown should be for the null multiply input'
            );
        } catch (Exception invalidException) {
            System.assert(
                false,
                'An more specific exception should have been thrown error is ' + invalidException.getMessage()
            );
        }
    }

    @IsTest
    private static void multiplyTest0Multiply() {
        ScientificFormNumber testNumber = new ScientificFormNumber(9143212);
        testNumber.multiply(new ScientificFormNumber(0));
        System.assertEquals(
            '0' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'The multiple of 0 should be 0'
        );
    }

    @IsTest
    private static void multiplyTest0InitialNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0);
        testNumber.multiply(new ScientificFormNumber(-123.134));
        System.assertEquals(
            '0' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            'The multiple of 0 should be 0'
        );
    }

    @IsTest
    private static void divideTestPositiveNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(1.1);
        testNumber.divide(new ScientificFormNumber(0.1));
        System.assertEquals(
            '1.1' + ScientificFormNumber.SEPARATOR + '1',
            testNumber.toString(),
            'The division of a positive number should be positive'
        );
    }

    @IsTest
    private static void divideTestNegativeNumber() {
        ScientificFormNumber testNumber = new ScientificFormNumber(-0.1);
        testNumber.divide(new ScientificFormNumber(10));
        System.assertEquals(
            '-1' + ScientificFormNumber.SEPARATOR + '-2',
            testNumber.toString(),
            'The division of a negative number should be negative'
        );
    }

    @IsTest
    private static void divideTestNullInput() {
        ScientificFormNumber testNumber = new ScientificFormNumber(12124);
        try {
            testNumber.divide(null);
            System.assert(
                false,
                'An exception should have been thrown for a null input into the divide method'
            );
        } catch (ScientificFormNumber.InvalidInputException exceptionToHandle) {
            System.assertEquals(
                ScientificFormNumber.NULL_ARGUMENT_ERROR,
                exceptionToHandle.getMessage(),
                'The error message thrown should be for the null divide input'
            );
        } catch (Exception invalidException) {
            System.assert(
                false,
                'An more specific exception should have been thrown error is ' + invalidException.getMessage()
            );
        }
    }

    @IsTest
    private static void divideTest0Numarator() {
        ScientificFormNumber testNumber = new ScientificFormNumber(0);
        testNumber.divide(new ScientificFormNumber(123.45));
        System.assertEquals(
            '0' + ScientificFormNumber.SEPARATOR + '0',
            testNumber.toString(),
            '0 divided by anything should be 0'
        );
    }

    @IsTest
    private static void divideTest0Denominator() {
        ScientificFormNumber testNumber = new ScientificFormNumber(34532);
        try {
            testNumber.divide(new ScientificFormNumber(0));
            System.assert(
                false,
                'An exception should have been thrown for a 0 as the denominator'
            );
        } catch (ScientificFormNumber.InvalidInputException exceptionToHandle) {
            System.assertEquals(
                ScientificFormNumber.DIVIDE_BY_ZERO_ERROR,
                exceptionToHandle.getMessage(),
                'The error message thrown should be for the 0 divide input'
            );
        } catch (Exception invalidException) {
            System.assert(
                false,
                'An more specific exception should have been thrown error is ' + invalidException.getMessage()
            );
        }
    }
}