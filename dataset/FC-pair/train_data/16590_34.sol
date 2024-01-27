contract c16590{
    /** NOTE: _newValue should be in ETH. */
    function updateMaxCapEthOnce(uint _newValue) public onlyOwner canBeCalledOnce("updateMaxCapEth") {
        maxCapWei = _newValue * 1e18;
    }
}