contract c18153{
    /**
    * @dev Remove contract from watch list
    */
    function removeContract(address _contractAddress) public onlymember {
        require(_contractAddress != address(this));
        ContractRemoved(_contractAddress);
    }
}