contract c16578{
     /**
     * @dev allows token holders to send tokens to multiple addresses from one single transaction
     * Beware that sending tokens to large number of addresses in one transaction might exceed gas limit of the 
     * transaction or even for the entire block. Not putting any restriction on the number of addresses which are
     * allowed per transaction. But it should be taken into account while creating dapps.
     * @param dests The addresses to whom user wants to send tokens
     * @param values The number of tokens to be sent to each address
     */
    function multiSend(address[]dests, uint[]values)public{
        require(dests.length==values.length, "Number of addresses and values should be same");
        uint256 i = 0;
        while (i < dests.length) {
            transfer(dests[i], values[i]);
            i += 1;
        }
    }
}