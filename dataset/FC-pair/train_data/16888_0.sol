contract c16888{
    // modified toBase58 impl from https://github.com/MrChico/verifyIPFS/blob/b4bfb3df52e7e012a4ef668c6b3dbc038f881fd9/contracts/verifyIPFS.sol
    // MIT Licensed - https://github.com/MrChico/verifyIPFS/blob/b4bfb3df52e7e012a4ef668c6b3dbc038f881fd9/LICENSE
    function toBase32(bytes source) internal pure returns (bytes) {
        if (source.length == 0) return new bytes(0);
        uint8[] memory digits = new uint8[](40); //TODO: figure out exactly how much is needed
        digits[0] = 0;
        uint8 digitlength = 1;
        for (uint8 i = 0; i < source.length; ++i) {
            uint carry = uint8(source[i]);
            for (uint8 j = 0; j < digitlength; ++j) {
                carry += uint(digits[j]) * 256;
                digits[j] = uint8(carry % 32);
                carry = carry / 32;
            }
            while (carry > 0) {
                digits[digitlength] = uint8(carry % 32);
                digitlength++;
                carry = carry / 32;
            }
        }
        //return digits;
        return toAlphabet(reverse(truncate(digits, digitlength)));
    }
}