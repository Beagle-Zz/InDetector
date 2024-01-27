contract c12505{
    /**
	 * @dev withdraw,send ether to target
	 * @param _to is where the ether will be sent to
	 *        _amount is the number of the ether
	 */
    function withdraw(address _to, uint _amount) public onlyOwner returns (bool) {
        require(_to != address(0));
        _to.transfer(_amount);
        emit WithdrawEther(_to, _amount);
        return true;
    }
}