contract c16652{
	/// @return the index of the current discount by date.
    function currentStepIndexByDate() internal view returns (uint8 roundNum) {
        require(now <= endPreICO); 
        if(now > preSale3) return 3;
        if(now > preSale5) return 2;
        if(now > preSale10) return 1;
        if(now > preSale20) return 0;
        else return 0;
    }
}