contract c13332{
    /**
     * Allow `spender` to take `value` tokens from the transaction sender's account.
     * Beware that changing an allowance with this method brings the risk that `spender` may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param spender - the address authorized to spend
     * @param value - the maximum amount they can spend
     */
    function approve (address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}