contract c3702{
    /**
    * @dev onlyOwner is available and the amount of coins can be deposited in centerBanker.
    * @param _value tmtg's amount
    */
    function stash(uint256 _value) public onlyOwner {
        require(balances[owner] >= _value);
        super.transfer(centralBanker, _value);
        emit TMTG_Stash(_value);        
    }
}