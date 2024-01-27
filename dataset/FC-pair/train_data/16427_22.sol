contract c16427{
  /**
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. We recommend to use use increaseApproval
   * and decreaseApproval functions instead !
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263555598
   */
    function approve(address _spender, uint256 _value) public canTransfert returns (bool) {
        return super.approve(_spender, _value);
    }
}