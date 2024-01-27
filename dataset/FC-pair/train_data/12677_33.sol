contract c12677{
    /**
     * @dev Split the given signature of the form rsv in r s v. v is incremented with 27 if
     * it is below 2.
     * @param _signature Signature to split.
     * @return r s v
     */
    function signatureSplit(bytes _signature)
        private
        pure
        returns (bytes32 r, bytes32 s, uint8 v)
    {
        require(_signature.length == 65);
        assembly {
            r := mload(add(_signature, 32))
            s := mload(add(_signature, 64))
            v := and(mload(add(_signature, 65)), 0xff)
        }
        if (v < 2) {
            v = v + 27;
        }
    }
}