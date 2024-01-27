contract c8066{
  //public functions
  function withdraw()  {
    uint256 contract_token_balance = token.balanceOf(address(this));
		var (balance, balance_bonus, fee, whitelisted) = contr.contributors(msg.sender);
		if (contributor_rounds[msg.sender] < rounds) {
			Snapshot storage snapshot = snapshots[contributor_rounds[msg.sender]];
      uint256 tokens_to_withdraw = (balance * snapshot.tokens_balance) / snapshot.eth_balance;
			snapshot.tokens_balance -= tokens_to_withdraw;
			snapshot.eth_balance -= balance;
      contributor_rounds[msg.sender]++;
      require(token.transfer(msg.sender, tokens_to_withdraw));
    }
  }
}