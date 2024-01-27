contract c10568{
    /*
     *  @dev CryptoFlower specific function returning the genome of a token
     *  @param uint256 tokenID to look up the genome
     *  @return bytes7 genome of the token
     */
    function getGen(uint256 tokenID) public view returns(bytes7) {
        return genes[tokenID];
    }
}