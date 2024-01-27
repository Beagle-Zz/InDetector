contract c2860{
	/** initializes the contract parameters */
	function init(address _likeAddr) public onlyOwner {
		require(like==address(0));
		like = LikeCoinInterface(_likeAddr);
		costs = [800 ether, 2000 ether, 5000 ether, 12000 ether, 25000 ether];
		setFee(5);
		maxArtworks = 1000;
		lastId = 1;
		oldest = 0;
	}
}