contract c18276{
    /** @dev transfer ethereum from contract */
    function transferEther(address _to, uint256 _value)
        public
        onlyOwner
        returns (bool)
    {
        _to.transfer(_value); // CHECK THIS
        return true;
    }
}