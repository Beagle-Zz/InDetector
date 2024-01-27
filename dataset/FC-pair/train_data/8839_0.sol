contract c8839{
    /**	
    * @dev Fix for the ERC20 short address attack.	
    * Remove short address attack checks from tokens(https://github.com/OpenZeppelin/openzeppelin-solidity/issues/261)
    */	
    modifier onlyPayloadSize(uint256 size) {	
        require(msg.data.length >= size + 4);
        _;	
    }
}