contract c4949{
    // @dev call any function from another contract
    function callData(address contractAddress, bytes data) 
        public
        validContract(contractAddress)
    {
        if(!contractAddress.call(data)) revert("request error, not valid data sent");
        EthereumGAS.mintEGAS();
    }
}