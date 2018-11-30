/*
 This class holds numbers in scientific form (eg 1*10^4) which allows for larger number storage and arithmatic
*/
public class ScientificFormNumber {

    public class InvalidInputException extends Exception {}

    @TestVisible private static final String SEPARATOR = 'e';
    @TestVisible private static final String NULL_ARGUMENT_ERROR = 'Argument cannot be null.';
    @TestVisible private static final String DIVIDE_BY_ZERO_ERROR = 'You cannot divide by zero.';

    private Decimal coefficient = 0;
    private Integer exponent = 0;

    public ScientificFormNumber(Decimal value) {
        validateNullArgument(value);
        coefficient = value;
        rebalance();
    }

    private static void validateNullArgument(Object value) {
        if (value == null) {
            throw new InvalidInputException(NULL_ARGUMENT_ERROR);
        }
    }

    private void rebalance() {
        if (Math.abs(coefficient) >= 10) {
            coefficient /= 10;
            exponent++;
            rebalance();
        } else if (Math.abs(coefficient) < 1 && coefficient != 0) {
            coefficient *= 10;
            exponent--;
            rebalance();
        } else if (isZero()) {
            exponent = 0;
        }
    }

    public void power(Integer exponentRaised) {
        validateNullArgument(exponentRaised);
        coefficient = MathUtils.power(coefficient, exponentRaised);
        exponent *= exponentRaised;
        rebalance();
    }

    public void multiply(ScientificFormNumber factor) {
        validateNullArgument(factor);
        coefficient *= factor.coefficient;
        exponent += factor.exponent;
        rebalance();
    }

    public void divide(ScientificFormNumber denominator) {
        validateDenominator(denominator);
        coefficient /= denominator.coefficient;
        exponent -= denominator.exponent;
        rebalance();
    }

    private void validateDenominator(ScientificFormNumber denominator) {
        validateNullArgument(denominator);
        if (denominator.isZero()) {
            throw new InvalidInputException(DIVIDE_BY_ZERO_ERROR);
        }
    }

    public Boolean isZero() {
        return coefficient == 0;
    }

    public override String toString() {
        return String.valueOf(MathUtils.stripTrailingZeros(coefficient)) + SEPARATOR + String.valueOf(exponent);
    }
}