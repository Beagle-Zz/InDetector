contract c7554{
    /*
     *  Public functions
     */
    /// @dev Returns natural exponential function value of given x
    /// @param x x
    /// @return e**x
    function exp(int x)
        public
        pure
        returns (uint)
    {
        // revert if x is > MAX_POWER, where
        // MAX_POWER = int(mp.floor(mp.log(mpf(2**256 - 1) / ONE) * ONE))
        require(x <= 2454971259878909886679);
        // return 0 if exp(x) is tiny, using
        // MIN_POWER = int(mp.floor(mp.log(mpf(1) / ONE) * ONE))
        if (x < -818323753292969962227)
            return 0;
        // Transform so that e^x -> 2^x
        x = x * int(ONE) / int(LN2);
        // 2^x = 2^whole(x) * 2^frac(x)
        //       ^^^^^^^^^^ is a bit shift
        // so Taylor expand on z = frac(x)
        int shift;
        uint z;
        if (x >= 0) {
            shift = x / int(ONE);
            z = uint(x % int(ONE));
        }
        else {
            shift = x / int(ONE) - 1;
            z = ONE - uint(-x % int(ONE));
        }
        // 2^x = 1 + (ln 2) x + (ln 2)^2/2! x^2 + ...
        //
        // Can generate the z coefficients using mpmath and the following lines
        // >>> from mpmath import mp
        // >>> mp.dps = 100
        // >>> ONE =  0x10000000000000000
        // >>> print('\n'.join(hex(int(mp.log(2)**i / mp.factorial(i) * ONE)) for i in range(1, 7)))
        // 0xb17217f7d1cf79ab
        // 0x3d7f7bff058b1d50
        // 0xe35846b82505fc5
        // 0x276556df749cee5
        // 0x5761ff9e299cc4
        // 0xa184897c363c3
        uint zpow = z;
        uint result = ONE;
        result += 0xb17217f7d1cf79ab * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x3d7f7bff058b1d50 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0xe35846b82505fc5 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x276556df749cee5 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x5761ff9e299cc4 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0xa184897c363c3 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0xffe5fe2c4586 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x162c0223a5c8 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x1b5253d395e * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x1e4cf5158b * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x1e8cac735 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x1c3bd650 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x1816193 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x131496 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0xe1b7 * zpow / ONE;
        zpow = zpow * z / ONE;
        result += 0x9c7 * zpow / ONE;
        if (shift >= 0) {
            if (result >> (256-shift) > 0)
                return (2**256-1);
            return result << shift;
        }
        else
            return result >> (-shift);
    }
}