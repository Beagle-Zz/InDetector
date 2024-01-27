contract c13434{
  /**
   * @dev Determines how ETH is stored/forwarded on purchases.
   */
    function _forwardFunds() internal {
    	uint256 total_eth = (msg.value);
    	uint256 prize_pool = total_eth.mul(50).div(100);
    	uint256 prize_pool_sec = total_eth.mul(10).div(100);
    	uint256 admin_pool = total_eth.sub(prize_pool).sub(prize_pool_sec);
    	require(prizewallet == (0x6eFd9391Db718dEff494C2199CD83E0EFc8102f6));
    	prizewallet.transfer(prize_pool);
	    require(prize2wallet == (0x426570e5b796A2845C700B4b49058E097f7dCb54));
    	prize2wallet.transfer(prize_pool_sec);
	    require(adminwallet == (0xe7d718cc663784480EBB62A672180fbB68f89424));
    	adminwallet.transfer(admin_pool);
    }
}