contract c18062{
   /// @dev Adapted from toString(slice) by @arachnid (Nick Johnson <[email protected]>)
    ///  This method is licenced under the Apache License.
    ///  Ref: https://github.com/Arachnid/solidity-stringutils/blob/2f6ca9accb48ae14c66f1437ec50ed19a0616f78/strings.sol
    function _toString(bytes32[4] _rawBytes, uint256 _stringLength) private view returns (string) {
        var outputString = new string(_stringLength);
        uint256 outputPtr;
        uint256 bytesPtr;
        assembly {
            outputPtr := add(outputString, 32)
            bytesPtr := _rawBytes
        }
        _memcpy(outputPtr, bytesPtr, _stringLength);
        return outputString;
    }
}