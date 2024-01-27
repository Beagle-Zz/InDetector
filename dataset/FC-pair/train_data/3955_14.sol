contract c3955{
    // mapping(address => mapping (address => uint256)) budgets;
    /**
     * @dev Send tokens to other multi addresses in one function
     *
     * @param _rand a random index for choosing a FlyDropToken contract address
     * @param _from address The address which you want to send tokens from
     * @param _value uint256 the amounts of tokens to be sent
     * @param _token address the ERC20 token address
     */
    function prepare(uint256 _rand,
                     address _from,
                     address _token,
                     uint256 _value) onlyOwner public returns (bool) {
        require(_token != address(0));
        require(_from != address(0));
        require(_rand > 0);
        if (ERC20(_token).allowance(_from, this) < _value) {
            return false;
        }
        if (_rand > dropTokenAddrs.length) {
            SimpleFlyDropToken dropTokenContract = new SimpleFlyDropToken();
            dropTokenAddrs.push(address(dropTokenContract));
            currentDropTokenContract = dropTokenContract;
        } else {
            currentDropTokenContract = SimpleFlyDropToken(dropTokenAddrs[_rand.sub(1)]);
        }
        currentDropTokenContract.setToken(_token);
        return ERC20(_token).transferFrom(_from, currentDropTokenContract, _value);
        // budgets[_token][_from] = budgets[_token][_from].sub(_value);
        // return itoken(_token).approveAndCall(currentDropTokenContract, _value, _extraData);
        // return true;
    }
}