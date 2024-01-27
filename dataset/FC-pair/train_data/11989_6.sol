contract c11989{
	//Token Sale time
	function isTokenSaleActive() internal view returns (bool) {
		return (now >= (publicsalestartTime) && (now <= publicsalesendTime));  
	}
}