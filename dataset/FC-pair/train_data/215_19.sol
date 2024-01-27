contract c215{
    /**
        @dev Internal function to remove a token from the users barn array
        @param tokenId ID of the token to remove
        @param barnAddress Address of the user selling tokens
    */
    function _removeTokenFromBarn(uint tokenId, address barnAddress)  internal {
        uint256[] storage barnArray = userBarn[barnAddress];
        require(barnArray.length > 0,"No tokens to remove");
        int index = _indexOf(tokenId, barnArray);
        require(index >= 0, "Token not found in barn");
        // Shift entire array :(
        for (uint256 i = uint256(index); i<barnArray.length-1; i++){
            barnArray[i] = barnArray[i+1];
        }
        // Remove element, update length, return array
        // this should be enough since https://ethereum.stackexchange.com/questions/1527/how-to-delete-an-element-at-a-certain-index-in-an-array
        barnArray.length--;
    }
}