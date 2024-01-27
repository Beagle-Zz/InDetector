contract c12578{
    /*
    * Additions by the FundRequest Team
    */
    function toBytes32(slice self) internal pure returns (bytes32 result) {
        string memory source = toString(self);
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }
}