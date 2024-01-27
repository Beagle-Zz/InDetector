contract c16105{
	/// @return the index of the current discount by date.
    function currentStepIndexByDate() internal view returns (uint8 roundNum) {
        require(now <= endPreICO); 
        if(now > preSale15) return 2;
        if(now > preSale20) return 1;
        if(now > preSale30) return 0;
        else return 0;
    }
}