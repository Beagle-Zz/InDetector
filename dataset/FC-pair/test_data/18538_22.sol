contract c18538{
    // Owner can salvage ERC20 tokens that may have been sent to the account
    function transferExternalToken(address _kAddr, address _to, uint _amount)
        public
        onlyOwner
        preventReentry
        returns (bool)
    {
        require(ERC20Token(_kAddr).transfer(_to, _amount));
        return true;
    }
}