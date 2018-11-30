/*
 The complex number class represents real and imaginary parts of a number
*/
public class ComplexNumber {

    private Decimal realPart;
    private Decimal imaginaryPart;

    public ComplexNumber(Decimal realPart, Decimal imaginaryPart) {
        this.realPart = realPart;
        this.imaginaryPart = imaginaryPart;
    }

    public void add(ComplexNumber complexNumber) {
        this.realPart += complexNumber.realPart;
        this.imaginaryPart += complexNumber.imaginaryPart;
    }

    public void subtract(ComplexNumber complexNumber) {
        this.realPart -= complexNumber.realPart;
        this.imaginaryPart -= complexNumber.imaginaryPart;
    }

    // (a + ib) (c + id) = ac + iad + icb - bd
    public void multiply(ComplexNumber complexNumber) {
        this.realPart = (this.realPart * complexNumber.realPart) - (this.imaginaryPart * complexNumber.imaginaryPart);
        this.imaginaryPart = (this.realPart * complexNumber.imaginaryPart) + (this.imaginaryPart * complexNumber.realPart);
    }

    public void multiply(Decimal numberToMultiply) {
        this.realPart *= numberToMultiply;
        this.imaginaryPart *= numberToMultiply;
    }

    public void divide(Decimal numberToDivide) {
        this.realPart /= numberToDivide;
        this.imaginaryPart /= numberToDivide;
    }

    // TODO implement divide of by a complex number

    // TODO implement negative powers
    public void power(Integer power) {
        ComplexNumber clone = copy();
        for (Integer i = 0; i < power; i++) {
            multiply(clone);
        }
    }

    public ComplexNumber copy() {
        return new ComplexNumber(realPart, imaginaryPart);
    }
}