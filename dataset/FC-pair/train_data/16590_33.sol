contract c16590{
    /** NOTE: _newValue should be in ETH. */
    function updateMinCapEthOnce(uint _newValue) public onlyOwner canBeCalledOnce("updateMinCapEth") {
        minCapWei = _newValue * 1e18;
    }
}